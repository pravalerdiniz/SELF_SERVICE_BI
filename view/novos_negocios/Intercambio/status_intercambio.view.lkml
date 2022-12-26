# The name of this view in Looker is "Status"
view: status_intercambio {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."INTERCAMBIO"."STATUS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_evento {
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
    sql: ${TABLE}."DATA_EVENTO" ;;
  }

  dimension_group: dt_inicio {
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
    sql: ${TABLE}."DT_INICIO" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Flg Ultimo Status" in Explore.

  dimension: flg_ultimo_status {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_STATUS" ;;
  }

  dimension: id_aluno {
    label: "id_garantidor"
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_evento {
    type: string
    sql: ${TABLE}."ID_EVENTO" ;;
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_status {
    type: string
    sql: ${TABLE}."ID_STATUS" ;;
  }

  dimension: journey_status {
    type: string
    sql: ${TABLE}."JOURNEY_STATUS" ;;
  }

  dimension: num_contrato {
    type: string
    sql: ${TABLE}."NUM_CONTRATO" ;;
  }

  dimension: objeto {
    type: string
    sql: ${TABLE}."OBJETO" ;;
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}."TIPO_EVENTO" ;;
  }

  dimension_group: ultima_atualizacao {
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
    sql: ${TABLE}."ULTIMA_ATUALIZACAO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
