
view: funil_nova_proposta {

  sql_table_name: "GRADUADO"."AD_HOC"."FUNIL_NOVA_PROPOSTA"
    ;;


  dimension: como_soube {
    type: string
    sql: ${TABLE}."COMO_SOUBE" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_status {
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DT_STATUS" ;;
  }

  dimension_group: data_safrado {
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_SAFRADO" ;;
  }

  dimension: etapa {
    type: string
    sql: ${TABLE}."ETAPA" ;;
  }

  dimension: qtd {
    type: number
    sql: ${TABLE}."QTD" ;;
  }


  measure: total_qtd {
    type: sum
    sql: ${qtd} ;;
  }

}
