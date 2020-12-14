view: validacoes_tipo_proposta {

  sql_table_name: "GRADUADO"."VALIDACOES"."VALIDACOES_TIPO_PROPOSTA"
  ;;

  dimension: tabela {
    type: string
    sql: ${TABLE}."TABELA" ;;
    value_format:  ""
    group_label: "Validações Tipo Proposta"
    group_item_label: ""
    description: "Tabela validada"
  }

  dimension: validacao {
    type: string
    sql: ${TABLE}."VALIDACAO" ;;
    value_format:  ""
    group_label: "Validações Tipo Proposta"
    group_item_label: ""
    description: "Tipo de validação"
  }

  dimension: qtd {
    type: string
    sql: ${TABLE}."QTD" ;;
    value_format:  ""
    group_label: "Validações Tipo Proposta"
    group_item_label: ""
    description: "Quantidade Proposta Inexistente"
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
    group_label: "Validações Tipo Proposta"
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
