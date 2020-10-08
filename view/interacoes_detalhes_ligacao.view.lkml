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
      f.value:"TEMPO_URA"::varchar as TEMPO_MAX_DURACAO_CHAMADA,
      f.value:"CAMINHO_URA"::varchar as TEMPO_URA,
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
    hidden: yes
    sql: ${TABLE}."ID_TICKET" ;;
  }


  dimension: data_ligacao {
    type: date
    label: "Data de ligação"
    description: "Indica a data da ligação do ticket."
    sql: ${TABLE}."DATA_LIGACAO" ;;
  }

  dimension: duracao_chamada {
    type: duration_second
    label: "Duração da chamada"
    description: "Indica a duração da chamada em HH:MM:SS."
    sql: ${TABLE}."DURACAO_CHAMADA" ;;
  }

  dimension: fila_atendimento {
    type: string
    label: "Fila"
    description: "Indica a fila de atendimento durante a ligação."
    sql: ${TABLE}."FILA_ATENDIMENTO" ;;
  }

  dimension_group: horario_entrada_ligacao {
    type: time
    label: "Entrada da Ligação - Horário"
    description: "Indica a hora de entrada da ligação do ticket."
    sql: ${TABLE}."HORARIO_ENTRADA_LIGACAO" ;;
  }

  dimension: nome_agente {
    type: string
    label: "Nome do Atendente"
    description: "Indica o nome do atendente responsável pela ligação no ticket."
    sql: ${TABLE}."NOME_AGENTE" ;;
  }

  dimension: tempo_espera_ate_atendimento {
    type: duration_second
    label: "Tempo de Espera"
    description: "Indica o tempo de espera da ligação até o atendimento em segundos."
    sql: ${TABLE}."TEMPO_ESPERA_ATE_ATENDIMENTO" ;;
  }

  dimension: tempo_falado {
    type: duration_second
    label: "Tempo Falado"
    description: "Indica o tempo falado da ligação em segundos."
    sql: ${TABLE}."TEMPO_FALADO" ;;
  }

  dimension: tempo_ura {
    type: duration_second
    label: "URA - Tempo"
    description: "Indica o tempo da ligação na URA em segundos"
    sql: ${TABLE}."TEMPO_URA" ;;
  }

  dimension: caminho_ura {
    type: string
    label: "URA - Caminho"
    description: "Indica o caminho da URA."
    sql: ${TABLE}."CAMINHO_URA" ;;
  }

  dimension: tipo_conexao {
    type: string
    label: "Tipo de Conexão"
    description: "Indica o tipo de conexão da chamada. Ex: Interno ou Externo."
    sql: ${TABLE}."TIPO_CONEXAO" ;;
  }

  dimension: tipo_ligacao {
    type: string
    label: "Tipo de Ligação"
    description: "Indica o tipo de ligação."
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
      caminho_ura,
      tempo_ura,
      tipo_conexao,
      tipo_ligacao
    ]
  }
}
