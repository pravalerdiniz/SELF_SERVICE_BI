view: documentacao {
  sql_table_name: DOC_ETL."DOCUMENTACAO"."DOCUMENTACAO"
    ;;

  dimension: bicho {
    type: string
    sql: ${TABLE}."BICHO" ;;
  }

  dimension: coluna_graduado {
    type: string
    sql: ${TABLE}."COLUNA_GRADUADO" ;;
  }

  dimension: coluna_veterano {
    type: string
    sql: ${TABLE}."COLUNA_VETERANO" ;;
  }

  dimension: descricao_graduado {
    type: string
    sql: ${TABLE}."DESCRICAO_GRADUADO" ;;
  }

  dimension: descricao_veterano {
    type: string
    sql: ${TABLE}."DESCRICAO_VETERANO" ;;
  }

  dimension: gradn {
    type: number
    sql: ${TABLE}."GRADN" ;;
  }

  dimension: graduado {
    type: string
    sql: ${TABLE}."GRADUADO" ;;
    drill_fields: [coluna_graduado]
  }

  dimension: script_graduado {
    type: string
    sql: ${TABLE}."SCRIPT_GRADUADO" ;;
  }

  dimension: script_veterano {
    type: string
    sql: ${TABLE}."SCRIPT_VETERANO" ;;
  }

  measure: total_tabelas {
    type: count_distinct
    sql: ${TABLE}."TOTAL_TABELAS" ;;
  }

  dimension: veterano {
    type: string
    sql: ${TABLE}."VETERANO" ;;
    drill_fields: [coluna_veterano,
      descricao_veterano,
      script_veterano]

  }

  dimension: vetn {
    type: number
    sql: ${TABLE}."VETN" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
