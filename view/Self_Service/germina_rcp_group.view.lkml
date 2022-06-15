view: germina_rcp_group {
  derived_table: {
    persist_for: "12 hour"
    sql: select g.experiment_id, g.treatment_id, g.group_id,
                e.DATE_STARTED, e.DATE_ENDED , E.EXPERIMENT_DESCRIPTION,
                t.TREATMENT,  T.TREATMENT_DESCRIPTION
          from "BICHO"."GERMINA"."RCT_EXPERIMENT_GROUPS" as G
            left join "BICHO"."GERMINA"."RCT_EXPERIMENTS" as E on G.EXPERIMENT_ID=E.EXPERIMENT_ID
            left join "BICHO"."GERMINA"."RCT_EXPERIMENT_TREATMENTS" as T on g.EXPERIMENT_ID= t.EXPERIMENT_ID
            and g.TREATMENT_ID=t.TREATMENT_ID
 ;;
  }

  dimension: EXPERIMENT_ID {
    type: number
    sql: ${TABLE}."EXPERIMENT_ID" ;;
    value_format: "0"
    label: "ID Experiment"
    #description: "Indica o ID do CPF correspondente ao CPF do aluno"
  }

  dimension: TREATMENT_ID {
    type: number
    sql: ${TABLE}."TREATMENT_ID" ;;
    value_format: "0"
    label: "ID Treatment"
    #description: "Indica o ID do CPF correspondente ao CPF do aluno"
  }

  dimension: GROUP_ID {
    type: number
    sql: ${TABLE}."GROUP_ID" ;;
    value_format: "0"
    label: "ID Group"
    #description: "Indica o grupo controle do aluno"
  }


  dimension_group: DATE_STARTED {
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
    sql: ${TABLE}."DATE_STARTED" ;;
    label: "Data início Experiment"
    #description: "Este campo mostra a data da primeira interação do CPF no ciclo"
  }

  dimension_group: DATE_ENDED {
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
    sql: ${TABLE}."DATE_ENDED" ;;
    label: "Data fim Experiment"
    #description: "Este campo mostra a data da última interação do CPF no ciclo"
  }

  dimension: EXPERIMENT_DESCRIPTION{
    type: string
    sql: ${TABLE}."EXPERIMENT_DESCRIPTION" ;;
    label: "Descrição Experiment"
    #description: "Persona atribuída, via modelo, ao aluno"
  }

  dimension: TREATMENT{
    type: yesno
    sql: ${TABLE}."TREATMENT" ;;
    label: "Recebe Tratamento"
    #description: "Persona atribuída, via modelo, ao aluno"
  }

  dimension: TREATMENT_DESCRIPTION{
    type: string
    sql: ${TABLE}."TREATMENT_DESCRIPTION" ;;
    label: "Descrição Treatment"
    #description: "Persona atribuída, via modelo, ao aluno"
  }

 }
