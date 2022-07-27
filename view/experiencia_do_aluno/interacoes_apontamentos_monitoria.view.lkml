view: interacoes_apontamentos_monitoria {
  derived_table: {
    persist_for: "1 hour"
    sql: SELECT
      A.ID_TICKET,
      t.value:DATA_ATUALIZACAO::timestamp DATA_ATUALIZACAO,
      T.VALUE:NOME_PROCEDIMENTO::VARCHAR NOME_PROCEDIMENTO,
      T.VALUE:PROCEDIMENTO::VARCHAR PROCEDIMENTO,
      T.VALUE:NOTA::INT NOTA,
      T.VALUE:NOME_AGENTE::VARCHAR NOME_AGENTE,
      T.VALUE:NOME_AVALIADOR::VARCHAR NOME_AVALIADOR,
      T.VALUE:FLG_AVALIACAO::VARCHAR FLG_AVALIACAO
      FROM GRADUADO.SELF_SERVICE_BI.INTERACOES A,
      LATERAL FLATTEN (INpUT => APONTAMENTOS) T
       ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: id_ticket {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}."ID_TICKET" ;;
  }

  dimension_group: data_atualizacao {
    type: time
    label: "Atualização"
    description: "Indica a data de atualização do apontamento da monitoria"
    hidden: yes
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension: nome_procedimento {
    type: string
    label: "Checklist"
    group_label: "Dados de Monitoria"
    description: "Indica checklist da monitoria por ticket"
    hidden: yes
    sql: ${TABLE}."NOME_PROCEDIMENTO" ;;
  }

  dimension: procedimento {
    type: string
    label: "Checklist Detalhado"
    group_label: "Dados de Monitoria"
    description: "Indica o detalhamento do checklist da monitoria"
    hidden: yes
    sql: ${TABLE}."PROCEDIMENTO" ;;
  }

  dimension: nota {
    type: number
    label: "Nota por Checklist"
    group_label: "Dados de Monitoria"
    description: "Indica a nota da monitoria"
    hidden: yes
    sql: ${TABLE}."NOTA" ;;
  }

  dimension: nome_agente {
    type: string
    label: "Atendente"
    description: "Indica a nome do atendente"
    hidden: yes
    sql: ${TABLE}."NOME_AGENTE" ;;
  }

  dimension: nome_avaliador {
    type: string
    label: "Avaliador"
    description: "Indica a nome do avaliador da monitoria"
    hidden: yes
    sql: ${TABLE}."NOME_AVALIADOR" ;;
  }

  dimension: conformidade_checklist {
    type: string
    label: "Conformidade por apontamento"
    description: "Indica a conformidade ou não conformidade por apontamento de monitoria"
    hidden: yes
    sql: ${TABLE}."FLG_AVALIACAO" ;;
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
