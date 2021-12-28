view: projecao_formalizados {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.CURVA_VELOCIDADE
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: chave_primaria {
    type: string
    primary_key: yes
    hidden: yes
    sql:concat(${dt_carga_date}, ${fonte},${mes_formalizacao}) ;;
    }

  dimension: fonte {
    type: string
    label: "Fonte"
    sql: ${TABLE}."FONTE" ;;
  }

  dimension: mes_formalizacao {
    type: string
    label: "Mês previsto da Formalização"
    sql: ${TABLE}."MES_FORMALIZACAO" ;;
  }

  dimension: qtd_form_prevista {
    type: number
    label: "Data Inclusão Sistema"
    sql: ${TABLE}."QTD_FORM_PREVISTA" ;;
  }

  dimension_group: dt_carga {
    type: time
    label: "Data Inclusão Sistema"
    sql: ${TABLE}."DT_CARGA" ;;
  }

  set: detail {
    fields: [fonte, mes_formalizacao, qtd_form_prevista, dt_carga_time]
  }
}
