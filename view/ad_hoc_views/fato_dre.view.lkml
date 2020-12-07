view: fato_dre {
  sql_table_name: "VETERANO"."FATO"."FATO_DRE"
    ;;

  dimension: custo_captacao {
    type: number
    sql: ${TABLE}."CUSTO_CAPTACAO" ;;
    value_format: "\"R$ \"#,##0.00"
    group_label: ""
    group_item_label: "Custo de Captação"
    description: "O custo de captação refere-se à remuneração paga aos cotistas dos fundos."
  }

  dimension: custo_com_pessoal {
    type: number
    sql: ${TABLE}."CUSTO_COM_PESSOAL" ;;
    value_format: "\"R$ \"#,##0.00"
    group_label: ""
    group_item_label: "Custo com Pessoal"
    description: "O custo com pessoal refere-se aos gastos com salários e benefícios."
  }

  dimension: custo_servicos_prestados {
    type: number
    sql: ${TABLE}."CUSTO_SERVICOS_PRESTADOS" ;;
    value_format: ""
    group_label: ""
    group_item_label: "Custo de Serviços Prestados"
    description: "O custo de serviços prestados refere-se aos gastos operacionais."
  }

  dimension: data {
    type: string
    sql: ${TABLE}."DATA" ;;
    group_label: ""
    group_item_label:"Data"
    description: "Ano-mês de fechamento."
  }

  dimension: depreciacao_amortizacao {
    type: number
    sql: ${TABLE}."DEPRECIACAO_AMORTIZACAO" ;;
    value_format: ""
    group_label: ""
    group_item_label: "Depreciação e Amortização"
    description: "Refere-se às despesas com depreciação. Exemplo: mobiliário e equipamentos de tecnologia."
  }

  dimension: despesa_com_pessoal {
    type: number
    sql: ${TABLE}."DESPESA_COM_PESSOAL" ;;
    value_format: ""
    group_label: ""
    group_item_label: "Despesa com Pessoal"
    description: "Refere-se ao total de gastos com salários e benefícios."
  }

  dimension: g_a {
    type: number
    sql: ${TABLE}."G_A" ;;
    value_format: ""
    group_label: ""
    group_item_label: "G&A"
    description: "Refere-se às despesas gerais e administrativas."
  }

  dimension: irpj_csll {
    type: number
    sql: ${TABLE}."IRPJ_CSLL" ;;
    value_format: ""
    group_label: ""
    group_item_label: "IRPJ/CSLL"
    description: "Refere-se às despesas com Imposto de Renda e Contribuição Social."
  }

  dimension: pdd {
    type: number
    sql: ${TABLE}."PDD" ;;
    value_format: ""
    group_label: ""
    group_item_label: "PDD"
    description: "Refere-se às despesas com a Provisão de Devedores Duvidosos."
  }

  dimension: plano_incentivos_longo_prazo {
    type: number
    sql: ${TABLE}."PLANO_INCENTIVOS_LONGO_PRAZO" ;;
    value_format: ""
    group_label: ""
    group_item_label: "Plano de Incentivos de Longo Prazo"
    description: "Provisão para recompra de ações."
  }

  dimension: receita_juros_liquida {
    type: number
    sql: ${TABLE}."RECEITA_JUROS_LIQUIDA" ;;
    value_format: ""
    group_label: ""
    group_item_label: "Receita de Juros Líquida"
    description: "Refere-se às receitas de juros das carteiras de crédito dos FIDCs."
  }

  dimension: receita_servicos_liquida {
    type: number
    sql: ${TABLE}."RECEITA_SERVICOS_LIQUIDA" ;;
    value_format: ""
    group_label: ""
    group_item_label: "Receita de Serviços Líquida"
    description: "Refere-se às receitas de comissão."
  }

  dimension: resultado_financeiro {
    type: number
    sql: ${TABLE}."RESULTADO_FINANCEIRO" ;;
    value_format: ""
    group_label: ""
    group_item_label: "Resultado financeiro"
    description: "Refere-se aos rendimentos das aplicações financeiras."
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
    value_format: ""
    group_label: ""
    group_item_label: "Real/Orçado"
    description: "Indica se a métrica é proveniente do orçamento ou realizado."
  }

  dimension: lucro_financeiro_bruto {
    type: number
    sql: ${receita_juros_liquida}+${custo_captacao} ;;
    value_format: ""
    group_label: ""
    group_item_label: "Lucro Financeiro Bruto"
    description: "Indica o Lucro Financeiro Bruto."
  }

  dimension: margem_financeira_bruta {
    type: number
    sql: ${lucro_financeiro_bruto}/(${receita_juros_liquida}+${pdd}) ;;
    value_format: "0.00%"
    group_label: ""
    group_item_label: "Margem Financeira Bruta"
    description: "Margem Financeira Bruta."
  }

  dimension: lucros_servicos_bruto {
    type: number
    sql: ${receita_servicos_liquida}+${custo_com_pessoal}+${custo_servicos_prestados} ;;
    value_format: ""
    group_label: ""
    group_item_label: "Lucros com Serviços Bruto"
    description: "Lucros com Serviços Bruto."
  }

  dimension: margem_servicos_bruta {
    type: number
    sql: ${lucros_servicos_bruto}/${receita_servicos_liquida} ;;
    value_format: "0.00%"
    group_label: ""
    group_item_label: "Margem de Serviços Bruta"
    description: "Margem de Serviços Bruta."
  }

  dimension: lucro_bruto_total {
    type: number
    sql: ${lucro_financeiro_bruto}+${lucros_servicos_bruto} ;;
    value_format: ""
    group_label: ""
    group_item_label: "Lucro Bruto Total"
    description: "Lucro Bruto Total."
  }

  dimension: margem_bruta_total {
    type: number
    sql: ${lucro_bruto_total}/(${receita_juros_liquida}+${pdd}+${receita_servicos_liquida}) ;;
    value_format: ""
    group_label: ""
    group_item_label: "Margem Bruta Total"
    description: "Margem Bruta Total."
  }

  dimension: resultado_operacional{
    type: number
    sql:  ${lucro_bruto_total}+${despesa_com_pessoal}+${g_a};;
    value_format: ""
    group_label: ""
    group_item_label: "Resultado Operacional"
    description: "Resultado Operacional."
  }

  dimension: margem_operacional{
    type: number
    sql:  ${resultado_operacional}/(${receita_juros_liquida}+${pdd}+${receita_juros_liquida});;
    value_format: "0.00%"
    group_label: ""
    group_item_label: "Margem Operacional"
    description: "Margem Operacional."
  }

  dimension: ebt{
    type: number
    sql:  ${resultado_operacional}+${resultado_financeiro}+${plano_incentivos_longo_prazo};;
    value_format: ""
    group_label: ""
    group_item_label: "EBT"
    description: "EBT."
  }

  dimension: lucro_liquido_ajustado{
    type: number
    sql: ${ebt}+${irpj_csll} ;;
    value_format: ""
    group_label: ""
    group_item_label: "Lucro Líquido Ajustado"
    description: "Lucro Líquido Ajustado."
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
