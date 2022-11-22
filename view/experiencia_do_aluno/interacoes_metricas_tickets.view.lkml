view: interacoes_metricas_tickets {
  sql_table_name: "VETERANO"."FATO"."FATO_TICKET_METRICS_ZENDESK"   ;;



  dimension: ticket_id {
    primary_key: yes
    type: number
    group_label: "Métricas de Ticket"
    group_item_label: "ID Ticket"
    description: "Id do ticket"
    sql: ${TABLE}."TICKET_ID" ;;
  }

  measure: grupos {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Qtd Grupos"
    description: "Número de grupos pelos quais o ticket passou"
    sql: ${TABLE}."GRUPOS" ;;
  }

  measure: atendentes {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Qtd Atendentes"
    description: "Número de atendentes pelos quais o ticket passou"
    sql: ${TABLE}."ATENDENTES" ;;
  }

  measure: reaberturas {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Reaberturas"
    description: "Quantidade de reaberturas que o ticket teve"
    sql: ${TABLE}."REABERTURAS" ;;
  }

  measure: respostas_publicas {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Respostas Públicas"
    description: "Número de respostas públicas adicionadas a um ticket por um agente"
    sql: ${TABLE}."RESPOSTAS_PUBLICAS" ;;
  }

  measure: primeira_resolucao_minutos_corridos {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Primeira Resolução (minutos corridos)"
    description: "Número de minutos corridos para a primeira resolução"
    sql: ${TABLE}."PRIMEIRA_RESOLUCAO_MINUTOS_CORRIDOS" ;;
  }

  measure: primeira_resolucao_minutos_trabalhados {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Primeira Resolução (minutos trabalhados)"
    description: "Número de minutos trabalhados para a primeira resolução"
    sql: ${TABLE}."PRIMEIRA_RESOLUCAO_MINUTOS_TRABALHADOS" ;;
  }

  measure: primeira_resposta_minutos_corridos {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Primeira Resposta (minutos corridos)"
    description: "Número de minutos corridos para a primeira resposta"
    sql: ${TABLE}."PRIMEIRA_RESPOSTA_MINUTOS_CORRIDOS" ;;
  }

  measure: primeira_resposta_minutos_trabalhados {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Primeira Resposta (minutos trabalhados)"
    description: "Número de minutos trabalhados para a primeira resposta"
    sql: ${TABLE}."PRIMEIRA_RESPOSTA_MINUTOS_TRABALHADOS" ;;
  }

  measure: resolucao_completa_minutos_corridos {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Resolução Completa (minutos corridos)"
    description: "Número de minutos corridos para a resolução completa"
    sql: ${TABLE}."RESOLUCAO_COMPLETA_MINUTOS_CORRIDOS" ;;
  }

  measure: resolucao_completa_minutos_trabalhados {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Resolução Completa (minutos trabalhados)"
    description: "Número de minutos trabalhados para a resolução completa"
    sql: ${TABLE}."RESOLUCAO_COMPLETA_MINUTOS_TRABALHADOS" ;;
  }

  measure: espera_agente_minutos_corridos {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Espera do Agente (minutos corridos)"
    description: "Número de minutos corridos que o atendente gastou esperando"
    sql: ${TABLE}."ESPERA_AGENTE_MINUTOS_CORRIDOS" ;;
  }

  measure: espera_agente_minutos_trabalhados {
    type: sum
    group_label: "Métricas de Ticket"
    group_item_label: "Espera do Agente (minutos trabalhados)"
    description: "Número de minutos trabalhados que o atendente gastou esperando"
    sql: ${TABLE}."ESPERA_AGENTE_MINUTOS_TRABALHADOS" ;;
  }


}
