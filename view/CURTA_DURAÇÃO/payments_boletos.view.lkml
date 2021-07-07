view: payments_boletos {
  derived_table: {
    sql: select key KEY,
        py.chave_contrato,
       f.value:COUNT_OVERDUE_NOTIFICATION::int as DIAS_VENCIDO,
       F.VALUE:DUE_DATE::DATE AS DATA_VENCIMENTO,
       F.VALUE:INSTALLMENT_NUMBER::INT AS NUM_PARCELA,
       F.VALUE:STATUS::VARCHAR AS SITUACAO,
       F.VALUE:VALUE::FLOAT AS VL_BOLETO,
       F.VALUE:UPDATED_AT::DATETIME AS DATA_ATUALIZACAO
       from "VETERANO"."CURTA"."PAYMENT" py,
lateral flatten (input=>boletos) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: key {
    type: string
    group_item_label: "Linha Digitável"
    sql: ${TABLE}."KEY" ;;
    description: "CODIGO DO BOLETO, LINHA DIGITÁVEL"
    primary_key: yes
  }

  dimension: chave_contrato {
    type: string
    sql: ${TABLE}."CHAVE_CONTRATO" ;;
    hidden: yes
  }

  dimension: dias_vencido {
    type: number
    group_item_label: "Dias Apos o Vencimento"
    sql: ${TABLE}."DIAS_VENCIDO" ;;
    description: "QUANTIDADE DE DIAS FORA DA VALIDADE"
  }

  dimension: data_vencimento {
    type: date
    group_item_label: "Data de Vencimento"
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
    description: "DATA DE VENCIMENTO DO BOLETO"
  }

  dimension: num_parcela {
    type: number
    group_item_label: "Numero da Parcela"
    sql: ${TABLE}."NUM_PARCELA" ;;
    description: "NUMERO DA PARCELA"
  }

  dimension: situacao {
    type: string
    group_item_label: "Situacao do Boleto"
    sql: ${TABLE}."SITUACAO" ;;
    description: "INDICA SE O BOLETO ESTÁ PAGO, ABERTO, VENCIDO, PAGO EM ATRASO, ETC"
  }

  measure: vl_boleto {
    type: sum
    group_item_label: "Valor da Parcela"
    sql: ${TABLE}."VL_BOLETO" ;;
    value_format: "$ #,##0.00"
    description: "SOMA DOS VALORES DOS BOLETOS"
  }

  measure: avg_vl_boleto {
    type: average
    group_item_label: "Valor da Parcela"
    sql: ${TABLE}."VL_BOLETO" ;;
    value_format: "$ #,##0.00"
    description: "MÉDIA DOS VALORES DOS BOLETOS"
  }

  measure: max_vl_boleto {
    type: max
    group_item_label: "Valor da Parcela"
    sql: ${TABLE}."VL_BOLETO" ;;
    value_format: "$ #,##0.00"
    description: "MÁXIMO DOS VALORES DOS BOLETOS"
  }

  measure: min_vl_boleto {
    type: min
    group_item_label: "Valor da Parcela"
    sql: ${TABLE}."VL_BOLETO" ;;
    value_format: "$ #,##0.00"
    description: "MÍNIMO DOS VALORES DOS BOLETOS"
  }


  dimension_group: data_atualizacao {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    group_item_label: "Data de Atualizacao"
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
    description: "DATA DA ULTIMA ATUALIZAÇÃO DO REGISTRO"
  }

  measure: avg_dias_vencido {
    type: average
    group_item_label: "Média de dias Fora da Validade"
    sql: ${dias_vencido} ;;
    description: "MÉDIA DE DIAS FORA DA VALIDADE"
  }

  set: detail {
    fields: [
      chave_contrato,
      dias_vencido,
      data_vencimento,
      num_parcela,
      situacao,
      vl_boleto
    ]
  }
}
