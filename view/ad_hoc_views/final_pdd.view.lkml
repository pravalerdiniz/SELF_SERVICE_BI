view: final_pdd {
  sql_table_name: "AD_HOC"."FINAL_PDD"
    ;;

  dimension: ano_cessao_cpf {
    type: string
    sql: ${TABLE}."ANO_CESSAO_CPF" ;;
  }

  dimension: ano_cessao_fundo {
    type: string
    sql: ${TABLE}."ANO_CESSAO_FUNDO" ;;
  }

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
  }

  dimension_group: data_visao {
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
    sql: ${TABLE}."DATA_VISAO" ;;
  }

  dimension: dias_atraso_cpf {
    type: number
    sql: ${TABLE}."DIAS_ATRASO_CPF" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_dias_atraso_cpf {
    type: sum
    sql: ${dias_atraso_cpf} ;;
  }

  measure: average_dias_atraso_cpf {
    type: average
    sql: ${dias_atraso_cpf} ;;
  }

  dimension: dias_atraso_fundo {
    type: number
    sql: ${TABLE}."DIAS_ATRASO_FUNDO" ;;
  }

  dimension: fundo {
    type: number
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: id_ies {
    type: number
    sql: ${TABLE}."ID_IES" ;;
  }

  dimension: id_produto {
    type: number
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: maturidade_cessao {
    type: number
    sql: ${TABLE}."MATURIDADE_CESSAO" ;;
  }

  dimension: maturidade_cpf {
    type: number
    sql: ${TABLE}."MATURIDADE_CPF" ;;
  }

  dimension: maturidade_fundo {
    type: number
    sql: ${TABLE}."MATURIDADE_FUNDO" ;;
  }

  dimension: maturidade_visao {
    type: number
    sql: ${TABLE}."MATURIDADE_VISAO" ;;
  }

  dimension: min_maturidade_cessao {
    type: number
    sql: ${TABLE}."MIN_MATURIDADE_CESSAO" ;;
  }

  dimension_group: mindetdt_vecto {
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
    sql: ${TABLE}."MINDETDT_VECTO" ;;
  }

  dimension: provisao_cpf {
    type: number
    sql: ${TABLE}."PROVISAO_CPF" ;;
  }

  dimension: provisao_cpf_pct {
    type: number
    sql: ${TABLE}."PROVISAO_CPF_PCT" ;;
  }

  dimension: provisao_cpf_tx_pdd_nova {
    type: number
    sql: ${TABLE}."PROVISAO_CPF_TX_PDD_NOVA" ;;
  }

  dimension: provisao_fundo {
    type: number
    sql: ${TABLE}."PROVISAO_FUNDO" ;;
  }

  dimension: provisao_fundo_pct {
    type: number
    sql: ${TABLE}."PROVISAO_FUNDO_PCT" ;;
  }

  dimension: rating_cpf {
    type: string
    sql: ${TABLE}."RATING_CPF" ;;
  }

  dimension: rating_fundo {
    type: string
    sql: ${TABLE}."RATING_FUNDO" ;;
  }

  dimension: safra_cessao_cpf {
    type: string
    sql: ${TABLE}."SAFRA_CESSAO_CPF" ;;
  }

  dimension: safra_cessao_fundo {
    type: string
    sql: ${TABLE}."SAFRA_CESSAO_FUNDO" ;;
  }

  dimension: safra_cessao_sem {
    type: string
    sql: ${TABLE}."SAFRA_CESSAO_SEM" ;;
  }

  dimension: sem_visao {
    type: number
    sql: ${TABLE}."SEM_VISAO" ;;
  }

  dimension: tdt_ano_mes {
    type: number
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: tdt_ano_obs {
    type: number
    sql: ${TABLE}."TDT_ANO_OBS" ;;
  }

  dimension: tdt_cpf {
    type: number
    sql: ${TABLE}."TDT_CPF" ;;
  }

  dimension: tx_pdd_nova {
    type: number
    sql: ${TABLE}."TX_PDD_NOVA" ;;
  }

  dimension: valor_presente {
    type: number
    sql: ${TABLE}."VALOR_PRESENTE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
