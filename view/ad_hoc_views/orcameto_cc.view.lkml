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
  }

  measure: average_ano {
    type: average
    sql: ${ano} ;;
  }

  dimension: areas {
    type: string
    sql: ${TABLE}."AREAS" ;;
  }

  dimension: class_frente {
    type: string
    sql: ${TABLE}."CLASS_FRENTE" ;;
  }

  dimension: conta_contabil {
    type: string
    sql: ${TABLE}."CONTA_CONTABIL" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data {
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
    sql: ${TABLE}."DATA" ;;
  }

  dimension: desc_fornecedor {
    type: string
    sql: ${TABLE}."DESC_FORNECEDOR" ;;
  }

  dimension: descricao_cc {
    type: string
    sql: ${TABLE}."DESCRICAO_CC" ;;
  }

  dimension: descricao_despesa {
    type: string
    sql: ${TABLE}."DESCRICAO_DESPESA" ;;
  }

  dimension: folha_aquisicao {
    type: number
    label: "% Folha Aquisição"
    group_label: "% Folha"
    value_format: "0.00%"
    description: "Porcentagem do custo para folha aquisição"
    sql: ${TABLE}."FOLHA_AQUISICAO" ;;
  }

  dimension: folha_investimento {
    type: number
    label: "% Folha Investimento"
    group_label: "% Folha"
    value_format: "0.00%"
    description: "Porcentagem do custo para folha investimento"
    sql: ${TABLE}."FOLHA_INVESTIMENTO" ;;
  }

  dimension: folha_manutencao {
    type: number
    label: "% Folha Manutenção"
    group_label: "% Folha"
    value_format: "0.00%"
    description: "Porcentagem do custo para folha manutenção"
    sql: ${TABLE}."FOLHA_MANUTENCAO" ;;
  }

  dimension: folha_renovacao {
    type: number
    label: "% Folha Renovação"
    group_label: "% Folha"
    value_format: "0.00%"
    description: "Porcentagem do custo para folha renovação"
    sql: ${TABLE}."FOLHA_RENOVACAO" ;;
  }

  dimension: frente {
    type: string
    sql: ${TABLE}."FRENTE" ;;
  }

  dimension: linha_df {
    type: string
    sql: ${TABLE}."LINHA_DF" ;;
  }

  dimension: montante {
    type: number
    sql: ${TABLE}."MONTANTE" ;;
  }

  dimension: operacional_aquisicao {
    type: number
    label: "% Operacional Aquisição"
    group_label: "% Operacional"
    value_format: "0.00%"
    description: "Porcentagem do custo para operacional aquisição"
    sql: ${TABLE}."OPERACIONAL_AQUISICAO" ;;
  }

  dimension: operacional_investimento {
    type: number
    label: "% Operacional Investimento"
    group_label: "% Operacional"
    value_format: "0.00%"
    description: "Porcentagem do custo para operacional investimento"
    sql: ${TABLE}."OPERACIONAL_INVESTIMENTO" ;;
  }

  dimension: operacional_manutencao {
    type: number
    label: "% Operacional Manutenção"
    group_label: "% Operacional"
    value_format: "0.00%"
    description: "Porcentagem do custo para operacional aquisição"
    sql: ${TABLE}."OPERACIONAL_MANUTENCAO" ;;
  }

  dimension: operacional_renovacao {
    type: number
    label: "% Operacional Renovação"
    group_label: "% Operacional"
    value_format: "0.00%"
    description: "Porcentagem do custo para operacional renovação"
    sql: ${TABLE}."OPERACIONAL_RENOVACAO" ;;
  }

  dimension: tipo_despesa {
    type: string
    sql: ${TABLE}."TIPO_DESPESA" ;;
  }

  dimension: tipo_orcamento {
    type: string
    sql: ${TABLE}."TIPO_ORCAMENTO" ;;
  }

  dimension: visao {
    type: string
    sql: ${TABLE}."VISAO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
