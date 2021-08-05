view: topico_tendencia {
  sql_table_name: "GRADUADO"."DATA_SCIENCE"."TOPICO_TENDENCIA"
    ;;
  drill_fields: [id]

  dimension: id {
    group_item_label: "ID Tópico"
    description: "Identificação do Tópico"
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: ano_semana {
    group_item_label: "Ano e Semana do Ano"
    description: "Ano e Semana no Ano da Tendência"
    type: string
    sql: ${TABLE}."ANO_SEMANA" ;;
  }

  dimension_group: data {
    group_item_label: "Data"
    description: "Data da Tendência"
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
    sql: ${TABLE}."DATA" ;;
  }

  dimension: semana {
    group_item_label: "Semana do Ano"
    description: "Semana no Ano da Tendência"
    type: number
    sql: ${TABLE}."SEMANA" ;;
  }

  dimension: topico {
    group_item_label: "Tópico"
    description: "Tópico ou Assunto"
    type: string
    sql: ${TABLE}."TOPICO" ;;
  }

  dimension: semana_ano {
    group_item_label: "Semana Ano Corrente"
    description: "Semana do Ano Corrente"
    type: number
    sql: WEEKOFYEAR(CURRENT_DATE()) ;;
  }

  measure: valor_calculado {
    group_item_label: "Valor de Tendência Calculada"
    description: "Valor da Tendência Histórica Calculada"
    type: sum
    sql: ${TABLE}."VALOR_CALCULADO" ;;
  }


  measure: valor {
    group_item_label: "Valor Tendência"
    description: "Valor da Tendência"
    type: sum
    sql: ${TABLE}."VALOR" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
