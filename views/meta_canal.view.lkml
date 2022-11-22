
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

  measure: lead {
    type: sum
    group_label: "1. Absoluto"
    label: "1. Meta Leads"
    sql: ${TABLE}."LEAD" ;;
  }

  measure: simulado {
    type: sum
    group_label: "1. Absoluto"
    label: "2. Meta Simulados"
    sql: ${TABLE}."SIMULADO" ;;
  }

  measure: iniciado {
    type: sum
    group_label: "1. Absoluto"
    label: "3. Meta Iniciados"
    sql: ${TABLE}."INICIADO" ;;
  }

  measure: finalizados {
    type: sum
    group_label: "1. Absoluto"
    label: "4. Meta Finalizados"
    sql: ${TABLE}."FINALIZADO" ;;
  }

  measure: aprovado_risco {
    type: sum
    group_label: "1. Absoluto"
    label: "5. Meta Aprovados Risco"
    sql: ${TABLE}."APROVADO_RISCO" ;;
  }

  measure: aprovado_instituicao {
    type: sum
    group_label: "1. Absoluto"
    label: "6. Meta Aprovados Instituição"
    sql: ${TABLE}."APROVADO_INSTITUICAO" ;;
  }

  measure: aguardando_documento {
    type: sum
    group_label: "1. Absoluto"
    label: "7. Meta Aguardando Documento"
    sql: ${TABLE}."AGUARDANDO_DOCUMENTO" ;;
  }

  measure: aguardando_assinatura {
    type: sum
    group_label: "1. Absoluto"
    label: "8. Meta Aguardando Assinatura"
    sql: ${TABLE}."AGUARDANDO_ASSINATURA" ;;
  }

  measure: formalizado {
    type: sum
    group_label: "1. Absoluto"
    label: "9. Meta Formalizados"
    sql: ${TABLE}."FORMALIZADO" ;;
  }

  measure: simuladosporleads {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversões"
    label: "1. Simulados / Leads"
    sql: ${simulado} / ${lead} ;;
  }

  measure: iniciadosporsimulados {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversões"
    label: "2. Iniciados / Simulados"
    sql: ${iniciado} / ${simulado} ;;
  }

  measure: finalizadosporiniciados {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversões"
    label: "3. Finalizados / Iniciados"
    sql: ${finalizados} / ${iniciado} ;;
  }

  measure: aprovadoriscoporfinalizados {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversões"
    label: "4. Aprovado Risco / Finalizados"
    sql: ${aprovado_risco} / ${finalizados} ;;
  }

  measure: aprovadoiesporaprovadorisco {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversões"
    label: "5. Aprovado IES / Aprovado Risco"
    sql: ${aprovado_instituicao} / ${aprovado_risco} ;;
  }

  measure: aguardandodocumentoporaprovadoies {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversões"
    label: "6. Aguardando Documento / Aprovado IES"
    sql: ${aguardando_documento} / ${aprovado_instituicao} ;;
  }

  measure: aguardandoassinaturaporaguardandodocumento {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversões"
    label: "7. Aguardando Assinatura / Aguardando Documento"
    sql: ${aguardando_assinatura} / ${aguardando_documento} ;;
  }

  measure: formalizadoporaguardandoassinatura {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversões"
    label: "8. Formalizados / Aguardando Assinatura"
    sql: ${formalizado} / ${aguardando_assinatura} ;;
  }

  measure: formalizadoporaprovadoies {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversões"
    label: "Formalizados / Aprovado IES"
    sql: ${formalizado} / ${aprovado_instituicao} ;;
  }

  measure: finalizadosporleads {
    type: number
    value_format: "0.0%"
    group_label: "2. Conversões"
    label: "Finalizados / Leads"
    sql: ${finalizados} / ${lead} ;;
  }




}
