view: okr_farol_check_data {
  derived_table: {
    sql: SELECT
      DATA_CARGA
      FROM
      GRADUADO."SELF_SERVICE_BI"."FAROL"
      QUALIFY ROW_NUMBER() OVER ( PARTITION BY TO_CHAR(DATA_CARGA, 'YYYY-MM-DD') ORDER BY DATA_CARGA DESC )=1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: data_carga {
    type: time
    sql: ${TABLE}."DATA_CARGA" ;;
  }


  set: detail {
    fields: [data_carga_time]
  }
}
