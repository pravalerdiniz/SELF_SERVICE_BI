view: tetris_integration {
  sql_table_name: "POS_GRADUADO"."ANALISES_SISTEMICAS"."TETRIS_INTEGRATION"
    ;;

  dimension: cpf {
    type: string
    sql: ${TABLE}."CPF" ;;
    hidden:  yes

  }

  dimension: current_status {
    type: string
    sql: ${TABLE}."CURRENT_STATUS" ;;
    label: "Current Status"
  }


  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EVENT_DATE" ;;
    label: "Data do Evento"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    hidden:  yes
  }

  measure: count_id_cpf {
    type: count_distinct
    sql: ${id_cpf} ;;
    label: "Quantidade de Alunos"
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
    label: "ID da Proposta"
  }

  measure: count_id_proposta {
    type: count_distinct
    sql: ${id_proposta} ;;
    label: "Quantidade de Propostas"
  }

  dimension: info {
    type: string
    sql: ${TABLE}."INFO" ;;
    label: "Info"
  }

  dimension_group: proposal_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      month_name,
      day_of_month
    ]
    sql: ${TABLE}."PROPOSAL_CREATED_AT" ;;
    label: "Data de Criação da Proposta"
  }

  dimension_group: proposal_finished {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PROPOSAL_FINISHED_AT" ;;
    label: "Data de Finalização da Proposta"
  }

  dimension_group: proposal_updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PROPOSAL_UPDATED_AT" ;;
    label: "Data de Atualização da Proposta"
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}."STUDENT_ID" ;;
    label: "Student ID"
  }
}
