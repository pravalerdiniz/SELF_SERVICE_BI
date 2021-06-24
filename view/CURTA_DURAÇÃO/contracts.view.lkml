view: contracts {
  sql_table_name: "CURTA"."CONTRACTS"
    ;;

   dimension: anual_cet {
    type: string
    sql: ${TABLE}."ANUAL_CET";;
    group_item_label: "Porcentagem Anual CET"
    description: "PORCENTAGEM COBRADA PELO CET"
    group_label: "Taxas do Contrato"
  }

  dimension: bairro_resp_fin {
    type: string
    sql: ${TABLE}."BAIRRO_RESP_FIN";;
    description: "BAIRRO DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
    group_item_label: "Bairro doResponsável Financeiro"
    group_label: "Dados Responsável Financeiro"

  }

  dimension: flg_ultimo_status {
    type: string
    sql: ${TABLE}."FLG_ULTIMO_STATUS";;
    group_item_label: "Ultimo Status"
    description: "INDICA QUAL É O ULTIMO STATUS DO CONTRATO"
    group_label: "Dados do Contrato"

  }

  dimension: base_calculo_multa {
    type: string
    sql: ${TABLE}."BASE_CALCULO_MULTA";;
    group_item_label: "Base de Calculo para Multa"
    description: "INDICA QUAIS DIAS DEVEM SER CONTADOS PARA SE CALCULAR A MULTA"
    group_label: "Taxas do Contrato"

  }

  dimension: base_calculo_tx_juros_prefixada {

    type: string
    sql: ${TABLE}."BASE_CALCULO_TX_JUROS_PREFIXADA";;
    group_item_label: "Base de calculo Taxa de Juros Pre-fixada"
    description: "BASE UTILIZADA PAR ACALCULAR A TAXA DE JUROS PRE-FIXADA"
    group_label: "Taxas do Contrato"
  }

  dimension: base_iof {
    type: number
    sql: ${TABLE}."BASE_IOF";;
    group_item_label: "Valor Base IOF"
    description: "VALOR BASE DO IOF"
    group_label: "Taxas do Contrato"
  }

  dimension: carencia_juros {
    type: number
    sql: ${TABLE}."CARENCIA_JUROS";;
    group_item_label: "Carencia para Juros"
    description: "INDICA A QUANTIDADE DE DIAS DE CARENCIA PARA O CONTRATO PARA APLICAÇÃO DE JUROS E MULTAS"
    group_label: "Taxas do Contrato"
  }

  dimension: carencia_principal {
    type: number
    sql: ${TABLE}."CARENCIA_PRINCIPAL";;
    group_item_label: "Carencia Principal"
    description: "INDICA A QUANTIDADE PRINCIPAL DE CARENCIA"
    group_label: "Taxas do Contrato"
  }

  dimension: cep_resp_fin {
    type: string
    sql: ${TABLE}."CEP_RESP_FIN";;
    group_item_label: "Cep do Responsável Financeiro"
    description: "CEP DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: chave_payment {
    type: string
    sql: ${TABLE}."CHAVE_PAYMENT";;
    description: "CHAVE DE LIGAÇÃO ENTRE A TABELA DE CONTRATOS E PAYMENT"
    hidden: yes
  }

  dimension: cidade_resp_fin {
    type: string
    sql: ${TABLE}."CIDADE_RESP_FIN";;
    group_item_label: "Cidade "
    description: "CIDADE DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: cod_banco {
    type: string
    sql: ${TABLE}."COD_BANCO";;
    group_item_label: "Codigo do banco do Contratante"
    description: "CODIGO DO BANCO ONDE SERÁ FEITO O DÉBITO DOS VALORES"
    group_label: "Dados Bancarios do Contrato"
  }

  dimension: cod_pais_resp_fin {
    type: string
    sql: ${TABLE}."COD_PAIS_RESP_FIN";;
    group_item_label: "Codigo Telefonico do Pais "
    description: "CODIGO DO PAIS DO TELEFONE DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: compl_resp_fin {
    type: string
    sql: ${TABLE}."COMPL_RESP_FIN";;
    group_item_label: "Complemento do Endereço"
    description: "COMPLEMENTO DO ENDEREÇO DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF";;
    description: "NUMERO DO CPF DO ALUNO"
    group_item_label: "CPF"
    group_label: "Dados do Aluno"
  }

  dimension: cpf_resp_fin {
    type: string
    sql: ${TABLE}."CPF_RESP_FIN";;
    description: "CPF DO RESPONSÁVEL FINANCEIRO DO CONTRATO"
    group_item_label: "CPF"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: curso {
    type: string
    sql: ${TABLE}."CURSO";;
    description: "NOME DO CURSO DO CONTRATO"
    group_item_label: "Nome do Curso"
    group_label: "Dados do Contrato"
  }

  dimension_group: data_emissao {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_EMISSAO";;
    description: "DATA DE EMISSÃO DO CONTRATO"
    group_label: "Dados do Contrato"
    group_item_label: "Data de Criação do Contrato"
  }

  dimension_group: data_pagamento {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_PAGAMENTO";;
    description: "DATA DE PAGAMENTO DO CONTRATO"
    group_item_label: "Data de Pagamento do Contrato"
    group_label: "Dados do Contrato"
  }

  dimension: ddd_resp_fin {
    type: number
    sql: ${TABLE}."DDD_RESP_FIN";;
    description: "DDD DO TELEFONE DO RESPONSÁVEL FINANCEIRO DO CONTRATO"
    group_item_label: "DDD"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: desc_taxas {
    type: string
    sql: ${TABLE}."DESC_TAXAS";;
    description: "DESCRIÇÃO DA COMPOSIÇÃO DAS TAXAS CONTRATUAIS"
    group_item_label: "Descrição das Taxas"
    group_label: "Taxas do Contrato"
  }

  dimension: desc_taxas_externas {
    type: string
    sql: ${TABLE}."DESC_TAXAS_EXTERNAS";;
    description: "DESCRIÇÃO DA COMPOSIÇÃO DAS TAXAS EXTERNAS"
    group_item_label: "Descrição das Taxas Externas"
    group_label: "Taxas do Contrato"
  }

  dimension: desconto {
    type: number
    sql: ${TABLE}."DESCONTO";;
    description: "DESCONTO APLICADO AO CONTRATO"
    group_item_label: "Desconto"
    group_label: "Dados do Contrato"
  }

  measure: avg_desconto {
    type: average
    sql: ${TABLE}."DESCONTO";;
    description: "MÉDIA DE DESCONTO APLICADO AO CONTRATO"
    group_item_label: "Media de Desconto Aplicado"
  }


  dimension: digito_conta {
    type: string
    sql: ${TABLE}."DIGITO_CONTA";;
    description: "DIGITO DA CONTA BANCÁRIA ONDE SERÁ REALIZADO O DÉBITO DO PAGAMENTO"
    group_item_label: "Digito da Conta"
    group_label: "Dados Bancarios do Contrato"
  }

  dimension: document_number_banco {
    type: string
    sql: ${TABLE}."DOCUMENT_NUMBER_BANCO";;
    description: "DOCUMENTO DE IDENTIFICAÇÃO DA INSTITUIÇÃO FINANCEIRA"
    group_item_label: "Documento da Instituicao Financeira"
    group_label: "Dados Bancarios do Contrato"
  }

  dimension_group: dt_criacao_tx_juros_prefixada {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    sql: ${TABLE}."DT_CRIACAO_TX_JUROS_PREFIXADA";;
    description: "DATA DE CRIAÇÃO DA TAXA DE JUROS PRE-FIXADA"
    group_item_label: "Data de Criação da Taxa de Juros Pre-fixada"
    group_label: "Taxas do Contrato"
  }

  dimension: email_resp_fin {
    type: string
    sql: ${TABLE}."EMAIL_RESP_FIN";;
    description: "EMAIL DO RESPONSÁVEL FINANCEIRO DO CONTRATO"
    group_item_label: "E-mail"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: estado_resp_fin {
    type: string
    sql: ${TABLE}."ESTADO_RESP_FIN";;
    description: "ESTADO DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
    group_item_label: "Estado"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO";;
    description: "IDENTIFICADOR DO ALUNO"
    group_item_label: "Id do Aluno"
    group_label: "Dados do Aluno"
  }

  dimension: id_contrato {
    type: string
    sql: ${TABLE}."ID_CONTRATO";;
    description: "IDENTIFICADOR DO CONTRATO"
    group_item_label: "Id do Contrato"
    group_label: "Dados do Contrato"
  }

  dimension: iof_adicional {
    type: number
    sql: ${TABLE}."IOF_ADICIONAL";;
    description: "VALOR ADICIONAL DO IOF COBRADO"
    group_item_label: "IOF Adicional"
    group_label: "Taxas do Contrato"
  }

  dimension: motivo_cancelamento {
    type: string
    sql: ${TABLE}."MOTIVO_CANCELAMENTO";;
    description: "DESCRIÇÃO DO MOTIVO DE CANCELAMENTO DO CONTRATO"
    group_item_label: "Motivo do Cancelamento"
    group_label: "Dados do Contrato"
  }

  dimension: nacionalidade_resp_fin {
    type: string
    sql: ${TABLE}."NACIONALIDADE_RESP_FIN";;
    description: "NACIONALIDADE DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
    group_item_label: "Nacionalidade"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: nome_aluno {
    type: string
    sql: ${TABLE}."NOME_ALUNO";;
    description: "NOME COMPLETO DO ALUNO"
    group_item_label: "Nome"
    group_label: "Dados do Aluno"
  }

  dimension: nome_banco {
    type: string
    sql: ${TABLE}."NOME_BANCO";;
    description: "NOME DO BANCO ONDE SERÁ FEITO O PAGAMENTO"
    group_item_label: "Nome"
    group_label: "Dados Bancarios do Contrato"
  }

  dimension: nome_instituicao {
    type: string
    sql: ${TABLE}."NOME_INSTITUICAO";;
    description: "NOME DA INSTITUIÇÃO"
    group_item_label: "Nome da Instituição de Ensino"
    group_label: "Dados do Contrato"
  }

  dimension: nome_mae_resp_fin {
    type: string
    sql: ${TABLE}."NOME_MAE_RESP_FIN";;
    description: "NOME DA MÃE DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
    group_item_label: "Nome da Mãe"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: nome_resp_fin {
    type: string
    sql: ${TABLE}."NOME_RESP_FIN";;
    description: "NOME DO RESPONSÁVEL FINANCEIRO DO CONTRATO"
    group_item_label: "Nome"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: num_agencia {
    type: string
    sql: ${TABLE}."NUM_AGENCIA";;
    description: "NUMERO DA AGENCIA BANCÁRIA ONDE SERÁ FEITO O DEBITO DO PAGAMENTO"
    group_item_label: "Número da Agência"
    group_label: "Dados Bancarios do Contrato"
  }

  dimension: num_conta {
    type: string
    sql: ${TABLE}."NUM_CONTA";;
    description: "NUMERO DA CONTA BANCARIA ONDE SERÁ FEITO O DÉBITO DO PAGAMENTO"
    group_item_label: "Número da Conta"
    group_label: "Dados Bancarios do Contrato"
  }

  dimension: num_contrato {
    type: string
    sql: ${TABLE}."NUM_CONTRATO";;
    description: "NUMERO DO CONTRATO"
    group_item_label: "Número do Contrato"
    group_label: "Dados do Contrato"
  }

  dimension: numero_resp_fin {
    type: string
    sql: ${TABLE}."NUMERO_RESP_FIN";;
    description: "NUMERO DA RESIDENCIA DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
    group_item_label: "Número da Residência"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: parcelas {
    type: string
    sql: ${TABLE}."PARCELAS";;
    description: "DESCRIÇÃO DAS PARCELAS REFERENTES AO CONTRATO"
    group_item_label: "Parcelas"
    group_label: "Dados do Contrato"
  }

  dimension: porcentagem_cet {
    type: string
    sql: ${TABLE}."PORCENTAGEM_CET";;
    description: "VALOR DE PORCENTAGEM DO CET"
    group_item_label: "Porcentagem CET"
    group_label: "Taxas do Contrato"
  }

  dimension: porcentagem_subsidio {
    type: number
    sql: ${TABLE}."PORCENTAGEM_SUBSIDIO";;
    description: "INDICA A PORCENTAGEM DE SUBSIDIO APLICADA AO CONTRATO"
    group_item_label: "Porcentagem Subisidio"
    group_label: "Dados do Contrato"
  }

  dimension_group: primeira_data_vencimento {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    sql: ${TABLE}."PRIMEIRA_DATA_VENCIMENTO";;
    description: "DATA DO VENCIMENTO DA PRIMEIRA PARCELA"
    group_item_label: "Primeira Data de Vencimento"
    group_label: "Dados do Contrato"
  }

  dimension: procentagem_pagamento {
    type: number
    sql: ${TABLE}."PROCENTAGEM_PAGAMENTO";;
    description: "INDICA A PORCENTAGEM DO VALOR TOTAL DO CURSO QUE SERÁ RETIRADA DESSA CONTA"
    group_item_label: "Porcentagem do Valor do Pago"
    group_label: "Dados Bancarios do Contrato"
  }

  dimension: profissao_resp_fin {
    type: string
    sql: ${TABLE}."PROFISSAO_RESP_FIN";;
    description: "PROFISSÃO DO RESPONSÁVEL FINANCEIRO PELO CONTRATO"
    group_item_label: "Profissao"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: qtd_parcelas {
    type: number
    sql: ${TABLE}."QTD_PARCELAS";;
    description: "TOTAL DE PARCELAS QUE O CONTRATO FOI FEITO"
    group_item_label: "QTD de Parcelas"
    group_label: "Dados do Contrato"
  }

  dimension: recibos_ted {
    type: string
    sql: ${TABLE}."RECIBOS_TED";;
    description: "LISTA COM OS RECIBOS DOS TEDS REALIZADOS"
    group_item_label: "Recibos TED"
    group_label: "Dados Bancarios do Contrato"
  }

  dimension: rg_resp_fin {
    type: string
    sql: ${TABLE}."RG_RESP_FIN";;
    description: "RG DO RESPONSÁVEL FINANCEIRO DO CONTRATO"
    group_item_label: "RG"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: rua_resp_fin {
    type: string
    sql: ${TABLE}."RUA_RESP_FIN";;
    description: "NOME DA RUA DO RESPONSÁVEL_FINANCEIRO PELO CONTRATO"
    group_item_label: "Rua"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS";;
    description: "STATUS DO CONTRATO"
    group_item_label: "Status"
    group_label: "Dados do Contrato"
  }

  dimension: taxa_juros_anual_prefixada {
    type: number
    sql: ${TABLE}."TAXA_JUROS_ANUAL_PREFIXADA";;
    description: "TAAX DE JUROS ANUAL PRE-FIXADA PARA O CONTRATO"
    group_item_label: "Taxa de Juros Anual Pré-fixada"
    group_label: "Taxas do Contrato"
  }

  dimension: taxa_juros_diaria_prefixada {
    type: number
    sql: ${TABLE}."TAXA_JUROS_DIARIA_PREFIXADA";;
    description: "TAXA DE JUROS DIÁRIA PRE-FIXADA"
    group_item_label: "Taxa de Juros Diária Pré-fixada"
    group_label: "Taxas do Contrato"
  }

  dimension: taxa_juros_mensal_prefixada {
    type: number
    sql: ${TABLE}."TAXA_JUROS_MENSAL_PREFIXADA";;
    description: "TAXA DE JUROS MENSAL PRE-FIXADA"
    group_item_label: "Taxa de Juros Mensal Pré-fixada"
    group_label: "Taxas do Contrato"
  }

  dimension: taxa_mensal {
    type: number
    sql: ${TABLE}."TAXA_MENSAL";;
    description: "TAXA MÁXIMA QUE PODE SER COBRADA DENTRO DE UM MES"
    group_item_label: "Taxa Mensal"
    group_label: "Taxas do Contrato"
  }

  dimension: taxa_multa {
    type: number
    sql: ${TABLE}."TAXA_MULTA";;
    description: "TAXA DE MULTA APLICADA EM CIMA DO CONTRATO, CONTNADO OS DIAS CONFORME A BASE DE CALCULO INDICA"
    group_item_label: "Taxa de Multa"
    group_label: "Taxas do Contrato"
  }

  dimension: taxas_contratuais {
    type: string
    sql: ${TABLE}."TAXAS_CONTRATUAIS";;
    description: "VALOR DAS TAXAS CONTRATUAIS"
    group_item_label: "Total de Taxas Contratuais"
    group_label: "Taxas do Contrato"
  }

  dimension: taxas_externas {
    type: number
    sql: ${TABLE}."TAXAS_EXTERNAS";;
    description: "VALOR TOTAL DAS TAXAS EXTERNAS COBRADAS NO CONTRATO"
    group_item_label: "Total de Taxas Externas"
    group_label: "Taxas do Contrato"
  }

  dimension: telefone_resp_fin {
    type: number
    sql: ${TABLE}."TELEFONE_RESP_FIN";;
    description: "NUMERO DO TELEFONE DO RESPONSAVEL FINANCEIRO"
    group_item_label: "Telefone"
    group_label: "Dados Responsável Financeiro"
  }

  dimension: tipo_interesse {
    type: string
    sql: ${TABLE}."TIPO_INTERESSE";;
    description: "INDICA O TIPO DE MODALIDADE DE COBRANÇA DE MULTA DO CONTRATO"
    group_item_label: "Tipo de Modalidade para Cobrança de Multa"
    group_label: "Dados do Contrato"
  }

  dimension: tipo_operacao {
    type: string
    sql: ${TABLE}."TIPO_OPERACAO";;
    description: "INDICA O TIPO DE OPERAÇÃO DE CRÉDITO REALIZADA PARA ESSE CONTRATO"
    group_item_label: "Tipo de Operação de Crédito"
    group_label: "Dados do Contrato"
  }

  dimension: total_iof {
    type: number
    sql: ${TABLE}."TOTAL_IOF";;
    description: "VALOR TOTAL COBRADO DE IOF"
    group_item_label: "Total IOF"
    group_label: "Taxas do Contrato"
  }

  dimension: total_mensalidades {
    type: string
    sql: ${TABLE}."TOTAL_MENSALIDADES";;
    description: "TOTAL DE MENSALIDADES DO CONTRATO"
    group_item_label: "Total de Mensalidades"
    group_label: "Dados do Contrato"
  }

  dimension: tx_juros_anul {
    type: number
    sql: ${TABLE}."TX_JUROS_ANUL";;
    description: "INDICA A TAXA DE JUROS ANUAL COBRADA PELO CONTRATO"
    group_item_label: "Taxa de Juros Anual"
    group_label: "Taxas do Contrato"
  }

  dimension_group: ultima_atualizacao {
    type: time    timeframes: [      raw,      time,      date,      week,      month,      quarter,      year    ]
    sql: ${TABLE}."ULTIMA_ATUALIZACAO";;
    description: "DATA DA ULTIMA ATUALIZAÇÃO DO REGISTRO"
    group_item_label: "Data da Ultima Atualização"
    group_label: "Dados do Contrato"
  }

  dimension: urls_contrato {
    type: string
    sql: ${TABLE}."URLS_CONTRATO";;
    description: "ENDEREÇO ONDE ESTÁ ARMAZENADO O CONTRATO"
    group_item_label: "URLs do Contrato"
    group_label: "Dados do Contrato"
  }

  measure: valor_assinatura {
    type: sum
    sql: ${TABLE}."VALOR_ASSINATURA";;
    description: "VALOR DO CONTRATO SEM AS TAXAS"
    group_item_label: "Valor do Contrato sem Taxas"
    group_label: "Dados do Contrato"
  }

  dimension: vl_curso {
    type: number
    sql: ${TABLE}."VL_CURSO";;
    description: "VALOR TOTAL DO CURSO"
    group_item_label: "Valor do Curso"
    group_label: "Dados do Contrato"
  }

  dimension: vl_mensalidade {
    type: string
    sql: ${TABLE}."VL_MENSALIDADE";;
    description: "VALOR DA MENSALIDADE DO CURSO"
    group_item_label: "Valor da Mensalidade"
    group_label: "Dados do Contrato"
  }

  dimension: vl_net_taxa_externa {
    type: number
    sql: ${TABLE}."VL_NET_TAXA_EXTERNA";;
    description: "VALOR NET DE TODAS AS TAXAS EXTERNAS COBRADAS"
    group_item_label: "Valor NET de Taxas Externas"
    group_label: "Taxas do Contrato"
  }

  measure: vl_subsidio {
    type: sum
    sql: ${TABLE}."VL_SUBSIDIO";;
    description: "INDICA O VALOR TOTAL DO SUBSIDIO APLICADO AO CONTRATO"
    group_item_label: "Valor do Subsidio"
    group_label: "Dados do Contrato"
  }

  measure: vl_total_contrato {
    type: sum
    sql: ${TABLE}."VL_TOTAL_CONTRATO";;
    description: "VALOR TOTAL DO CONTRATO COM AS TAXAS"
    group_item_label: "Valor Total do Contrato"
    group_label: "Dados do Contrato"
  }

  dimension: vl_total_prefixado {
    type: number
    sql: ${TABLE}."VL_TOTAL_PREFIXADO";;
    description: "VALOR TOTAL PRE-FIXADO"
    group_item_label: "Valor Total Pré-fixado"
    group_label: "Dados do Contrato"
  }





  measure: count {
    type: count_distinct
    drill_fields: []
    group_item_label: "Total de contratos"

  }
}
