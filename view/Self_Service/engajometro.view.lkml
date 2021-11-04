view: engajometro {
  derived_table: {
    sql: SELECT * FROM "GRADUADO"."AD_HOC".ENGAJOMETRO
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: gerente {
    type: string
    label: "GERENTE"
    sql: ${TABLE}."GERENTE" ;;
    description: "Nome do gerente da carteira"
  }

  dimension: grupo {
    type: string
    label: "GRUPO"
    sql: ${TABLE}."GRUPO" ;;
    description: "Grupo da IES"
  }

  dimension: nota_final {
    type: number
    label: "NOTA FINAL"
    sql: ${TABLE}."NOTA_FINAL" ;;
    description: "Nota do Engajometro"
  }

  dimension: status_engajamento {
    type: string
    label: "STATUS ENGAJAMENTO"
    sql: ${TABLE}."STATUS_ENGAJAMENTO" ;;
    description: "Status do Engajamento"
  }

  dimension: data {
    type: date
    label: "DATA REF"
    sql: ${TABLE}."DATA" ;;
    description: "Data de referencia do processamento da tabela"
    hidden: yes
  }

  dimension: data_grupo_ies {
    type: string
    primary_key: yes
    hidden: yes
    sql:concat(${data},${grupo}) ;;
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
    sql: ${TABLE}."DATA" ;;
    label: "Data Referencia"
    description: "Data de referencia do processamento da tabela"
  }

  set: detail {
    fields: [gerente, grupo, nota_final, status_engajamento, data]
  }
}
