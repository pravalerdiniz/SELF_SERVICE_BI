view: cobranca_pdd_boletos {
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
    group_item_label: "Data de Pagamento"
    sql: ${TABLE}."DATAPG" ;;
  }

  dimension: fundo {
    type: number
    group_item_label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: fx_atraso {
    type: string
    group_item_label: "Faixa de Atraso"
    sql: ${TABLE}."FX_ATRASO" ;;
  }

  dimension: cpf {
    type: number
    hidden:  yes
    sql: ${TABLE}."CPF" ;;
  }

  measure: qtd_boletos_pagos {
    type: number
    group_item_label: "Quantidade de Boletos Pagos"
    sql: ${TABLE}."QTD_BOLETOS_PAGOS" ;;
  }

  measure: valor_boletos {
    type: number
    group_item_label: "Valor dos Boletos"
    sql: ${TABLE}."VALOR_BOLETOS" ;;
  }

  measure: valor_pago {
    type: number
    group_item_label: "Valor Pago"
    sql: ${TABLE}."VALOR_PAGO" ;;
  }

  measure: valor_atualizado {
    type: number
    group_item_label: "Valor Atualizado"
    sql: ${TABLE}."VALOR_ATUALIZADO" ;;
  }

  measure: desconto_cedido {
    type: number
    group_item_label: "Desconto Cedido"
    sql: ${TABLE}."DESCONTO_CEDIDO" ;;
  }

  measure: juros_recebido {
    type: number
    group_item_label: "Juros Recebidos"
    sql: ${TABLE}."JUROS_RECEBIDO" ;;
  }

  measure: desconto_principal {
    type: number
    group_item_label: "Desconto Principal"
    sql: ${TABLE}."DESCONTO_PRINCIPAL" ;;
  }

  dimension: flg_maior_atraso {
    type: yesno
    group_item_label: "Maior Atraso?"
    sql: ${TABLE}."FLG_MAIOR_ATRASO" ;;
  }

  dimension: flg_maior_faixa_atraso {
    type: yesno
    group_item_label: "Maior Faixa de Atraso?"
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
