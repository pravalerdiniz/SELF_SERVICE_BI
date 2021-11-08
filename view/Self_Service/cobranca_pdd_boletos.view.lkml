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
    label: "Data de Pagamento"
    sql: ${TABLE}."DATAPG" ;;
  }

  dimension: fundo {
    type: number
    label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: fx_atraso {
    type: string
    label: "Faixa de Atraso"
    sql: ${TABLE}."FX_ATRASO" ;;
  }

  dimension: cpf {
    type: number
    hidden:  yes
    primary_key: yes
    sql: ${TABLE}."CPF" ;;
  }

  measure: qtd_boletos_pagos {
    type: sum
    label: "Quantidade de Boletos Pagos"
    sql: ${TABLE}."QTD_BOLETOS_PAGOS" ;;
  }

  measure: valor_boletos {
    type: sum
    label: "Valor dos Boletos"
    sql: ${TABLE}."VALOR_BOLETOS" ;;
  }

  measure: valor_pago {
    type: sum
    label: "Valor Pago"
    sql: ${TABLE}."VALOR_PAGO" ;;
  }

  measure: valor_atualizado {
    type: sum
    label: "Valor Atualizado"
    sql: ${TABLE}."VALOR_ATUALIZADO" ;;
  }

  measure: desconto_cedido {
    type: sum
    label: "Desconto Cedido"
    sql: ${TABLE}."DESCONTO_CEDIDO" ;;
  }

  measure: juros_recebido {
    type: sum
    label: "Juros Recebidos"
    sql: ${TABLE}."JUROS_RECEBIDO" ;;
  }

  measure: desconto_principal {
    type: sum
    label: "Desconto Principal"
    sql: ${TABLE}."DESCONTO_PRINCIPAL" ;;
  }

  dimension: flg_maior_atraso {
    type: yesno
    label: "Maior Atraso?"
    sql: ${TABLE}."FLG_MAIOR_ATRASO" ;;
  }

  dimension: flg_maior_faixa_atraso {
    type: yesno
    label: "Maior Faixa de Atraso?"
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
