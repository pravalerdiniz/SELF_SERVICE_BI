# The name of this view in Looker is "Dim Date"
view: dim_date {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "VETERANO"."DIMENSAO"."DIM_DATE"
    ;;


  dimension: ano {
    type: number
    sql: ${TABLE}."ANO" ;;
    hidden:  yes
  }

  dimension: dia {
    type: number
    sql: ${TABLE}."DIA" ;;
    hidden:  yes
  }

  dimension: dia_ano {
    type: number
    sql: ${TABLE}."DIA_ANO" ;;
    hidden:  yes
  }

  dimension: dia_semana {
    type: string
    sql: ${TABLE}."DIA_SEMANA" ;;
    hidden:  yes
  }

  dimension: dia_util_mes {
    type: number
    sql: ${TABLE}."DIA_UTIL_MES" ;;
    hidden:  yes
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: ds {
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
    sql: ${TABLE}."DS_DATE" ;;
    hidden:  no
    label: "Data Calendário"
  }

  dimension: ds_dia_semana {
    type: string
    sql: ${TABLE}."DS_DIA_SEMANA" ;;
    hidden:  no
    label: "Dia da Semana"
  }

  dimension: ds_mes {
    type: string
    sql: ${TABLE}."DS_MES" ;;
    hidden:  yes
  }

  dimension: feriado {
    type: string
    sql: ${TABLE}."FERIADO" ;;
    hidden:  no
    label: "Feriado"
  }

  dimension: flg_primeiro_dia {
    type: yesno
    sql: ${TABLE}."FLG_PRIMEIRO_DIA" ;;
    hidden:  yes
  }

  dimension: flg_ultimo_dia {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_DIA" ;;
    hidden:  yes
  }

  dimension: id_date {
    type: number
    sql: ${TABLE}."ID_DATE" ;;
    hidden:  yes
  }

  dimension: mes {
    type: number
    sql: ${TABLE}."MES" ;;
    hidden:  yes
  }

  dimension: quarter {
    type: number
    sql: ${TABLE}."QUARTER" ;;
    hidden:  yes
  }

  dimension: semana_ano {
    type: number
    sql: ${TABLE}."SEMANA_ANO" ;;
    hidden:  yes
  }

  measure: count_days {
    type:  count_distinct
    sql: ${dia} ;;
    label: "Contagem de Dias"
  }

  dimension_group: dia_anterior  {
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
    hidden:  yes
    sql: GETDATE() - interval '1 day' ;;
  }

  dimension: ytd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "Year to Date - Calendário"
    type: yesno
    sql:  (EXTRACT(DOY FROM ${ds_raw}) < EXTRACT(DOY FROM ${dia_anterior_raw})
                OR
            (EXTRACT(DOY FROM ${ds_raw}) = EXTRACT(DOY FROM ${dia_anterior_raw})))  ;;
  }


  measure: count {
    type: count
    drill_fields: []
    hidden:  yes
  }
}
