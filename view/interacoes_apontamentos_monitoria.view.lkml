view: interacoes_apontamentos {
  derived_table: {
    sql: SELECT
      A.ID_TICKET,
      t.value:DATA_ATUALIZACAO::timestamp DATA_ATUALIZACAO,
      T.VALUE:NOME_PROCEDIMENTO::VARCHAR NOME_PROCEDIMENTO,
      T.VALUE:PROCEDIMENTO::VARCHAR PROCEDIMENTO,
      T.VALUE:NOTA::INT NOTA,
      T.VALUE:NOME_AGENTE::VARCHAR NOME_AGENTE,
      T.VALUE:NOME_AVALIADOR::VARCHAR NOME_AVALIADOR
      FROM GRADUADO.SELF_SERVICE_BI.INTERACOES A,
      LATERAL FLATTEN (INpUT => APONTAMENTOS) T
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

  dimension_group: data_atualizacao {
    type: time
    label: "Data de Atualização"
    description: "Indica a data de atualização do apontamento da monitoria"
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension: nome_procedimento {
    type: string
    label: "Checklist Monitoria"
    description: "Indica checklist da monitoria por ticket"
    sql: ${TABLE}."NOME_PROCEDIMENTO" ;;
  }

  dimension: procedimento {
    type: string
    label: "Checklist - Detalhamento"
    description: "Indica o detalhamento do checklist da monitoria"
    sql: ${TABLE}."PROCEDIMENTO" ;;
  }

  dimension: nota {
    type: number
    label: "Nota"
    description: "Indica a nota da monitoria"
    sql: ${TABLE}."NOTA" ;;
  }

  dimension: nome_agente {
    type: string
    label: "Atendente"
    description: "Indica a nome do atendente"
    sql: ${TABLE}."NOME_AGENTE" ;;
  }

  dimension: nome_avaliador {
    type: string
    label: "Avaliador"
    description: "Indica a nome do avaliador da monitoria"
    sql: ${TABLE}."NOME_AVALIADOR" ;;
  }

  set: detail {
    fields: [
      id_ticket,
      data_atualizacao_time,
      nome_procedimento,
      procedimento,
      nota,
      nome_agente,
      nome_avaliador
    ]
  }
}
