view: orcamento {
  sql_table_name: "AD_HOC"."ORCAMENTO"
    ;;

  dimension: ano {
    type: number
    sql: ${TABLE}."ANO" ;;
  }

  dimension: class_frente {
    type: string
    sql: ${TABLE}."CLASS_FRENTE" ;;
  }

  dimension: conta_contabil {
    type: string
    sql: ${TABLE}."CONTA_CONTABIL" ;;
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
    sql: ${TABLE}."DATA" ;;
  }

  dimension: desc_fornecedor {
    type: string
    sql: ${TABLE}."DESC_FORNECEDOR" ;;
  }

  dimension: descricao_cc {
    type: string
    sql: ${TABLE}."DESCRICAO_CC" ;;
  }

  dimension: descricao_despesa {
    type: string
    sql: ${TABLE}."DESCRICAO_DESPESA" ;;
  }

  dimension: frente {
    type: string
    sql: ${TABLE}."FRENTE" ;;
  }

  dimension: montante {
    type: number
    sql: ${TABLE}."MONTANTE" ;;
  }

  dimension: tipo_despesa {
    type: string
    sql: ${TABLE}."TIPO_DESPESA" ;;
  }

  dimension: tipo_orcamento {
    type: string
    sql: ${TABLE}."TIPO_ORCAMENTO" ;;
  }

  dimension: visao {
    type: string
    sql: ${TABLE}."VISAO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
