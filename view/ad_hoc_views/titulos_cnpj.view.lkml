view: titulos_cnpj {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.VW_TITULOS_CNPJ
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: seunum {
    type: number
    sql: ${TABLE}."SEUNUM" ;;
    description: "Identificação do boleto"
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."SNOME" ;;
    description: "nome da IES"
  }

  dimension: apelido {
    type: string
    sql: ${TABLE}."APELIDO" ;;
    description: "apelido IES"
  }


  dimension_group: vecto {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."VECTO" ;;
    label: "Vencimento"
    description: "Data do vencimento do boleto"
  }


  dimension: valor {
    type: number
    sql: ${TABLE}."VALOR" ;;
    description: "valor do boleto"
  }

  dimension: valorpg {
    type: number
    sql: ${TABLE}."VALORPG" ;;
    description: "valor pago do boleto"
  }


  dimension_group: datapg {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."DATAPG" ;;
    label: "Pagamento"
    description: "Data em que foi feito o pagamento do boleto"
  }


  dimension: slinha01 {
    type: string
    sql: ${TABLE}."SLINHA01" ;;
    description: "mensagem"
  }

  set: detail {
    fields: [
      seunum,
      nome,
      apelido,
      vecto_date,
      valor,
      valorpg,
      datapg_date,
      slinha01
    ]
  }
}
