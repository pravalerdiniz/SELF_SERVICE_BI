view: okr_farol_check_data {
  derived_table: {
    sql: SELECT
      DATA_CARGA,
      "Status_11_0_Aluno_no_Portal_da_IES_FORA_SLA"
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

  dimension: status_11_0_aluno_no_portal_da_ies_fora_sla {
    type: number
    sql: ${TABLE}."Status_11_0_Aluno_no_Portal_da_IES_FORA_SLA" ;;
  }

  set: detail {
    fields: [data_carga_time, status_11_0_aluno_no_portal_da_ies_fora_sla]
  }
}
