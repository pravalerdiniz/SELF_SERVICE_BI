# The name of this view in Looker is "Fato Lead Mgm"
view: fato_lead_mgm {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "VETERANO"."FATO"."FATO_LEAD_MGM"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Action ID" in Explore.

  dimension: action_id {
    type: string
    sql: ${TABLE}."ACTION_ID" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cpf {
    type: sum
    sql: ${cpf} ;;
  }

  measure: average_cpf {
    type: average
    sql: ${cpf} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_criacao_registro {
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
    sql: ${TABLE}."DATA_CRIACAO_REGISTRO" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: player {
    type: string
    sql: ${TABLE}."PLAYER" ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: validation_code {
    type: string
    sql: ${TABLE}."VALIDATION_CODE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
