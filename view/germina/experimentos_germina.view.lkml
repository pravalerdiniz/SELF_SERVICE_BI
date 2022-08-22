view: experimentos_germina {
  sql_table_name: "POS_GRADUADO"."MARKETING"."EXPERIMENTOS_GERMINA"
    ;;

  dimension: experiment_id {
    label: "ID do Experimento"
    type: number
    sql:  ${TABLE}."EXPERIMENT_ID"  ;;
  }

  dimension: treatment_id {
    label: "ID do Tratamento"
    description: "Indica o ID da ação sugerida no experimento"
    type: number
    sql:  ${TABLE}."TREATMENT_ID"  ;;
  }

  dimension: group_id {
    label: "ID do Grupo Experimento"
    type: number
    sql:  ${TABLE}."GROUP_ID"  ;;
  }

  dimension: experiment_description {
    label: "Descrição do Experimento"
    type: string
    sql:  ${TABLE}."EXPERIMENT_DESCRIPTION"  ;;
  }

  dimension: treatment_description {
    label: "Descrição do Tratamento"
    description: "Indica o detalhamento da ação sugerida no experimento"
    type: string
    sql:  ${TABLE}."TREATMENT_DESCRIPTION"  ;;
  }

  dimension: treatment {
    label: "Flag Grupo Tratamento"
    description: "Indica se o campo treatment faz parte de um grupo tratamento (yes) ou grupo controle (no)"
    type: yesno
    sql:  ${TABLE}."TREATMENT"  ;;
  }

  dimension_group: date_started {
    label: "Data de Início do Experimento"
    type: time
    timeframes: [
      date,
      day_of_week,
      week,
      month,
      year
    ]
    sql: ${TABLE}."DATE_STARTED" ;;
  }

  dimension_group: date_ended {
    label: "Data de Fim do Experimento"
    type: time
    timeframes: [
      date,
      day_of_week,
      week,
      month,
      year
    ]
    sql: ${TABLE}."DATE_ENDED" ;;
  }

}
