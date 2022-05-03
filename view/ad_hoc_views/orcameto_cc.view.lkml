# The name of this view in Looker is "Orcameto Cc"
view: orcameto_cc {
  sql_table_name: "AD_HOC"."ORCAMETO_CC"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  dimension: ano {
    type: number
    sql: ${TABLE}."ANO" ;;
    hidden: yes
  }

# Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_lancamento {
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
    label: "Lançamento"
    group_label: "Data"
    description: "Indica a Data que a despesa foi lançada"
    sql: ${TABLE}."DATA" ;;
  }

  measure: total_ano {
    type: sum
    sql: ${ano} ;;
    hidden: yes
  }

  measure: average_ano {
    type: average
    sql: ${ano} ;;
    hidden: yes
  }

  dimension: areas {
    type: string
    label: "Áreas"
    group_label: "Detalhe das Despesas"
    description: "Nomes das áreas que a despesa se refere"
    sql: ${TABLE}."AREAS" ;;
  }

  dimension: class_frente {
    type: string
    label: "Categoria de Custo"
    group_label: "Detalhe das Despesas"
    description: "Detalha a descrição do motivo do gasto"
    sql: ${TABLE}."CLASS_FRENTE" ;;
  }

  dimension: conta_contabil {
    type: string
    label: "Conta Contabil"
    group_label: "Detalhe das Despesas"
    description: "Número da Conta Contabil"
    sql: ${TABLE}."CONTA_CONTABIL" ;;
  }

  dimension: desc_fornecedor {
    type: string
    label: "Descrição do Fornecedor"
    group_label: "Detalhe das Despesas"
    description: "Descrição do Fornecedor"
    sql: ${TABLE}."DESC_FORNECEDOR" ;;
  }

  dimension: descricao_cc {
    type: string
    label: "Descrição do Centro de Custo"
    group_label: "Detalhe das Despesas"
    description: "Detalha o nome do centro de custo que o valor foi alocado"
    sql: ${TABLE}."DESCRICAO_CC" ;;
  }

  dimension: descricao_despesa {
    type: string
    label: "Descrição da Despesa"
    group_label: "Detalhe das Despesas"
    description: "Detalha a descrição da despesa"
    sql: ${TABLE}."DESCRICAO_DESPESA" ;;
  }

   # Porcentagem de alocação para CAC Folha (Medidas e Dimensões)

  dimension: folha_aquisicao {
    type: number
    label: "% Folha Aquisição"
    group_item_label: "% Folha Aquisição"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para folha aquisição"
    sql: ${TABLE}."FOLHA_AQUISICAO" ;;
  }

  measure: measure_folha_aquisicao {
    type: average
    sql: ${folha_aquisicao} ;;
    value_format: "0.00%"
    group_label: "Percentuais"
    group_item_label: "% Folha Aquisição"
    description: ""
  }

  dimension: folha_investimento {
    type: number
    label: "% Folha Investimento"
    group_item_label: "% Folha Investimento"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para folha investimento"
    sql: ${TABLE}."FOLHA_INVESTIMENTO" ;;
  }

  measure: measure_folha_investimento {
    type: average
    sql: ${folha_investimento} ;;
    value_format: "0.00%"
    group_label: "Percentuais"
    group_item_label: "% Folha Investimento"
    description: ""
  }

  dimension: folha_manutencao {
    type: number
    label: "% Folha Manutenção"
    group_item_label: "% Folha Manutenção"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para folha manutenção"
    sql: ${TABLE}."FOLHA_MANUTENCAO" ;;
  }

  measure: measure_folha_manutencao {
    type: average
    sql: ${folha_manutencao} ;;
    value_format: "0.00%"
    group_label: "Percentuais"
    group_item_label: "% Folha Manutenção"
    description: ""
  }

  dimension: folha_renovacao {
    type: number
    label: "% Folha Renovação"
    group_item_label: "% Folha Renovação"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para folha renovação"
    sql: ${TABLE}."FOLHA_RENOVACAO" ;;
  }

  measure: measure_folha_renovacao {
    type: average
    sql: ${folha_renovacao} ;;
    value_format: "0.00%"
    group_label: "Percentuais"
    group_item_label: "% Folha Renovação"
    description: ""
  }

  dimension: frente {
    type: string
    label: "Frente de Custo"
    group_label: "Detalhe das Despesas"
    description: "Descrição da Frente que o custo foi alocado. Ex: Cultura, Institucional, Operações de RH, etc"
    sql: ${TABLE}."FRENTE" ;;
  }

  dimension: linha_df {
    type: string
    label: "Linha de Custo"
    group_label: "Detalhe das Despesas"
    description: "Descrição da Linha que o custo foi alocado. Ex: Custo com pessoal, Despesas gerais e administrativas, etc"
    sql: ${TABLE}."LINHA_DF" ;;
  }

  dimension: montante {
    type: number
    label: "Valor"
    description: "Montante em reais orçado ou gasto"
    value_format: "$#,##0.00"
    sql: ${TABLE}."MONTANTE" ;;
  }

  measure: sum_montante {
    type: sum
    sql: ${montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor"
    group_item_label: "Soma do Valor"
    description: "Soma do valor Orçado ou Gasto"
  }

  measure: avg_montante {
    type: average
    sql: ${montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor"
    group_item_label: "Média do Valor"
    description: "Valor médio Orçado ou Gasto"
  }

  measure: ltm {
    type: sum
    sql: ${montante} ;;
    filters: [data_lancamento_month: "last 12 months"]
    value_format: "$#,##0.00"
    group_label: "Valor"
    group_item_label: "LTM"
  }

  dimension: grupo_canais {
    type: string
    case: {
      when: {
        sql: ${descricao_cc} in ('Trade Marketing','Comercial - B2B') ;;
        label: "Faculdade"
      }
      when:{
        sql: ${descricao_cc} in ('Central CX', 'Estratégia de Crédito','Estratégia de crédito','  Formalização','Planejamento e Conversão')  ;;
        label: "Jornada"
      }
      when: {
        sql: ${descricao_cc} in ('Marca');;
        label: "Organico"
      }
      when: {
        sql: ${descricao_cc} in ('Social','Online');;
        label: "Pago"
      }
      when: {
        sql: ${descricao_cc} in ('Online RV');;
        label: "RV"
      }
      when: {
        sql: ${descricao_cc} in ('Investimentos Marketing');;
        label: "TV"
      }
      else: "Outros"
    }
    label: "Grupo de Canais"
    group_label: "Detalhe das Despesas"
    description: "Grupo de Canais"
    }

   # Cálculo da porcentagem de CAC no Montante para Operacional

  measure: calculo_porcentagem_operacional_aquisicao {
    type: number
    sql: ${measure_operacional_aquisicao} * ${sum_montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual"
    group_item_label: "Valor Perc Operacional Aquisição"
    description: ""
  }

  measure: calculo_porcentagem_operacional_aquisicao_ltm {
    type: number
    sql: ${measure_operacional_aquisicao} * ${ltm} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual LTM"
    group_item_label: "Perc Operacional Aquisição LTM"
    description: ""
  }

  measure: calculo_porcentagem_operacional_investimento {
    type: number
    sql: ${measure_operacional_investimento} * ${sum_montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual"
    group_item_label: "Valor Perc Operacional Investimento"
    description: ""
  }

  measure: calculo_porcentagem_operacional_investimento_ltm {
    type: number
    sql: ${measure_operacional_investimento} * ${ltm} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual LTM"
    group_item_label: "Perc Operacional Investimento LTM"
    description: ""
  }

  measure: calculo_porcentagem_operacional_manutencao {
    type: number
    sql: ${measure_operacional_manutencao} * ${sum_montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual"
    group_item_label: "Valor Perc Operacional Manutenção"
    description: ""
  }

  measure: calculo_porcentagem_operacional_manutencao_ltm {
    type: number
    sql: ${measure_operacional_manutencao} * ${ltm} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual LTM"
    group_item_label: "Perc Operacional Manutenção LTM"
    description: ""
  }

  measure: calculo_porcentagem_operacional_renovacao {
    type: number
    sql: ${measure_operacional_renovacao} * ${sum_montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual"
    group_item_label: "Valor Perc Operacional Renovação"
    description: ""
  }

  measure: calculo_porcentagem_operacional_renovacao_ltm {
    type: number
    sql: ${measure_operacional_renovacao} * ${ltm} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual LTM"
    group_item_label: "Perc Operacional Renovação LTM"
    description: ""
  }

   # Cálculo da porcentagem de CAC no Montante para Folha

  measure: calculo_porcentagem_folha_aquisicao {
    type: number
    sql: ${measure_folha_aquisicao} * ${sum_montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual"
    group_item_label: "Valor Perc Folha Aquisição"
    description: ""
  }

  measure: calculo_porcentagem_folha_aquisicao_ltm {
    type: number
    sql: ${measure_operacional_aquisicao} * ${ltm} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual LTM"
    group_item_label: "Perc Folha Aquisição LTM"
    description: ""
  }

  measure: calculo_porcentagem_folha_investimento {
    type: number
    sql: ${measure_folha_investimento} * ${sum_montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual"
    group_item_label: "Valor Perc Folha Investimento"
    description: ""
  }

  measure: calculo_porcentagem_folha_investimento_ltm {
    type: number
    sql: ${measure_operacional_investimento} * ${ltm} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual LTM"
    group_item_label: "Perc Folha Investimento LTM"
    description: ""
  }

  measure: calculo_porcentagem_folha_manutencao {
    type: number
    sql: ${measure_folha_manutencao} * ${sum_montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual"
    group_item_label: "Valor Perc Folha Manutenção"
    description: ""
  }

  measure: calculo_porcentagem_folha_manutencao_ltm {
    type: number
    sql: ${measure_operacional_manutencao} * ${ltm} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual LTM"
    group_item_label: "Perc Folha Manutenção LTM"
    description: ""
  }

  measure: calculo_porcentagem_folha_renovacao {
    type: number
    sql: ${measure_folha_renovacao} * ${sum_montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual"
    group_item_label: "Valor Perc Folha Renovação"
    description: ""
  }

  measure: calculo_porcentagem_folha_renovacao_ltm {
    type: number
    sql: ${measure_operacional_renovacao} * ${ltm} ;;
    value_format: "$#,##0.00"
    group_label: "Valor Percentual LTM"
    group_item_label: "Perc Folha Renovação LTM"
    description: ""
  }

   # Porcentagem de alocação para CAC Operacional (Medidas e Dimensões)

  dimension: operacional_aquisicao {
    type: number
    label: "% Operacional Aquisição"
    group_item_label: "% Operacional Aquisição"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para operacional aquisição"
    sql: ${TABLE}."OPERACIONAL_AQUISICAO" ;;
  }

  measure: measure_operacional_aquisicao {
    type: average
    sql: ${operacional_aquisicao} ;;
    value_format: "0.00%"
    group_label: "Percentuais"
    group_item_label: "% Operacional Aquisição"
    description: ""
  }

  dimension: operacional_investimento {
    type: number
    label: "% Operacional Investimento"
    group_item_label: "% Operacional Investimento"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para operacional investimento"
    sql: ${TABLE}."OPERACIONAL_INVESTIMENTO" ;;
  }

  measure: measure_operacional_investimento {
    type: average
    sql: ${operacional_investimento} ;;
    value_format: "0.00%"
    group_label: "Percentuais"
    group_item_label: "% Operacional Investimento"
    description: ""
  }

  dimension: operacional_manutencao {
    type: number
    label: "% Operacional Manutenção"
    group_item_label: "% Operacional Manutenção"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para operacional aquisição"
    sql: ${TABLE}."OPERACIONAL_MANUTENCAO" ;;
  }

  measure: measure_operacional_manutencao {
    type: average
    sql: ${operacional_manutencao} ;;
    value_format: "0.00%"
    group_label: "Percentuais"
    group_item_label: "% Operacional Manutenção"
    description: ""
  }

  dimension: operacional_renovacao {
    type: number
    label: "% Operacional Renovação"
    group_item_label: "% Operacional Renovação"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para operacional renovação"
    sql: ${TABLE}."OPERACIONAL_RENOVACAO" ;;
  }

  measure: measure_operacional_renovacao {
    type: average
    sql: ${operacional_renovacao} ;;
    value_format: "0.00%"
    group_label: "Percentuais"
    group_item_label: "% Operacional Renovação"
    description: ""
  }

  dimension: tipo_despesa {
    type: string
    label: "Tipo de Despesa"
    group_label: "Detalhe das Despesas"
    description: "Detalha a descrição do tipo da despesa"
    sql: ${TABLE}."TIPO_DESPESA" ;;
  }

  dimension: tipo_orcamento {
    type: string
    label: "Tipo de Orçamento"
    group_label: "Detalhe do Orçamento"
    description: "Detalha o tipo de orçamento. Ex: Operacional, Folha, Não considerar e Investimento"
    sql: ${TABLE}."TIPO_ORCAMENTO" ;;
  }

  dimension: visao {
    type: string
    label: "Visão do Gasto"
    description: "Categoriza valor em orçado e realizado"
    sql: ${TABLE}."VISAO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes

  }
}
