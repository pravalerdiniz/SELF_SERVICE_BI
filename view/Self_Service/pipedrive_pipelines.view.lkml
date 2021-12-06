view: pipedrive_pipelines {
  derived_table: {
    sql: SELECT * FROM "BICHO"."PIPEDRIVE"."PIPELINES"
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    label: "ID"
    primary_key: yes
    sql: ${TABLE}."ID" ;;
  }

  dimension: name {
    type: string
    label: "Nome Pipeline"
    sql: ${TABLE}."NAME" ;;
  }

  dimension: url_title {
    type: string
    label: "Titulo da URL"
    sql: ${TABLE}."URL_TITLE" ;;
  }

  dimension: order_nr {
    type: number
    label: "Numero Order"
    sql: ${TABLE}."ORDER_NR" ;;
  }

  dimension: active {
    type: string
    label: "Ativo?"
    sql: ${TABLE}."ACTIVE" ;;
  }

  dimension: deal_probability {
    type: string
    label: "Probabilidade de Negócio (True/False)"
    sql: ${TABLE}."DEAL_PROBABILITY" ;;
  }

  dimension_group: add_time {
    type: time
    label: "Data inclusão"
    hidden: yes
    sql: ${TABLE}."ADD_TIME" ;;
  }

  dimension_group: data_inclusao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."ADD_TIME" ;;
    label: "Data inclusão"
  }

  dimension_group: update_time {
    type: time
    label: "Data update"
    hidden: yes
    sql: ${TABLE}."UPDATE_TIME" ;;
  }

  dimension_group: data_update {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."UPDATE_TIME" ;;
    label: "Data update"
  }

  dimension: selected {
    type: string
    label: "Selecionado (True/False)"
    sql: ${TABLE}."SELECTED" ;;
  }

  set: detail {
    fields: [
      id,
      name,
      url_title,
      order_nr,
      active,
      deal_probability,
      add_time_time,
      update_time_time,
      selected
    ]
  }
}
