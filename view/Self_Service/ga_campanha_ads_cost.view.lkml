view: ga_campanha_ads_cost {
  derived_table: {
    persist_for: "1 hour"
    sql: select a.date,
          f.key as chave,
          f.value:CAMPANHA::varchar as CAMPANHA,
          f.value:ID_CAMPANHA::varchar as ID_CAMPANHA,
          f.value:GRUPO_ANUNCIO::varchar as GRUPO_ANUNCIO,
          f.value:ID_GRUPO_ANUNCIO::varchar as ID_GRUPO_ANUNCIO,
          f.value:CUSTO::number(38,2) as CUSTO,
          f.value:CPL::int as CPL,
          f.value:CPS::int as CPS,
          f.value:CPI::int as CPI,
          F.value:CPF::int as CPF
          from GRADUADO.SELF_SERVICE_BI.GOOGLE_ANALYTICS a,
          lateral flatten (input => CAMPANHA_ADS_COST) f
       ;;
  }

  dimension: chave {
    type: string
    sql: {TABLE}."chave";;
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

  dimension: id_campanha {
    type: string
    sql: ${TABLE}."ID_CAMPANHA" ;;
    label: "ID Campanha"
    description: "ID da Campanha pelo AdWords."
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

  measure: total_custo_anuncio {
    type: sum
    label: "custo"
    description: "Custo derivado da campanha publicitária."
    sql: ${TABLE}."CUSTO" ;;
    }

  measure: total_cpl{
    type: sum
    label: "CPL"
    description: "Custo Por Lead da Campanha."
    sql: ${TABLE}."CPL";;
  }

  measure: total_cps{
    type: sum
    sql: ${TABLE}."CPS" ;;
    label: "CPS"
    description: "Custo Por Simulado da Campanha."
  }

  measure: total_cpi{
    type: sum
    sql: ${TABLE}."CPI" ;;
    label: "CPI"
    description: "Custo Por Iniciado da Campanha."
  }

  measure: total_cpf {
    type: sum
    sql: ${TABLE}."CPF" ;;
    label: "CPF"
    description: "Custo Por Finalizado da Campanha."
  }

}
