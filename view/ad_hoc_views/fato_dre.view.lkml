view: fato_dre {
  sql_table_name: "VETERANO"."FATO"."FATO_DRE"
    ;;

  dimension: custo_captacao {
    type: number
    sql: ${TABLE}."CUSTO_CAPTACAO" ;;
  }

  dimension: custo_com_pessoal {
    type: number
    sql: ${TABLE}."CUSTO_COM_PESSOAL" ;;
  }

  dimension: custo_servicos_prestados {
    type: number
    sql: ${TABLE}."CUSTO_SERVICOS_PRESTADOS" ;;
  }

  dimension: data {
    type: number
    sql: ${TABLE}."DATA" ;;
  }

  dimension: depreciacao_amortizacao {
    type: number
    sql: ${TABLE}."DEPRECIACAO_AMORTIZACAO" ;;
  }

  dimension: despesa_com_pessoal {
    type: number
    sql: ${TABLE}."DESPESA_COM_PESSOAL" ;;
  }

  dimension: g_a {
    type: number
    sql: ${TABLE}."G_A" ;;
  }

  dimension: irpj_csll {
    type: number
    sql: ${TABLE}."IRPJ_CSLL" ;;
  }

  dimension: pdd {
    type: number
    sql: ${TABLE}."PDD" ;;
  }

  dimension: plano_incentivos_longo_prazo {
    type: number
    sql: ${TABLE}."PLANO_INCENTIVOS_LONGO_PRAZO" ;;
  }

  dimension: receita_juros_liquida {
    type: number
    sql: ${TABLE}."RECEITA_JUROS_LIQUIDA" ;;
  }

  dimension: receita_servicos_liquida {
    type: number
    sql: ${TABLE}."RECEITA_SERVICOS_LIQUIDA" ;;
  }

  dimension: resultado_financeiro {
    type: number
    sql: ${TABLE}."RESULTADO_FINANCEIRO" ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
