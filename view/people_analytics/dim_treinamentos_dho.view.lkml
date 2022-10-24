# The name of this view in Looker is "Dim Treinamentos Dho"
view: dim_treinamentos_dho {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."DIM_TREINAMENTOS_DHO"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Carga Horaria" in Explore.

  dimension: carga_horaria {
    type: string
    sql: ${TABLE}."CARGA_HORARIA" ;;
  }

  dimension: carga_horaria_segundos {
    type: number
    sql: ${TABLE}."CARGA_HORARIA_SEGUNDOS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_carga_horaria_segundos {
    type: sum
    sql: ${carga_horaria_segundos} ;;
  }

  measure: average_carga_horaria_segundos {
    type: average
    sql: ${carga_horaria_segundos} ;;
  }

  dimension: curso {
    type: string
    sql: ${TABLE}."CURSO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_fim {
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
    sql: ${TABLE}."DATA_FIM" ;;
  }

  dimension: data_inicio {
    type: string
    sql: ${TABLE}."DATA_INICIO" ;;
  }

  dimension_group: data_ultimo_acesso {
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
    sql: ${TABLE}."DATA_ULTIMO_ACESSO" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: origem {
    type: string
    sql: ${TABLE}."ORIGEM" ;;
  }

  dimension: pravalente {
    type: string
    sql: ${TABLE}."PRAVALENTE" ;;
  }

  dimension: progresso {
    type: number
    sql: ${TABLE}."PROGRESSO" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: turma {
    type: string
    sql: ${TABLE}."TURMA" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
