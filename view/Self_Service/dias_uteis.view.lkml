view: dias_uteis {
  derived_table: {
    sql: SELECT * FROM veterano.dimensao.dim_date
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_date {
    type: number
    label: "ID DATE"
    primary_key: yes
    hidden: yes
    sql: ${TABLE}."ID_DATE" ;;
  }

  dimension: ds_date {
    type: date
    label: "DS DATE"
    sql: ${TABLE}."DS_DATE" ;;
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
    sql: ${TABLE}."DS_DATE" ;;
    label: "Data"
  }

  dimension: ano {
    type: number
    label: "ANO"
    sql: ${TABLE}."ANO" ;;
  }

  dimension: quarter {
    type: number
    label: "QUARTER"
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: mes {
    type: number
    label: "MES"
    sql: ${TABLE}."MES" ;;
  }

  dimension: ds_mes {
    type: string
    label: "DS MES"
    sql: ${TABLE}."DS_MES" ;;
  }

  dimension: dia {
    type: number
    label: "DIA"
    sql: ${TABLE}."DIA" ;;
  }

  dimension: ds_dia_semana {
    type: string
    label: "DS DIA SEMANA"
    sql: ${TABLE}."DS_DIA_SEMANA" ;;
  }

  dimension: semana_ano {
    type: number
    label: "SEMANA ANO"
    sql: ${TABLE}."SEMANA_ANO" ;;
  }

  dimension: dia_ano {
    type: number
    label: "DIA ANO"
    sql: ${TABLE}."DIA_ANO" ;;
  }

  dimension: feriado {
    type: string
    label: "FERIADO"
    sql: ${TABLE}."FERIADO" ;;
  }

  dimension: dia_util_mes {
    type: number
    label: "DIA UTIL MES"
    sql: ${TABLE}."DIA_UTIL_MES" ;;
  }

  dimension: flg_ultimo_dia {
    type: string
    label: "FLG ULTIMO DIA"
    sql: ${TABLE}."FLG_ULTIMO_DIA" ;;
  }

  dimension: flg_primeiro_dia {
    type: yesno
    label: "FLG PRIMEIRO DIA"
    sql: ${TABLE}."FLG_PRIMEIRO_DIA" ;;
  }

  dimension: dia_semana {
    type: string
    label: "DIA SEMANA"
    sql: ${TABLE}."DIA_SEMANA" ;;
  }

  set: detail {
    fields: [
      id_date,
      ds_date,
      ano,
      quarter,
      mes,
      ds_mes,
      dia,
      ds_dia_semana,
      semana_ano,
      dia_ano,
      feriado,
      flg_ultimo_dia,
      flg_primeiro_dia,
      dia_semana
    ]
  }
}
