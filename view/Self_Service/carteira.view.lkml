view: carteira {
  sql_table_name: "SELF_SERVICE_BI"."CARTEIRA"
    ;;

  dimension: primary_key {
    primary_key: yes
    label: "Chave Única"
    type: string
    sql: CONCAT(${id_boleto},${tdt_ano_mes} );;
  }

  dimension: boleto {
    type: number
    sql: ${TABLE}."BOLETO" ;;
  }

  measure: total_boleto {
    type: sum
    sql: ${boleto} ;;
  }

  measure: average_boleto {
    type: average
    sql: ${boleto} ;;
  }

  dimension: cd_cedente {
    type: number
    sql: ${TABLE}."CD_CEDENTE" ;;
  }

  dimension: cnpj_entidade_pagadora {
    type: number
    sql: ${TABLE}."CNPJ_ENTIDADE_PAGADORA" ;;
  }

  dimension: cnpj_fundo {
    type: number
    sql: ${TABLE}."CNPJ_FUNDO" ;;
  }

  dimension: cpf_cliente {
    type: number
    sql: ${TABLE}."CPF_CLIENTE" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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

  dimension_group: data_emissao {
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
    sql: ${TABLE}."DATA_EMISSAO" ;;
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
    sql: ${TABLE}."DATA_ENTRADA" ;;
  }

  dimension_group: data_protesto {
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
    sql: ${TABLE}."DATA_PROTESTO" ;;
  }

  dimension_group: data_referencia {
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
    sql: ${TABLE}."DATA_REFERENCIA" ;;
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

  dimension: ds_produto {
    type: string
    sql: ${TABLE}."DS_PRODUTO" ;;
  }

  dimension: id_alu_contrato {
    type: string
    sql: ${TABLE}."ID_ALU_CONTRATO" ;;
  }

  dimension: id_boleto {
    type: string
    sql: ${TABLE}."ID_BOLETO" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: id_produto {
    type: string
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: id_seunum {
    type: string
    sql: ${TABLE}."ID_SEUNUM" ;;
  }

  dimension: id_tipo_boleto {
    type: number
    sql: ${TABLE}."ID_TIPO_BOLETO" ;;
  }

  dimension: id_titulo_status {
    type: number
    sql: ${TABLE}."ID_TITULO_STATUS" ;;
  }

  dimension: modalidade_risco {
    type: string
    sql: ${TABLE}."MODALIDADE_RISCO" ;;
  }

  dimension: nm_cedente {
    type: string
    sql: ${TABLE}."NM_CEDENTE" ;;
  }

  dimension: nm_cliente {
    type: string
    sql: ${TABLE}."NM_CLIENTE" ;;
  }

  dimension: nm_entidade_pagador {
    type: string
    sql: ${TABLE}."NM_ENTIDADE_PAGADOR" ;;
  }

  dimension: nm_fundo {
    type: string
    sql: ${TABLE}."NM_FUNDO" ;;
  }

  dimension: nm_produto_comercial {
    type: string
    sql: ${TABLE}."NM_PRODUTO_COMERCIAL" ;;
  }

  dimension: nm_tipo_produto {
    type: string
    sql: ${TABLE}."NM_TIPO_PRODUTO" ;;
  }

  dimension: num_contrato {
    type: number
    sql: ${TABLE}."NUM_CONTRATO" ;;
  }

  dimension: num_parcela {
    type: number
    sql: ${TABLE}."NUM_PARCELA" ;;
  }

  dimension: prazo {
    type: string
    sql: ${TABLE}."PRAZO" ;;
  }

  dimension: protesto {
    type: string
    sql: ${TABLE}."PROTESTO" ;;
  }

  dimension: qtd_parcelas {
    type: number
    sql: ${TABLE}."QTD_PARCELAS" ;;
  }

  dimension: taxa_cessao {
    type: number
    sql: ${TABLE}."TAXA_CESSAO" ;;
  }

  dimension: taxa_media_ponderada {
    type: number
    sql: ${TABLE}."TAXA_MEDIA_PONDERADA" ;;
  }

  dimension: tdt_ano_mes {
    type: number
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
  }

  dimension: valor_aquisicao {
    type: number
    sql: ${TABLE}."VALOR_AQUISICAO" ;;
  }

  dimension: valor_presente {
    type: number
    sql: ${TABLE}."VALOR_PRESENTE" ;;
  }

  dimension: vl_corrigido {
    type: number
    sql: ${TABLE}."VL_CORRIGIDO" ;;
  }

  dimension: vl_face {
    type: number
    sql: ${TABLE}."VL_FACE" ;;
  }

  dimension: vl_face_original {
    type: number
    sql: ${TABLE}."VL_FACE_ORIGINAL" ;;
  }

  dimension: vl_financiamento {
    type: number
    sql: ${TABLE}."VL_FINANCIAMENTO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
