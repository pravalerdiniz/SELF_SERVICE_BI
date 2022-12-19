view: vw_extrato_repasse {
  sql_table_name: "AD_HOC"."VW_EXTRATO_REPASSE"
    ;;

  dimension: id_cpf {
    type: number
    value_format: "0"
    group_label: "Dados do Aluno"
    label: "ID CPF"
    description: "Indica o código de referência do CPF do Aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: cpf {
    type: number
    value_format: "0"
    group_label: "Dados do Aluno"
    label: "CPF"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: nome_aluno {
    type: string
    label: "Nome"
    group_label: "Dados do Aluno"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: status_aluno {
    type: string
    label: "Status Aluno"
    group_label: "Dados do Aluno"
    sql: ${TABLE}."STATUS_ALUNO" ;;
  }

  dimension_group: cancelamento {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_num,
      month_name,
      year,
    ]
    sql: ${TABLE}."DATA_CANCELAMENTO" ;;
    label: "Data Cancelamento"
  }

  dimension: id_contrato {
    type: string
    group_label: "Dados do Contrato"
    label: "Contrato"
    description: "Indica o número do contrato do aluno com PRAVALER"
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  dimension: semestre_financiado {
    type:  number
    label: "Semestre Financiado"
    group_label: "Dados do Contrato"
    sql: ${TABLE}."SEMESTRE_FINANCIADO" ;;
  }

  dimension: ano_financiado {
    type:  number
    label: "Ano Financiado"
    group_label: "Dados do Contrato"
    sql: ${TABLE}."ANO_FINANCIADO" ;;
  }

  dimension: ra_aluno {
    type:  string
    label: "R.A. Aluno"
    group_label: "Dados do Aluno"
    sql: ${TABLE}."RA_ALUNO" ;;
  }

  dimension: ies_grupo {
    type: string
    label: "IES Grupo"
    group_label: "Dados da Instituição"
    sql: ${TABLE}."IES_GRUPO" ;;
  }

  dimension: nome_ies {
    type: string
    label: "Nome IES"
    group_label: "Dados da Instituição"
    sql: ${TABLE}."NOME_IES" ;;
  }

  dimension: campus_ies {
    type: string
    label: "Campus IES"
    group_label: "Dados da Instituição"
    sql: ${TABLE}."CAMPUS_IES" ;;
  }

  dimension: uf_campus {
    type: string
    label: "UF Campus"
    group_label: "Dados da Instituição"
    sql: ${TABLE}."UF_CAMPUS" ;;
  }

  dimension: codigo_curso {
    type: string
    label: "Codigo Curso"
    group_label: "Dados da Instituição"
    sql: ${TABLE}."CODIGO_CURSO" ;;
  }

  dimension: nome_curso {
    type: string
    label: "Nome Curso"
    group_label: "Dados da Instituição"
    sql: ${TABLE}."NOME_CURSO" ;;
  }

  dimension: mes_contratacao {
    type: number
    label: "Mes Contratacao"
    group_label: "Dados do Contrato"
    sql: ${TABLE}."MES_CONTRATACAO" ;;
  }

  dimension: parcela {
    type: string
    label: "Parcela"
    group_label: "Dados do Título"
    sql: ${TABLE}."PARCELA" ;;
  }

  dimension: tipo_aluno {
    type: string
    label: "Tipo Aluno"
    group_label:"Dados do Aluno"
    sql: ${TABLE}."TIPO_ALUNO" ;;
  }

  dimension: vl_financiado_total {
    type: number
    value_format: "$ #,##0.00"
    label: "Valor Financiado Total"
    group_label: "Dados do Contrato"
    sql: ${TABLE}."VL_FINANCIADO_TOTAL" ;;
  }

  dimension: qtd_prestacoes {
    type: number
    label: "Qtd. Prestacoes"
    group_label: "Dados do Contrato"
    sql: ${TABLE}."QTD__PRESTACOES" ;;
  }

  dimension: valor_mensalidade {
    type: number
    value_format: "$ #,##0.00"
    label: "Valor Mensalidade"
    group_label: "Dados do Contrato"
    sql: ${TABLE}."VALOR_MENSALIDADE" ;;
  }

  dimension: dia_escolhido_pagamento {
    type: number
    label: "Dia Escolhido Pagamento"
    group_label: "Dados do Título"
    sql: ${TABLE}."DIA_ESCOLHIDO_PAGAMENTO" ;;
  }

  dimension_group: vencimento_boleto {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_num,
      month_name,
      year,
    ]
    sql: ${TABLE}."DATA_VENCIMENTO_DO_BOLETO" ;;
    label: "Data Vencimento do Boleto"
  }

  dimension: valor_ipca {
    type: number
    label: "Valor IPCA"
    group_label: "Dados do Título"
    sql: ${TABLE}."VALOR_IPCA" ;;
  }

  dimension: porcentagem_ipca {
    type: number
    label: "Porcentagem IPCA"
    group_label: "Dados do Título"
    sql: ${TABLE}."PORCENTAGEM_IPCA" ;;
  }

  dimension: valor_do_boleto {
    type: number
    label: "Valor do Boleto"
    group_label: "Dados do Título"
    sql: ${TABLE}."VALOR_DO_BOLETO" ;;
  }

  dimension_group: reconhecimento_do_pagamento {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_num,
      month_name,
      year,
    ]
    sql: ${TABLE}."DATA_RECONHECIMENTO_DO_PAGAMENTO" ;;
    label: "Data Reconhecimento do Pagamento"
  }

  dimension: dias_de_atraso {
    type: number
    label: "Dias de Atraso"
    group_label: "Dados do Título"
    sql: ${TABLE}."DIAS_DE_ATRASO" ;;
  }

  dimension: taxa_comissao {
    type: number
    label: "Taxa Comissao"
    group_label: "Dados do Contrato"
    sql: ${TABLE}."TAXA_COMISSAO" ;;
  }

  dimension: vl_seguro_pravaler {
    type: number
    value_format: "$ #,##0.00"
    label: "Valor Seguro Pravaler"
    group_label: "Dados de Repasse"
    sql: ${TABLE}."VL_SEGURO_PRAVALER" ;;
  }

  dimension: taxa_adesao {
    type: number
    label: "Taxa Adesao"
    group_label: "Dados do Contrato"
    sql: ${TABLE}."TAXA_ADESAO" ;;
  }

  dimension: produto_nome {
    type: string
    label: "Produto Nome"
    group_label: "Dados do Contrato"
    sql: ${TABLE}."PRODUTO_NOME" ;;
  }

  dimension: num_boleto {
    type: number
    primary_key: yes
    group_label: "Dados do Título"
    label: "Numero Boleto"
    sql: ${TABLE}."NUM_BOLETO" ;;
  }

  dimension: num_boleto_origem {
    type: string
    label: "Numero Boleto Origem"
    group_label: "Dados do Título"
    sql: ${TABLE}."NUM_BOLETO_ORIGEM" ;;
  }

  dimension: vl_comissao_pravaler {
    type: number
    group_label: "Dados de Repasse"
    value_format: "$ #,##0.00"
    label: "Valor Comissao Pravaler"
    sql: ${TABLE}."VL_COMISSAO_PRAVALER" ;;
  }

  measure: sum_comissao {
    type: sum
    sql_distinct_key: ${num_boleto} ;;
    group_label: "Dados de Repasse"
    value_format: "$ #,##0.00"
    label: "Soma Comissão Pravaler"
    sql: ${vl_comissao_pravaler} ;;
  }

  dimension: vl_debito_total {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,##0.00"
    label: "Debito Total"
    sql: ${TABLE}."VL_DEBITO_TOTAL" ;;
  }

  dimension: vl_repasse_total_ies {
    type: number
    group_label: "Dados de Repasse"
    value_format: "$ #,##0.00"
    label: "Repasse Total IES"
    sql: ${TABLE}."VL_REPASSE_TOTAL_IES" ;;
  }

  measure: sum_repasse_total {
    type: sum
    group_label: "Dados de Repasse"
    value_format: "$ #,##0.00"
    label: "Soma Repasse Total IES"
    sql: ${vl_repasse_total_ies} ;;
  }

  dimension: vl_desp_cobranca_pravaler {
    type: number
    group_label: "Dados de Repasse"
    value_format: "$ #,##0.00"
    label: "Valor Despesa Cobranca Pravaler"
    sql: ${TABLE}."VL_DESPESA_COBRANCA_PRAVALER" ;;
  }

  dimension: vl_pago_aluno {
    type: number
    group_label: "Dados do Aluno"
    value_format: "$ #,##0.00"
    label: "Valor Pago Aluno"
    sql: ${TABLE}."VL_PAGO_ALUNO" ;;
  }

  dimension: vl_adm_aluno_pravaler {
    type: number
    group_label: "Dados do Aluno"
    value_format: "$ #,##0.00"
    label: "Valor Adm. Aluno Pravaler"
    sql: ${TABLE}."VL_ADM_ALUNO_PRAVALER" ;;
  }

  dimension: vl_adm_aluno_ies {
    type: number
    group_label: "Dados do Aluno"
    value_format: "$ #,##0.00"
    label: "Valor Adm. Aluno IES"
    sql: ${TABLE}."VL_ADM_ALUNO_IES" ;;
  }

  dimension: vl_juros_atraso {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,##0.00"
    label: "Juros Atraso"
    sql: ${TABLE}."VL_JUROS_ATRASO" ;;
  }

  dimension: multa_atraso {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,##0.00"
    label: "Multa Atraso"
    sql: ${TABLE}."MULTA_ATRASO" ;;
  }

  dimension_group: transferencia {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_num,
      month_name,
      year,
    ]
    sql: ${TABLE}."DATA_TRANSFERENCIA" ;;
    label: "Data Transferencia"
    description: "Data em que foi feito o repasse dos valores gestão para a IES"
  }

  dimension_group: concessao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_num,
      month_name,
      year,
    ]
    sql: ${TABLE}."DATA_CONCESSAO" ;;
    label: "Data Concessao"
  }

  dimension: qtd_mensalidades {
    type: number
    label: "Qtd. Mensalidades"
    group_label: "Dados do Contrato"
    sql: ${TABLE}."QTD_MENSALIDADES" ;;
  }

  dimension: id_ies {
    type: string
    label: "ID IES"
    group_label: "Dados da Instituição"
    sql: ${TABLE}."ID_IES" ;;
  }

  dimension: tipo_baixa {
    type: number
    label: "Tipo Baixa"
    group_label: "Dados do Título"
    sql: ${TABLE}."TIPO_BAIXA" ;;
  }

  dimension: pn {
    type: string
    label: "PN"
    sql: ${TABLE}."PN" ;;
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
