# The name of this view in Looker is "Solucx Transaction"
view: solucx_transaction {
  sql_table_name: "VETERANO"."FATO"."SOLUCX_TRANSACTION"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: no
    label: "IDENTIFICADOR DO REGISTRO"
    sql: ${TABLE}."ID" ;;
  }

  dimension: amount {
    type: string
    hidden: yes
    sql: ${TABLE}."AMOUNT" ;;
  }

  dimension: class_nota {
    type: string
    hidden: yes
    sql: ${TABLE}."CLASS_NOTA" ;;
  }

  dimension: customer_cpf {
    type: string
    hidden: yes
    sql: ${TABLE}."CUSTOMER_CPF" ;;
  }

  dimension: customer_email {
    type: string
    label: "EMAIL DO CLIENTE"
    sql: ${TABLE}."CUSTOMER_EMAIL" ;;
  }

  dimension: customer_external_id {
    type: string
    label: "IDENTIFICADOR EXTERNO DO CLIENTE"
    sql: ${TABLE}."CUSTOMER_EXTERNAL_ID" ;;
  }

  dimension: customer_gender {
    type: string
    hidden: yes
    sql: ${TABLE}."CUSTOMER_GENDER" ;;
  }

  dimension: customer_id {
    type: string
    label: "IDENTIFICADOR DO CLIENTE"
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: customer_name {
    type: string
    label: "NOME DO CLIENTE"
    sql: ${TABLE}."CUSTOMER_NAME" ;;
  }

  dimension: customer_phone {
    type: string
    label: "TELEFONE DO CLIENTE"
    sql: ${TABLE}."CUSTOMER_PHONE" ;;
  }

  dimension: employee_external_id {
    type: string
    label: "ID EXTERNO DO COLABORADOR"
    sql: ${TABLE}."EMPLOYEE_EXTERNAL_ID" ;;
  }

  dimension: employee_id {
    type: string
    label: "ID DO COLABORADOR"
    sql: ${TABLE}."EMPLOYEE_ID" ;;
  }

  dimension: employee_name {
    type: string
    label: "NOME DO COLABORADOR"
    sql: ${TABLE}."EMPLOYEE_NAME" ;;
  }

  dimension: external_id {
    type: string
    label: "IDENTIFICADOR EXTERNO DA TRANSAÇÃO"
    sql: ${TABLE}."EXTERNAL_ID" ;;
  }

  dimension: journey {
    type: string
    label: "JORNADA DA TRANSAÇÃO"
    sql: ${TABLE}."JOURNEY" ;;
  }

  dimension: rating_acessibilidade {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_ACESSIBILIDADE" ;;
  }

  dimension: rating_atendimento {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_ATENDIMENTO" ;;
  }

  dimension: rating_atendimento_alunos {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_ATENDIMENTO_ALUNOS" ;;
  }

  dimension: rating_cadastro {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_CADASTRO" ;;
  }

  dimension: rating_canais {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_CANAIS" ;;
  }

  dimension: rating_clareza {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_CLAREZA" ;;
  }

  dimension: rating_comment {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_COMMENT" ;;
  }

  dimension: rating_comment_reply {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_COMMENT_REPLY" ;;
  }

  dimension: rating_comunicacao {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_COMUNICACAO" ;;
  }

  dimension: rating_contratacao {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_CONTRATACAO" ;;
  }

  dimension_group: rating_last_update {
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
    hidden: yes
    sql: ${TABLE}."RATING_LAST_UPDATE" ;;
  }

  dimension: rating_pagamento {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_PAGAMENTO" ;;
  }

  dimension: rating_processo_aprovacao {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_PROCESSO_APROVACAO" ;;
  }

  dimension: rating_produtos {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_PRODUTOS" ;;
  }

  dimension: rating_resolutividade {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_RESOLUTIVIDADE" ;;
  }

  dimension: rating_source {
    type: string
    hidden: yes
    sql: ${TABLE}."RATING_SOURCE" ;;
  }

  dimension_group: rating_timestamp {
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
    hidden: yes
    sql: ${TABLE}."RATING_TIMESTAMP" ;;
  }

  dimension: rating_value {
    type: number
    hidden: yes
    sql: ${TABLE}."RATING_VALUE" ;;
  }

  dimension: reversed {
    type: string
    label: "TRANSACAO INVERTIDA"
    sql: ${TABLE}."REVERSED" ;;
  }

  dimension: store_external_id {
    type: string
    label: "ID EXTERNO DA CAMPANHA"
    sql: ${TABLE}."STORE_EXTERNAL_ID" ;;
  }

  dimension: store_id {
    type: string
    label: "ID DA CAMPANHA"
    sql: ${TABLE}."STORE_ID" ;;
  }

  dimension: store_name {
    type: string
    label: "NOME DA CAMPANHA"
    sql: ${TABLE}."STORE_NAME" ;;
  }

  dimension: survey_type {
    type: string
    label: "TIPO DA PESQUISA"
    sql: ${TABLE}."SURVEY_TYPE" ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month
    ]
    label: "DATA DA TRANSAÇÃO"
    sql: ${TABLE}."TIMESTAMP" ;;
  }

  dimension: transaction_id {
    type: string
    label: "IDENTIFICADOR DA TRANSAÇÃO"
    sql: ${TABLE}."TRANSACTION_ID" ;;
  }

measure:  count_transaction_id {
  type: count_distinct
  label: "Qtd de transações"
  sql: ${transaction_id} ;;
}

  dimension: type {
    type: string
    label: "TIPO DE REGISTRO"
    sql: ${TABLE}."TYPE" ;;
  }

}
