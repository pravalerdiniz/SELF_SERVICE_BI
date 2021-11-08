view: alunos_cobranca_pdd_boletos {
  derived_table: {
    sql: select * from stage.public.cobranca_pdd_boletos
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: datapg {
    type: date
    sql: ${TABLE}."DATAPG" ;;
  }

  dimension: fundo {
    type: number
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: fx_atraso {
    type: string
    sql: ${TABLE}."FX_ATRASO" ;;
  }

  dimension: cpf {
    type: number
    primary_key: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: qtd_boletos_pagos {
    type: number
    sql: ${TABLE}."QTD_BOLETOS_PAGOS" ;;
  }

  dimension: valor_boletos {
    type: number
    sql: ${TABLE}."VALOR_BOLETOS" ;;
  }

  dimension: valor_pago {
    type: number
    sql: ${TABLE}."VALOR_PAGO" ;;
  }

  dimension: valor_atualizado {
    type: number
    sql: ${TABLE}."VALOR_ATUALIZADO" ;;
  }

  dimension: desconto_cedido {
    type: number
    sql: ${TABLE}."DESCONTO_CEDIDO" ;;
  }

  dimension: juros_recebido {
    type: number
    sql: ${TABLE}."JUROS_RECEBIDO" ;;
  }

  dimension: desconto_principal {
    type: number
    sql: ${TABLE}."DESCONTO_PRINCIPAL" ;;
  }

  dimension: flg_maior_atraso {
    type: string
    sql: ${TABLE}."FLG_MAIOR_ATRASO" ;;
  }

  dimension: flg_maior_faixa_atraso {
    type: string
    sql: ${TABLE}."FLG_MAIOR_FAIXA_ATRASO" ;;
  }

  set: detail {
    fields: [
      datapg,
      fundo,
      fx_atraso,
      cpf,
      qtd_boletos_pagos,
      valor_boletos,
      valor_pago,
      valor_atualizado,
      desconto_cedido,
      juros_recebido,
      desconto_principal,
      flg_maior_atraso,
      flg_maior_faixa_atraso
    ]
  }
}
