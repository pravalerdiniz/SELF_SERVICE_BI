# The name of this view in Looker is "Dim Reembolsos"
view: dim_reembolsos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."DIM_REEMBOLSOS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_solicitacao {
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
    sql: ${TABLE}."DATA_SOLICITACAO" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: flg_matricula_edupass {
    type: yesno
    sql: ${TABLE}."FLG_MATRICULA_EDUPASS" ;;
  }

  dimension: flg_pode_pagar {
    type: yesno
    sql: ${TABLE}."FLG_PODE_PAGAR" ;;
  }

  dimension: nome_produto {
    type: string
    sql: ${TABLE}."NOME_PRODUTO" ;;
  }

  dimension: obs {
    type: string
    sql: ${TABLE}."OBS" ;;
  }

  dimension: origem {
    type: string
    sql: ${TABLE}."ORIGEM" ;;
  }

  dimension: origem_produto {
    type: string
    sql: ${TABLE}."ORIGEM_PRODUTO" ;;
  }

  dimension: parcela_reembolso {
    type: number
    sql: ${TABLE}."PARCELA_REEMBOLSO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_parcela_reembolso {
    type: sum
    sql: ${parcela_reembolso} ;;
  }

  measure: average_parcela_reembolso {
    type: average
    sql: ${parcela_reembolso} ;;
  }

  dimension: pravalente {
    type: string
    sql: ${TABLE}."PRAVALENTE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: tipo_pagamento {
    type: string
    sql: ${TABLE}."TIPO_PAGAMENTO" ;;
  }

  dimension: total_parcelas {
    type: number
    sql: ${TABLE}."TOTAL_PARCELAS" ;;
  }

  dimension: total_produto {
    type: number
    sql: ${TABLE}."TOTAL_PRODUTO" ;;
  }

  dimension: total_reembolso {
    type: number
    sql: ${TABLE}."TOTAL_REEMBOLSO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
