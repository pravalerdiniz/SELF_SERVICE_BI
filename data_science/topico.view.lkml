view: topico {
  sql_table_name: "VETERANO"."DATA_SCIENCE"."TOPICO"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: topico {
    type: string
    sql: ${TABLE}."TOPICO" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
