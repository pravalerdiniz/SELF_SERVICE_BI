view: atribuicao {
  sql_table_name: veterano."FATO"."ATRIBUICAO"
    ;;

  dimension: canal {
    type: string
    sql: ${TABLE}."CANAL" ;;
  }

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: fase_status {
    type: string
    sql: ${TABLE}."FASE_STATUS" ;;
  }

  dimension: fonte {
    type: string
    sql: ${TABLE}."FONTE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}."URL" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: conta_email {
    type: count

  }

  measure: porcentual {
    type: percent_of_total
    sql: ${conta_email} ;;


  }
}
