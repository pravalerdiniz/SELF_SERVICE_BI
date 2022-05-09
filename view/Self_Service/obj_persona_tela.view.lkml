view: obj_persona_tela {
  derived_table: {
    persist_for: "1 hour"
    sql: select
            id_cpf,
            f.value:CONTROL_GROUP::int as CONTROL_GROUP,
            f.value:FIRST_ACTION_TIMESTAMP::timestamp as FIRST_ACTION_TIMESTAMP,
            f.value:LAST_ACTION_TIMESTAMP::timestamp as LAST_ACTION_TIMESTAMP,
            f.value:PERSONA::varchar as PERSONA,
            f.value:PERSON_ID::int as PERSON_ID,
            f.value:PROPENSITY::float as PROPENSITY
            from GRADUADO.CRM.CHAMADOS_TELA_ATENDIMENTO a,
            lateral flatten (input => persona) f
 ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    value_format: "0"
    label: "ID CPF do Aluno"
    description: "Indica o ID do CPF correspondente ao CPF do aluno"
  }

  dimension: person_id {
    type: number
    sql: ${TABLE}."PERSON_ID" ;;
    value_format: "0"
    label: "Person ID do Aluno (ID_CPF)"
    description: "Indica o ID do CPF correspondente ao CPF do aluno"
  }

  dimension: control_group {
    type: number
    sql: ${TABLE}."CONTROL_GROUP" ;;
    value_format: "0"
    label: "Grupo controle"
    description: "Indica o grupo controle do aluno"
  }

  dimension: propensity {
    type: number
    sql: ${TABLE}."PROPENSITY" ;;
    value_format: "0"
    label: "Propensão"
    description: "Indica a propensão do aluno converter no funil (Formalizar)"
  }

  dimension_group: first_action {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month
    ]
    sql: ${TABLE}."FIRST_ACTION_TIMESTAMP" ;;
    label: "Data primeira Interação"
    description: "Este campo mostra a data da primeira interação do CPF no ciclo"
  }

  dimension_group: last_action {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month
    ]
    sql: ${TABLE}."LAST_ACTION_TIMESTAMP" ;;
    label: "Data última Interação"
    description: "Este campo mostra a data da última interação do CPF no ciclo"
  }

  dimension: persona{
    type: string
    sql: ${TABLE}."PERSONA" ;;
    label: "Persona"
    description: "Persona atribuída, via modelo, ao aluno"
  }

  dimension: faixa_propensao {
    type: string
    case: {
      when: {
        sql: ${propensity} <= 0.1 ;;
        label: "1. < 10%"
      }
      when: {
        sql: ${propensity} <= 0.3 ;;
        label: "2. 10% - 30%"
      }
      when: {
        sql: ${propensity} <= 0.5 ;;
        label: "3. 30% - 50%"
      }
      when: {
        sql: ${propensity} <= 0.7 ;;
        label: "4. 50% - 70%"
      }
      when: {
        sql: ${propensity} > 0.7 ;;
        label: "5. > 70%"
      }
      else: "6. Sem Propensão"
    }
    label: "Faixa Propensão"
    description: "Este campo mostra a propensão quebrada por faixas"
  }

 }
