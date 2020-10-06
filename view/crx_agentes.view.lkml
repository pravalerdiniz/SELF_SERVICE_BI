view: crx_agentes {
  sql_table_name: "SELF_SERVICE_BI"."CRX_AGENTES"
    ;;

  dimension: data_registro {
    type: string
    sql: ${TABLE}."DATA_REGISTRO" ;;
  }

  dimension: dias_logados {
    type: string
    sql: ${TABLE}."DIAS_LOGADOS" ;;
  }

  dimension: media_tempo_logado_dia {
    type: string
    sql: ${TABLE}."MEDIA_TEMPO_LOGADO_DIA" ;;
  }

  dimension: media_tempo_logado_sessao {
    type: string
    sql: ${TABLE}."MEDIA_TEMPO_LOGADO_SESSAO" ;;
  }

  dimension: media_tempo_pausado_dia {
    type: string
    sql: ${TABLE}."MEDIA_TEMPO_PAUSADO_DIA" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: numero_ramal {
    type: string
    sql: ${TABLE}."NUMERO_RAMAL" ;;
  }

  dimension: pausas {
    type: string
    sql: ${TABLE}."PAUSAS" ;;
    hidden: yes
  }

  dimension: produtividade {
    type: string
    sql: ${TABLE}."PRODUTIVIDADE" ;;
  }

  dimension: qtd_atendimento_ativo {
    type: string
    sql: ${TABLE}."QTD_ATENDIMENTO_ATIVO" ;;
  }

  dimension: qtd_atendimento_receptivo {
    type: string
    sql: ${TABLE}."QTD_ATENDIMENTO_RECEPTIVO" ;;
  }

  dimension: qtd_ligacoes_atendidas {
    type: string
    sql: ${TABLE}."QTD_LIGACOES_ATENDIDAS" ;;
  }

  dimension: qtd_ligacoes_nao_atendidas {
    type: string
    sql: ${TABLE}."QTD_LIGACOES_NAO_ATENDIDAS" ;;
  }

  dimension: qtd_pausas {
    type: string
    sql: ${TABLE}."QTD_PAUSAS" ;;
  }

  dimension: qtd_recusa {
    type: string
    sql: ${TABLE}."QTD_RECUSA" ;;
  }

  dimension: sla_atendimento {
    type: string
    sql: ${TABLE}."SLA_ATENDIMENTO" ;;
  }

  dimension: tempo_maximo_ligacao {
    type: string
    sql: ${TABLE}."TEMPO_MAXIMO_LIGACAO" ;;
  }

  dimension: tempo_medio_falado {
    type: string
    sql: ${TABLE}."TEMPO_MEDIO_FALADO" ;;
  }

  dimension: tempo_medio_pausado {
    type: string
    sql: ${TABLE}."TEMPO_MEDIO_PAUSADO" ;;
  }

  dimension: tempo_minimo_ligacao {
    type: string
    sql: ${TABLE}."TEMPO_MINIMO_LIGACAO" ;;
  }

  dimension: tempo_ociosidade {
    type: string
    sql: ${TABLE}."TEMPO_OCIOSIDADE" ;;
  }

  dimension: tempo_total_falado {
    type: string
    sql: ${TABLE}."TEMPO_TOTAL_FALADO" ;;
  }

  dimension: tempo_total_logado {
    type: string
    sql: ${TABLE}."TEMPO_TOTAL_LOGADO" ;;
  }

  dimension: tempo_total_pausado {
    type: string
    sql: ${TABLE}."TEMPO_TOTAL_PAUSADO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
