view: meta_sla_comercial {
  derived_table: {
    sql: SELECT * FROM "GRADUADO"."AD_HOC".METAS_SLA_COMERCIAL
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: etapa_gerente_status {
    type: string
    primary_key: yes
    hidden: yes
    sql:concat(${etapa_funil},${gerente},${status}) ;;
  }

  dimension: etapa_funil {
    type: string
    label: "ETAPA"
    sql: ${TABLE}."ETAPA_FUNIL" ;;
  }

  dimension: gerente {
    type: string
    label: "GERENTE"
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: status {
    type: string
    label: "STATUS DO ESTOQUE"
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: faixa_tempo_aluno_estoque {
    type: string
    label: "FAIXA TEMPO ALUNO ESTOQUE"
    sql: ${TABLE}."FAIXA_TEMPO_ALUNO_ESTOQUE" ;;
  }

  dimension: minimo {
    type: number
    label: "MINIMO DE DIAS"
    sql: ${TABLE}."MINIMO" ;;
  }

  dimension: maximo {
    type: number
    label: "MAXIMO DE DIAS"
    sql: ${TABLE}."MAXIMO" ;;
  }

  set: detail {
    fields: [
      etapa_funil,
      gerente,
      status,
      faixa_tempo_aluno_estoque,
      minimo,
      maximo
    ]
  }
}
