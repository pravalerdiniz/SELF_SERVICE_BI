view: topico_artigo {
  sql_table_name: "VETERANO"."DATA_SCIENCE"."TOPICO_ARTIGO"
    ;;

  dimension: contagem {
    type: number
    sql: ${TABLE}."CONTAGEM" ;;
  }

  dimension: id_artigo {
    type: string
    sql: ${TABLE}."ID_ARTIGO" ;;
  }

  dimension: id_topico {
    type: string
    sql: ${TABLE}."ID_TOPICO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
