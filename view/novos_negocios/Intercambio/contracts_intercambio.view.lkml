# The name of this view in Looker is "Contracts"
view: contracts_intercambio {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."INTERCAMBIO"."CONTRACTS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Anual Cet" in Explore.

  dimension: anual_cet {
    type: string
    sql: ${TABLE}."ANUAL_CET" ;;
  }

  dimension: bairro_resp_fin {
    type: string
    sql: ${TABLE}."BAIRRO_RESP_FIN" ;;
  }

  dimension: base_calculo_multa {
    type: string
    sql: ${TABLE}."BASE_CALCULO_MULTA" ;;
  }

  dimension: base_calculo_tx_juros_prefixada {
    type: string
    sql: ${TABLE}."BASE_CALCULO_TX_JUROS_PREFIXADA" ;;
  }

  dimension: base_iof {
    type: string
    sql: ${TABLE}."BASE_IOF" ;;
  }

  dimension: carencia_juros {
    type: string
    sql: ${TABLE}."CARENCIA_JUROS" ;;
  }

  dimension: carencia_principal {
    type: string
    sql: ${TABLE}."CARENCIA_PRINCIPAL" ;;
  }

  dimension: cep_resp_fin {
    type: string
    sql: ${TABLE}."CEP_RESP_FIN" ;;
  }

  dimension: chave_payment {
    type: string
    sql: ${TABLE}."CHAVE_PAYMENT" ;;
  }

  dimension: cidade_resp_fin {
    type: string
    sql: ${TABLE}."CIDADE_RESP_FIN" ;;
  }

  dimension: cod_banco {
    type: string
    sql: ${TABLE}."COD_BANCO" ;;
  }

  dimension: cod_pais_resp_fin {
    type: string
    sql: ${TABLE}."COD_PAIS_RESP_FIN" ;;
  }

  dimension: compl_resp_fin {
    type: string
    sql: ${TABLE}."COMPL_RESP_FIN" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_abreviada_desembolso {
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
    sql: ${TABLE}."DATA_ABREVIADA_DESEMBOLSO" ;;
  }

  dimension_group: data_confirmacao_desembolso {
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
    sql: ${TABLE}."DATA_CONFIRMACAO_DESEMBOLSO" ;;
  }

  dimension_group: data_desembolso {
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
    sql: ${TABLE}."DATA_DESEMBOLSO" ;;
  }

  dimension: data_emissao {
    type: string
    sql: ${TABLE}."DATA_EMISSAO" ;;
  }

  dimension_group: data_final_desembolso {
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
    sql: ${TABLE}."DATA_FINAL_DESEMBOLSO" ;;
  }

  dimension_group: data_inicio_desembolso {
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
    sql: ${TABLE}."DATA_INICIO_DESEMBOLSO" ;;
  }

  dimension: data_pagamento {
    type: string
    sql: ${TABLE}."DATA_PAGAMENTO" ;;
  }

  dimension: ddd_resp_fin {
    type: string
    sql: ${TABLE}."DDD_RESP_FIN" ;;
  }

  dimension: desc_taxas {
    type: string
    sql: ${TABLE}."DESC_TAXAS" ;;
  }

  dimension: desc_taxas_externas {
    type: string
    sql: ${TABLE}."DESC_TAXAS_EXTERNAS" ;;
  }

  dimension: desconto {
    type: string
    sql: ${TABLE}."DESCONTO" ;;
  }

  dimension: digito_conta {
    type: string
    sql: ${TABLE}."DIGITO_CONTA" ;;
  }

  dimension: document_number_banco {
    type: string
    sql: ${TABLE}."DOCUMENT_NUMBER_BANCO" ;;
  }

  dimension_group: dt_criacao_tx_juros_prefixada {
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
    sql: ${TABLE}."DT_CRIACAO_TX_JUROS_PREFIXADA" ;;
  }

  dimension: email_resp_fin {
    type: string
    sql: ${TABLE}."EMAIL_RESP_FIN" ;;
  }

  dimension: estado_resp_fin {
    type: string
    sql: ${TABLE}."ESTADO_RESP_FIN" ;;
  }

  dimension: flg_contrato_caa {
    type: yesno
    sql: ${TABLE}."FLG_CONTRATO_CAA" ;;
  }

  dimension: flg_desembolso_antes_atribuicao {
    type: string
    sql: ${TABLE}."FLG_DESEMBOLSO_ANTES_ATRIBUICAO" ;;
  }

  dimension: flg_desembolso_diario {
    type: string
    sql: ${TABLE}."FLG_DESEMBOLSO_DIARIO" ;;
  }

  dimension: flg_ultimo_status {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_STATUS" ;;
  }

  dimension: id_aluno {
    type: string
    primary_key: yes
    sql: ${TABLE}."ID_ALUNO" ;;
  }

  dimension: id_contrato {
    type: string
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  dimension: id_cpf_aluno {
    type: string
    sql: ${TABLE}."ID_CPF_ALUNO" ;;
  }

  dimension: id_cpf_resp_fin {
    type: string
    sql: ${TABLE}."ID_CPF_RESP_FIN" ;;
  }

  dimension: iof_adicional {
    type: string
    sql: ${TABLE}."IOF_ADICIONAL" ;;
  }

  dimension: motivo_cancelamento {
    type: string
    sql: ${TABLE}."MOTIVO_CANCELAMENTO" ;;
  }

  dimension: nacionalidade_resp_fin {
    type: string
    sql: ${TABLE}."NACIONALIDADE_RESP_FIN" ;;
  }

  dimension: nome_aluno {
    type: string
    sql: ${TABLE}."NOME_ALUNO" ;;
  }

  dimension: nome_banco {
    type: string
    sql: ${TABLE}."NOME_BANCO" ;;
  }

  dimension: nome_mae_resp_fin {
    type: string
    sql: ${TABLE}."NOME_MAE_RESP_FIN" ;;
  }

  dimension: nome_resp_fin {
    type: string
    sql: ${TABLE}."NOME_RESP_FIN" ;;
  }

  dimension: num_agencia {
    type: string
    sql: ${TABLE}."NUM_AGENCIA" ;;
  }

  dimension: num_conta {
    type: string
    sql: ${TABLE}."NUM_CONTA" ;;
  }

  dimension: num_contrato {
    type: string
    sql: ${TABLE}."NUM_CONTRATO" ;;
  }

  dimension: numero_resp_fin {
    type: string
    sql: ${TABLE}."NUMERO_RESP_FIN" ;;
  }

  dimension: parcelas {
    type: string
    sql: ${TABLE}."PARCELAS" ;;
  }

  dimension: porcentagem_cet {
    type: string
    sql: ${TABLE}."PORCENTAGEM_CET" ;;
  }

  dimension: porcentagem_subsidio {
    type: string
    sql: ${TABLE}."PORCENTAGEM_SUBSIDIO" ;;
  }

  dimension: primeira_data_vencimento {
    type: string
    sql: ${TABLE}."PRIMEIRA_DATA_VENCIMENTO" ;;
  }

  dimension: procentagem_pagamento {
    type: number
    sql: ${TABLE}."PROCENTAGEM_PAGAMENTO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_procentagem_pagamento {
    type: sum
    sql: ${procentagem_pagamento} ;;
  }

  measure: average_procentagem_pagamento {
    type: average
    sql: ${procentagem_pagamento} ;;
  }

  dimension: profissao_resp_fin {
    type: string
    sql: ${TABLE}."PROFISSAO_RESP_FIN" ;;
  }

  dimension: qtd_parcelas {
    type: string
    sql: ${TABLE}."QTD_PARCELAS" ;;
  }

  dimension: recibos_ted {
    type: string
    sql: ${TABLE}."RECIBOS_TED" ;;
  }

  dimension: rg_resp_fin {
    type: string
    sql: ${TABLE}."RG_RESP_FIN" ;;
  }

  dimension: rua_resp_fin {
    type: string
    sql: ${TABLE}."RUA_RESP_FIN" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: taxa_juros_anual_prefixada {
    type: number
    sql: ${TABLE}."TAXA_JUROS_ANUAL_PREFIXADA" ;;
  }

  dimension: taxa_juros_diaria_prefixada {
    type: number
    sql: ${TABLE}."TAXA_JUROS_DIARIA_PREFIXADA" ;;
  }

  dimension: taxa_juros_mensal_prefixada {
    type: number
    sql: ${TABLE}."TAXA_JUROS_MENSAL_PREFIXADA" ;;
  }

  dimension: taxa_mensal {
    type: string
    sql: ${TABLE}."TAXA_MENSAL" ;;
  }

  dimension: taxa_multa {
    type: string
    sql: ${TABLE}."TAXA_MULTA" ;;
  }

  dimension: taxas_contratuais {
    type: number
    sql: ${TABLE}."TAXAS_CONTRATUAIS" ;;
  }

  dimension: taxas_externas {
    type: number
    sql: ${TABLE}."TAXAS_EXTERNAS" ;;
  }

  dimension: telefone_resp_fin {
    type: string
    sql: ${TABLE}."TELEFONE_RESP_FIN" ;;
  }

  dimension: tipo_interesse {
    type: string
    sql: ${TABLE}."TIPO_INTERESSE" ;;
  }

  dimension: tipo_operacao {
    type: string
    sql: ${TABLE}."TIPO_OPERACAO" ;;
  }

  dimension: total_iof {
    type: number
    sql: ${TABLE}."TOTAL_IOF" ;;
  }

  dimension: tx_juros_anul {
    type: string
    sql: ${TABLE}."TX_JUROS_ANUL" ;;
  }

  dimension_group: ultima_atualizacao {
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
    sql: ${TABLE}."ULTIMA_ATUALIZACAO" ;;
  }

  dimension: urls_contrato {
    type: string
    sql: ${TABLE}."URLS_CONTRATO" ;;
  }

  dimension: valor_assinatura {
    type: string
    sql: ${TABLE}."VALOR_ASSINATURA" ;;
  }

  measure: vl_curso {
    type: sum
    sql: ${TABLE}."VL_CURSO" ;;
  }

  measure: vl_emitido_desembolso {
    type: sum
    sql: ${TABLE}."VL_EMITIDO_DESEMBOLSO" ;;
  }

  measure: vl_final_desembolso {
    type: sum
    sql: ${TABLE}."VL_FINAL_DESEMBOLSO" ;;
  }

  measure: vl_net_taxa_externa {
    type: sum
    sql: ${TABLE}."VL_NET_TAXA_EXTERNA" ;;
  }

  measure: vl_subsidio {
    type: sum
    sql: ${TABLE}."VL_SUBSIDIO" ;;
  }

  measure: vl_total_contrato {
    type: sum
    sql: ${TABLE}."VL_TOTAL_CONTRATO" ;;
  }

  measure: vl_total_prefixado {
    type: sum
    sql: ${TABLE}."VL_TOTAL_PREFIXADO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
