view: validacoes_entre_camadas {

  sql_table_name: "GRADUADO"."VALIDACOES"."VALIDACOES_ENTRE_CAMADAS"
  ;;

  dimension: tabela {
    type: string
    sql: ${TABLE}."TABELA" ;;
    value_format:  ""
    group_label: "Validação Entre Camadas"
    group_item_label: ""
    description: "Tabela validada"
  }

  dimension: validacao {
    type: string
    sql: ${TABLE}."VALIDACAO" ;;
    value_format:  ""
    group_label: "Validação Entre Camadas"
    group_item_label: ""
    description: "Tipo de validação"
  }

  dimension: qtd {
    type: string
    sql: ${TABLE}."QTD" ;;
    value_format:  ""
    group_label: "Validação Entre Camadas"
    group_item_label: ""
    description: "Quantidade divergente"
  }

  dimension_group: snapshot {
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
    group_label: "Validação Entre Camadas"
    sql: ${TABLE}."SNAPSHOT" ;;
  }

  measure: soma_qtd {
    type: sum
    sql: ${qtd} ;;
    value_format:  "0"
    group_label: ""
    group_item_label: ""
    description: ""
  }
}
