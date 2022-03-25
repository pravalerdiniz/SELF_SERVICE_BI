view: meta_conversao_grupo_ies_2 {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.META_CONVERSAO_GRUPO_IES
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: data {
    type: date
    sql: ${TABLE}."DATA" ;;
  }

  dimension: mes {
    type: string
    sql: ${TABLE}."MES" ;;
  }

  dimension: ano {
    type: number
    sql: ${TABLE}."ANO" ;;
  }

  dimension: gerente {
    type: string
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: grupo {
    type: string
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: finalizado {
    type: string
    sql: ${TABLE}."FINALIZADO" ;;
  }

  dimension: aprovado_risco {
    type: string
    sql: ${TABLE}."APROVADO_RISCO" ;;
  }

  dimension: aprovado_ies {
    type: string
    sql: ${TABLE}."APROVADO_IES" ;;
  }

  dimension: aguardando_documento {
    type: string
    sql: ${TABLE}."AGUARDANDO_DOCUMENTO" ;;
  }

  dimension: aguardando_assinatura {
    type: string
    sql: ${TABLE}."AGUARDANDO_ASSINATURA" ;;
  }

  dimension: formalizado {
    type: string
    sql: ${TABLE}."FORMALIZADO" ;;
  }

  dimension: conv_global {
    type: string
    sql: ${TABLE}."CONV_GLOBAL" ;;
  }

  set: detail {
    fields: [
      data,
      mes,
      ano,
      gerente,
      grupo,
      finalizado,
      aprovado_risco,
      aprovado_ies,
      aguardando_documento,
      aguardando_assinatura,
      formalizado,
      conv_global
    ]
  }
}
