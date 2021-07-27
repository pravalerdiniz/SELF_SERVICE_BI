view: artigo {
  sql_table_name: "VETERANO"."DATA_SCIENCE"."ARTIGO"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: data_publicacao {
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
    sql: ${TABLE}."DATA_PUBLICACAO" ;;
  }

  dimension: link {
    type: string
    sql: ${TABLE}."LINK" ;;
  }

  dimension: texto {
    type: string
    sql: ${TABLE}."TEXTO" ;;
  }

  dimension: titulo {
    type: string
    sql: ${TABLE}."TITULO" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
