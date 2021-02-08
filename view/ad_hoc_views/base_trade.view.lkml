view: base_trade {
  sql_table_name: "AD_HOC"."BASE_TRADE"
    ;;

  dimension: cedidos {
    type: string
    sql: ${TABLE}."CEDIDOS" ;;
  }

  dimension: gerente {
    type: string
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: grupo {
    type: string
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: indicador {
    type: string
    sql: ${TABLE}."INDICADOR" ;;
  }

  measure: indicados {
    type: sum
    sql: ${TABLE}."INDICADOS" ;;
  }

  dimension: instituicao {
    type: string
    sql: ${TABLE}."INSTITUICAO" ;;
  }

  dimension: observacoes {
    type: string
    sql: ${TABLE}."OBSERVACOES" ;;
  }

  measure: performance {
    type: sum
    sql: ${TABLE}."PERFORMANCE" ;;
  }

  measure: qq_tt_atendentes {
    type: sum
    sql: ${TABLE}."QQ_TT_ATENDENTES" ;;
  }

  measure: qt_atendentes {
    type: sum
    sql: ${TABLE}."QT_ATENDENTES" ;;
  }

  measure: qt_atendentes_zerados {
    type: sum
    sql: ${TABLE}."QT_ATENDENTES_ZERADOS" ;;
  }

  dimension: regional {
    type: string
    sql: ${TABLE}."REGIONAL" ;;
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
