
view: dim_field_group_mongo {

  sql_table_name: "DIMENSAO"."DIM_FIELD_GROUP_MONGO"
    ;;

  dimension: mongo_fieldgroup {
    type: string
    sql: ${TABLE}."MONGO_FIELDGROUP" ;;
    group_label: "Dados Mongo"
    hidden: yes
  }

  dimension: pageview {
    type: string
    sql: ${TABLE}."PAGEVIEW" ;;
    group_label: "Dados Mongo"
    label: "PageView - Google Analytics"
  }

  dimension: subetapa {
    type: string
    sql: ${TABLE}."SUBETAPA" ;;
    group_label: "Dados Mongo"
    label: "Sub-Etapa"
  }

}
