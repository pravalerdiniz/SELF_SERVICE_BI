view: contracts {
  sql_table_name: "CURTA"."CONTRACTS"
    ;;

   dimension: anual_cet {
    type: string
    sql: ${TABLE}."ANUAL_CET";;
    description: "PORCENTAGEM COBRADA PELO CET"
  }

  dimension: bairro_resp_fin {
    type: string
    sql: ${TABLE}."BAIRRO_RESP_FIN";;
    description: "BAIRRO DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
  }

  dimension: base_calculo_multa {
    type: string
    sql: ${TABLE}."BASE_CALCULO_MULTA";;
    description: "INDICA QUAIS DIAS DEVEM SER CONTADOS PARA SE CALCULAR A MULTA"
  }

  dimension: base_calculo_tx_juros_prefixada {

    type: string
    sql: ${TABLE}."BASE_CALCULO_TX_JUROS_PREFIXADA";;
    description: "BASE UTILIZADA PAR ACALCULAR A TAXA DE JUROS PRE-FIXADA"
  }

  dimension: base_iof {
    type: number
    sql: ${TABLE}."BASE_IOF";;
    description: "VALOR BASE DO IOF"
  }

  dimension: carencia_juros {
    type: number
    sql: ${TABLE}."CARENCIA_JUROS";;
    description: "INDICA A QUANTIDADE DE DIAS DE CARENCIA PARA O CONTRATO PARA APLICAÇÃO DE JUROS E MULTAS"
  }

  dimension: carencia_principal {
    type: number
    sql: ${TABLE}."CARENCIA_PRINCIPAL";;
    description: "INDICA A QUANTIDADE PRINCIPAL DE CARENCIA"
  }

  dimension: cep_resp_fin {
    type: string
    sql: ${TABLE}."CEP_RESP_FIN";;
    description: "CEP DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
  }

  dimension: chave_payment {
    type: string
    sql: ${TABLE}."CHAVE_PAYMENT";;
    description: "CHAVE DE LIGAÇÃO ENTRE A TABELA DE CONTRATOS E PAYMENT"
  }

  dimension: cidade_resp_fin {
    type: string
    sql: ${TABLE}."CIDADE_RESP_FIN";;
    description: "CIDADE DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
  }

  dimension: cod_banco {
    type: string
    sql: ${TABLE}."COD_BANCO";;
    description: "CODIGO DO BANCO ONDE SERÁ FEITO O DÉBITO DOS VALORES"
  }

  dimension: cod_pais_resp_fin {
    type: string
    sql: ${TABLE}."COD_PAIS_RESP_FIN";;
    description: "CODIGO DO PAIS DO TELEFONE DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
  }

  dimension: compl_resp_fin {
    type: string
    sql: ${TABLE}."COMPL_RESP_FIN";;
    description: "COMPLEMENTO DO ENDEREÇO DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF";;
    description: "NUMERO DO CPF DO ALUNO"
  }

  dimension: cpf_resp_fin {
    type: string
    sql: ${TABLE}."CPF_RESP_FIN";;
    description: "CPF DO RESPONSÁVEL FINANCEIRO DO CONTRATO"
  }

  dimension: curso {
    type: string
    sql: ${TABLE}."CURSO";;
    description: "NOME DO CURSO DO CONTRATO"
  }

  dimension_group: data_emissao {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_EMISSAO";;
    description: "DATA DE EMISSÃO DO CONTRATO"
  }

  dimension_group: data_pagamento {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_PAGAMENTO";;
    description: "DATA DE PAGAMENTO DO CONTRATO"
  }

  dimension: ddd_resp_fin {
    type: number
    sql: ${TABLE}."DDD_RESP_FIN";;
    description: "DDD DO TELEFONE DO RESPONSÁVEL FINANCEIRO DO CONTRATO"
  }

  dimension: desc_taxas {
    type: string
    sql: ${TABLE}."DESC_TAXAS";;
    description: "DESCRIÇÃO DA COMPOSIÇÃO DAS TAXAS CONTRATUAIS"
  }

  dimension: desc_taxas_externas {
    type: string
    sql: ${TABLE}."DESC_TAXAS_EXTERNAS";;
    description: "DESCRIÇÃO DA COMPOSIÇÃO DAS TAXAS EXTERNAS"
  }

  dimension: desconto {
    type: number
    sql: ${TABLE}."DESCONTO";;
    description: "DESCONTO APLICADO AO CONTRATO"
  }

  dimension: digito_conta {
    type: string
    sql: ${TABLE}."DIGITO_CONTA";;
    description: "DIGITO DA CONTA BANCÁRIA ONDE SERÁ REALIZADO O DÉBITO DO PAGAMENTO"
  }

  dimension: document_number_banco {
    type: string
    sql: ${TABLE}."DOCUMENT_NUMBER_BANCO";;
    description: "DOCUMENTO DE IDENTIFICAÇÃO DA INSTITUIÇÃO FINANCEIRA"
  }

  dimension_group: dt_criacao_tx_juros_prefixada {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    sql: ${TABLE}."DT_CRIACAO_TX_JUROS_PREFIXADA";;
    description: "DATA DE CRIAÇÃODA TAXA DE JUROS PRE-FIXADA"
  }

  dimension: email_resp_fin {
    type: string
    sql: ${TABLE}."EMAIL_RESP_FIN";;
    description: "EMAIL DO RESPONSÁVEL FINANCEIRO DO CONTRATO"
  }

  dimension: estado_resp_fin {
    type: string
    sql: ${TABLE}."ESTADO_RESP_FIN";;
    description: "ESTADO DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
  }

  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO";;
    description: "IDENTIFICADOR DO ALUNO"
  }

  dimension: id_contrato {
    type: string
    sql: ${TABLE}."ID_CONTRATO";;
    description: "IDENTIFICADOR DO CONTRATO"
  }

  dimension: iof_adicional {
    type: number
    sql: ${TABLE}."IOF_ADICIONAL";;
    description: "VALOR ADICIONAL DO IOF COBRADO"
  }

  dimension: motivo_cancelamento {
    type: string
    sql: ${TABLE}."MOTIVO_CANCELAMENTO";;
    description: "DESCRIÇÃO DO MOTIVO DE CANCELAMENTO DO CONTRATO"
  }

  dimension: nacionalidade_resp_fin {
    type: string
    sql: ${TABLE}."NACIONALIDADE_RESP_FIN";;
    description: "NACIONALIDADE DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
  }

  dimension: nome_aluno {
    type: string
    sql: ${TABLE}."NOME_ALUNO";;
    description: "NOME COMPLETO DO ALUNO"
  }

  dimension: nome_banco {
    type: string
    sql: ${TABLE}."NOME_BANCO";;
    description: "NOME DO BANCO ONDE SERÁ FEITO O PAGAMENTO"
  }

  dimension: nome_instituicao {
    type: string
    sql: ${TABLE}."NOME_INSTITUICAO";;
    description: "NOME DA INSTITUIÇÃO"
  }

  dimension: nome_mae_resp_fin {
    type: string
    sql: ${TABLE}."NOME_MAE_RESP_FIN";;
    description: "NOME DA MÃE DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
  }

  dimension: nome_resp_fin {
    type: string
    sql: ${TABLE}."NOME_RESP_FIN";;
    description: "NOME DO RESPONSÁVEL FINANCEIRO DO CONTRATO"
  }

  dimension: num_agencia {
    type: string
    sql: ${TABLE}."NUM_AGENCIA";;
    description: "NUMERO DA AGENCIA BANCÁRIA ONDE SERÁ FEITO O DEBITO DO PAGAMENTO"
  }

  dimension: num_conta {
    type: string
    sql: ${TABLE}."NUM_CONTA";;
    description: "NUMERO DA CONTA BANCARIA ONDE SERÁ FEITO O DÉBITO DO PAGAMENTO"
  }

  dimension: num_contrato {
    type: string
    sql: ${TABLE}."NUM_CONTRATO";;
    description: "NUMERO DO CONTRATO"
  }

  dimension: numero_resp_fin {
    type: string
    sql: ${TABLE}."NUMERO_RESP_FIN";;
    description: "NUMERO D ARESIDENCIA DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
  }

  dimension: parcelas {
    type: string
    sql: ${TABLE}."PARCELAS";;
    description: "DESCRIÇÃO DAS PARCELAS REFERENTES AO CONTRATO"
  }

  dimension: porcentagem_cet {
    type: string
    sql: ${TABLE}."PORCENTAGEM_CET";;
    description: "VALOR DE PORCENTAGEM DO CET"
  }

  dimension: porcentagem_subsidio {
    type: number
    sql: ${TABLE}."PORCENTAGEM_SUBSIDIO";;
    description: "INDICA A PORCENTAGEM DE SUBSIDIO APLICADA AO CONTRATO"
  }

  dimension_group: primeira_data_vencimento {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    sql: ${TABLE}."PRIMEIRA_DATA_VENCIMENTO";;
    description: "DATA DO VENCIMENTO DA PRIMEIRA PARCELA"
  }

  dimension: procentagem_pagamento {
    type: number
    sql: ${TABLE}."PROCENTAGEM_PAGAMENTO";;
    description: "INDICA A PORCENTAGEM DO VALOR DO CURSO QUE SERÁ RETIRADA DESSA CONTA"
  }

  dimension: profissao_resp_fin {
    type: string
    sql: ${TABLE}."PROFISSAO_RESP_FIN";;
    description: "PROFISSÃO DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
  }

  dimension: qtd_parcelas {
    type: number
    sql: ${TABLE}."QTD_PARCELAS";;
    description: "TOTAL DE PARCELAS QUE O CONTRATO FOI FEITO"
  }

  dimension: recibos_ted {
    type: string
    sql: ${TABLE}."RECIBOS_TED";;
    description: "LISTA COM OS RECIBOS DOS TEDS REALIZADOS"
  }

  dimension: rg_resp_fin {
    type: string
    sql: ${TABLE}."RG_RESP_FIN";;
    description: "RG DO RESPONSÁVEL FINANCEIRO DO CONTRATO"
  }

  dimension: rua_resp_fin {
    type: string
    sql: ${TABLE}."RUA_RESP_FIN";;
    description: "NOME DA RUA DO RESPONSÁVEL_FINANCEIRO PELO CONTRATO"
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS";;
    description: "STATUS DO CONTRATO"
  }

  dimension: taxa_juros_anual_prefixada {
    type: number
    sql: ${TABLE}."TAXA_JUROS_ANUAL_PREFIXADA";;
    description: "TAAX DE JUROS ANUAL PRE-FIXADA PARA O CONTRATO"
  }

  dimension: taxa_juros_diaria_prefixada {
    type: number
    sql: ${TABLE}."TAXA_JUROS_DIARIA_PREFIXADA";;
    description: "TAXA DE JUROS DIÁRIA PRE-FIXADA"
  }

  dimension: taxa_juros_mensal_prefixada {
    type: number
    sql: ${TABLE}."TAXA_JUROS_MENSAL_PREFIXADA";;
    description: "TAXA DE JUROS MENSAL PRE-FIXADA"
  }

  dimension: taxa_mensal {
    type: number
    sql: ${TABLE}."TAXA_MENSAL";;
    description: "TAXA MÁXIMA QUE PODE SER COBRADA DENTRO DE UM MES"
  }

  dimension: taxa_multa {
    type: number
    sql: ${TABLE}."TAXA_MULTA";;
    description: "TAXA DE MULTA APLICADA EM CIMAD O CONTRATO, CONTNADO OS DIAS CONFORME A BASE DE CALCULO INDICA"
  }

  dimension: taxas_contratuais {
    type: string
    sql: ${TABLE}."TAXAS_CONTRATUAIS";;
    description: "VALOR DAS TAXAS CONTRATUAIS"
  }

  dimension: taxas_externas {
    type: number
    sql: ${TABLE}."TAXAS_EXTERNAS";;
    description: "VALOR TOTAL DAS TAXAS EXTERNAS COBRADAS NO CONTRATO"
  }

  dimension: telefone_resp_fin {
    type: number
    sql: ${TABLE}."TELEFONE_RESP_FIN";;
    description: "NUMERO DO TELEFONE DO RESPONSAVEL FINANCEIRO"
  }

  dimension: tipo_interesse {
    type: string
    sql: ${TABLE}."TIPO_INTERESSE";;
    description: "INDICA O TIPO DE MODALIDADE DE COBRANÇA DE MULTA DO CONTRATO"
  }

  dimension: tipo_operacao {
    type: string
    sql: ${TABLE}."TIPO_OPERACAO";;
    description: "INDICA O TIPO DE OPERAÇÃO DE CRÉDITO REALIZADA PARA ESSE CONTRATO"
  }

  dimension: total_iof {
    type: number
    sql: ${TABLE}."TOTAL_IOF";;
    description: "VALOR TOTAL COBRADO DE IOF"
  }

  dimension: total_mensalidades {
    type: string
    sql: ${TABLE}."TOTAL_MENSALIDADES";;
    description: "0"
  }

  dimension: tx_juros_anul {
    type: number
    sql: ${TABLE}."TX_JUROS_ANUL";;
    description: "INDICA A TAXA DE JUROS ANUAL COBRADA PELO CONTRATO"
  }

  dimension_group: ultima_atualizacao {
    type: time    timeframes: [      raw,      time,      date,      week,      month,      quarter,      year    ]
    sql: ${TABLE}."ULTIMA_ATUALIZACAO";;
    description: "DATA DA ULTIMA ATUALIZAÇÃO DO REGISTRO"
  }

  dimension: urls_contrato {
    type: string
    sql: ${TABLE}."URLS_CONTRATO";;
    description: "ENDEREÇO ONDE ESTÁ ARMAZENADO O CONTRATO"
  }

  dimension: valor_assinatura {
    type: number
    sql: ${TABLE}."VALOR_ASSINATURA";;
    description: "VALOR DO CONTRATO SEM AS TAXAS"
  }

  dimension: vl_curso {
    type: number
    sql: ${TABLE}."VL_CURSO";;
    description: "VALOR TOTAL DO CURSO"
  }

  dimension: vl_mensalidade {
    type: string
    sql: ${TABLE}."VL_MENSALIDADE";;
    description: "VALOR DA MENSALIDADE DO CURSO"
  }

  dimension: vl_net_taxa_externa {
    type: number
    sql: ${TABLE}."VL_NET_TAXA_EXTERNA";;
    description: "VALOR NET DE TODAS AS TAXAS EXTERNAS COBRADAS"
  }

  dimension: vl_subsidio {
    type: number
    sql: ${TABLE}."VL_SUBSIDIO";;
    description: "INDICA O VALOR TOTAL DO SUBSIDIO APLICADO AO CONTRATO"
  }

  dimension: vl_total_contrato {
    type: number
    sql: ${TABLE}."VL_TOTAL_CONTRATO";;
    description: "VALOR TOTAL DO CONTRATO COM AS TAXAS"
  }

  dimension: vl_total_prefixado {
    type: number
    sql: ${TABLE}."VL_TOTAL_PREFIXADO";;
    description: "VALOR TOTAL PRE-FIXADO"
  }





  measure: count {
    type: count
    drill_fields: []
  }
}
