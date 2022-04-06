view: ga_ads_conversao_hora {
  derived_table: {
    persist_for: "1 hour"
    sql: select a.date,
          f.key as chave,
          f.value:FINALIZADO::int as FINALIZADO,
          f.value:GRUPO_ANUNCIO::varchar as GRUPO_ANUNCIO,
          f.value:HORA::varchar as HORA,
          f.value:ID_GRUPO_ANUNCIO::varchar as ID_GRUPO_ANUNCIO,
          f.value:INICIADO::int as INICIADO,
          f.value:LEAD::int as LEAD,
          f.value:SIMULADO::int as SIMULADO
          from GRADUADO.SELF_SERVICE_BI.GOOGLE_ANALYTICS a,
          lateral flatten (input => ADS_CONVERSAO_HORA) f
       ;;
  }

  dimension: chave {
    type: string
    primary_key: yes
    sql: ${TABLE}."chave" ;;
    hidden: yes
  }

  dimension_group: date {
    type: time
    timeframes: [ week_of_year,
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
    label: "Data da sessão"
    description: "Data considerada para análise do site"
    hidden: yes
  }

  dimension: grupo_anuncio {
    type: string
    sql: ${TABLE}."GRUPO_ANUNCIO" ;;
    label: "Grupo de Anúncio - Ads"
    description: "O nome do grupo de anúncios do AdWords."
  }

  dimension: id_grupo_anuncio {
    type: number
    sql: ${TABLE}."ID_GRUPO_ANUNCIO" ;;
    label: "ID do Grupo de Anúncio - Ads"
    description: "O ID do grupo de anúncios do AdWords."
  }

  dimension: hora_conversao {
    type: string
    sql: ${TABLE}."HORA" ;;
    label: "Hora"
    description: "Uma hora do dia de dois dígitos variando de 00 a 23."
  }

  measure: total_lead {
    type: sum
    label: "1. Soma Leads"
    description: "Soma da etapa Lead no site de acordo com a HORA."
    sql: ${TABLE}."FINALIZADO" ;;
    group_label: "Métricas de conversão por HORA"
  }

  measure: total_simulado {
    type: sum
    label: "2. Soma Simulados"
    description: "Soma da etapa Simulado no site de acordo com a HORA."
    sql: ${TABLE}."SIMULADO" ;;
    group_label: "Métricas de conversão por HORA"
  }

  measure: total_iniciado {
    type: sum
    label: "3. Soma Iniciados"
    description: "Soma da etapa Iniciado no site de acordo com a HORA."
    sql: ${TABLE}."INICIADO" ;;
    group_label: "Métricas de conversão por HORA"
  }

  measure: total_finalizado {
    type: sum
    label: "4. Soma Finalizados"
    description: "Soma da etapa Finalizado no site de acordo com a HORA."
    sql: ${TABLE}."FINALIZADO" ;;
    group_label: "Métricas de conversão por HORA"
  }
}
