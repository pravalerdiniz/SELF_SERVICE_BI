view: orcamento_cc_ltm {
  derived_table: {
    sql: select r1.VISAO,
      r1.TIPO_ORCAMENTO,
      r1.DESCRICAO_CC,
      r1.DESCRICAO_DESPESA,
      r1.data,
      sum(r1.MONTANTE)
      from "GRADUADO"."AD_HOC"."ORCAMENTO" AS r1
      JOIN "GRADUADO"."AD_HOC"."ORCAMENTO" AS r2
      ON datediff (m,r1.DATA, r2.DATA) BETWEEN 0 AND 12
      GROUP BY r1.DATA,
      r1.VISAO,
      r1.TIPO_ORCAMENTO,
      r1.DESCRICAO_CC,
      r1.DESCRICAO_DESPESA
      ORDER BY r1.DATA desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: visao {
    type: string
    sql: ${TABLE}."VISAO" ;;

  }

  dimension: tipo_orcamento {
    type: string
    sql: ${TABLE}."TIPO_ORCAMENTO" ;;
  }

  dimension: descricao_cc {
    type: string
    sql: ${TABLE}."DESCRICAO_CC" ;;
  }

  dimension: descricao_despesa {
    type: string
    sql: ${TABLE}."DESCRICAO_DESPESA" ;;
  }

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Lançamento"
    group_label: "Data"
    description: "Indica a Data que a despesa foi lançada"
    sql: ${TABLE}."DATA" ;;
    hidden: yes
  }

  dimension: sumr1_montante {
    type: number
    label: "Valor LTM"
    description: "Montante em reais orçado ou gasto dos últimos 12 meses"
    value_format: "$#,##0.00"
    sql: ${TABLE}."SUM(R1.MONTANTE)" ;;
  }

  measure: sum_montante_ltm {
    type: sum
    sql: ${sumr1_montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor"
    group_item_label: "Soma do Valor LTM"
    description: "Soma do valor Orçado ou Gasto  dos últimos 12 meses"
  }

  set: detail {
    fields: [
      visao,
      tipo_orcamento,
      descricao_cc,
      descricao_despesa,
      sumr1_montante
    ]
  }
}
