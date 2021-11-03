view: meta_conversao_grupo_ies {
  derived_table: {
    sql: SELECT * FROM "GRADUADO"."AD_HOC".META_CONVERSAO
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: data_grupo_ies {
    type: string
    primary_key: yes
    hidden: yes
    sql:concat(${data},${grupo} ;;
  }

  dimension: data {
    type: date
    label: "DATA REFERENCIA META"
    sql: ${TABLE}."DATA" ;;
    description: "Data de referencia da Meta"
  }

  dimension: mes {
    type: string
    label: "MES REFERENCIA META"
    sql: ${TABLE}."MES" ;;
    description: "Mês de referencia da Meta"
  }

  dimension: ano {
    type: number
    label: "ANO REFERENCIA META"
    sql: ${TABLE}."ANO" ;;
    description: "Ano de referencia da Meta"
  }

  dimension: gerente {
    type: string
    label: "GERENTE"
    sql: ${TABLE}."GERENTE" ;;
    description: "Nome do gerente da carteira"
  }

  dimension: grupo {
    type: string
    label: "GRUPO DA IES"
    sql: ${TABLE}."GRUPO" ;;
    description: "Grupo da Instituição Estudantil"
  }

  dimension: simulado {
    type: number
    label: "META CONVERSAO - SIMULADO"
    sql: ${TABLE}."SIMULADO" ;;
    description: "Meta da Conversão da etapa Lead para Simulado"
  }

  dimension: iniciado {
    type: number
    label: "META CONVERSAO - INICIADO"
    sql: ${TABLE}."INICIADO" ;;
    description: "Meta da Conversão da etapa Simulado para Iniciado"
  }

  dimension: finalizado {
    type: number
    label: "META CONVERSAO - FINALIZADO"
    sql: ${TABLE}."FINALIZADO" ;;
    description: "Meta da Conversão da etapa Iniciado para Finalizado"
  }

  dimension: aprovado_risco {
    type: number
    label: "META CONVERSAO - APROVADO RISCO"
    sql: ${TABLE}."APROVADO_RISCO" ;;
    description: "Meta da Conversão da etapa Finalizado para Aprovado Risco"
  }

  dimension: aprovado_ies {
    type: number
    label: "META CONVERSAO - APROVADO IES"
    sql: ${TABLE}."APROVADO_IES" ;;
    description: "Meta da Conversão da etapa Aprovado Risco para Aprovado Instituição"
  }

  dimension: aguardando_documento {
    type: number
    label: "META CONVERSAO - AGUARDANDO DOCUMENTO"
    sql: ${TABLE}."AGUARDANDO_DOCUMENTO" ;;
    description: "Meta da Conversão da etapa Aprovado Instituição para Aguardando Documento"
  }

  dimension: aguardando_assinatura {
    type: number
    label: "META CONVERSAO - AGUARDANDO ASSINATURA"
    sql: ${TABLE}."AGUARDANDO_ASSINATURA" ;;
    description: "Meta da Conversão da etapa Aguardando Documento para Aguardando Assinatura"
  }

  dimension: formalizado {
    type: number
    label: "META CONVERSAO - FORMALIZADO"
    sql: ${TABLE}."FORMALIZADO" ;;
    description: "Meta da Conversão da etapa Aguardando Assinatura para Formalizado"
  }

  dimension_group: data_meta {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."DATA" ;;
    label: "Data Referencia"
    description: "Data de referencia da meta"
  }

  set: detail {
    fields: [
      data,
      mes,
      ano,
      gerente,
      grupo,
      simulado,
      iniciado,
      finalizado,
      aprovado_risco,
      aprovado_ies,
      aguardando_documento,
      aguardando_assinatura,
      formalizado
    ]
  }
}
