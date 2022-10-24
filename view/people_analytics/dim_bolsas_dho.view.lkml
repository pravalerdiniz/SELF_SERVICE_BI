# The name of this view in Looker is "Dim Bolsas Dho"
view: dim_bolsas_dho {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."DIM_BOLSAS_DHO"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Categoria" in Explore.

  dimension: categoria {
    type: string
    sql: ${TABLE}."CATEGORIA" ;;
  }

  dimension: curso {
    type: string
    sql: ${TABLE}."CURSO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_inscricao {
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
    sql: ${TABLE}."DATA_INSCRICAO" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: instituicao {
    type: string
    sql: ${TABLE}."INSTITUICAO" ;;
  }

  dimension: origem {
    type: string
    sql: ${TABLE}."ORIGEM" ;;
  }

  dimension: perc_desconto {
    type: number
    sql: ${TABLE}."PERC_DESCONTO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_perc_desconto {
    type: sum
    sql: ${perc_desconto} ;;
  }

  measure: average_perc_desconto {
    type: average
    sql: ${perc_desconto} ;;
  }

  dimension: pravalente {
    type: string
    sql: ${TABLE}."PRAVALENTE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
