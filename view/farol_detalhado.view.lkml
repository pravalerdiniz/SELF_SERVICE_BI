view: farol_detalhado {
  derived_table: {
    sql: select "proposta", "cpf", concat("data",' ', "hora")::datetime data, concat("sl_status_destino",'.', "sl_status_destino_detalhe") status from BICHO.BO.PRV_STATUS_LOG
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: proposta {
    type: number
    sql: ${TABLE}."proposta" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."cpf" ;;
    required_access_grants: [grupo_cpf]
  }

  dimension_group: data {
    type: time
    sql: ${TABLE}."DATA" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  set: detail {
    fields: [proposta, cpf, data_time, status]
  }
}
