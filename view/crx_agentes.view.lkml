view: crx_agentes {
  sql_table_name: "SELF_SERVICE_BI"."CRX_AGENTES"
    ;;

  dimension: nome_data {
    type: string
    sql: CONCAT(${nome},${data_registro}) ;;
    primary_key: yes
    hidden: yes






  }
  dimension: dias_logados {
    type: number
    group_label: "Dados do Atendente"
    group_item_label: "Logado?"
    description: "Indica se o atendente estava logado no dia ou não. Ex: Sim = 1 ou Não = 0"
    hidden: yes
    sql: ${TABLE}."DIAS_LOGADOS" ;;
  }

  dimension: data_registro {
    type: date
    group_label: "Dados de Atendimento"
    group_item_label: "Data de registro"
    description: "Indica a data em que o registro da ação do atendente foi realizada."
    sql: ${TABLE}."DATA_REGISTRO" ;;
  }

  measure: sum_dias_logados {
    type: sum
    group_label: "Dados do Atendente"
    group_item_label: "Quantidade de dias logado"
    description: "Indica a quantidade de dias logados do atendente"
    sql: ${dias_logados} ;;
  }

  measure: media_tempo_logado_dia {
    type: average
     group_label: "Dados do Atendente"
    label: "Tempo Médio Logado"
    description: "Indica a média de tempo logado do atendente por dia."
    filters: [dias_logados: "1"]
    sql: ${TABLE}."MEDIA_TEMPO_LOGADO_DIA"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }


  measure: media_tempo_logado_sessao {
    type: average
     group_label: "Dados de Atendimento"
    label: "Média Tempo Logado sessão"
    description: "Indica a média de tempo logado do atendente por sessão."
    filters: [dias_logados: "1"]
    hidden: yes
    sql: ${TABLE}."MEDIA_TEMPO_LOGADO_SESSAO"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }

  measure: media_tempo_pausado_dia {
    type: average
    group_label: "Dados de Atendimento"
    label: "Dia - Tempo Pausado Média"
    filters: [dias_logados: "1"]
    hidden: yes
    description: "Indica a média de tempo de pausa do atendente por dia."
    sql: ${TABLE}."MEDIA_TEMPO_PAUSADO_DIA"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }

  dimension: nome {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "Nome"
    description: "Indica o nome do atendente"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: numero_ramal {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "Ramal"
    description: "Indica o número do ramal do atendente"
    sql: ${TABLE}."NUMERO_RAMAL" ;;
  }

  dimension: pausas {
    type: string
    sql: ${TABLE}."PAUSAS" ;;
    hidden: yes
  }

  dimension: produtividade {
    type: string
    group_label: "Dados de Atendimento"
    group_item_label: "Produtividade"
    sql: ${TABLE}."PRODUTIVIDADE" ;;
    hidden: yes
  }

  measure: qtd_atendimento_ativo {
    type: sum
    group_label: "Dados de Ligação"
    group_item_label: "Ativo"
    description: "Indica a quantidade de atendimentos ativos do atendente"
    sql: ${TABLE}."QTD_ATENDIMENTO_ATIVO" ;;
  }

  measure: qtd_atendimento_receptivo {
    type: sum
    group_label: "Dados de Ligação"
    group_item_label: "Receptivo"
    description: "Indica a quantidade de atendimentos receptivos do atendente"
    sql: ${TABLE}."QTD_ATENDIMENTO_RECEPTIVO" ;;
  }

  dimension: qtd_ligacoes_atendidas {
    type: string
    group_label: "Dados de Ligação"
    group_item_label: "Atendidas"
    description: "Indica a quantidade de ligações atendidas pelo atendente"
    sql: ${TABLE}."QTD_LIGACOES_ATENDIDAS" ;;
    hidden: yes
  }

  measure: qtd_ligacoes_nao_atendidas {
    type: sum
    group_label: "Dados de Ligação"
    group_item_label: "Não Atendidas"
    description: "Indica a quantidade de ligações NÃO atendidas pelo atendente"
    sql: ${TABLE}."QTD_LIGACOES_NAO_ATENDIDAS" ;;
  }

  measure: qtd_pausas {
    type: sum
    group_label: "Dados do Atendente"
    group_item_label: "Quantidade de Pausas"
    description: "Indica a quantidade de pausas realizadas pelo atendente"
    sql: ${TABLE}."QTD_PAUSAS" ;;
  }

  measure: qtd_recusa {
    type: sum
    group_label: "Dados de Ligação"
    group_item_label: "Recusadas"
    description: "Indica a quantidade de ligaçoes recusadas pelo atendente"
    sql: ${TABLE}."QTD_RECUSA" ;;
  }

  dimension: sla_atendimento {
    type: number
    group_label: "Dados de Atendente"
    group_item_label: "SLA"
    value_format: "0.0%"
    hidden: yes
    description: "Indica o tempo de SLA de atendimento do atendente"
    sql: ${TABLE}."SLA_ATENDIMENTO" ;;
  }


  measure: media_sla_atendimento {
    type: average
    group_label: "Dados de Atendente"
    group_item_label: "SLA"
    value_format: "0.0%"
    description: "Indica o tempo de SLA de atendimento do atendente"
    sql: ${TABLE}."SLA_ATENDIMENTO" ;;
  }

  measure: tempo_maximo_ligacao {
    type: sum
    group_label: "Dados de Ligação"
    group_item_label: "Tempo Máximo"
    description: "Indica o tempo máximo do atendente durante a ligação"
    sql: ${TABLE}."TEMPO_MAXIMO_LIGACAO"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }

   measure: tempo_medio_falado {
    type: average
    group_label: "Dados de Ligação"
    group_item_label: "Tempo Médio Falado"
    description: "Indica o tempo médio falado do atendente durante a ligações"
    sql: ${TABLE}."TEMPO_MEDIO_FALADO"/ 86400.0;;
    filters: [dias_logados: "1"]
    value_format: "[hh]:mm:ss"
  }

  measure: tempo_medio_pausado {
    type: average
   group_label: "Dados do Atendente"
    group_item_label: "Tempo Médio de Pausa"
    description: "Indica o tempo médio de pausa do atendente"
    filters: [dias_logados: "1"]
    sql: ${TABLE}."TEMPO_MEDIO_PAUSADO"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }


  measure: tempo_minimo_ligacao {
    type: sum
    group_label: "Dados de Ligação"
    group_item_label: "Tempo Mínimo"
    description: "Indica o tempo mínimo de ligação do atendente"
    sql: ${TABLE}."TEMPO_MINIMO_LIGACAO"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }


  measure: tempo_ociosidade {
    type: average
     group_label: "Dados de Ligação"
    group_item_label: "Tempo Ocioso"
    description: "Indica o tempo de ociosidade do atendente"
    filters: [dias_logados: "1"]
    sql: ${TABLE}."TEMPO_OCIOSIDADE"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }


  measure: tempo_total_falado {
    type: sum
    group_label: "Dados de Ligação"
    group_item_label: "Tempo Total Falado"
    description: "Indica o tempo total falado do atendente durante as ligações"
    filters: [dias_logados: "1"]
    sql: ${TABLE}."TEMPO_TOTAL_FALADO"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }



  measure: tempo_total_logado {
    type: sum
     group_label: "Dados do Atendente"
    group_item_label: "Tempo Total Logado"
    description: "Indica o tempo total logado do atendente"
    filters: [dias_logados: "1"]
    sql: ${TABLE}."TEMPO_TOTAL_LOGADO"/86400.0;;
    value_format: "[hh]:mm:ss"
  }


  measure: tempo_total_pausado {
    type: sum
     group_label: "Dados do Atendente"
    group_item_label: "Tempo Total Pausado"
    description: "Indica o tempo total de pausa do atendente"
    filters: [dias_logados: "1"]
    sql: ${TABLE}."TEMPO_TOTAL_PAUSADO"/86400.0;;
    value_format: "[hh]:mm:ss"
  }



  measure: count {
    type: count
    drill_fields: []
  }
}
