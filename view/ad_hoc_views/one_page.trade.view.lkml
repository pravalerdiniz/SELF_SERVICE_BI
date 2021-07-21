view: one_page_trade {
  sql_table_name: "GRADUADO"."ONE_PAGE"."TRADE"
    ;;

  dimension: dia {
    type: date
    label: "Dia"
    sql: ${TABLE}."DIA" ;;
  }

  dimension: indicador {
    type: string
    label: "Indicador"
    sql: ${TABLE}."INDICADOR" ;;
  }

  dimension: valor {
    type: number
    label: "Valor"
    sql: ${TABLE}."VALOR" ;;
  }

  }
