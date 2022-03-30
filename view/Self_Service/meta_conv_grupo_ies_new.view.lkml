view: meta_conv_grupo_ies_new {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.META_CONVERSAO_GRUPO_IES
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
    sql:concat(${data},${grupo}) ;;
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
    value_format: "0.00%"
    sql: ${TABLE}."SIMULADO" ;;
    description: "Meta da Conversão da etapa Lead para Simulado"
  }

  dimension: iniciado {
    type: number
    label: "META CONVERSAO - INICIADO"
    value_format: "0.00%"
    sql: ${TABLE}."INICIADO" ;;
    description: "Meta da Conversão da etapa Simulado para Iniciado"
  }

  dimension: finalizado {
    type: number
    label: "META CONVERSAO - FINALIZADO"
    value_format: "0.00%"
    sql: ${TABLE}."FINALIZADO" ;;
    description: "Meta da Conversão da etapa Iniciado para Finalizado"
  }

  dimension: aprovado_risco {
    type: number
    label: "META CONVERSAO - APROVADO RISCO"
    value_format: "0.00%"
    sql: ${TABLE}."APROVADO_RISCO" ;;
    description: "Meta da Conversão da etapa Finalizado para Aprovado Risco"
  }

  dimension: aprovado_ies {
    type: number
    label: "META CONVERSAO - APROVADO IES"
    value_format: "0.00%"
    sql: ${TABLE}."APROVADO_IES" ;;
    description: "Meta da Conversão da etapa Aprovado Risco para Aprovado Instituição"
  }

  dimension: aguardando_documento {
    type: number
    label: "META CONVERSAO - AGUARDANDO DOCUMENTO"
    value_format: "0.00%"
    sql: ${TABLE}."AGUARDANDO_DOCUMENTO" ;;
    description: "Meta da Conversão da etapa Aprovado Instituição para Aguardando Documento"
  }

  dimension: aguardando_assinatura {
    type: number
    label: "META CONVERSAO - AGUARDANDO ASSINATURA"
    value_format: "0.00%"
    sql: ${TABLE}."AGUARDANDO_ASSINATURA" ;;
    description: "Meta da Conversão da etapa Aguardando Documento para Aguardando Assinatura"
  }

  dimension: formalizado {
    type: number
    label: "META CONVERSAO - FORMALIZADO"
    value_format: "0.00%"
    sql: ${TABLE}."FORMALIZADO" ;;
    description: "Meta da Conversão da etapa Aguardando Assinatura para Formalizado"
  }

  measure:avg_simulado {
    type:average
    label: "Média - Simulado"
    value_format: "0.00%"
    group_label: "Simulado"
    sql: ${simulado};;

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
