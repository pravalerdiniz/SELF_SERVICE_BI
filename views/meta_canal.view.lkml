
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
    label: "1. Meta Leads"
    sql: ${TABLE}."LEAD" ;;
  }

  measure: simulado {
    type: sum
    label: "2. Meta Simulados"
    sql: ${TABLE}."SIMULADO" ;;
  }

  measure: iniciado {
    type: sum
    label: "3. Meta Iniciados"
    sql: ${TABLE}."INICIADO" ;;
  }

  measure: finalizados {
    type: sum
    label: "4. Meta Finalizados"
    sql: ${TABLE}."FINALIZADO" ;;
  }

  measure: aprovado_risco {
    type: sum
    label: "5. Meta Aprovados Risco"
    sql: ${TABLE}."APROVADO_RISCO" ;;
  }

  measure: aprovado_instituicao {
    type: sum
    label: "6. Meta Aprovados Instituição"
    sql: ${TABLE}."APROVADO_INSTITUICAO" ;;
  }

  measure: aguardando_documento {
    type: sum
    label: "7. Meta Aguardando Documento"
    sql: ${TABLE}."AGUARDANDO_DOCUMENTO" ;;
  }

  measure: aguardando_assinatura {
    type: sum
    label: "8. Meta Aguardando Assinatura"
    sql: ${TABLE}."AGUARDANDO_ASSINATURA" ;;
  }

  measure: formalizado {
    type: sum
    label: "9. Meta Formalizados"
    sql: ${TABLE}."FORMALIZADO" ;;
  }


}
