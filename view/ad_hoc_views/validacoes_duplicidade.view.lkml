view: validacoes_duplicidade {

  sql_table_name: "GRADUADO"."VALIDACOES"."VALIDACOES_DUPLICIDADE"
  ;;

  dimension: tabela {
    type: string
    sql: ${TABLE}."TABELA" ;;
    value_format:  ""
    group_label: "Duplicidades"
    group_item_label: ""
    description: "Tabela validada"
  }

  dimension: validacao {
    type: string
    sql: ${TABLE}."VALIDACAO" ;;
    value_format:  ""
    group_label: "Duplicidades"
    group_item_label: ""
    description: "Tipo de validação"
  }

  dimension: chave {
    type: string
    sql: ${TABLE}."CHAVE" ;;
    value_format:  ""
    group_label: "Duplicidades"
    group_item_label: ""
    description: "Campo Chave Validado"
  }

  dimension: qte {
    type: string
    sql: ${TABLE}."QTD" ;;
    value_format:  ""
    group_label: "Duplicidades"
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
    group_label: "Duplicidades"
    sql: ${TABLE}."SNAPSHOT" ;;
  }
}
