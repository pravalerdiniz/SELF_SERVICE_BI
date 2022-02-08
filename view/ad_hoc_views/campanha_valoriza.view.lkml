# The name of this view in Looker is "Campanha Valoriza"
view: campanha_valoriza {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."CAMPANHA_VALORIZA"
    ;;


  dimension: login {
    type: string
    sql: ${TABLE}."Login" ;;
  }


  measure: pontos {
    type: number
    sql: ${TABLE}."Pontos" ;;
  }

}
