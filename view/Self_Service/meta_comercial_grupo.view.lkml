view: meta_comercial_grupo {
  sql_table_name:  GRADUADO.AD_HOC.VW_TABELA_GRUPOS
      ;;

  dimension: grupo_data {
    type: string
    primary_key: yes
    hidden: yes
    sql:concat(${grupo},${mes_ano}) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: gerente {
    type: string
    label: "Gerente Comercial"
    description: "Indica o nome do Gerente Comercial"
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: grupo {
    type: string
    label: "Grupo Instituição"
    description: "Indica o nome do Grupo da Instituição"
    sql: ${TABLE}."GRUPO" ;;
  }

  measure: meta_iniciados {
    type: sum
    label: "Meta de Iniciados"
    description: "Soma da Meta da quantidade de Iniciados"
    sql: ${TABLE}."META_INICIADOS" ;;
  }

  measure: meta_finalizados {
    type: sum
    label: "Meta de Finalizados"
    description: "Soma da Meta da quantidade de Finalizados"
    sql: ${TABLE}."META_FINALIZADOS" ;;
  }

  measure: meta_formalizados {
    type: sum
    label: "Meta de Formalizados"
    description: "Soma da Meta da quantidade de Formalizados"
    sql: ${TABLE}."META_FORMALIZADOS" ;;
  }

  dimension: mes {
    type: string
    sql: ${TABLE}."MES" ;;
  }

  dimension: ano {
    type: string
    sql: ${TABLE}."ANO" ;;
  }

  dimension: mes_ano {
    type: string
    sql: ${TABLE}."MES_ANO" ;;
    hidden: yes
  }


  dimension_group: mes_ano {
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
    label: "Ano Mês Meta"
    description: "Indica a data da meta."
    sql: ${TABLE}."MES_ANO" ;;
  }

  set: detail {
    fields: [
      gerente,
      grupo,
      meta_iniciados,
      meta_finalizados,
      meta_formalizados,
      mes,
      ano,
      mes_ano
    ]
  }
}
