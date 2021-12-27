view: projecao_formalizados {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.CURVA_VELOCIDADE
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fonte {
    type: string
    sql: ${TABLE}."FONTE" ;;
  }

  dimension: mes_formalizacao {
    type: string
    sql: ${TABLE}."MES_FORMALIZACAO" ;;
  }

  dimension: qtd_form_prevista {
    type: number
    sql: ${TABLE}."QTD_FORM_PREVISTA" ;;
  }

  dimension_group: dt_carga {
    type: time
    sql: ${TABLE}."DT_CARGA" ;;
  }

  set: detail {
    fields: [fonte, mes_formalizacao, qtd_form_prevista, dt_carga_time]
  }
}
