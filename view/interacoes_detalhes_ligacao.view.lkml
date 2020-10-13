view: interacoes_detalhes_ligacao {
  derived_table: {
    sql: select a.id_ticket,
      (f.value:"DATA_LIGACAO"::timestamp)  as DATA_LIGACAO,
      f.value:"DURACAO_CHAMADA"::varchar as DURACAO_CHAMADA,
      f.value:"FILA_ATENDIMENTO"::varchar as FILA_ATENDIMENTO,
      f.value:"ID_LIGACAO"::varchar as ID_LIGACAO,
      --f.value:"HORARIO_ENTRADA_LIGACAO"::time as HORARIO_ENTRADA_LIGACAO,
      f.value:"NOME_AGENTE"::varchar as NOME_AGENTE,
      f.value:"TEMPO_ESPERA_ATE_ATENDIMENTO"::varchar as TEMPO_ESPERA_ATE_ATENDIMENTO,
      f.value:"TEMPO_FALADO"::varchar as TEMPO_FALADO,
      f.value:"TEMPO_URA"::varchar as TEMPO_URA,
      f.value:"CAMINHO_URA"::varchar as CAMINHO_URA,
      f.value:"TIPO_CONEXAO"::varchar as TIPO_CONEXAO,
    f.value:"DURACAO_CHAMADA_SEG"::int as DURACAO_CHAMADA_SEG,
    f.value:"TEMPO_ESPERA_ATE_ATENDIMENTO_SEG"::int as TEMPO_ESPERA_ATE_ATENDIMENTO_SEG,
    f.value:"TEMPO_FALADO_SEG"::int as TEMPO_FALADO_SEG,
    f.value:"TEMPO_URA_SEG"::int as TEMPO_URA_SEG,
      f.value:"TIPO_LIGACAO"::varchar as TIPO_LIGACAO
      from "GRADUADO"."SELF_SERVICE_BI"."INTERACOES" a,
      lateral flatten (input => detalhes_ligacao) f
       ;;


  }

  measure: count {
    type: count
    label: "Quantidade de Ligações"
    drill_fields: [detail*]
  }

measure: DURACAO_CHAMADA_SEG{
  type: sum
  sql: ${TABLE}."DURACAO_CHAMADA_SEG"/ 86400.0;;
  label: "Tempo Total - Duração da Chamada"
  description: "Soma do tempo falado da ligação."
  value_format: "[hh]:mm:ss"

   }

  measure: medio_duracao_chamada_seg {
    type: average
    sql: ${TABLE}."DURACAO_CHAMADA_SEG"/ 86400.0;;
    label: "Tempo Médio - Duração da Chamada"
    description: "Média do tempo de duração da chamada"
    value_format: "[hh]:mm:ss"

  }




  measure: TEMPO_ESPERA_ATE_ATENDIMENTO_SEG{
    type: sum
    label: "Tempo Total - Espera"
    description: "Soma do tempo espera até atendimento da ligação."
    sql: ${TABLE}."TEMPO_ESPERA_ATE_ATENDIMENTO_SEG"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }


  measure: medio_tempo_espera_ate_atendimento {
    type: average
    sql: ${TABLE}."TEMPO_ESPERA_ATE_ATENDIMENTO_SEG"/ 86400.0;;
    label: "Tempo Médio - Espera"
    description: "Média do tempo de espera até o atendimento chamada"
    value_format: "[hh]:mm:ss"


  }

  measure: TEMPO_FALADO_SEG{
    type: sum
    label: "Tempo Total - Falado"
    description: "Soma do tempo falado da ligação."
    sql: ${TABLE}."TEMPO_FALADO_SEG"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }


  measure: MEDIA_TEMPO_FALADO_SEG{
    type: average
    label: "Tempo Médio - Falado"
    description: "Soma do tempo falado da ligação."
    sql: ${TABLE}."TEMPO_FALADO_SEG"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }










  measure: TEMPO_URA_SEG{
    type: sum
    label: "Tempo Total -  URA"
    description: "Soma do tempo de ligação na URA."
    sql: ${TABLE}."TEMPO_URA_SEG"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }


  measure: medio_tempo_ura {
    type: average
    sql: ${TABLE}."TEMPO_URA_SEG"/ 86400.0;;
    label: "Tempo Médio - URA"
    description: "Média do tempo da URA"
    value_format: "[hh]:mm:ss"


  }

  dimension: id_ticket {
    type: number
    hidden: yes
    sql: ${TABLE}."ID_TICKET" ;;
  }


  dimension: id_ligacao {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}."ID_LIGACAO" ;;
  }


  dimension_group: data_ligacao {
    type: time
    label: "Data de ligação"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    description: "Indica a data da ligação do ticket."
    sql: ${TABLE}."DATA_LIGACAO" ;;
  }





  dimension: duracao_chamada {
    type: string
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


  dimension: nome_agente {
    type: string
    label: "Nome do Atendente"
    description: "Indica o nome do atendente responsável pela ligação no ticket."
    sql: ${TABLE}."NOME_AGENTE" ;;
  }

  dimension: tempo_espera_ate_atendimento {
    type: string
    label: "Tempo de Espera"
    description: "Indica o tempo de espera da ligação até o atendimento em segundos."

    sql: ${TABLE}."TEMPO_ESPERA_ATE_ATENDIMENTO" ;;
  }

  dimension: tempo_falado {
    type: string
    label: "Tempo Falado"
    description: "Indica o tempo falado da ligação em segundos."
    sql: ${TABLE}."TEMPO_FALADO" ;;
  }

  dimension: tempo_ura {
    type: string
    label: "Tempo na URA"
    description: "Indica o tempo da ligação na URA em segundos"
    sql: ${TABLE}."TEMPO_URA" ;;
  }

  dimension: caminho_ura {
    type: string
    label: "Caminho da URA"
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
      data_ligacao_date,
      data_ligacao_time,
      duracao_chamada,
      fila_atendimento,
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
