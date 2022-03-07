view: kpi_controladoria {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.BASE_KPIS
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  dimension: dt {
    type: date
    sql: ${TABLE}."DATA" ;;
    hidden: yes
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

  dimension: pilar {
    type: string
    sql: ${TABLE}."PILAR" ;;
  }

  dimension: kpi {
    type: string
    sql: ${TABLE}."KPI" ;;
  }

  dimension: montante {
    type: number
    sql: ${TABLE}."MONTANTE" ;;
  }

  measure: valores {
    type: sum
    sql: ${montante}  ;;
  }

  set: detail {
    fields: [tipo, dt, data_date, pilar, kpi, montante]
  }
}
