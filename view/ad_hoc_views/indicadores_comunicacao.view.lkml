view: indicadores_comunicacao {
  sql_table_name: "AD_HOC"."INDICADORES_COMUNICACAO"
    ;;

  measure: comentarios {
    type: sum
    sql: ${TABLE}."COMENTARIOS" ;;
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

  dimension: grupo_evento {
    type: string
    sql: ${TABLE}."GRUPO_EVENTO" ;;
  }

  measure: mensagens {
    type: sum
    sql: ${TABLE}."MENSAGENS" ;;
  }

  measure: publicacoes {
    type: sum
    sql: ${TABLE}."PUBLICACOES" ;;
  }

  measure: reacoes {
    type: sum
    sql: ${TABLE}."REACOES" ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  measure: visualizacoes {
    type: sum
    sql: ${TABLE}."VISUALIZACOES" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
