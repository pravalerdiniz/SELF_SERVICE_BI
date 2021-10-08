view: bv_export_boletos {
  sql_table_name: "VETERANO"."PUBLIC"."BV_EXPORT_BOLETOS"
    ;;

  dimension: baixa_boleto {
    type: string
    sql: ${TABLE}."BAIXA_BOLETO" ;;
  }

  dimension: conta {
    type: number
    sql: ${TABLE}."CONTA" ;;
  }

  dimension: contrato_bv {
    type: string
    sql: ${TABLE}."CONTRATO_BV" ;;
  }

  dimension: cpf_aluno {
    type: number
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  dimension: cpf_avalista {
    type: number
    sql: ${TABLE}."CPF_AVALISTA" ;;
  }

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
    datatype: date
    sql: ${TABLE}."DATA_BAIXA" ;;
  }

  dimension_group: data_concessao {
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
    sql: ${TABLE}."DATA_CONCESSAO" ;;
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
    sql: ${TABLE}."DATA_PAGAMENTO" ;;
  }

  dimension_group: data_vencimento {
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
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  dimension: renda_aluno {
    type: number
    sql:${TABLE}."RENDA_ALUNO" ;;
  }

  dimension: renda_avalista {
    type: number
    sql:${TABLE}."RENDA_AVALISTA" ;;
  }

  dimension: despesa {
    type: number
    sql: ${TABLE}."DESPESA" ;;
  }

  dimension: ds_curso {
    type: string
    sql: ${TABLE}."DS_CURSO" ;;
  }

  dimension: duracao {
    type: number
    sql: ${TABLE}."DURACAO" ;;
  }

  dimension: gh {
    type: string
    sql: ${TABLE}."GH" ;;
  }

  dimension: gh_bhv {
    type: string
    sql: ${TABLE}."GH_BHV" ;;
  }

  dimension: id_baixa {
    type: number
    sql: ${TABLE}."ID_BAIXA" ;;
  }

  dimension: id_contrato {
    type: string
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  dimension: mora {
    type: number
    sql: ${TABLE}."MORA" ;;
  }

  dimension: multa {
    type: number
    sql: ${TABLE}."MULTA" ;;
  }

  dimension: nm_originador {
    type: string
    sql: ${TABLE}."NM_ORIGINADOR" ;;
  }

  dimension: nm_produto {
    type: string
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: nome_aluno {
    type: string
    sql: ${TABLE}."NOME_ALUNO" ;;
  }

  dimension: num_contratacao {
    type: number
    sql: ${TABLE}."NUM_CONTRATACAO" ;;
  }

  dimension: num_parcela {
    type: number
    sql: ${TABLE}."NUM_PARCELA" ;;
  }

  dimension: origem_aluno {
    type: string
    sql: ${TABLE}."ORIGEM_ALUNO" ;;
  }

  dimension: semestre_cursando {
    type: number
    sql: ${TABLE}."SEMESTRE_CURSANDO" ;;
  }

  dimension: servidor {
    type: string
    sql: ${TABLE}."SERVIDOR" ;;
  }

  dimension: seunum {
    type: number
    sql: ${TABLE}."SEUNUM" ;;
  }

  dimension: status_boleto {
    type: string
    sql: ${TABLE}."STATUS_BOLETO" ;;
  }

  dimension: tipo_boleto {
    type: string
    sql: ${TABLE}."TIPO_BOLETO" ;;
  }

  dimension: tx_mensal_aluno {
    type: number
    sql: ${TABLE}."TX_MENSAL_ALUNO" ;;
  }

  dimension: tx_mensal_total {
    type: number
    sql: ${TABLE}."TX_MENSAL_TOTAL" ;;
  }

  dimension: vl_boleto {
    type: number
    sql: ${TABLE}."VL_BOLETO" ;;
  }

  dimension: vl_financiamento {
    type: number
    sql: ${TABLE}."VL_FINANCIAMENTO" ;;
  }

  dimension: vl_pago {
    type: number
    sql: ${TABLE}."VL_PAGO" ;;
  }

  dimension: vlr_maior {
    type: number
    sql: ${TABLE}."VLR_MAIOR" ;;
  }

  dimension: vlr_menor {
    type: number
    sql: ${TABLE}."VLR_MENOR" ;;
  }

  dimension: qtd_prestacoes{
    type: number
    sql: ${TABLE}."QTD_PRESTACOES" ;;
  }

  dimension: prod_pre_pos{
    type: string
    label: "Taxa Pré/Pós Fixada"
    sql: ${TABLE}."PROD_PRE_POS" ;;
  }

  measure: count_cpf {
    type: count_distinct
    sql: ${TABLE}."CPF_ALUNO" ;;
    label: "Contagem CPF"
  }



  measure: count {
    type: count
    drill_fields: []
  }
}
