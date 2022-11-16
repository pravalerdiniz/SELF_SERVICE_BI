view: interacoes_metricas_tickets {
  sql_table_name: "VETERANO"."FATO"."FATO_TICKET_METRICS_ZENDESK"

    ;;



  dimension: ticket_id {
    primary_key: yes
    type: number
    group_label: "Métricas de Ticket"
    group_item_label: "ID Ticket"
    description: "Id do ticket"
    sql: ${TABLE}."TICKET_ID" ;;
  }

  measure: reaberturas {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Reaberturas"
    description: "Quantidade de reaberturas que o ticket teve"
    sql: ${TABLE}."REOPENS" ;;
  }

  measure: tempo_primeira_resolucao {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Tempo de Primeira Resolução (minutos)"
    description: "Mostra o tempo em minutos até a primeira view: interacoes"
    sql: ${TABLE}."FIRST_RESOLUTION_TIME_IN_MINUTES_CORRIDO" ;;
  }

  measure: tempo_resolucao_completa {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Tempo de Resolução Completa (minutos)"
    description: "Mostra o tempo em minutos até a resolução completa do ticket."
    sql: ${TABLE}."FULL_RESOLUTION_TIME_IN_MINUTES_CORRIDO" ;;
  }

  measure: tempo_resposta {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Tempo de resposta (minutos)"
    description: "Mostra o tempo de resposta em minutos."
    sql: ${TABLE}."REPLY_TIME_IN_MINUTES_CORRIDO" ;;
  }

  dimension_group: criacao{
    type: time
    label: "Ticket Criação"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
      description: "Indica a data de criação do ticket"
  }

}
