view: parametro_data {

  parameter: periodo {
    type: unquoted
    default_value: "month"
    allowed_value: {
      value: "year"
      label: "Anos"
    }
    allowed_value: {
      value: "month"
      label: "Meses"
    }
    allowed_value: {
      value: "week"
      label: "Semanas"
    }
    allowed_value: {
      value: "day"
      label: "Dias"
    }
  }

  parameter: data_referencia {
    type: date
    convert_tz: no
  }

  dimension_group: data_atual {
    hidden: yes
    type: time
    timeframes: [raw,date,hour_of_day,day_of_week_index,day_of_month,day_of_year]
    convert_tz: yes
    sql: current_timestamp ;;
  }

 }
