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

  dimension: folha_aquisicao {
    type: number
    label: "% Folha Aquisição"
    group_item_label: "% Folha Aquisição"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para folha aquisição"
    sql: ${TABLE}."FOLHA_AQUISICAO" ;;
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

  dimension: folha_manutencao {
    type: number
    label: "% Folha Manutenção"
    group_item_label: "% Folha Manutenção"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para folha manutenção"
    sql: ${TABLE}."FOLHA_MANUTENCAO" ;;
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

  measure: porcentagem_aquisicao {
    type: number
    sql: ${operacional_aquisicao} * ${sum_montante} ;;
    value_format: "$#,##0.00"
    group_label: "Valor"
    group_item_label: "Porcentagem de Aquisição"
    description: ""
  }


  dimension: operacional_aquisicao {
    type: number
    label: "% Operacional Aquisição"
    group_item_label: "% Operacional Aquisição"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para operacional aquisição"
    sql: ${TABLE}."OPERACIONAL_AQUISICAO" ;;
  }

  measure: perc_operacional_aquisicao {
    type: sum
    sql: ${operacional_aquisicao} ;;

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

  dimension: operacional_manutencao {
    type: number
    label: "% Operacional Manutenção"
    group_item_label: "% Operacional Manutenção"
    group_label: "Detalhe do Orçamento"
    value_format: "0.00%"
    description: "Porcentagem do custo para operacional aquisição"
    sql: ${TABLE}."OPERACIONAL_MANUTENCAO" ;;
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
