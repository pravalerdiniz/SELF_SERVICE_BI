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
    label: "Data de entrada no Status"
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

  dimension: grupo {
    type:  string
    sql: case when ${status} ilike '46.%' then '46.'
              when  ${status} ilike '8.%' then '8.'
              when  ${status} ilike '9.%' then '9.'
              when  ${status} ilike '%9090.%' then '-9090.'
              when  ${status} ilike '15.%' then '15.'
              when  ${status} ilike '41.%' then '41.'
              when  ${status} ilike '13.%' then '13.'
              else ${status} end;;

  }
}
