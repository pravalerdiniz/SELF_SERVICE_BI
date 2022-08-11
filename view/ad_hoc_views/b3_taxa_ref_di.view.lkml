view: b3_taxa_ref_di {
  sql_table_name: "AD_HOC"."B3_TAXA_REF_DI";;

  dimension: calendar_days {
    type: number
    label: "Dias Corridos"
    description: "Dias Corridos a partir da Data Referência para a Taxa"
    sql: ${TABLE}."CALENDAR_DAYS" ;;
  }

  dimension: di_x_pre_252 {
    type: number
    label: "Dim DI x Pré (252)"
    sql: ${TABLE}."DI_X_PRE_252" ;;
  }

  measure: sum_di_x_pre_252 {
    type: sum
    sql: ${di_x_pre_252} ;;
    label: "DI x Pré (252)"
  }

  dimension: di_x_pres_360 {
    type: number
    label: "Dim DI x Pré (360)"
    sql: ${TABLE}."DI_X_PRES_360" ;;
  }

  measure: sum_di_x_pre_360 {
    type: sum
    sql: ${di_x_pres_360} ;;
    label: "DI x Pré (360)"
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
    label: "Inserção"
    description: "Data de inserção do registro no snowflake"
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
    label: "Atualização B3"
    description: "Data de atualização na B3"
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
