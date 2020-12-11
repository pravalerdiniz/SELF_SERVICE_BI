view: validacoes_campos_nulos {

  sql_table_name: "GRADUADO"."VALIDACOES"."VALIDACOES_CAMPOS_NULOS"
  ;;

  dimension: tabela {
    type: string
    sql: ${TABLE}."TABELA" ;;
    value_format:  ""
    group_label: ""
    group_item_label: ""
    description: "Tabela validada"
  }

  dimension: validacao {
    type: string
    sql: ${TABLE}."VALIDACAO" ;;
    value_format:  ""
    group_label: ""
    group_item_label: ""
    description: "Tipo de validação"
  }

  dimension: campo {
    type: string
    sql: ${TABLE}."CAMPO" ;;
    value_format:  ""
    group_label: ""
    group_item_label: ""
    description: "Campo Validado"
  }

  dimension: qte {
    type: number
    sql: ${TABLE}."QTD" ;;
    value_format:  ""
    group_label: ""
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
    group_label: ""
    sql: ${TABLE}."SNAPSHOT" ;;
  }

  measure: soma_qtd {
    type: sum
    sql: ${qte} ;;
    value_format:  "0"
    group_label: ""
    group_item_label: ""
    description: ""
  }
}
