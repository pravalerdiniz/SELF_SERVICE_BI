view: fato_dre {
  sql_table_name: "VETERANO"."FATO"."FATO_DRE"
    ;;

  dimension: custo_captacao {
    type: number
    sql: ${TABLE}."CUSTO_CAPTACAO" ;;
    value_format: "\"R$ \"#,##0.00"
    group_label: ""
    group_item_label: "Custo de Captação"
    hidden: yes
    description: "O custo de captação refere-se à remuneração paga aos cotistas dos fundos."
  }

  dimension: custo_com_pessoal {
    type: number
    sql: ${TABLE}."CUSTO_COM_PESSOAL" ;;
    value_format: "\"R$ \"#,##0.00"
    group_label: ""
    hidden: yes
    group_item_label: "Custo com Pessoal"
    description: "O custo com pessoal refere-se aos gastos com salários e benefícios."
  }

  dimension: custo_servicos_prestados {
    type: number
    sql: ${TABLE}."CUSTO_SERVICOS_PRESTADOS" ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Custo de Serviços Prestados"
    description: "O custo de serviços prestados refere-se aos gastos operacionais."
  }

  dimension: custo_servicos_prestados_e_pessoal {
    type: number
    sql: ${custo_com_pessoal}+${custo_servicos_prestados} ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Custo de Serviços Prestados e Pessoal"
    description: "O custo de serviços prestados refere-se aos gastos operacionais."
  }






  dimension_group: data {
    type: time
    timeframes: [
      raw,
      week,
      month,
      quarter,
      month_name,
      month_num,
      year
    ]
    convert_tz: no
    label: "Fechamento"
    description: "Indica a data do fechamento"
    datatype: date
    sql: ${TABLE}."DATA" ;;
  }

  dimension: depreciacao_amortizacao {
    type: number
    sql: ${TABLE}."DEPRECIACAO_AMORTIZACAO" ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Depreciação e Amortização"
    description: "Refere-se às despesas com depreciação. Exemplo: mobiliário e equipamentos de tecnologia."
  }

  dimension: despesa_com_pessoal {
    type: number
    sql: ${TABLE}."DESPESA_COM_PESSOAL" ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Despesa com Pessoal"
    description: "Refere-se ao total de gastos com salários e benefícios."
  }

  dimension: g_a {
    type: number
    sql: ${TABLE}."G_A" ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "G&A"
    description: "Refere-se às despesas gerais e administrativas."
  }

  dimension: irpj_csll {
    type: number
    sql: ${TABLE}."IRPJ_CSLL" ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "IRPJ/CSLL"
    description: "Refere-se às despesas com Imposto de Renda e Contribuição Social."
  }

  dimension: pdd {
    type: number
    sql: ${TABLE}."PDD" ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "PDD"
    description: "Refere-se às despesas com a Provisão de Devedores Duvidosos."
  }

  dimension: plano_incentivos_longo_prazo {
    type: number
    sql: ${TABLE}."PLANO_INCENTIVOS_LONGO_PRAZO" ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Plano de Incentivos de Longo Prazo"
    description: "Provisão para recompra de ações."
  }

  dimension: receita_juros_liquida {
    type: number
    sql: ${TABLE}."RECEITA_JUROS_LIQUIDA" ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Receita de Juros Líquida"
    description: "Refere-se às receitas de juros das carteiras de crédito dos FIDCs."
  }

  dimension: receita_servicos_liquida {
    type: number
    sql: ${TABLE}."RECEITA_SERVICOS_LIQUIDA" ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Receita de Serviços Líquida"
    description: "Refere-se às receitas de comissão."
  }

  dimension: resultado_financeiro {
    type: number
    sql: ${TABLE}."RESULTADO_FINANCEIRO" ;;
    value_format: ""
    group_label: ""
    hidden: yes
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
    sql:${TABLE}."LUCRO_FINANCEIRO_BRUTO" ;;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Lucro Financeiro Bruto"
    description: "Indica o Lucro Financeiro Bruto."
  }

  dimension: margem_financeira_bruta {
    type: number
    sql:${TABLE}."MARGEM_FINANCEIRA_BRUTA" ;;
    value_format: "0.00%"
    group_label: ""
    hidden: yes
    group_item_label: "Margem Financeira Bruta"
    description: "Margem Financeira Bruta."
  }

  dimension: lucros_servicos_bruto {
    type: number
    sql:${TABLE}."LUCROS_SERVICOS_BRUTOS";;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Lucros com Serviços Bruto"
    description: "Lucros com Serviços Bruto."
  }

  dimension: margem_servicos_bruto {
    type: number
    sql:${TABLE}."MARGEM_SERVICOS_BRUTAS";;
    value_format: "0.00%"
    group_label: ""
    hidden: yes
    group_item_label: "Margem de Serviços Bruta"
    description: "Margem de Serviços Bruta."
  }

  dimension: lucro_bruto_total {
    type: number
    sql:${TABLE}."LUCRO_BRUTO_TOTAL";;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Lucro Bruto Total"
    description: "Lucro Bruto Total."
  }

  dimension: margem_bruta_total {
    type: number
    sql:${TABLE}."MARGEM_BRUTA_TOTAL";;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Margem Bruta Total"
    description: "Margem Bruta Total."
  }

  dimension: resultado_operacional{
    type: number
    sql:${TABLE}."RESULTADO_OPERACIONAL";;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "Resultado Operacional"
    description: "Resultado Operacional."
  }

  dimension: margem_operacional{
    type: number
    sql:${TABLE}."MARGEM_OPERACIONAL";;
    value_format: "0.00%"
    group_label: ""
    hidden: yes
    group_item_label: "Margem Operacional"
    description: "Margem Operacional."
  }

  dimension: ebt{
    type: number
    sql:${TABLE}."EBT";;
    value_format: ""
    group_label: ""
    hidden: yes
    group_item_label: "EBT"
    description: "EBT."
  }

  dimension: lucro_liquido_ajustado{
    type: number
    sql:${TABLE}."LUCRO_LIQUIDO_AJUSTADO";;
    value_format: ""
    group_label: ""
    hidden: yes
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
    group_label: "Custo"
    group_item_label: ""
    description: ""
  }

  measure: sum_custo_com_pessoal {
    type: sum
    sql: ${custo_com_pessoal} ;;
    value_format: ""
    group_label: "Custo"
    group_item_label: ""
    description: ""
  }

  measure: sum_custo_servicos_prestados {
    type: sum
    sql: ${custo_servicos_prestados} ;;
    value_format: ""
    group_label: "Custo"
    group_item_label: ""
    description: ""
  }


  measure: sum_custo_servicos_prestados_e_pessoal{
    type: sum
    sql: ${custo_servicos_prestados_e_pessoal} ;;
    value_format: ""
    group_label: "Custo"
    group_item_label: ""
    description: ""
  }



  measure: sum_depreciacao_amortizacao {
    type: sum
    sql: ${depreciacao_amortizacao} ;;
    value_format: ""
    group_label: "Depreciação Amortização"
    group_item_label: ""
    description: ""
  }

  measure: sum_despesa_com_pessoal {
    type: sum
    sql: ${despesa_com_pessoal} ;;
    value_format: ""
    group_label: "Despesa"
    group_item_label: "Com Pessoal - Soma"
    description: ""
  }



  measure:sum_pdd {
    type: sum
    sql: ${pdd} ;;
    value_format: ""
    group_label: "PDD"
    group_item_label: "Soma"
    description: ""
  }



  measure: sum_receita_juros_liquida {
    type: sum
    sql: ${receita_juros_liquida} ;;
    value_format: ""
    group_label: "Receita"
    group_item_label: ""
    description: ""
  }

  measure: sum_receita_servicos_liquida {
    type: sum
    sql: ${receita_servicos_liquida} ;;
    value_format: ""
    group_label: "Receita"
    group_item_label: ""
    description: ""
  }

  measure: sum_resultado_financeiro {
    type: sum
    sql: ${receita_servicos_liquida} ;;
    value_format: ""
    group_label: "Resultado"
    group_item_label: "Financeiro - Soma"
    description: ""
  }

  measure: sum_lucro_financeiro_bruto{
    type: sum
    sql: ${lucro_financeiro_bruto} ;;
    value_format: ""
    group_label: "Lucro"
    group_item_label: ""
    description: ""
  }

  measure: sum_margem_financeira_bruto{
    type: sum
    sql: ${margem_financeira_bruta} ;;
    value_format: "0.00%"
    group_label: "Margem"
    group_item_label: ""
    description: ""

  }

  measure: sum_margem_servicos_bruto{
    type: sum
    sql: ${margem_servicos_bruto} ;;
    value_format: "0.00%"
    group_label: "Margem"
    group_item_label: ""
    description: ""

  }

  measure: sum_margem_bruta_total{
    type: sum
    sql: ${margem_bruta_total} ;;
    value_format: "0.00%"
    group_label: "Margem"
    group_item_label: ""
    description: ""

  }


  measure: sum_lucro_servicos_bruto{
    type: sum
    sql: ${lucros_servicos_bruto} ;;
    group_label: "Lucro"
    group_item_label: ""
    description: ""

  }

  measure: sum_lucro_bruto_total{
    type: sum
    sql: ${lucro_bruto_total} ;;
    group_label: "Lucro"
    group_item_label: ""
    description: ""

  }



  measure: sum_ebt{
    type: sum
    sql: ${ebt} ;;
    group_label: "Lucro"
    group_item_label: ""
    description: ""

  }

  measure: sum_irpj_cll{
    type: sum
    sql: ${irpj_csll} ;;
    group_label: "IRPJ/CLL"
    group_item_label: ""
    description: ""

  }

  measure: sum_lucro_liquido_ajustado{
    type: sum
    sql: ${lucro_liquido_ajustado} ;;
    group_label: "Lucro"
    group_item_label: ""
    description: ""

  }

  measure: sum_g_a{
    type: sum
    sql: ${g_a} ;;
    group_label: ""
    group_item_label: "G&A"
    description: ""

  }

  measure: sum_margem_operacional{
    type: sum
    sql: ${margem_operacional} ;;
    group_label: "Margem"
    group_item_label: ""
    description: ""
    value_format: "0.00%"
  }

  measure: sum_resultado_operacional{
    type: sum
    sql: ${resultado_operacional} ;;
    group_label: "Resultado"
    group_item_label: ""
    description: ""

  }

  measure: sum_plano_incentivo_longo_prazo{
    type: sum
    sql: ${plano_incentivos_longo_prazo} ;;
    group_label: ""
    group_item_label: ""
    description: ""

  }








}
