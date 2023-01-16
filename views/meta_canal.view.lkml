
view: meta_canal {

  sql_table_name: "POS_GRADUADO"."MARKETING"."META_CANAL"
    ;;

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA" ;;
  }

  dimension: canal {
    type: string
    sql: ${TABLE}."CANAL" ;;
  }

  dimension: etapa {
    type: string
    sql: ${TABLE}."ETAPA" ;;
  }

  measure: meta_volume {
    type: sum
    value_format: "0"
    sql: ${TABLE}."META" ;;
  }

  measure: lead {
    type: sum
    value_format: "0"
    group_label: "1. Absoluto"
    label: "1. Meta Leads"
    filters: [etapa: "Lead"]
    sql: ${TABLE}."META" ;;
  }

  measure: simulado {
    type: sum
    value_format: "0"
    group_label: "1. Absoluto"
    label: "2. Meta Simulados"
    filters: [etapa: "Simulado"]
    sql: ${TABLE}."META" ;;
  }

  measure: iniciado {
    type: sum
    value_format: "0"
    group_label: "1. Absoluto"
    label: "3. Meta Iniciados"
    filters: [etapa: "Iniciado"]
    sql: ${TABLE}."META" ;;
  }

  measure: finalizado {
    type: sum
    value_format: "0"
    group_label: "1. Absoluto"
    label: "4. Meta Finalizados"
    filters: [etapa: "Finalizado"]
    sql: ${TABLE}."META" ;;
  }

  measure: aprovado_risco {
    type: sum
    value_format: "0"
    group_label: "1. Absoluto"
    label: "5. Meta Aprovado Risco"
    filters: [etapa: "Aprovado Risco"]
    sql: ${TABLE}."META" ;;
  }

  measure: aprovado_instituicao {
    type: sum
    value_format: "0"
    group_label: "1. Absoluto"
    label: "6. Meta Aprovado Instituição"
    filters: [etapa: "Aprovado Instituicao"]
    sql: ${TABLE}."META" ;;
  }

  measure: aguardando_documento {
    type: sum
    value_format: "0"
    group_label: "1. Absoluto"
    label: "7. Meta Aguardando Documento"
    filters: [etapa: "Aguardando Documento"]
    sql: ${TABLE}."META" ;;
  }

  measure: aguardando_assinatura {
    type: sum
    value_format: "0"
    group_label: "1. Absoluto"
    label: "8. Meta Aguardando Assinatura"
    filters: [etapa: "Aguardando Assinatura"]
    sql: ${TABLE}."META" ;;
  }

  measure: formalizado {
    type: sum
    value_format: "0"
    group_label: "1. Absoluto"
    label: "9. Meta Formalizados"
    filters: [etapa: "Formalizado"]
    sql: ${TABLE}."META" ;;
  }

  measure: simulado_por_lead {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversão"
    label: "1. Meta Simulado/Lead"
    sql: ${simulado} / NULLIF(${lead},0) ;;
  }

  measure: iniciado_por_simulado {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversão"
    label: "2. Meta Iniciado/Simulado"
    sql: ${iniciado} / NULLIF(${simulado},0) ;;
  }

  measure: finalizado_por_iniciado {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversão"
    label: "3. Meta Finalizado/Iniciado"
    sql: ${finalizado} / NULLIF(${iniciado},0) ;;
  }

  measure: aprov_risco_por_finalizado {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversão"
    label: "4. Meta Aprov Risco/Finalizado"
    sql: ${aprovado_risco} / NULLIF(${finalizado},0) ;;
  }

  measure: aprov_ies_por_aprov_risco{
    type: number
    value_format: "0.0%"
    group_label: "2. Conversão"
    label: "5. Meta Aprov IES/Aprov Risco"
    sql: ${aprovado_instituicao} / NULLIF(${aprovado_risco},0) ;;
  }

  measure: aguard_doc_por_aprov_ies {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversão"
    label: "6. Meta Aguard Doc/Aprov IES"
    sql: ${aguardando_documento} / NULLIF(${aprovado_instituicao},0) ;;
  }

  measure: aguard_ass_por_aguard_doc {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversão"
    label: "7. Meta Aguard Ass/Aguard Doc"
    sql: ${aguardando_assinatura} / NULLIF(${aguardando_documento},0) ;;
  }

  measure: formalizado_por_aguard_ass {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversão"
    label: "8. Meta Formalizado/Aguard Ass"
    sql: ${formalizado} / NULLIF(${aguardando_assinatura},0) ;;
  }


}
