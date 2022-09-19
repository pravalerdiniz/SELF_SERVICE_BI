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

  dimension: id_contrato {
    type: string
    group_label: "Dados do Aluno"
    label: "ID do Contrato"
    description: "Indica o número do contrato do aluno com PRAVALER"
    sql: ${TABLE}."ID_CONTRATO" ;;
  }



  dimension: num_boleto {
    type: number
    primary_key: yes
    group_label: "Dados do Título"
    label: "SEUNUM"
    sql: ${TABLE}."NUM_BOLETO" ;;
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



  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
