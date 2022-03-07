view: kpi_financeiro {
  derived_table: {
    sql: select * from graduado.ad_hoc.kpi_financeiro
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dt {
    type: date
    sql: ${TABLE}."DATA" ;;
  }

  dimension_group: data {
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
    sql: ${TABLE}."DATA" ;;
    label: "Data"
  }

  dimension: taxa {
    type: number
    sql: ${TABLE}."TAXA" ;;
  }

  measure: custo_captacao {
    type: sum
    sql: ${taxa}  ;;
  }

  dimension: capital_giro {
    type: number
    sql: ${TABLE}."CAPITAL_GIRO" ;;
  }

  measure: vol_capital_giro{
    type: sum
    sql: ${capital_giro} ;;
  }

  set: detail {
    fields: [dt, data_date, taxa, capital_giro]
  }
}
