# The name of this view in Looker is "Bc Expectativas Mercado"
view: bc_expectativas_mercado {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."BC_EXPECTATIVAS_MERCADO"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Basecalculo" in Explore.

  dimension: basecalculo {
    type: number
    sql: ${TABLE}."BASECALCULO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_basecalculo {
    type: sum
    sql: ${basecalculo} ;;
  }

  measure: average_basecalculo {
    type: average
    sql: ${basecalculo} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension: datareferencia {
    type: string
    sql: ${TABLE}."DATAREFERENCIA" ;;
  }

  dimension: desviopadrao {
    type: number
    sql: ${TABLE}."DESVIOPADRAO" ;;
  }

  dimension: indicador {
    type: string
    sql: ${TABLE}."INDICADOR" ;;
  }

  dimension: maximo {
    type: number
    sql: ${TABLE}."MAXIMO" ;;
  }

  dimension: media {
    type: number
    sql: ${TABLE}."MEDIA" ;;
  }

  dimension: mediana {
    type: number
    sql: ${TABLE}."MEDIANA" ;;
  }

  dimension: minimo {
    type: number
    sql: ${TABLE}."MINIMO" ;;
  }

  dimension: numerorespondentes {
    type: number
    sql: ${TABLE}."NUMERORESPONDENTES" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
