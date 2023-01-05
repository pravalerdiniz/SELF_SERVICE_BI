view: liberacao_credito_debitos {
  sql_table_name: "FINANCEIRO"."LIBERACAO_CREDITO_DEBITOS"
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

  #VALUE
  dimension: valor {
    type: number
    label: "Valor do Débito"
    group_label: ""
    description: "valor total do debito"
    sql: ${TABLE}."VALOR" ;;
  }

  #CHECKING_ACCOUNT_ID
  dimension: id_acesso_checkin {
    type: string
    label: "ID Conta"
    group_label: ""
    description: "Identificador da conta bancaria"
    sql: ${TABLE}."ID_ACESSO_CHECKIN" ;;
  }

  #STATUS
  dimension: status {
    type: string
    label: "Status do debito"
    group_label: ""
    description: "status do debito"
    sql: ${TABLE}."STATUS" ;;
  }

  #CONTRACT_ID
  dimension: id_contrato {
    type: string
    label: "ID Contrato"
    group_label: ""
    description: "Identificador do contrato"
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  #CUSTOMER_ID
  dimension: id_cliente {
    type: string
    label: "ID Cliente"
    group_label: ""
    description: "identificador do aluno (entidade customer) a qual esse debito pertence"
    sql: ${TABLE}."ID_CLIENTE" ;;
  }


  ## DATAS ##

  dimension_group: liberado_em {
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
    label: "Data Liberação"
    description: "Data hora de quando o debito foi liberado"
    sql: ${TABLE}."LIBERADO_EM" ;;
  }

  dimension_group: debito_resolvido_em {
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
    label: "Data Quitação"
    description: "Data e hora de quando o debito foi quitado"
    sql: ${TABLE}."DEBITO_RESOLVIDO_EM" ;;
  }

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
