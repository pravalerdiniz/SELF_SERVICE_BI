view: fato_swap {
  sql_table_name: "FATO"."FATO_SWAP"
    ;;

  dimension: ativo {
    type: yesno
    sql: ${TABLE}."ATIVO" ;;
  }

  dimension: ativo_vm {
    type: number
    sql: ${TABLE}."ATIVO_VM" ;;
  }

  dimension_group: data_entrada {
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
    sql: ${TABLE}."DATA_ENTRADA" ;;
  }

  dimension: di_futuro {
    type: number
    sql: ${TABLE}."DI_FUTURO" ;;
  }

  dimension: du_ate_vencimento {
    type: number
    sql: ${TABLE}."DU_ATE_VENCIMENTO" ;;
  }

  dimension: du_tx_pre_fixada {
    type: number
    sql: ${TABLE}."DU_TX_PRE_FIXADA" ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}."DURATION" ;;
  }

  dimension: duration_modificada {
    type: number
    sql: ${TABLE}."DURATION_MODIFICADA" ;;
  }

  dimension: fator_cdi {
    type: number
    sql: ${TABLE}."FATOR_CDI" ;;
  }

  dimension: fator_cdi_acumulado_mes {
    type: number
    sql: ${TABLE}."FATOR_CDI_ACUMULADO_MES" ;;
  }

  dimension: fcx_swap {
    type: number
    sql: ${TABLE}."FCX_SWAP" ;;
  }

  dimension_group: fim_mes_entrada {
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
    sql: ${TABLE}."FIM_MES_ENTRADA" ;;
  }

  dimension_group: fim_mes_referencia {
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
    sql: ${TABLE}."FIM_MES_REFERENCIA" ;;
  }

  dimension_group: fim_mes_vencimento {
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
    sql: ${TABLE}."FIM_MES_VENCIMENTO" ;;
  }

  dimension: id_fundo {
    type: number
    sql: ${TABLE}."ID_FUNDO" ;;
  }

  dimension: mtm_ativo_fv {
    type: number
    sql: ${TABLE}."MTM_ATIVO_FV" ;;
  }

  dimension: mtm_passivo_fv {
    type: number
    sql: ${TABLE}."MTM_PASSIVO_FV" ;;
  }

  dimension: mtm_vf_diferencial {
    type: number
    sql: ${TABLE}."MTM_VF_DIFERENCIAL" ;;
  }

  dimension: mtm_vp_diff {
    type: number
    sql: ${TABLE}."MTM_VP_DIFF" ;;
  }

  dimension: orcado_ativo {
    type: number
    sql: ${TABLE}."ORCADO_ATIVO" ;;
  }

  dimension: orcado_diferencial_receber {
    type: number
    sql: ${TABLE}."ORCADO_DIFERENCIAL_RECEBER" ;;
  }

  dimension: orcado_passivo {
    type: number
    sql: ${TABLE}."ORCADO_PASSIVO" ;;
  }

  dimension: orcado_resultado_curva {
    type: number
    sql: ${TABLE}."ORCADO_RESULTADO_CURVA" ;;
  }

  dimension: orcado_resultado_mtm {
    type: number
    sql: ${TABLE}."ORCADO_RESULTADO_MTM" ;;
  }

  dimension: orcado_volatilidade {
    type: number
    sql: ${TABLE}."ORCADO_VOLATILIDADE" ;;
  }

  dimension: orcado_vp_diferencial_receber {
    type: number
    sql: ${TABLE}."ORCADO_VP_DIFERENCIAL_RECEBER" ;;
  }

  dimension: passivo_vm {
    type: number
    sql: ${TABLE}."PASSIVO_VM" ;;
  }

  dimension: rn {
    type: number
    sql: ${TABLE}."RN" ;;
  }

  dimension: taxa_pre {
    type: number
    sql: ${TABLE}."TAXA_PRE" ;;
  }

  dimension: valor_contabil_ativo {
    type: number
    sql: ${TABLE}."VALOR_CONTABIL_ATIVO" ;;
  }

  dimension: valor_contabil_diff {
    type: number
    sql: ${TABLE}."VALOR_CONTABIL_DIFF" ;;
  }

  dimension: valor_contabil_passivo {
    type: number
    sql: ${TABLE}."VALOR_CONTABIL_PASSIVO" ;;
  }

  dimension_group: vecto {
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
    sql: ${TABLE}."VECTO" ;;
  }

  dimension: volume_inicial {
    type: number
    sql: ${TABLE}."VOLUME_INICIAL" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
