view: alunos_inadimplencia_book_wo {
  derived_table: {
    sql: select * from stage.public.book_inadimplencia_wo
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: safra_wo {
    type: number
    label: "Safra - WO"
    value_format: "0"
    sql: ${TABLE}."SAFRA_WO" ;;
  }

  dimension: data_fechamento {
    type: date
    hidden: yes
    sql: ${TABLE}."DATA_FECHAMENTO" ;;
  }
  dimension_group: data_fechamento_group{
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
    label: "Fechamento"
    description: "Indica a data de baixa realizada"
    datatype: date
    sql: ${data_fechamento} ;;
  }

  dimension: fundo {
    type: number
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: vp {
    type: number
    hidden: yes
    sql: ${TABLE}."VP" ;;
  }

  measure: sum_vp {
    type: sum
    label: "Valor Presente"
    sql: ${vp} ;;


  }

  set: detail {
    fields: [cpf, safra_wo, data_fechamento, fundo, vp]
  }
}
