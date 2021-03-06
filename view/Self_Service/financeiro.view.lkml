view: financeiro {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO"
    ;;

  dimension_group: data_baixa {
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
    label: "Baixa"
    description: "Indica a data de baixa realizada"
    datatype: date
    sql: ${TABLE}."DATA_BAIXA" ;;
  }





  dimension_group: data_compra {
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

    label: "Compra"
    description: "Indica a Data de Compra do Título"
    sql: ${TABLE}."DATA_COMPRA" ;;
  }

  dimension_group: data_despesa {
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
    label: "Despesa"
    description: "Indica a Data que a despesa pode ser cobrada"
    sql: ${TABLE}."DATA_DESPESA" ;;
  }

  dimension_group: data_entrada {
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

    label: "Entrada"
    description: "Indica a data de Entrada do Título do Sistema"
    sql: ${TABLE}."DATA_ENTRADA" ;;
  }

  dimension_group: data_pagamento {
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

    label: "Pagamento"
    description: "Indica a data que o boleto foi pago"
    sql: ${TABLE}."DATA_PAGAMENTO" ;;
  }

  dimension_group: data_vencimento {
    type: time
    timeframes: [
       raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Vencimento"
    description: "Indica a data de vencimento do boleto"
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  measure: min_data_vencimento {
    type:  date
    label: "Menor Data Vencimento"
    description: "Indica a menor data de vencimento do boleto"
    sql: min(${data_vencimento_date}) ;;
  }

  dimension: pagamento_prazo {
    sql: CASE
        WHEN ${TABLE}."DATA_PAGAMENTO" > ${TABLE}."DATA_VENCIMENTO"  THEN 'Atrasado'
        ELSE 'No Prazo'
        END ;;
    label: "Pagou no prazo"
    description: "Indica se boleto foi pago no prazo ou em atraso"
  }

  dimension_group: data_writeoff {
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

    label: "WriteOff"
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
    value_format: "#"
  }



  dimension: id_banco {
    type: number
    group_label: "Dados do Banco"
    label: "ID do Banco"
    description: "Indica o ID do Banco responsável pela geração do boleto"
    sql: ${TABLE}."ID_BANCO" ;;
    value_format: "#"
  }

  dimension: id_boleto {
    type: string
    group_label: "Dados do Boleto"
    label: "ID do Boleto"
    description: "Indica o código de identificação do boleto. O número do Cedente (cednum)."
    sql: ${TABLE}."ID_BOLETO" ;;
    value_format: "#"
  }

  dimension: id_contrato {
    type: string
    group_label: "Dados do Aluno"
    label: "ID do Contrato"
    description: "Indica o número do contrato do aluno com PRAVALER"
    sql: ${TABLE}."ID_CONTRATO" ;;

  }

  measure: array_contrato {
    type: list
    group_label: "Dados do Aluno"
    label: "Lista de Contratos"
    description: "Exibe todos os contratos do aluno segundo os filtros selecionados"
#sql:  listagg(${TABLE}."ID_CONTRATO",',')  ;;
    list_field: id_contrato
    }

  dimension: id_cpf {
    type: number
    group_label: "Dados do Aluno"
    label: "ID CPF"
    description: "Indica o código de referência do CPF do Aluno"
    sql: ${TABLE}."ID_CPF" ;;
    value_format: "#"
  }

  dimension: id_extrato_titulo_info {
    type: string
    group_label: "Dados do Aluno"
    label: "Extrato titulo"
    hidden: yes
    description: "Indica os IDs correspondentes de extratos de titulos de alunos do produto GESTÃO"
    sql: ${TABLE}."ID_EXTRATO_TITULO_INFO" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    group_label: "Dados do Fundo de Investimento"
    label: "ID do Fundo de Investimento"
    description: "Indica a identificação do fundo de investimento"
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
    value_format: "#"
  }

  dimension: id_log_titulo_info {
    type: string
    group_label: "Dados do Título"
    hidden: yes
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
    value_format: "#"
  }

  dimension: id_seunum {
    type: number
    group_label: "Dados do Boleto"
    label: "Seunum"
    description: "Indica o código único do boleto."
    sql: ${TABLE}."ID_SEUNUM" ;;
    value_format: "#"
  }

  dimension: id_titulo {
    type: number
    group_label: "Dados do Título"
    label: "ID Titulo"
    description: "Indica o ID único do título."
    sql: ${TABLE}."ID_TITULO" ;;
    primary_key: yes
    value_format: "#"
  }

  dimension: id_titulo_classificacao {
    type: number
    group_label: "Dados do Título"
    label: "ID Classificação do Título "
    description: "Indica o ID correspondente a classificação do título gerado."
    sql: ${TABLE}."ID_TITULO_CLASSIFICACAO" ;;
    value_format: "#"
  }

  dimension: id_titulo_status {
    type: number
    group_label: "Status do Boleto"
    label: "ID do Status"
    description: "Indica o ID correspondente ao status do título gerado."
    sql: ${TABLE}."ID_TITULO_STATUS" ;;
    value_format: "#"
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
    value_format: "0.00\%"
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
    value_format: "$ #,##0.00"
    label: "Valor de Boleto"
    description: "Indica o valor do boleto"
    sql: ${TABLE}."VL_BOLETO" ;;
  }

  dimension: vl_total {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor Total"
    description: "Indica o valor total do boleto. Considerando: Valor de Boleto + Juros + Multa + Despesa de Cobrança"
    sql: CASE WHEN ${dias_atraso} = 0 THEN ${vl_boleto}
          WHEN ${dias_atraso} > 0 AND ${dias_atraso} < 11 THEN (${dias_atraso} * ${vl_juros}) + ${vl_boleto} +  ${vl_multa}
          WHEN ${dias_atraso} > 10 THEN (${dias_atraso} * ${vl_juros}) + ${vl_boleto} + ${vl_multa} + ${vl_despesa}
          ELSE 0 END;;
  }

  dimension: ativo_boleto {
    type: number
    group_label: "Gestão de Portifólio (Dados do Boleto)"
    label: "Ativo do Boleto"
    description: "Indica qual o ativo do boleto"
    sql: CASE WHEN ${id_fundo_investimento} = 6 THEN ${id_titulo_status} = 2
      ELSE ${id_titulo_status} IN (2,4,14) END;;
      hidden: yes
  }

  dimension: vl_despesa {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,##0.00"
    label: "Valor de Despesa"
    description: "Indica o valor de cobrança de despesa do título."
    sql: ${TABLE}."VL_DESPESA" ;;
  }

  dimension: vl_ipca {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,##0.00"
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
    value_format: "$ #,##0.00"
    label: "Valor da Multa"
    description: "Indica o valor da multa aplicada sobre o boleto"
    sql: ${TABLE}."VL_MULTA" ;;
  }

  dimension: vl_pago {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor do Pagamento"
    description: "Indica o valor de pagamento do boleto gerado"
    sql: ${TABLE}."VL_PAGO" ;;
  }

  dimension: vl_pago_credito {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor do Pagamento - Crédito"
    description: "Indica o valor de pagamento por crédito do boleto gerado"
    sql: ${TABLE}."VL_PAGO_CREDITO" ;;
  }

  dimension: vl_pago_debito {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor do Pagamento - Débito"
    description: "Indica o valor de pagamento por débito do boleto gerado"
    sql: ${TABLE}."VL_PAGO_DEBITO" ;;
  }

  dimension: vl_seguro {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor do Seguro"
    description: "Indica o valor do seguro do boleto gerado"
    sql: ${TABLE}."VL_SEGURO" ;;
  }

  dimension: vl_taxa {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor da Taxa Bancária"
    description: "Indica o valor da taxa bancária"
    sql: ${TABLE}."VL_TAXA" ;;
  }







  dimension: flg_titulo_diferenca {
    type: yesno
    group_label: "Dados do Boleto"
    label: "Boleto de Diferença?"
    description: "Indica se o boleto é um titulo de diferença. Diferença: Valores de diferença a serem repassados do título que
foi gerado por um pagamento menor do boleto anterior."
    sql: ${TABLE}."FLG_TITULO_DIFERENCA" ;;
  }


  dimension: cpf_aluno {
    sql: ${proposta.cpf_aluno};;
    hidden: yes

  }

  dimension: aluno_email {
    sql: ${proposta.aluno_email};;
    hidden: yes

  }


  dimension: aluno_celular {
    sql: ${proposta.aluno_celular};;
    hidden: yes

  }


  dimension: grupo_instituicao {
    sql: ${proposta.grupo_instituicao};;
    hidden: yes

  }


  dimension: ds_instituicao {
    sql: ${proposta.ds_instituicao};;
    hidden: yes

  }



  dimension: ds_campus {
    sql: ${proposta.ds_campus};;
    hidden: yes

  }





  dimension: nm_modalidade_produto{
    sql: ${proposta.nm_modalidade_produto};;
    hidden: yes

  }


  dimension: nm_produto{
    sql: ${proposta.nm_produto};;
    hidden: yes

  }

  dimension: ds_curso{
    sql: ${proposta.ds_curso};;
    hidden: yes

  }

  dimension: aluno_nome {
    sql: ${proposta.aluno_nome};;
    hidden: yes

  }




  measure: count_titulo {
    type: count
    value_format: "0"
    group_item_label: "Quantidade de titulos"
    drill_fields: [

      cpf_aluno, aluno_nome,id_contrato,
      aluno_email,
      aluno_celular,
      ds_curso,
      grupo_instituicao,
      ds_instituicao,
      ds_campus,
      nm_modalidade_produto,
      nm_produto,
      id_titulo,
      dias_atraso,
      vl_boleto,
      data_pagamento_date,
      data_vencimento_date,





    ]
  }


  measure: count_alunos {
    type: count_distinct
    sql: ${id_cpf} ;;
    value_format: "0"
    group_label: "Quantidade de Alunos"
    group_item_label: "Valor"
    description: "Contagem de ID_CPFs únicos"
    drill_fields: [
      cpf_aluno, aluno_nome,id_contrato,
      aluno_email,
      aluno_celular,
      ds_curso,
      grupo_instituicao,
      ds_instituicao,
      ds_campus,
      nm_modalidade_produto,
      nm_produto,
      id_boleto,
      dias_atraso,
      vl_boleto,
      data_pagamento_date,
      data_vencimento_date,


      ]
  }

  measure: perc_alunos {
    type: percent_of_total
    sql: ${count_alunos} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Porcentagem"
    description: "Porcentagem da quantidade de alunos."


  }

  measure: count_atraso {
    type: count
    value_format: "0"
    group_label: "Atraso"
    group_item_label: "Quantidade de Boletos em Atraso"
    description: "Indica a quantidade total de boletos em atraso"
    filters: [flg_boleto_atrasado: "Yes"]
    drill_fields: [id_cpf, id_contrato, data_vencimento_date,data_pagamento_date]
  }



  measure: avg_dias_atraso {
    type: average
    sql: ${dias_atraso} ;;
    value_format: "0"
    group_label: "Atraso"
    group_item_label: "Dias - Média"
    description: "Média de dias de atraso de pagamento do boleto"
    drill_fields: [id_cpf, id_contrato, data_vencimento_date,data_pagamento_date]
  }

  measure: sum_dias_atraso {
    type: sum
    sql: ${dias_atraso} ;;
    value_format: "0"
    group_label: "Atraso"
    group_item_label: "Dias - Soma"
    description: "Soma de dias de atraso de pagamento do boleto"
    drill_fields: [id_cpf, id_contrato, data_vencimento_date,data_pagamento_date]
  }




  measure: max_dias_atraso {
    type: max
    sql: ${dias_atraso} ;;
    value_format: "0"
    group_label: "Atraso"
    group_item_label: "Dias - Máximo"
    description: "Valor máximo de dias de atraso do pagamento do boleto"
    drill_fields: [id_cpf, id_contrato, data_vencimento_date,data_pagamento_date]
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
    value_format: "$ #,###.00"
    group_label: "Valor de Aquisição"
    group_item_label: "Máximo"
    description: "Valor máximo de aquisição do titulo"
  }


  measure: avg_boleto {
    type: average
    sql: ${vl_boleto} ;;
    value_format: "$ #,###.00"
    group_label: "Valor do Boleto"
    group_item_label: "Média"
    description: "Valor médio do boleto."
  }

  measure: sum_boleto {
    type: sum
    sql: ${vl_boleto} ;;
    value_format: "$ #,###.00"
    group_label: "Valor do Boleto"
    group_item_label: "Soma"
    description: "Soma do valor do boleto."
    drill_fields: [
      cpf_aluno, aluno_nome,id_contrato,
      aluno_email,
      aluno_celular,
      ds_curso,
      grupo_instituicao,
      ds_instituicao,
      ds_campus,
      nm_modalidade_produto,
      nm_produto,
      id_boleto,
      dias_atraso,
      vl_boleto,
      data_pagamento_date,
      data_vencimento_date,


      ]
  }


  measure: min_boleto {
    type: min
    sql: ${vl_boleto} ;;
    value_format: "$ #,###.00"
    group_label: "Valor do Boleto"
    group_item_label: "Mínimo"
    description: "Valor minimo do boleto"
  }


  measure: max_boleto {
    type: max
    sql: ${vl_boleto} ;;
    value_format: "$ #,###.00"
    group_label: "Valor do Boleto"
    group_item_label: "Máximo"
    description: "Valor máximo de aquisição do titulo"
  }


  measure: avg_despesa {
    type: average
    sql: ${vl_despesa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Despesa"
    group_item_label: "Média"
    description: "Valor médio de cobrança da despesa"
  }

  measure: sum_despesa {
    type: sum
    sql: ${vl_despesa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Despesa"
    group_item_label: "Soma"
    description: "Soma do valor de cobrança da despesa."
  }


  measure: min_despesa {
    type: min
    sql: ${vl_despesa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Despesa"
    group_item_label: "Mínimo"
    description: "Valor minimo de cobrança da despesa"
  }


  measure: max_despesa {
    type: max
    sql: ${vl_despesa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Despesa"
    group_item_label: "Máximo"
    description: "Valor máximo de cobrança da despesa"
  }

  measure: avg_juros {
    type: average
    sql: ${vl_juros} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Juros"
    group_item_label: "Média"
    description: "Valor médio de juros aplicado"
  }

  measure: sum_juros {
    type: sum
    sql: ${vl_juros} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Juros"
    group_item_label: "Soma"
    description: "Soma do valor de juros aplicado"
  }


  measure: min_juros {
    type: min
    sql: ${vl_juros} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Juros"
    group_item_label: "Mínimo"
    description: "Valor minimo de juros aplicado"
  }


  measure: max_juros {
    type: max
    sql: ${vl_juros} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Juros"
    group_item_label: "Máximo"
    description: "Valor máximo de juros aplicado"
  }


  measure: avg_multa {
    type: average
    sql: ${vl_multa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Multa"
    group_item_label: "Média"
    description: "Valor médio de multa aplicada"
  }

  measure: sum_multa {
    type: sum
    sql: ${vl_multa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Multa"
    group_item_label: "Soma"
    description: "Soma do valor da multa aplicada"
  }


  measure: min_multa {
    type: min
    sql: ${vl_multa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Multa"
    group_item_label: "Mínimo"
    description: "Valor minimo da multa aplicada"
  }


  measure: max_multa {
    type: max
    sql: ${vl_multa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Multa"
    group_item_label: "Máximo"
    description: "Valor máximo de multa aplicada"
  }



  measure: avg_pago {
    type: average
    sql: ${vl_pago} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago"
    group_item_label: "Média"
    description: "Valor médio dos boletos pagos"
  }

  measure: sum_pago {
    type: sum
    sql: ${vl_pago} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago"
    group_item_label: "Soma"
    description: "Soma do valor de boletos pagos"
  }


  measure: min_pago {
    type: min
    sql: ${vl_pago} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago"
    group_item_label: "Mínimo"
    description: "Valor minimo de boletos pagos"
  }


  measure: max_pago {
    type: max
    sql: ${vl_pago} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago"
    group_item_label: "Máximo"
    description: "Valor máximo de boletos pagos"
  }

  measure: avg_pago_credito {
    type: average
    sql: ${vl_pago_credito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Média"
    description: "Valor médio de pagamentos por crédito "
  }

  measure: sum_pago_credito {
    type: sum
    sql: ${vl_pago_credito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Soma"
    description: "Soma do valor de pagamentos por crédito"
  }


  measure: min_pago_credito {
    type: min
    sql: ${vl_pago_credito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Mínimo"
    description: "Valor minimo de pagamento por crédito"
  }


  measure: max_pago_credito {
    type: max
    sql: ${vl_pago_credito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Máximo"
    description: "Valor máximo de pagamento por crédito"
  }


  measure: avg_pago_debito {
    type: average
    sql: ${vl_pago_debito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Débito"
    group_item_label: "Média"
    description: "Valor médio de pagamentos por débito "
  }

  measure: sum_pago_debito {
    type: sum
    sql: ${vl_pago_debito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Débito"
    group_item_label: "Soma"
    description: "Soma do valor de pagamentos por débito"
  }


  measure: min_pago_debito {
    type: min
    sql: ${vl_pago_debito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Débito"
    group_item_label: "Mínimo"
    description: "Valor minimo de pagamento por débito"
  }


  measure: max_pago_debito {
    type: max
    sql:  ${vl_pago_debito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Débito"
    group_item_label: "Máximo"
    description: "Valor máximo de pagamento por débito"
  }

  measure: avg_vl_seguro {
    type: average
    sql: ${vl_seguro} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Seguro"
    group_item_label: "Médio"
    description: "Valor médio do pagamento do seguro"
  }

  measure: sum_vl_seguro {
    type: sum
    sql: ${vl_seguro} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Seguro"
    group_item_label: "Soma"
    description: "Valor da soma de pagamento do seguro"
  }


  measure: min_vl_seguro {
    type: min
    sql: ${vl_seguro} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Seguro"
    group_item_label: "Mínimo"
    description: "Valor minimo de pagamento do seguro"
  }


  measure: max_vl_seguro {
    type: max
    sql: ${vl_seguro} ;;
    value_format: "$ #,###"
    group_label: "Valor Seguro"
    group_item_label: "Máximo"
    description: "Valor máximo de pagamento do seguro"
  }


  measure: avg_tx_bancaria {
    type: average
    sql: ${vl_taxa} ;;
    value_format: "$ #,###"
    group_label: "Taxa Bancária"
    group_item_label: "Médio"
    description: "Valor médio da taxa bancária"
  }

  measure: sum_tx_bancaria {
    type: sum
    sql: ${vl_taxa} ;;
    value_format: "$ #,###"
    group_label: "Taxa Bancária"
    group_item_label: "Soma"
    description: "Valor da soma de taxa bancária"
  }


  measure: min_tx_bancaria {
    type: min
    sql: ${vl_taxa}  ;;
    value_format: "$ #,###"
    group_label: "Taxa Bancária"
    group_item_label: "Mínimo"
    description: "Valor minimo da taxa bancária"
  }


  measure: max_tx_bancaria {
    type: max
    sql: ${vl_taxa}  ;;
    value_format: "$ #,###"
    group_label: "Taxa Bancária"
    group_item_label: "Máximo"
    description: "Valor máximo da taxa bancária"
  }

  measure: vl_atraso {
    type: sum
    sql: ${vl_total};;
    value_format: "$ #,###.00"
    group_label: "Valor em Atraso"
    filters: [flg_boleto_atrasado: "yes"]
    group_item_label: "Soma"
    description: "Soma do valor total em atraso. O valor considerado para este cálculo é o 'Valor Total' do boleto"
  }

  measure: count_pagos {
    type: count_distinct
    sql: ${id_cpf} ;;
    value_format: "0"
    group_label: "Pagos"
    group_item_label: "Valor"
    description: "Quantidade de CPF por boleto pago"
    filters: [flg_boleto_pago: "Yes"]
    drill_fields: [
      cpf_aluno, aluno_nome,id_contrato,
      aluno_email,
      aluno_celular,
      ds_curso,
      grupo_instituicao,
      ds_instituicao,
      ds_campus,
      nm_modalidade_produto,
      nm_produto,
      id_boleto,
      dias_atraso,
      vl_boleto,
      data_pagamento_date,
      data_vencimento_date,


    ]
  }




  dimension_group: data_transferencia {
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

    label: "Data de Transferência"
    description: "Indica a Data de Transferência do Valor"
    sql: ${TABLE}."DATA_TRANSFERENCIA" ;;
  }

  dimension_group: data_avaliacao_collection {
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
    label: "Data Avaliacao Collection"
    description: "Indica a Data de Avaliação do Collection"
    sql: ${TABLE}."DATA_AVALIACAO_COLLECTION" ;;
  }





  dimension: gh_collection {
    type: string
    group_label: "Collection"
    label: "GH do Collection"
    description: "Indica o GH do Collection"
    sql: ${TABLE}."GH_COLLECTION" ;;
  }


  dimension: ultimo_collection {
    type: string
    group_label: "Collection"
    label: "Último - GH do Collection"
    description: "Indica o Último Collection do Aluno"
    sql: ${TABLE}."ULTIMO_COLLECTION" ;;
  }



  dimension_group: data_ultimo_collection {
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
    label: "Último Collection"
    description: "Indica a Última data de Avaliação do Collection"
    sql: ${TABLE}."DATA_ULTIMO_COLLECTION" ;;
  }















}
