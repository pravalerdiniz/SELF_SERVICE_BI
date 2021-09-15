view: alunos_mis_meritocracia {
  derived_table: {
    sql: select * from stage.public.mis_meritocracia
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cpf_dt_pg {
    type: string
    sql: CONCAT(${cpf},${data_pagamento_group_raw}) ;;
    primary_key: yes
    hidden: yes





  }



  dimension: cpf_join {
    type: number
    hidden: yes
    sql: ${TABLE}."CPF_JOIN" ;;
  }


  dimension: cpf {
    type: string
    sql: ${TABLE}."CPF" ;;
  }

  dimension: fundo {
    type: number
    group_item_label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: datapg {
    type: date
    group_item_label: "Data de Pagamento"
    hidden: yes
    sql: ${TABLE}."DATAPG" ;;
  }

  dimension_group: data_pagamento_group{
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      month_name,
      year,
      time,

    ]
    convert_tz: no
    label: "Pagamento"
    description: "Indica a a data de pagamento do boleto"
    datatype: date
    sql: ${datapg} ;;
  }

  measure: qtd_boletos_pagos {
    type: sum
    group_item_label: "Quantidade de Boletos Pagos"
    sql: ${TABLE}."QTD_BOLETOS_PAGOS" ;;
  }

  dimension: maior_atraso {
    type: number
    group_item_label: "Maior Atraso"
    sql: ${TABLE}."MAIOR_ATRASO" ;;
  }

  dimension: tipo_baixa {
    type: number
    group_item_label: "Tipo de Baixa"
    sql: ${TABLE}."TIPO_BAIXA" ;;
  }

  measure: valor_boletos {
    type: sum
    group_item_label: "Valor dos Boletos"
    sql: ${TABLE}."VALOR_BOLETOS" ;;
  }

  measure: valor_pago {
    type: sum
    group_item_label: "Valor Pago"
    sql: ${TABLE}."VALOR_PAGO" ;;
  }

  measure: valor_atualizado {
    type: sum
    group_item_label: "Valor Atualizado"
    sql: ${TABLE}."VALOR_ATUALIZADO" ;;
  }

  measure: desconto_cedido {
    type: sum
    group_item_label: "Desconto Cedido"
    sql: ${TABLE}."DESCONTO_CEDIDO" ;;
  }

  measure: juros_recebido {
    type: sum
    group_item_label: "Juros Recebidos"
    sql: ${TABLE}."JUROS_RECEBIDO" ;;
  }

  measure: desconto_principal {
    type: sum
    group_item_label: "Desconto Principal"
    sql: ${TABLE}."DESCONTO_PRINCIPAL" ;;
  }

  dimension: faixa_atraso {
    type: string
    group_item_label: "Faixa de Atraso"
    sql: ${TABLE}."FAIXA_ATRASO" ;;
  }

  dimension: tipo_canal {
    type: string
    group_item_label: "Tipo de Canal"
    description: "Indica qual a empresa que realizou o acordo"
    sql: ${TABLE}."TIPO_CANAL" ;;
  }

  dimension: tipo_fundo {
    type: string
    group_item_label: "Tipo de Fundo"
    sql: ${TABLE}."TIPO_FUNDO" ;;
  }

  dimension: carteira {
    type: string
    group_item_label: "Carteira"
    sql: ${TABLE}."CARTEIRA" ;;
  }

  set: detail {
    fields: [
      cpf,
      fundo,
      datapg,
      qtd_boletos_pagos,
      maior_atraso,
      tipo_baixa,
      valor_boletos,
      valor_pago,
      valor_atualizado,
      desconto_cedido,
      juros_recebido,
      desconto_principal,
      faixa_atraso,
      tipo_canal,
      tipo_fundo,
      carteira
    ]
  }
}
