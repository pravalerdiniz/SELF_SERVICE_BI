# The name of this view in Looker is "Risk"
view: risk {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "INTERCAMBIO"."RISK"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Categoria Score" in Explore.

  dimension: categoria_score {
    type: string
    sql: ${TABLE}."CATEGORIA_SCORE" ;;
  }

  dimension: external_id {
    label: "id_garantidor"
    type: string
    sql: ${TABLE}."EXTERNAL_ID" ;;
  }

  dimension: flg_processo_finalizado_renda {
    type: yesno
    sql: ${TABLE}."FLG_PROCESSO_FINALIZADO_RENDA" ;;
  }

  dimension: flg_processo_finalizado_score {
    type: yesno
    sql: ${TABLE}."FLG_PROCESSO_FINALIZADO_SCORE" ;;
  }

  dimension: flg_renda_aprovada {
    type: yesno
    sql: ${TABLE}."FLG_RENDA_APROVADA" ;;
  }

  dimension: flg_score_aprovado {
    type: yesno
    sql: ${TABLE}."FLG_SCORE_APROVADO" ;;
  }

  dimension: id_analise {
    type: string
    sql: ${TABLE}."ID_ANALISE" ;;
  }

  dimension: id_cpf_garantidor {
    type: number
    sql: ${TABLE}."ID_CPF_GARANTIDOR" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_id_cpf_garantidor {
    type: sum
    sql: ${id_cpf_garantidor} ;;
  }

  measure: average_id_cpf_garantidor {
    type: average
    sql: ${id_cpf_garantidor} ;;
  }

  dimension: pct_max_comprometimento_renda {
    type: number
    sql: ${TABLE}."PCT_MAX_COMPROMETIMENTO_RENDA" ;;
  }

  dimension: status_analise {
    type: string
    sql: ${TABLE}."STATUS_ANALISE" ;;
  }

  dimension: status_analise_renda {
    type: string
    sql: ${TABLE}."STATUS_ANALISE_RENDA" ;;
  }

  dimension: status_analise_score {
    type: string
    sql: ${TABLE}."STATUS_ANALISE_SCORE" ;;
  }

  dimension: tipo_produto {
    type: string
    sql: ${TABLE}."TIPO_PRODUTO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: ultima_atualizacao_analise {
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
    sql: ${TABLE}."ULTIMA_ATUALIZACAO_ANALISE" ;;
  }

  dimension_group: ultima_atualizacao_customers {
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
    sql: ${TABLE}."ULTIMA_ATUALIZACAO_CUSTOMERS" ;;
  }

  dimension_group: ultima_atualizacao_income {
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
    sql: ${TABLE}."ULTIMA_ATUALIZACAO_INCOME" ;;
  }

  dimension_group: ultima_atualizacao_score {
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
    sql: ${TABLE}."ULTIMA_ATUALIZACAO_SCORE" ;;
  }

  dimension: valor_parcela_analise {
    type: number
    sql: ${TABLE}."VALOR_PARCELA_ANALISE" ;;
  }

  dimension: valor_score {
    type: number
    sql: ${TABLE}."VALOR_SCORE" ;;
  }

  dimension: vl_max_comprometimento_renda {
    type: number
    sql: ${TABLE}."VL_MAX_COMPROMETIMENTO_RENDA" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
