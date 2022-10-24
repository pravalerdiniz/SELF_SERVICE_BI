# The name of this view in Looker is "Dim Pravalentes Dho"
view: dim_pravalentes_dho {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."DIM_PRAVALENTES_DHO"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_cadastro {
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
    sql: ${TABLE}."DATA_CADASTRO" ;;
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

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: flg_ativo {
    type: yesno
    sql: ${TABLE}."FLG_ATIVO" ;;
  }

  dimension: origem {
    type: string
    sql: ${TABLE}."ORIGEM" ;;
  }

  dimension: pravalente {
    type: string
    sql: ${TABLE}."PRAVALENTE" ;;
  }

  dimension: qtd_acessos {
    type: number
    sql: ${TABLE}."QTD_ACESSOS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_qtd_acessos {
    type: sum
    sql: ${qtd_acessos} ;;
  }

  measure: average_qtd_acessos {
    type: average
    sql: ${qtd_acessos} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
