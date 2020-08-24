view: farol_detalhado {
  sql_table_name: "SELF_SERVICE_BI"."FAROL_DETALHADO"
    ;;

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
    required_access_grants: [grupo_cpf]
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
      year
    ]
    sql: ${TABLE}."DATA" ;;
  }

  dimension_group: data_carga {
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
    sql: CAST(${TABLE}."DATA_CARGA" AS TIMESTAMP_NTZ) ;;
  }

  dimension: proposta {
    type: number
    sql: ${TABLE}."PROPOSTA" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
