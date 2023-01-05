# The name of this view in Looker is "Vw Metas"
view: metas_intercambio {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."INTERCAMBIO"."VW_METAS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Agencia" in Explore.

  dimension: agencia {
    type: string
    sql: ${TABLE}."AGENCIA" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_meta {
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
    sql: ${TABLE}."DATA_META" ;;
  }

  dimension: id_agencia_sistema {
    type: string
    sql: ${TABLE}."ID_AGENCIA_SISTEMA" ;;
  }

  measure: valor_meta_diaria {
    type: sum
    sql: ${TABLE}."VALOR_META_DIARIA" ;;
  }

  measure: valor_meta_mensal {
    type: sum
    sql: ${TABLE}."VALOR_META_MENSAL" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
