# The name of this view in Looker is "Uni Prv"
view: uni_prv {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."UNI_PRV"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Atraso" in Explore.

  dimension: atraso {
    type: string
    sql: ${TABLE}."ATRASO" ;;
  }

  dimension: avaliacao_conhecimento {
    type: string
    sql: ${TABLE}."AVALIACAO_CONHECIMENTO" ;;
  }

  dimension: avaliacao_treinamento {
    type: string
    sql: ${TABLE}."AVALIACAO_TREINAMENTO" ;;
  }

  dimension: business_center {
    type: string
    sql: ${TABLE}."BUSINESS_CENTER" ;;
  }

  dimension: canal {
    type: string
    sql: ${TABLE}."CANAL" ;;
  }

  dimension: check_in {
    type: string
    sql: ${TABLE}."CHECK_IN" ;;
  }

  dimension: check_in_na_localidade {
    type: string
    sql: ${TABLE}."CHECK_IN_NA_LOCALIDADE" ;;
  }

  dimension: check_out {
    type: string
    sql: ${TABLE}."CHECK_OUT" ;;
  }

  dimension: cidade {
    type: string
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: cnpj {
    type: string
    sql: ${TABLE}."CNPJ" ;;
  }

  dimension: cod_agendamento {
    type: number
    sql: ${TABLE}."COD_AGENDAMENTO" ;;
  }

  dimension: cod_loja {
    type: number
    sql: ${TABLE}."COD_LOJA" ;;
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

  dimension: empresa {
    type: string
    sql: ${TABLE}."EMPRESA" ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: feedback_instrutor {
    type: string
    sql: ${TABLE}."FEEDBACK_INSTRUTOR" ;;
  }

  dimension_group: fim {
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
    sql: ${TABLE}."FIM" ;;
  }

  dimension: formato {
    type: string
    sql: ${TABLE}."FORMATO" ;;
  }

  dimension_group: inicio {
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
    sql: ${TABLE}."INICIO" ;;
  }

  dimension: instrutor {
    type: string
    sql: ${TABLE}."INSTRUTOR" ;;
  }

  dimension: investimento {
    type: string
    sql: ${TABLE}."INVESTIMENTO" ;;
  }

  dimension: investimento_pessoa {
    type: string
    sql: ${TABLE}."INVESTIMENTO_PESSOA" ;;
  }

  dimension: localizacao_cadastro {
    type: string
    sql: ${TABLE}."LOCALIZACAO_CADASTRO" ;;
  }

  dimension: localizacao_check_in {
    type: string
    sql: ${TABLE}."LOCALIZACAO_CHECK_IN" ;;
  }

  dimension: loja {
    type: string
    sql: ${TABLE}."LOJA" ;;
  }

  dimension: motivo_status {
    type: string
    sql: ${TABLE}."MOTIVO_STATUS" ;;
  }

  dimension: observacoes {
    type: string
    sql: ${TABLE}."OBSERVACOES" ;;
  }

  dimension: parceiro {
    type: string
    sql: ${TABLE}."PARCEIRO" ;;
  }

  dimension: participantes_treinados {
    type: number
    sql: ${TABLE}."PARTICIPANTES_TREINADOS" ;;
  }

  dimension: produtividade {
    type: string
    sql: ${TABLE}."PRODUTIVIDADE" ;;
  }

  dimension: quarter {
    type: string
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: regional {
    type: string
    sql: ${TABLE}."REGIONAL" ;;
  }

  dimension: semana {
    type: string
    sql: ${TABLE}."SEMANA" ;;
  }

  dimension: shopping {
    type: string
    sql: ${TABLE}."SHOPPING" ;;
  }

  dimension: solicitante {
    type: string
    sql: ${TABLE}."SOLICITANTE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: tema {
    type: string
    sql: ${TABLE}."TEMA" ;;
  }

  dimension: titulo_do_agendamento {
    type: string
    sql: ${TABLE}."TITULO_DO_AGENDAMENTO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_cod_agendamento {
    type: sum
    hidden: yes
    sql: ${cod_agendamento} ;;
  }

  measure: average_cod_agendamento {
    type: average
    hidden: yes
    sql: ${cod_agendamento} ;;
  }

  measure: total_cod_loja {
    type: sum
    hidden: yes
    sql: ${cod_loja} ;;
  }

  measure: average_cod_loja {
    type: average
    hidden: yes
    sql: ${cod_loja} ;;
  }

  measure: total_participantes_treinados {
    type: sum
    hidden: yes
    sql: ${participantes_treinados} ;;
  }

  measure: average_participantes_treinados {
    type: average
    hidden: yes
    sql: ${participantes_treinados} ;;
  }
}
