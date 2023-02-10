view: liberacao_credito_contratos {
  sql_table_name: "POS_GRADUADO"."FINANCEIRO"."LIBERACAO_CREDITO_CONTRATOS"
    ;;
  drill_fields: [id]

  ## DIMENSIONS ##

  #ID
  dimension: id {
    primary_key: yes
    type: string
    label: "ID"
    group_label: ""
    description: "Identificado único da entidade"
    sql: ${TABLE}."ID" ;;
  }

  #INSTALLMENT_VALUE
  dimension: valor_parcela {
    type: number
    value_format: "$0.00"
    label: "Valor Parcela"
    group_label: ""
    description: "Valor de cada parcela"
    sql: ${TABLE}."VALOR_PARCELA" ;;
  }

  #SERVICE_FEE
  dimension: taxa_de_servico {
    type: number
    label: "Taxa de Serviço"
    group_label: ""
    description: "Valor da taxa"
    sql: ${TABLE}."TAXA_DE_SERVICO" ;;
  }

  #RELEASE
  dimension: liberado {
    type: number
    label: "Realese"
    group_label: ""
    description: "Numero da versão do contrato"
    sql: ${TABLE}."LIBERADO" ;;
  }

  #NUMBER
  dimension: valor {
    type: number
    value_format: "0"
    label: "Número do Contrato"
    group_label: ""
    description: "Numero do contrato"
    sql: ${TABLE}."VALOR" ;;
  }

  #VERIFYING_DIGIT
  dimension: digito_verificador {
    type: number
    label: "Digito Verificador do Contrato"
    group_label: ""
    description: "Digito verificado do contrato"
    sql: ${TABLE}."DIGITO_VERIFICADOR" ;;
  }

  #INSTALLMENT_COUNT
  dimension: qtd_parcelas {
    type: number
    label: "Qtd Parcelas Contrato"
    group_label: ""
    description: "Quantidade de parcelas do contrato"
    sql: ${TABLE}."QTD_PARCELAS" ;;
  }

  #ORIGINATOR_ID
  dimension: id_originador {
    type: string
    label: "ID Originador"
    group_label: ""
    description: "Identificado do originador a qual o contrato pertence"
    sql: ${TABLE}."ID_ORIGINADOR" ;;
  }


  ## DATAS ##


  dimension_group: data_criacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    label: "Data Criação"
    description: "Data e hora da criação do registro"
    sql: ${TABLE}."DATA_CRIACAO" ;;
  }

  dimension_group: data_atualizacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    label: "Data Ataualização"
    description: "Data e hora da ultima atualização do registro"
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension_group: data_exclusao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    label: "Data Exclusão"
    description: "Data e hora que o registro foi excluído, apenas preenchido caso o registro tenha sido excluído"
    sql: ${TABLE}."DATA_EXCLUSAO" ;;
  }

  measure: count {
    type: count
    label: "Qtd Contratos"
    drill_fields: [valor]
  }
}
