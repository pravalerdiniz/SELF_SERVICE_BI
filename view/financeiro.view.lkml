view: financeiro {
  sql_table_name: "SELF_SERVICE_BI"."FINANCEIRO"
    ;;

  dimension_group: data_baixa {
    type: time
    timeframes: [
      raw,
      date,
    ]
    convert_tz: no
    group_label: "Status do Boleto"
    label: "Data de Baixa"
    description: "Indica a data de baixa realizada"
    datatype: date
    sql: ${TABLE}."DATA_BAIXA" ;;
  }

  dimension_group: data_compra {
    type: time
    timeframes: [
      raw,
      date,
    ]
    convert_tz: no
    datatype: date
    group_label: "Dados do Título"
    label: "Data de Compra"
    description: "Indica a Data de Compra do Título"
    sql: ${TABLE}."DATA_COMPRA" ;;
  }

  dimension_group: data_despesa {
    type: time
    timeframes: [
      raw,
      date,
    ]
    convert_tz: no
    datatype: date
    group_label: "Dados do Título"
    label: "Data de Despesa"
    description: "Indica a Data que a despesa pode ser cobrada"
    sql: ${TABLE}."DATA_DESPESA" ;;
  }

  dimension_group: data_entrada {
    type: time
    timeframes: [
      raw,
      date,
    ]
    convert_tz: no
    datatype: date
    group_label: "Dados do Título"
    label: "Data de Entrada"
    description: "Indica a data de Entrada do Título do Sistema"
    sql: ${TABLE}."DATA_ENTRADA" ;;
  }

  dimension_group: data_pagamento {
    type: time
    timeframes: [
      raw,
      date,
    ]
    convert_tz: no
    datatype: date
    group_label: "Dados do Boleto"
    label: "Data de Pagamento"
    description: "Indica a data que o boleto foi pago"
    sql: ${TABLE}."DATA_PAGAMENTO" ;;
  }

  dimension_group: data_vencimento {
    type: time
    timeframes: [
      raw,
      date,
    ]
    convert_tz: no
    datatype: date
    group_label: "Dados do Boleto"
    label: "Data de Vencimento"
    description: "Indica a data de vencimento do boleto"
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  dimension_group: data_writeoff {
    type: time
    timeframes: [
      raw,
      date,
    ]
    convert_tz: no
    datatype: date
    group_label: "Dados do Título"
    label: "Data de WriteOff"
    description: "Indica a data de entrada do título no W.O"
    sql: ${TABLE}."DATA_WRITEOFF" ;;
  }

  dimension: dias_atraso {
    type: number
    group_label: "Dados do Boleto"
    label: "Número de dias de atraso"
    description: "Indica o número de dias de atraso após vencimento do boleto."
    sql: ${TABLE}."DIAS_ATRASO" ;;
  }

  dimension: ds_baixa {
    type: string
    group_label: "Status do Boleto"
    label: "Tipo de Baixa"
    description: "Indica o tipo de baixa do boleto.
    Ex: Quitação, Em aberto, Baixa Manual, Baixa Automática, Baixa Judicial, entre outros."
    sql: ${TABLE}."DS_BAIXA" ;;
  }

  dimension: ds_banco {
    type: string
    group_label: "Dados do Banco"
    label: "Nome do Banco"
    description: "Indica o nome do Banco responsável pela geração do boleto"
    sql: ${TABLE}."DS_BANCO" ;;
  }

  dimension: ds_fundo_investimento {
    type: string
    group_label: "Dados do Fundo de Investimento"
    label: "Nome do Fundo de Investimento"
    description: "Indica o nome do fundo de investimento"
    sql: ${TABLE}."DS_FUNDO_INVESTIMENTO" ;;
  }

  dimension: ds_tipo_boleto {
    type: string
    group_label: "Dados do Boleto"
    label: "Tipo do Boleto"
    description: "Indica o tipo de boleto gerado. Ex: Original ou Avulso"
    sql: ${TABLE}."DS_TIPO_BOLETO" ;;
  }

  dimension: ds_titulo_classificacao {
    type: string
    group_label: "Dados do Título"
    label: "Classificação do Título"
    description: "Indica qual a classificação do título gerado.
    Ex: Contrato, Antecipação de Parcelas, Boleto de Matrícula Expressa, Avulso, entre outros. "
    sql: ${TABLE}."DS_TITULO_CLASSIFICACAO" ;;
  }

  dimension: ds_titulo_status {
    type: string
    group_label: "Status do Boleto"
    label: "Nome do Status"
    description: "Indica qual é o status do título gerado.
    Ex: Ativo, Recompra, Cobrança, Erro Operacional, Cancelamento Boleto Matrícula, entre outros."
    sql: ${TABLE}."DS_TITULO_STATUS" ;;
  }

  dimension: flg_baixa_manual {
    type: yesno
    group_label: "Status do Boleto"
    label: "Baixa Manual?"
    description: "Indica se foi realizada a baixa manual do boleto"
    sql: ${TABLE}."FLG_BAIXA_MANUAL" ;;
  }

  dimension: flg_boleto_atrasado {
    type: yesno
    group_label: "Dados do Boleto"
    label: "Boleto Atrasado?"
    description: "Indica se o boleto passou da data de vencimento"
    sql: ${TABLE}."FLG_BOLETO_ATRASADO" ;;
  }

  dimension: flg_boleto_pago {
    type: yesno
    group_label: "Dados do Boleto"
    label: "Boleto Pago?"
    description: "Indica se o boleto já foi pago pelo aluno"
    sql: ${TABLE}."FLG_BOLETO_PAGO" ;;
  }

  dimension: flg_writeoff {
    type: yesno
    group_label: "Dados do Título"
    label: "Entrou em WriteOff?"
    description: "Indica se o título entrou no W.O"
    sql: ${TABLE}."FLG_WRITEOFF" ;;
  }

  dimension: id_baixa {
    type: number
    group_label: "Status do Boleto"
    label: "ID Baixa"
    description: "Indica o código de identificação da baixa do boleto."
    sql: ${TABLE}."ID_BAIXA" ;;
  }

  dimension: id_banco {
    type: number
    group_label: "Dados do Banco"
    label: "ID do Banco"
    description: "Indica o ID do Banco responsável pela geração do boleto"
    sql: ${TABLE}."ID_BANCO" ;;
  }

  dimension: id_boleto {
    type: number
    group_label: "Dados do Boleto"
    label: "ID do Boleto"
    description: "Indica o código de identificação do boleto. O número do Cedente (cednum)."
    sql: ${TABLE}."ID_BOLETO" ;;
  }

  dimension: id_contrato {
    type: number
    group_label: "Dados do Aluno"
    label: "ID do Contrato"
    description: "Indica o número do contrato do aluno com PRAVALER"
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  dimension: id_cpf {
    type: number
    group_label: "Dados do Aluno"
    label: "ID CPF"
    description: "Indica o código de referência do CPF do Aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_extrato_titulo_info {
    type: string
    group_label: "Dados do Aluno"
    label: "Extrato titulo"
    description: "Indica os IDs correspondentes de extratos de titulos de alunos do produto GESTÃO"
    sql: ${TABLE}."ID_EXTRATO_TITULO_INFO" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    group_label: "Dados do Fundo de Investimento"
    label: "ID do Fundo de Investimento"
    description: "Indica a identificação do fundo de investimento"
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: id_log_titulo_info {
    type: string
    group_label: "Dados do Título"
    label: "ID Titulo Info - Log"
    description: "Indica o ID correspondente a URL da geração do título"
    sql: ${TABLE}."ID_LOG_TITULO_INFO" ;;
  }

  dimension: id_nossonum {
    type: number
    group_label: "Dados do Boleto"
    label: "Nossonum"
    description: "Indica o código de controle que permite o PRAVALER e ao Aluno identificar os dados da cobrança que deu origem ao Boleto de Pagamento"
    sql: ${TABLE}."ID_NOSSONUM" ;;
  }

  dimension: id_seunum {
    type: number
    group_label: "Dados do Boleto"
    label: "Seunum"
    description: "Indica o código único do boleto."
    sql: ${TABLE}."ID_SEUNUM" ;;
  }

  dimension: id_titulo {
    type: number
    group_label: "Dados do Título"
    label: "ID Titulo"
    description: "Indica o ID único da tabela"
    sql: ${TABLE}."ID_TITULO" ;;
  }

  dimension: id_titulo_classificacao {
    type: number
    group_label: "Dados do Título"
    label: "ID Classificação do Título "
    description: "Indica o ID correspondente a classificação do título gerado."
    sql: ${TABLE}."ID_TITULO_CLASSIFICACAO" ;;
  }

  dimension: id_titulo_status {
    type: number
    group_label: "Status do Boleto"
    label: "ID do Status"
    description: "Indica o ID correspondente ao status do título gerado."
    sql: ${TABLE}."ID_TITULO_STATUS" ;;
  }

  dimension: num_parcela {
    type: number
    group_label: "Dados do Aluno"
    label: "Número da Parcela"
    description: "Indica o número da parcela do contrato que o boleto está."
    sql: ${TABLE}."NUM_PARCELA" ;;
  }

  dimension: perc_ipca {
    type: number
    group_label: "Dados do Boleto"
    label: "Percentual de IPCA"
    description: "Indica o valor em percentual da taxa de IPCA do boleto"
    sql: ${TABLE}."PERC_IPCA" ;;
  }

  dimension: vl_aquisicao {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,###"
    label: "Valor de Aquisição"
    description: "Indica o valor de aquisiçao do título"
    sql: ${TABLE}."VL_AQUISICAO" ;;
  }

  dimension: vl_boleto {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,###"
    label: "Valor de Boleto"
    description: "Indica o valor do boleto"
    sql: ${TABLE}."VL_BOLETO" ;;
  }

  dimension: vl_despesa {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,###"
    label: "Valor de Despesa"
    description: "Indica o valor de cobrança de despesa do título."
    sql: ${TABLE}."VL_DESPESA" ;;
  }

  dimension: vl_ipca {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,###"
    label: "Valor do IPCA"
    description: "Indica o valor do IPCA sobre o título."
    sql: ${TABLE}."VL_IPCA" ;;
  }

  dimension: vl_juros {
    type: number
    group_label: "Dados do Boleto"
    label: "Valor de Juros"
    description: "Indica o valor de juros aplicado sobre o boleto"
    sql: ${TABLE}."VL_JUROS" ;;
  }

  dimension: vl_multa {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,###"
    label: "Valor da Multa"
    description: "Indica o valor da multa aplicada sobre o boleto"
    sql: ${TABLE}."VL_MULTA" ;;
  }

  dimension: vl_pago {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,###"
    label: "Valor do Pagamento"
    description: "Indica o valor de pagamento do boleto gerado"
    sql: ${TABLE}."VL_PAGO" ;;
  }

  dimension: vl_pago_credito {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,###"
    label: "Valor do Pagamento - Crédito"
    description: "Indica o valor de pagamento por crédito do boleto gerado"
    sql: ${TABLE}."VL_PAGO_CREDITO" ;;
  }

  dimension: vl_pago_debito {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,###"
    label: "Valor do Pagamento - Débito"
    description: "Indica o valor de pagamento por débito do boleto gerado"
    sql: ${TABLE}."VL_PAGO_DEBITO" ;;
  }

  dimension: vl_seguro {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,###"
    label: "Valor do Seguro"
    description: "Indica o valor do seguro do boleto gerado"
    sql: ${TABLE}."VL_SEGURO" ;;
  }

  dimension: vl_taxa {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,###"
    label: "Valor da Taxa Bancária"
    description: "Indica o valor da taxa bancária"
    sql: ${TABLE}."VL_TAXA" ;;
  }




  measure: count {
    type: count
    drill_fields: []
  }


  measure: avg_aquisicao {
    type: average
    sql: ${vl_aquisicao} ;;
    value_format: "$ #,###"
    group_label: "Valor de Aquisição"
    group_item_label: "Média"
    description: "Valor médio de aquisição do titulo"
  }

  measure: sum_aquisicao {
    type: sum
    sql: ${vl_aquisicao} ;;
    value_format: "$ #,###"
    group_label: "Valor de Aquisição"
    group_item_label: "Soma"
    description: "Soma do valor de aquisição do titulo"
  }


  measure: min_aquisicao {
    type: min
    sql: ${vl_aquisicao} ;;
    value_format: "$ #,###"
    group_label: "Valor de Aquisição"
    group_item_label: "Mínimo"
    description: "Valor minimo de aquisição do titulo"
  }


  measure: max_aquisicao {
    type: max
    sql: ${vl_aquisicao} ;;
    value_format: "$ #,###"
    group_label: "Valor de Aquisição"
    group_item_label: "Máximo"
    description: "Valor máximo de aquisição do titulo"
  }


  measure: avg_boleto {
    type: average
    sql: ${vl_boleto} ;;
    value_format: "$ #,###"
    group_label: "Valor do Boleto"
    group_item_label: "Média"
    description: "Valor médio do boleto."
  }

  measure: sum_boleto {
    type: sum
    sql: ${vl_boleto} ;;
    value_format: "$ #,###"
    group_label: "Valor do Boleto"
    group_item_label: "Soma"
    description: "Soma do valor do boleto."
  }


  measure: min_boleto {
    type: min
    sql: ${vl_boleto} ;;
    value_format: "$ #,###"
    group_label: "Valor do Boleto"
    group_item_label: "Mínimo"
    description: "Valor minimo do boleto"
  }


  measure: max_boleto {
    type: max
    sql: ${vl_boleto} ;;
    value_format: "$ #,###"
    group_label: "Valor do Boleto"
    group_item_label: "Máximo"
    description: "Valor máximo de aquisição do titulo"
  }


  measure: avg_despesa {
    type: average
    sql: ${vl_despesa} ;;
    value_format: "$ #,###"
    group_label: "Valor de Despesa"
    group_item_label: "Média"
    description: "Valor médio de cobrança da despesa"
  }

  measure: sum_despesa {
    type: sum
    sql: ${vl_despesa} ;;
    value_format: "$ #,###"
    group_label: "Valor de Despesa"
    group_item_label: "Soma"
    description: "Soma do valor de cobrança da despesa."
  }


  measure: min_despesa {
    type: min
    sql: ${vl_despesa} ;;
    value_format: "$ #,###"
    group_label: "Valor de Despesa"
    group_item_label: "Mínimo"
    description: "Valor minimo de cobrança da despesa"
  }


  measure: max_despesa {
    type: max
    sql: ${vl_despesa} ;;
    value_format: "$ #,###"
    group_label: "Valor de Despesa"
    group_item_label: "Máximo"
    description: "Valor máximo de cobrança da despesa"
  }

  measure: avg_juros {
    type: average
    sql: ${vl_juros} ;;
    value_format: "$ #,###"
    group_label: "Valor de Juros"
    group_item_label: "Média"
    description: "Valor médio de juros aplicado"
  }

  measure: sum_juros {
    type: sum
    sql: ${vl_juros} ;;
    value_format: "$ #,###"
    group_label: "Valor de Juros"
    group_item_label: "Soma"
    description: "Soma do valor de juros aplicado"
  }


  measure: min_juros {
    type: min
    sql: ${vl_juros} ;;
    value_format: "$ #,###"
    group_label: "Valor de Juros"
    group_item_label: "Mínimo"
    description: "Valor minimo de juros aplicado"
  }


  measure: max_juros {
    type: max
    sql: ${vl_juros} ;;
    value_format: "$ #,###"
    group_label: "Valor de Juros"
    group_item_label: "Máximo"
    description: "Valor máximo de juros aplicado"
  }


  measure: avg_multa {
    type: average
    sql: ${vl_multa} ;;
    value_format: "$ #,###"
    group_label: "Valor de Multa"
    group_item_label: "Média"
    description: "Valor médio de multa aplicada"
  }

  measure: sum_multa {
    type: sum
    sql: ${vl_multa} ;;
    value_format: "$ #,###"
    group_label: "Valor de Multa"
    group_item_label: "Soma"
    description: "Soma do valor da multa aplicada"
  }


  measure: min_multa {
    type: min
    sql: ${vl_multa} ;;
    value_format: "$ #,###"
    group_label: "Valor de Multa"
    group_item_label: "Mínimo"
    description: "Valor minimo da multa aplicada"
  }


  measure: max_multa {
    type: max
    sql: ${vl_multa} ;;
    value_format: "$ #,###"
    group_label: "Valor de Multa"
    group_item_label: "Máximo"
    description: "Valor máximo de multa aplicada"
  }



  measure: avg_pago {
    type: average
    sql: ${vl_pago} ;;
    value_format: "$ #,###"
    group_label: "Valor Pago"
    group_item_label: "Média"
    description: "Valor médio dos boletos pagos"
  }

  measure: sum_pago {
    type: sum
    sql: ${vl_pago} ;;
    value_format: "$ #,###"
    group_label: "Valor Pago"
    group_item_label: "Soma"
    description: "Soma do valor de boletos pagos"
  }


  measure: min_pago {
    type: min
    sql: ${vl_pago} ;;
    value_format: "$ #,###"
    group_label: "Valor Pago"
    group_item_label: "Mínimo"
    description: "Valor minimo de boletos pagos"
  }


  measure: max_pago {
    type: max
    sql: ${vl_pago} ;;
    value_format: "$ #,###"
    group_label: "Valor Pago"
    group_item_label: "Máximo"
    description: "Valor máximo de boletos pagos"
  }

  measure: avg_pago_credito {
    type: average
    sql: ${vl_pago_credito} ;;
    value_format: "$ #,###"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Média"
    description: "Valor médio de pagamentos por crédito "
  }

  measure: sum_pago_credito {
    type: sum
    sql: ${vl_pago_credito} ;;
    value_format: "$ #,###"
    group_label: "Valor Pago -  Crédito"
    group_item_label: "Soma"
    description: "Soma do valor de pagamentos por crédito"
  }


  measure: min_pago_credito {
    type: min
    sql: ${vl_pago} ;;
    value_format: "$ #,###"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Mínimo"
    description: "Valor minimo de pagamento por crédito"
  }


  measure: max_pago_credito {
    type: max
    sql: ${vl_pago} ;;
    value_format: "$ #,###"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Máximo"
    description: "Valor máximo de pagamento por crédito"
  }










}