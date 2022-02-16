
view: dim_field_group_mongo {

  sql_table_name: "DIMENSAO"."DIM_FIELD_GROUP_MONGO"
    ;;

  dimension: mongo_fieldgroup {
    type: string
    sql: ${TABLE}."MONGO_FIELDGROUP" ;;
  }

  dimension: pageview {
    type: string
    sql: ${TABLE}."PAGEVIEW" ;;
  }

  dimension: subetapa {
    type: string
    sql: ${TABLE}."SUBETAPA" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
