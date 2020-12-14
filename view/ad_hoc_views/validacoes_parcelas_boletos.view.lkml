view: validacoes_parcelas_boletos {

  sql_table_name: "GRADUADO"."VALIDACOES"."VALIDACOES_PARCELAS_BOLETOS"
  ;;

  dimension: tabela {
    type: string
    sql: ${TABLE}."TABELA" ;;
    value_format:  ""
    group_label: "Parcelas Divergente de Qtde. Boletos"
    group_item_label: ""
    description: "Tabela validada"
  }

  dimension: validacao {
    type: string
    sql: ${TABLE}."VALIDACAO" ;;
    value_format:  ""
    group_label: "Parcelas Divergente de Qtde. Boletos"
    group_item_label: ""
    description: "Tipo de validação"
  }

  dimension: qtd_prestacoes {
    type: number
    sql: ${TABLE}."QTD_PRESTACOES" ;;
    value_format:  ""
    group_label: "Parcelas Divergente de Qtde. Boletos"
    group_item_label: ""
    description: "Quantidade Prestações"
  }

  dimension: qtd_divergencia {
    type: number
    sql: ${TABLE}."QTD_DIVERGENCIA" ;;
    value_format:  ""
    group_label: "Parcelas Divergente de Qtde. Boletos"
    group_item_label: ""
    description: "Quantidade Divergente"
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
    value_format:  ""
    group_label: "Parcelas Divergente de Qtde. Boletos"
    group_item_label: ""
    description: "ID da Proposta"
  }

  dimension: qtd_boleto_gerado {
    type: number
    sql: ${TABLE}."QTD_BOLETO_GERADO" ;;
    value_format:  ""
    group_label: "Parcelas Divergente de Qtde. Boletos"
    group_item_label: ""
    description: "Quantidade de Boletos Gerados"
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
    group_label: "Parcelas Divergente de Qtde. Boletos"
    sql: ${TABLE}."SNAPSHOT" ;;
  }

  measure: soma_qte_prestacoes {
    type: sum
    sql: ${qtd_prestacoes} ;;
    value_format:  "0"
    group_label: ""
    group_item_label: ""
    description: ""
  }

  measure: soma_qte_divergencia {
    type: sum
    sql: ${qtd_divergencia} ;;
    value_format:  "0"
    group_label: ""
    group_item_label: ""
    description: ""
  }

  measure: soma_qte_boleto_gerado {
    type: sum
    sql: ${qtd_boleto_gerado} ;;
    value_format:  "0"
    group_label: ""
    group_item_label: ""
    description: ""
  }
}
