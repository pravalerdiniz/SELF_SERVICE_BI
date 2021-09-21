view: base_carteira_atrasado {
  derived_table: {
    sql: select * from stage.public.base_carteira_atrasado BCA
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cpf {
    type: number
    hidden:  yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: ano_mes {
    type: string
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: tipo_contrato {
    type: string
    group_item_label:"Tipo do Contrato"
    sql: ${TABLE}."TIPO_CONTRATO" ;;
  }

  dimension: fundo {
    type: string
    group_item_label:"Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: faixa_atraso {
    type: string
    group_item_label:"Faixa de Atraso"
    sql: ${TABLE}."FAIXA_ATRASO" ;;
  }

  dimension: bkt {
    type: string
    group_item_label:"Bucket"
    sql: ${TABLE}."BKT" ;;
  }

  dimension: qtd {
    type: number
    hidden:  yes
    sql: ${TABLE}."QTD" ;;
  }

  measure: saldo {
    type: sum
    group_item_label:"Saldo"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."SALDO" ;;
  }

  dimension: fec_mar {
    type: number
    sql: ${TABLE}."FEC_MAR" ;;
  }

  set: detail {
    fields: [
      cpf,
      ano_mes,
      tipo_contrato,
      fundo,
      faixa_atraso,
      bkt,
      qtd,
      saldo,
      fec_mar
    ]
  }
}
