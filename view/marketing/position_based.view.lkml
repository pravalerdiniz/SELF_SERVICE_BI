
view: position_based {

  sql_table_name: "POS_GRADUADO"."MARKETING"."POSITION_BASED"
    ;;


  dimension: canal {
    type: string
    sql: ${TABLE}."CANAL" ;;
  }

  measure: credito {
    type: sum
    value_format: "0"
    sql: ${TABLE}."CREDITO" ;;
  }

  measure: qtd_alunos {
    type: count_distinct
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension_group: date_status {
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
    sql: ${TABLE}."DATE_STATUS" ;;
  }

  dimension: flg_first {
    type: yesno
    sql: ${TABLE}."FLG_FIRST" ;;
  }

  dimension: flg_last {
    type: yesno
    sql: ${TABLE}."FLG_LAST" ;;
  }

  dimension: flg_middle {
    type: yesno
    sql: ${TABLE}."FLG_MIDDLE" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: qtd_contatos {
    type: number
    sql: ${TABLE}."QTD_CONTATOS" ;;
  }

  dimension: qtd_contatos_unicos {
    type: number
    sql: ${TABLE}."QTD_CONTATOS_UNICOS" ;;
  }

  dimension: touchpoint {
    type: number
    sql: ${TABLE}."TOUCHPOINT" ;;
  }

}
