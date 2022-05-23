view: vw_extrato_repasse {
  sql_table_name: "AD_HOC"."VW_EXTRATO_REPASSE"
    ;;

  dimension: cpf {
    primary_key: yes
    type: number
    group_label: "Dados do Aluno"
    label: "CPF do Aluno"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: id_contrato {
    type: string
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

  dimension: num_boleto {
    type: number
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

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
