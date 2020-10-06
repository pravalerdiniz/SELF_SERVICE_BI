view: interacoes_detalhes_ligacao {
  derived_table: {
    sql: select a.id_ticket,
      concat(right(f.value:"DATA_LIGACAO"::varchar,4),'-',left(right(f.value:"DATA_LIGACAO"::varchar,7),2),'-',left(f.value:"DATA_LIGACAO"::varchar,2))::date as DATA_LIGACAO,
      f.value:"DURACAO_CHAMADA"::varchar as DURACAO_CHAMADA,
      f.value:"FILA_ATENDIMENTO"::varchar as FILA_ATENDIMENTO,
      f.value:"HORARIO_ENTRADA_LIGACAO"::time as HORARIO_ENTRADA_LIGACAO,
      f.value:"NOME_AGENTE"::varchar as NOME_AGENTE,
      f.value:"TEMPO_ESPERA_ATE_ATENDIMENTO"::varchar as TEMPO_ESPERA_ATE_ATENDIMENTO,
      f.value:"TEMPO_FALADO"::varchar as TEMPO_FALADO,
      f.value:"TEMPO_MAX_DURACAO_CHAMADA"::varchar as TEMPO_MAX_DURACAO_CHAMADA,
      f.value:"TEMPO_URA"::varchar as TEMPO_URA,
      f.value:"TIPO_CONEXAO"::varchar as TIPO_CONEXAO,
      f.value:"TIPO_LIGACAO"::varchar as TIPO_LIGACAO
      from "GRADUADO"."SELF_SERVICE_BI"."INTERACOES" a,
      lateral flatten (input => detalhes_ligacao) f
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_ticket {
    type: number
    sql: ${TABLE}."ID_TICKET" ;;
  }


  dimension: data_ligacao {
    type: date
    sql: ${TABLE}."DATA_LIGACAO" ;;
  }

  dimension: duracao_chamada {
    type: string
    sql: ${TABLE}."DURACAO_CHAMADA" ;;
  }

  dimension: fila_atendimento {
    type: string
    sql: ${TABLE}."FILA_ATENDIMENTO" ;;
  }

  dimension_group: horario_entrada_ligacao {
    type: time
    sql: ${TABLE}."HORARIO_ENTRADA_LIGACAO" ;;
  }

  dimension: nome_agente {
    type: string
    sql: ${TABLE}."NOME_AGENTE" ;;
  }

  dimension: tempo_espera_ate_atendimento {
    type: string
    sql: ${TABLE}."TEMPO_ESPERA_ATE_ATENDIMENTO" ;;
  }

  dimension: tempo_falado {
    type: string
    sql: ${TABLE}."TEMPO_FALADO" ;;
  }

  dimension: tempo_max_duracao_chamada {
    type: string
    sql: ${TABLE}."TEMPO_MAX_DURACAO_CHAMADA" ;;
  }

  dimension: tempo_ura {
    type: string
    sql: ${TABLE}."TEMPO_URA" ;;
  }

  dimension: tipo_conexao {
    type: string
    sql: ${TABLE}."TIPO_CONEXAO" ;;
  }

  dimension: tipo_ligacao {
    type: string
    sql: ${TABLE}."TIPO_LIGACAO" ;;
  }

  set: detail {
    fields: [
      data_ligacao,
      duracao_chamada,
      fila_atendimento,
      horario_entrada_ligacao_time,
      nome_agente,
      tempo_espera_ate_atendimento,
      tempo_falado,
      tempo_max_duracao_chamada,
      tempo_ura,
      tipo_conexao,
      tipo_ligacao
    ]
  }
}
