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
    label: "CPF do Aluno"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: nome_aluno {
    type: string
    label: "Nome do Aluno"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: status_aluno {
    type: string
    label: "Status Aluno"
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
  }

  dimension: id_contrato {
    type: string
    group_label: "Dados do Aluno"
    label: "ID do Contrato"
    description: "Indica o número do contrato do aluno com PRAVALER"
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  dimension: semestre_financiado {
    type:  number
    label: "Semestre Financiado"
    sql: ${TABLE}."SEMESTRE_FINANCIADO" ;;
  }

  dimension: ano_financiado {
    type:  number
    label: "Ano Financiado"
    sql: ${TABLE}."ANO_FINANCIADO" ;;
  }

  dimension: ra_aluno {
    type:  string
    label: "RA Aluno"
    sql: ${TABLE}."RA_ALUNO" ;;
  }

  dimension: ies_grupo {
    type: string
    label: "IES Grupo"
    sql: ${TABLE}."IES_GRUPO" ;;
  }

  dimension: nome_ies {
    type: string
    label: "Nome IES"
    sql: ${TABLE}."NOME_IES" ;;
  }

  dimension: campus_ies {
    type: string
    label: "Campus IES"
    sql: ${TABLE}."CAMPUS_IES" ;;
  }

  dimension: uf_campus {
    type: string
    label: "UF Campus"
    sql: ${TABLE}."UF_CAMPUS" ;;
  }

  dimension: codigo_curso {
    type: string
    label: "Codigo Curso"
    sql: ${TABLE}."CODIGO_CURSO" ;;
  }

  dimension: nome_curso {
    type: string
    label: "Nome Curso"
    sql: ${TABLE}."NOME_CURSO" ;;
  }

  dimension: mes_contratacao {
    type: number
    label: "MES_CONTRATACAO"
    sql: ${TABLE}."MES_CONTRATACAO" ;;
  }

  dimension: parcela {
    type: string
    label: "Parcela"
    sql: ${TABLE}."PARCELA" ;;
  }

  dimension: tipo_aluno {
    type: string
    label: "Tipo Aluno"
    sql: ${TABLE}."TIPO_ALUNO" ;;
  }

  dimension: vl_financiado_total {
    type: number
    value_format: "$ #,##0.00"
    label: "Valor Financiado Total"
    sql: ${TABLE}."VL_FINANCIADO_TOTAL" ;;
  }

  dimension: qtd_prestacoes {
    type: number
    label: "Qtd Prestações"
    sql: ${TABLE}."QTD__PRESTACOES" ;;
  }

  dimension: valor_mensalidade {
    type: number
    value_format: "$ #,##0.00"
    label: "Valor Mensalidade"
    sql: ${TABLE}."VALOR_MENSALIDADE" ;;
  }

  dimension: dia_escolhido_pagamento {
    type: number
    label: "Dia Escolhido Pagamento"
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
  }

  dimension: valor_ipca {
    type: number
    label: "Valor IPCA"
    sql: ${TABLE}."VALOR_IPCA" ;;
  }

  dimension: porcentagem_ipca {
    type: number
    label: "Porcentagem IPCA"
    sql: ${TABLE}."PORCENTAGEM_IPCA" ;;
  }

  dimension: valor_do_boleto {
    type: number
    label: "Valor do Boleto"
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
  }

  dimension: dias_de_atraso {
    type: number
    label: "Dias de Atraso"
    sql: ${TABLE}."DIAS_DE_ATRASO" ;;
  }

  dimension: taxa_comissao {
    type: number
    label: "Taxa Comissão"
    sql: ${TABLE}."TAXA_COMISSAO" ;;
  }

  dimension: vl_seguro_pravaler {
    type: number
    value_format: "$ #,##0.00"
    label: "Valor Seguro Pravaler"
    sql: ${TABLE}."VL_SEGURO_PRAVALER" ;;
  }

  dimension: taxa_adesao {
    type: number
    label: "Taxa Adesão"
    sql: ${TABLE}."TAXA_ADESAO" ;;
  }

  dimension: produto_nome {
    type: string
    label: "Produto Nome"
    sql: ${TABLE}."PRODUTO_NOME" ;;
  }

  dimension: num_boleto {
    type: number
    primary_key: yes
    group_label: "Dados do Título"
    label: "SEUNUM"
    sql: ${TABLE}."NUM_BOLETO" ;;
  }

  dimension: num_boleto_origem {
    type: string
    label: "Origem Número Boleto"
    sql: ${TABLE}."NUM_BOLETO_ORIGEM" ;;
  }

  dimension: vl_comissao_pravaler {
    type: number
    group_label: "Dados de Repasse"
    value_format: "$ #,##0.00"
    label: "Valor da Comissão Pravaler"
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
    label: "Valor de Débito Total"
    sql: ${TABLE}."VL_DEBITO_TOTAL" ;;
  }

  dimension: vl_repasse_total_ies {
    type: number
    group_label: "Dados de Repasse"
    value_format: "$ #,##0.00"
    label: "Valor de Repasse Total IES"
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
    group_label: "Dados do Repasse"
    value_format: "$ #,##0.00"
    label: "Valor Despesa de cobrança Pravaler"
    sql: ${TABLE}."VL_DESPESA_COBRANCA_PRAVALER" ;;
  }

  dimension: vl_pago_aluno {
    type: number
    group_label: "Dados do Aluno"
    value_format: "$ #,##0.00"
    label: "Valor Pago pelo Aluno"
    sql: ${TABLE}."VL_PAGO_ALUNO" ;;
  }

  dimension: vl_adm_aluno_pravaler {
    type: number
    group_label: "Dados do Aluno"
    value_format: "$ #,##0.00"
    label: "Valor Adm Aluno Pravaler"
    sql: ${TABLE}."VL_ADM_ALUNO_PRAVALER" ;;
  }

  dimension: vl_adm_aluno_ies {
    type: number
    group_label: "Dados do Aluno"
    value_format: "$ #,##0.00"
    label: "Valor Adm Aluno IES"
    sql: ${TABLE}."VL_ADM_ALUNO_IES" ;;
  }

  dimension: vl_juros_atraso {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,##0.00"
    label: "Valor de Juros Atraso"
    sql: ${TABLE}."VL_JUROS_ATRASO" ;;
  }

  dimension: multa_atraso {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,##0.00"
    label: "Multa de Atraso"
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
  }

  dimension: qtd_mensalidades {
    type: number
    label: "Qtd Mensalidades"
    sql: ${TABLE}."QTD_MENSALIDADES" ;;
  }

  dimension: id_ies {
    type: number
    value_format: "0"
    label: "ID IES"
    sql: ${TABLE}."ID_IES" ;;
  }

  dimension: tipo_baixa {
    type: number
    label: "Tipo Baixa"
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
