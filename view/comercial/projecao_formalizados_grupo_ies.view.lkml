view: projecao_formalizados_grupo_ies {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.PROJECAO_FORMALIZADOS
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
    sql:concat(${dt_carga_date}, ${fonte},${mes_formalizacao},${gerente},${grupo}) ;;
  }

  dimension: mes_formalizacao {
    type: string
    label: "Mês previsto da Formalização"
    sql: ${TABLE}."MES_FORMALIZACAO" ;;
  }

  dimension: fonte {
    type: string
    label: "Fonte"
    sql: ${TABLE}."FONTE" ;;
  }

  dimension: gerente {
    type: string
    label: "Gerente"
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: grupo {
    type: string
    label: "Grupo da Instituição"
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: qtd_form_prevista {
    type: number
    label: "Quantidade de formalizados prevista"
    sql: ${TABLE}."QTD_FORM_PREVISTA" ;;
  }

  dimension_group: dt_carga {
    type: time
    label: "Data Inclusão Sistema"
    sql: ${TABLE}."DT_CARGA" ;;
  }

  set: detail {
    fields: [
      mes_formalizacao,
      fonte,
      gerente,
      grupo,
      qtd_form_prevista,
      dt_carga_time
    ]
  }
}
