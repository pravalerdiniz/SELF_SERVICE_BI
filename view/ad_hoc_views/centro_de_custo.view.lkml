view: centro_de_custo {
  sql_table_name: "BACKOFFICE"."CENTRO_DE_CUSTO"
    ;;

  dimension: centro_de_custo {
    type: number
    sql: ${TABLE}."CENTRO_DE_CUSTO" ;;
  }

  dimension: desc_centro_custo {
    type: string
    sql: ${TABLE}."DESC_CENTRO_CUSTO" ;;
  }

  dimension: diretoria {
    type: string
    sql: ${TABLE}."DIRETORIA" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
