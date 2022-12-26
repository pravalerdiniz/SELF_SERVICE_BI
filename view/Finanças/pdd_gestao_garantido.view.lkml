# The name of this view in Looker is "Pdd Gestao Garantido"
view: pdd_gestao_garantido {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCEIRO"."PDD_GESTAO_GARANTIDO"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_cessao {
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
    sql: ${TABLE}."DATA_CESSAO" ;;
    hidden: yes
  }

  dimension_group: data_pagamento {
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
    sql: ${TABLE}."DATA_PAGAMENTO" ;;
    hidden: yes
  }

  dimension_group: data_referencia {
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

  dimension_group: data_vencimento {
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
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
    hidden: yes
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Faixa Atraso" in Explore.

  dimension: faixa_atraso {
    type: number
    sql: ${TABLE}."FAIXA_ATRASO" ;;
    hidden: yes
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    hidden: yes
  }

  dimension: id_titulo {
    type: number
    sql: ${TABLE}."ID_TITULO" ;;
    hidden: yes
  }

  dimension: pdd {
    type: number
    sql: ${TABLE}."PDD" ;;
    hidden: yes
  }

  dimension: saldo_atraso {
    type: number
    sql: ${TABLE}."SALDO_ATRASO" ;;
    hidden: yes
  }

  dimension: var_pdd_mensal {
    type: number
    sql: ${TABLE}."VAR_PDD_MENSAL" ;;
    hidden: yes
  }

  # measures

  measure:  sum_pdd {
    type: sum
    sql: ${pdd} ;;
    value_format_name: usd
  }

  measure:  sum_var_pdd {
    type: sum
    sql: ${var_pdd_mensal} ;;
    value_format_name: usd
  }

  measure:  sum_saldo_atraso {
    type: sum
    sql: ${saldo_atraso} ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
