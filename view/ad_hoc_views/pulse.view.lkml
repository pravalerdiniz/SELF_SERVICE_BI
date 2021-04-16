view: pulse {
  sql_table_name: "GENTE_GESTAO"."PULSE"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: data_pesquisa {
    type: string
    sql: ${TABLE}."DATA_PESQUISA" ;;
  }

  dimension: diretoria {
    type: string
    sql: ${TABLE}."DIRETORIA" ;;
  }

  dimension: grau_concordancia {
    type: string
    sql: ${TABLE}."GRAU_CONCORDANCIA" ;;
  }

  dimension: sentimento {
    type: string
    sql: ${TABLE}."SENTIMENTO" ;;
  }

  dimension: sentimento_cat {
    type: number
    sql: ${TABLE}."SENTIMENTO_CAT" ;;
  }

  dimension: tempo_casa {
    type: string
    sql: ${TABLE}."TEMPO_CASA" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
