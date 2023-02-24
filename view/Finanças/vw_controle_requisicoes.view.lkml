# The name of this view in Looker is "Vw Controle Requisicoes"
view: vw_controle_requisicoes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCEIRO"."VW_CONTROLE_REQUISICOES"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Area Responsavel" in Explore.

  dimension: area_responsavel {
    type: string
    sql: ${TABLE}."AREA_RESPONSAVEL" ;;
  }

  dimension: cc {
    type: string
    sql: ${TABLE}."CC" ;;
  }

  dimension: chave_esboco {
    type: string
    sql: ${TABLE}."CHAVE_ESBOCO" ;;
  }

  dimension: classificacao {
    type: string
    sql: ${TABLE}."CLASSIFICACAO" ;;
  }

  dimension: codigo_de_item {
    type: string
    sql: ${TABLE}."CODIGO_DE_ITEM" ;;
  }

  dimension: contrato_gc {
    type: string
    sql: ${TABLE}."CONTRATO_GC" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_de_pagamento {
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
    sql: ${TABLE}."DATA_DE_PAGAMENTO" ;;
  }

  dimension_group: data_de_recebimento {
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
    sql: ${TABLE}."DATA_DE_RECEBIMENTO" ;;
  }

  dimension_group: data_do_esboco {
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
    sql: ${TABLE}."DATA_DO_ESBOCO" ;;
  }

  dimension_group: data_do_po {
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
    sql: ${TABLE}."DATA_DO_PO" ;;
  }

  dimension: determinacao_contabil {
    type: string
    sql: ${TABLE}."DETERMINACAO_CONTABIL" ;;
  }

  dimension_group: data_emissao_da_nota {
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
    sql: ${TABLE}."EMISSAO_DA_NOTA" ;;
  }

  dimension: emissor {
    type: string
    sql: ${TABLE}."EMISSOR" ;;
  }

  dimension_group: mes_vigente {
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
    sql: ${TABLE}."MES_VIGENTE" ;;
  }

  dimension: no_req_zeev {
    type: string
    sql: ${TABLE}."NO_REQ_ZEEV" ;;
  }

  dimension: numero_da_nf {
    type: string
    sql: ${TABLE}."NUMERO_DA_NF" ;;
  }

  dimension: observacao {
    type: string
    sql: ${TABLE}."OBSERVACAO" ;;
  }

  dimension: pedido_de_compra {
    type: string
    sql: ${TABLE}."PEDIDO_DE_COMPRA" ;;
  }

  dimension: periodo_de_referencia {
    type: string
    sql: ${TABLE}."PERIODO_DE_REFERENCIA" ;;
  }

  dimension: prestador_de_servico {
    type: string
    sql: ${TABLE}."PRESTADOR_DE_SERVICO" ;;
  }

  dimension: servico {
    type: string
    sql: ${TABLE}."SERVICO" ;;
  }

  dimension: sla_lancamento {
    type: string
    sql: ${TABLE}."SLA_LANCAMENTO" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: status_pagamento {
    type: string
    sql: ${TABLE}."STATUS_PAGAMENTO" ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  dimension: valor {
    type: number
    sql: ${TABLE}."VALOR" ;;
    hidden: yes
  }

  dimension: valor_previsto {
    type: number
    sql: ${TABLE}."VALOR_PREVISTO" ;;
    hidden: yes
  }

  dimension_group: vencimento {
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
    sql: ${TABLE}."VENCIMENTO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_valor {
    type: sum
    sql: ${valor} ;;
  }

  measure: average_valor {
    type: average
    sql: ${valor} ;;
  }



  measure: count {
    type: count
    drill_fields: []
  }
}
