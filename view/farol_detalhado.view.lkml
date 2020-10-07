view: farol_detalhado {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."FAROL_DETALHADO"
    ;;

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
    value_format: "0"
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
    label: "Data de entrada no Status"
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

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }


  dimension: nome_instituicao {
    type: string
    sql: ${TABLE}."NOME_INSTITUICAO" ;;
  }

  dimension: grupo_instituicao {
    type: string
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
  }

  dimension: id_produto {
    type: string
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: nome_produto {
    type: string
    sql: ${TABLE}."NOME_PRODUTO" ;;
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
              when  ${status} ilike '2039.%' then '2039.'

              else ${status} end;;

  }
}
