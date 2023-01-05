view: liberacao_credito_contas_acesso {
  sql_table_name: "POS_GRADUADO"."FINANCEIRO"."LIBERACAO_CREDITO_CONTAS_ACESSO"
    ;;
  drill_fields: [id]

  ## DIMENSIONS ##

  dimension: id {
    primary_key: yes
    type: string
    label: "ID"
    group_label: ""
    description: "Identificado único da entidade"
    sql: ${TABLE}."ID" ;;
  }

  dimension: nome {
    type: string
    label: "Nome Proprietario"
    group_label: ""
    description: "Nome do proprietário da conta"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: id_banco {
    type: string
    label: "ID Banco"
    group_label: ""
    description: "Identificado do banco a qual esse conta pertence"
    sql: ${TABLE}."ID_BANCO" ;;
  }

  dimension: numero {
    type: number
    label: "Número da conta"
    group_label: ""
    description: "Número da conta"
    sql: ${TABLE}."NUMERO" ;;
  }

  dimension: digitos_verificador {
    type: number
    label: "Dígito Verificador"
    group_label: ""
    description: "digito verificado da conta"
    sql: ${TABLE}."DIGITOS_VERIFICADOR" ;;
  }

  ## DATA ##

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
    label: "Data Atualização"
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
    drill_fields: [id]
    hidden: yes
  }
}
