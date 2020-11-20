view: fato_dre {
  sql_table_name: "VETERANO"."FATO"."FATO_DRE"
    ;;

  dimension: custo_captacao {
    type: number
    sql: ${TABLE}."CUSTO_CAPTACAO" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: custo_com_pessoal {
    type: number
    sql: ${TABLE}."CUSTO_COM_PESSOAL" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: custo_servicos_prestados {
    type: number
    sql: ${TABLE}."CUSTO_SERVICOS_PRESTADOS" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: data {
    type: string
    sql: ${TABLE}."DATA" ;;
    group_label: ""
    group_item_label:""
    description: ""
  }

  dimension: depreciacao_amortizacao {
    type: number
    sql: ${TABLE}."DEPRECIACAO_AMORTIZACAO" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: despesa_com_pessoal {
    type: number
    sql: ${TABLE}."DESPESA_COM_PESSOAL" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: g_a {
    type: number
    sql: ${TABLE}."G_A" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: irpj_csll {
    type: number
    sql: ${TABLE}."IRPJ_CSLL" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: pdd {
    type: number
    sql: ${TABLE}."PDD" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: plano_incentivos_longo_prazo {
    type: number
    sql: ${TABLE}."PLANO_INCENTIVOS_LONGO_PRAZO" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: receita_juros_liquida {
    type: number
    sql: ${TABLE}."RECEITA_JUROS_LIQUIDA" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: receita_servicos_liquida {
    type: number
    sql: ${TABLE}."RECEITA_SERVICOS_LIQUIDA" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: resultado_financeiro {
    type: number
    sql: ${TABLE}."RESULTADO_FINANCEIRO" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }


  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_custo_captacao {
    type: sum
    sql: ${custo_captacao} ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  measure: sum_custo_com_pessoal {
    type: sum
    sql: ${custo_com_pessoal} ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  measure: sum_custo_servicos_prestados {
    type: sum
    sql: ${custo_servicos_prestados} ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }


  measure: sum_depreciacao_amortizacao {
    type: sum
    sql: ${depreciacao_amortizacao} ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  measure: sum_despesa_com_pessoal {
    type: number
    sql: ${despesa_com_pessoal} ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }



  measure:sum_pdd {
    type: sum
    sql: ${pdd} ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }



  measure: sum_receita_juros_liquida {
    type: sum
    sql: ${receita_juros_liquida} ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  measure: sum_receita_servicos_liquida {
    type: sum
    sql: ${receita_servicos_liquida} ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

  measure: sum_resultado_financeiro {
    type: sum
    sql: ${receita_servicos_liquida} ;;
    value_format: ""
    group_label: ""
    group_item_label: ""
    description: ""
  }

}
