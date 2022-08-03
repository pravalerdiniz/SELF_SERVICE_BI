view: sazonalidade_mensal_meta {
  sql_table_name: "BICHO"."SHAREPOINT"."TABELA_SAZONALIDADE";;

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: date {
    type: string
    sql: ${TABLE}."DATE" ;;
    primary_key: yes
  }

  dimension_group: date_time {
    type: time
    timeframes: [
      raw,
      date,
      day_of_week,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year,
      day_of_month,
    ]
    convert_tz: no
    datatype: date
    label: "Data Meta"
    description: "Indica a data da meta."
    sql: ${TABLE}."DATE" ;;
  }

  measure: sazonalidade_iniciados {
    type: sum
    label: "Sazonalidade Iniciados"
    description: "Distribuição dos Iniciados por dia do mês (Soma 100% no mês)"
    sql: ${TABLE}."SAZONALIDADE_INICIADOS" ;;
  }

  measure: sazonalidade_finalizados {
    type: sum
    label: "Sazonalidade Finalizados"
    description: "Distribuição dos Finalizados por dia do mês (Soma 100% no mês)"
    sql: ${TABLE}."SAZONALIDADE_FINALIZADOS" ;;
  }

  measure: sazonalidade_formalizados {
    type: sum
    label: "Sazonalidade Formalizados"
    description: "Distribuição dos Formalizados por dia do mês (Soma 100% no mês)"
    sql: ${TABLE}."SAZONALIDADE_FORMALIZADOS" ;;
  }

  set: detail {
    fields: [date, sazonalidade_iniciados, sazonalidade_finalizados, sazonalidade_formalizados]
  }
}
