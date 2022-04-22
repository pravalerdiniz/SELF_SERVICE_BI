view: ga_campanha_ads_etapas {
  derived_table: {
    persist_for: "1 hour"
    sql: select a.date,
          f.key as chave,
          f.value:CAMPANHA::varchar as CAMPANHA,
          f.value:LEAD::int as LEAD,
          f.value:SIMULADO::int as SIMULADO,
          f.value:INICIADO::int as INICIADO,
          f.value:FINALIZADO::int as FINALIZADO,
          f.value:GRUPO_ANUNCIO::varchar as GRUPO_ANUNCIO,
          f.value:ID_CAMPANHA::varchar as ID_CAMPANHA,
          f.value:ID_GRUPO_ANUNCIO::varchar as ID_GRUPO_ANUNCIO,
          f.value:IMPRESSOES::int as IMPRESSOES
          from GRADUADO.SELF_SERVICE_BI.GOOGLE_ANALYTICS a,
          lateral flatten (input => CAMPANHA_ADS_ETAPAS) f
       ;;
  }

  dimension: chave {
    type: string
    sql: concat(${TABLE}."chave",${date_date}) ;;
    primary_key: yes
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

  dimension: campanha {
    type: string
    sql: ${TABLE}."CAMPANHA" ;;
    label: "Campanha"
    description: "São os nomes das campanhas de anúncios on-line."
  }

  dimension: grupo_anuncio {
    type: string
    sql: ${TABLE}."GRUPO_ANUNCIO" ;;
    label: "Grupo de anúncio"
    description: "O nome do grupo de anúncios do AdWords."
  }

  dimension: id_grupo_anuncio {
    type: string
    sql: ${TABLE}."ID_GRUPO_ANUNCIO" ;;
    label: "ID Grupo de anúncio"
    description: "ID do grupo de anúncios do AdWords."
  }

  dimension: id_campanha {
    type: string
    sql: ${TABLE}."ID_CAMPANHA" ;;
    label: "ID Campanha"
    description: "ID da Campanha pelo AdWords."
  }

  measure: total_lead {
    type: sum
    label: "1. Soma Leads"
    description: "Soma total da etapa Lead no site."
    sql: ${TABLE}."LEAD" ;;
    group_label: "1. Etapas"
  }

  measure: total_simulado {
    type: sum
    label: "2. Soma Simulados"
    description: "Soma total da etapa Simulado no site."
    sql: ${TABLE}."SIMULADO" ;;
    group_label: "1. Etapas"
  }

  measure: total_iniciado {
    type: sum
    label: "3. Soma Iniciados"
    description: "Soma total da etapa Iniciado no site."
    sql: ${TABLE}."INICIADO" ;;
    group_label: "1. Etapas"
  }

  measure: total_finalizado {
    type: sum
    label: "4. Soma Finalizados"
    description: "Soma total da etapa Finalizado no site."
    sql: ${TABLE}."FINALIZADO" ;;
    group_label: "1. Etapas"
  }

  measure: total_impressoes {
    type: sum
    sql: ${TABLE}."IMPRESSOES" ;;
    label: "Impressões"
    description: "Número de vezes que os anúncios de pesquisa da campanha foram apresentados."
  }

}
