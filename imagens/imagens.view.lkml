view: imagens {
  sql_table_name: "SELF_SERVICE_BI"."IMAGENS"
    ;;

  dimension: endereco {
    type: string
    sql: ${TABLE}."ENDERECO" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
