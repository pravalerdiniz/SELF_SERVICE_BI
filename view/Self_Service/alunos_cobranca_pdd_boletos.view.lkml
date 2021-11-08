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

  measure: qtd_boletos_pagos {
    type: sum
    sql: ${TABLE}."QTD_BOLETOS_PAGOS" ;;
  }

  measure: valor_boletos {
    type: sum
    sql: ${TABLE}."VALOR_BOLETOS" ;;
  }

  measure: valor_pago {
    type: sum
    sql: ${TABLE}."VALOR_PAGO" ;;
  }

  measure: valor_atualizado {
    type: sum
    sql: ${TABLE}."VALOR_ATUALIZADO" ;;
  }

  measure: desconto_cedido {
    type: sum
    sql: ${TABLE}."DESCONTO_CEDIDO" ;;
  }

  measure: juros_recebido {
    type: sum
    sql: ${TABLE}."JUROS_RECEBIDO" ;;
  }

  measure: desconto_principal {
    type: sum
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
