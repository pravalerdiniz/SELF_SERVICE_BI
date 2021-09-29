###  Period over Period Method 1: Use Looker's native date dimension groups

view: jornada_pop {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."JORNADA" ;;


  dimension_group: created {
    type: time
    view_label: "_PoP"
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
    convert_tz: no
  }

  measure: count_cpf {
    label: "Count of CPFs"
    type: count_distinct
    sql: ${count_cpf} ;;
    hidden: yes
  }

  }
