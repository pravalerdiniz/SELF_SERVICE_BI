# The name of this view in Looker is "Instagram Insights"
view: instagram_insights {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."INSTAGRAM_INSIGHTS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_referencia {
    label: "Data de referência"
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
    sql: ${TABLE}."DATA_REFERENCIA" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Descricao Metrica" in Explore.

  dimension: descricao_metrica {
    label: "Descritivo da métrica"
    type: string
    sql: ${TABLE}."DESCRICAO_METRICA" ;;
  }

  dimension: id_pagina {
    label: "ID da página"
    type: number
    sql: ${TABLE}."ID_PAGINA" ;;
  }

  dimension: metrica {
    label: "Métrica"
    type: string
    sql: ${TABLE}."METRICA" ;;
  }

  dimension: valor {
    label: "Valor"
    type: number
    sql: ${TABLE}."VALOR" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
