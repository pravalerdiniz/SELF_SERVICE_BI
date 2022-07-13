# The name of this view in Looker is "Pulse"
view: pulse {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."PULSE"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Data Pesquisa" in Explore.

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

  dimension: grau_concordancia_objetivo {
    type: string
    sql: ${TABLE}."GRAU_CONCORDANCIA_OBJETIVO" ;;
  }

  dimension: sentimento {
    type: string
    sql: ${TABLE}."SENTIMENTO" ;;
  }

  dimension: sentimento_cat {
    type: number
    sql: ${TABLE}."SENTIMENTO_CAT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sentimento_cat {
    type: sum
    sql: ${sentimento_cat} ;;
  }

  measure: average_sentimento_cat {
    type: average
    sql: ${sentimento_cat} ;;
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
