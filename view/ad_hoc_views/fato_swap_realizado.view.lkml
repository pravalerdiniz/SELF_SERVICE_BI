view: fato_swap_realizado {
  sql_table_name: "FATO"."FATO_SWAP_REALIZADO"
    ;;

  dimension: diferencial_a_receber {
    type: number
    sql: ${TABLE}."DIFERENCIAL_A_RECEBER" ;;
  }

  dimension: fcx_swap {
    type: number
    sql: ${TABLE}."FCX_SWAP" ;;
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

  dimension: id_fundo {
    type: number
    sql: ${TABLE}."ID_FUNDO" ;;
  }

  dimension: mtm_vp_diff {
    type: number
    sql: ${TABLE}."MTM_VP_DIFF" ;;
  }

  dimension: resultado_curva {
    type: number
    sql: ${TABLE}."RESULTADO_CURVA" ;;
  }

  dimension: resultado_mtm {
    type: number
    sql: ${TABLE}."RESULTADO_MTM" ;;
  }

  dimension: valor_contabil_ativo {
    type: number
    sql: ${TABLE}."VALOR_CONTABIL_ATIVO" ;;
  }

  dimension: valor_contabil_passivo {
    type: number
    sql: ${TABLE}."VALOR_CONTABIL_PASSIVO" ;;
  }

  dimension: volatilidade {
    type: number
    sql: ${TABLE}."VOLATILIDADE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
