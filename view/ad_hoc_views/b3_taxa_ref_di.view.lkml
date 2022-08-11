view: b3_taxa_ref_di {
  sql_table_name: "AD_HOC"."B3_TAXA_REF_DI;;

  dimension: calendar_days {
    type: number
    sql: ${TABLE}."CALENDAR_DAYS" ;;
  }

  measure: total_calendar_days {
    type: sum
    sql: ${calendar_days} ;;
  }

  measure: average_calendar_days {
    type: average
    sql: ${calendar_days} ;;
  }

  dimension: di_x_pre_252 {
    type: number
    sql: ${TABLE}."DI_X_PRE_252" ;;
  }

  dimension: di_x_pres_360 {
    type: number
    sql: ${TABLE}."DI_X_PRES_360" ;;
  }

  dimension_group: inserted {
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
    sql: ${TABLE}."INSERTED_AT" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."UPDATED_AT" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
