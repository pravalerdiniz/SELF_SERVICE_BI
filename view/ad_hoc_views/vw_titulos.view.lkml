view: vw_titulos {
  sql_table_name: "APIBOLETOS"."VW_TITULOS"  ;;


  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}."ID" ;;
  }



  dimension: agencia {
    type: string
    sql: ${TABLE}."AGENCIA" ;;
  }

  dimension: alu_contrato {
    type: number
    sql: ${TABLE}."ALU_CONTRATO" ;;
  }

  dimension: ativo_titulo_id {
    type: string
    sql: ${TABLE}."ATIVO_TITULO_ID" ;;
  }

  dimension: backoffice_id {
    type: string
    sql: ${TABLE}."BACKOFFICE_ID" ;;
  }

  dimension: bairro {
    type: string
    sql: ${TABLE}."BAIRRO" ;;
  }

  dimension: banco {
    type: string
    sql: ${TABLE}."BANCO" ;;
  }

  dimension: carteira {
    type: string
    sql: ${TABLE}."CARTEIRA" ;;
  }

  dimension: cednum {
    type: string
    sql: ${TABLE}."CEDNUM" ;;
  }

  dimension: cep {
    type: string
    sql: ${TABLE}."CEP" ;;
  }

  dimension: cidade {
    type: string
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: classificacao_titulo {
    type: number
    sql: ${TABLE}."CLASSIFICACAO_TITULO" ;;
  }

  dimension: conta_corrente {
    type: string
    sql: ${TABLE}."CONTA_CORRENTE" ;;
  }

  dimension: convenio {
    type: string
    sql: ${TABLE}."CONVENIO" ;;
  }

  dimension: cpf_cnpj {
    type: string
    sql: ${TABLE}."CPF_CNPJ" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension_group: data_aquisicao {
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
    sql: ${TABLE}."DATA_AQUISICAO" ;;
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

  dimension_group: deleted {
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
    sql: ${TABLE}."DELETED_AT" ;;
  }

  dimension: dv {
    type: string
    sql: ${TABLE}."DV" ;;
  }

  dimension: endereco {
    type: string
    sql: ${TABLE}."ENDERECO" ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: fundo_investimento_id {
    type: number
    sql: ${TABLE}."FUNDO_INVESTIMENTO_ID" ;;
  }

  dimension: id_modalidade {
    type: string
    sql: ${TABLE}."ID_MODALIDADE" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: numero_parcela {
    type: number
    sql: ${TABLE}."NUMERO_PARCELA" ;;
  }

  dimension: seunum {
    type: string
    sql: ${TABLE}."SEUNUM" ;;
  }

  dimension: status_id {
    type: string
    sql: ${TABLE}."STATUS_ID" ;;
  }

  dimension: taxa_porcentagem_pravaler {
    type: number
    sql: ${TABLE}."TAXA_PORCENTAGEM_PRAVALER" ;;
  }

  dimension: tipo_baixa {
    type: number
    sql: ${TABLE}."TIPO_BAIXA" ;;
  }

  dimension: tipo_inscricao {
    type: number
    sql: ${TABLE}."TIPO_INSCRICAO" ;;
  }

  dimension: tipo_titulo {
    type: number
    sql: ${TABLE}."TIPO_TITULO" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."UPDATED_AT" ;;
  }

  dimension: valor_adesao {
    type: number
    sql: ${TABLE}."VALOR_ADESAO" ;;
  }

  dimension: valor_adm {
    type: number
    sql: ${TABLE}."VALOR_ADM" ;;
  }

  dimension: valor_aquisicao {
    type: string
    sql: ${TABLE}."VALOR_AQUISICAO" ;;
  }

  dimension: valor_pagamento {
    type: number
    sql: ${TABLE}."VALOR_PAGAMENTO" ;;
  }

  dimension: valor_tarifa_parcela {
    type: number
    sql: ${TABLE}."VALOR_TARIFA_PARCELA" ;;
  }

  dimension: valor_titulo {
    type: number
    sql: ${TABLE}."VALOR_TITULO" ;;
  }

  dimension_group: writeoff {
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
    sql: ${TABLE}."WRITEOFF" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
