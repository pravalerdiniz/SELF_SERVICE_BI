view: new_relic {
  sql_table_name: "VETERANO"."NEW_RELIC".LOG_QUERY
    ;;

  dimension: id {
    label: "ID"
    description: "ID (Arquivo + Query)"
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: arquivo {
    label: "ARQUIVO"
    description: "Arquivo originador da execução da query"
    type: number
    sql: ${TABLE}."ARQUIVO" ;;
  }

  dimension: query {
    label: "QUERY"
    description: "Query executada"
    type: string
    sql: ${TABLE}."QUERIES" ;;
  }

  dimension_group: data {
    type: time
    timeframes: [
      date,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA" ;;
    label: "DATA"
    group_label: "DATA DE LOG"
    description: "Informa a data em que a informação foi inserida no banco de dados"
  }

  dimension: soma_chamadas {
    label: "SOMA DAS CHAMADAS"
    description: "Indica a quantidade de vezes em que a Query/Arquivo foram chamados"
    type: number
    sql: ${TABLE}."SOMA_CHAMADAS" ;;
  }

  dimension: media_maior_chamada {
    label: "MEDIA MAIOR CHAMADA"
    description: "Média das maiores chamadas da query"
    type: number
    sql: ${TABLE}."MEDIA_MAIOR_CHAMADA" ;;
  }

  dimension: media_menor_chamada {
    label: "MEDIA MENOR CHAMADA"
    description: "Média das menores chamadas da query"
    type: number
    sql: ${TABLE}."MEDIA_MENOR_CHAMADA" ;;
  }

  dimension: ocupacao {
    label: "OCUPACAO DA QUERY"
    description: "Tempo de ocupação da query"
    type: number
    sql: ${TABLE}."OCUPACAO" ;;
  }

  measure: count {
    label: "CONTAGEM DE OCORRÊNCIAS"
    view_label: "MÉTRICAS"
    #description: "Informa a situação atual do Pravalente"
    type: count
    drill_fields: []
  }

  measure: porcentagem {
    label: "PORCENTAGEM DE OCORRÊNCIAS"
    view_label: "MÉTRICAS"
    #description: "Informa a situação atual do Pravalente"
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: []
  }
}
