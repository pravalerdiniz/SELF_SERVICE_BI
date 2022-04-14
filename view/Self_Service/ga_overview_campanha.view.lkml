view: ga_overview_campanha {
  derived_table: {
    persist_for: "1 hour"
    sql: select a.date,
          f.key as chave,
          f.value:CAMPANHA::varchar as CAMPANHA,
          f.value:CLICKS_ANUNCIO::int as CLICKS_ANUNCIO,
          f.value:CPC::int as CPC,
          f.value:CTR::int as CTR,
          f.value:CUSTO_ANUNCIO::number(38,2) as CUSTO_ANUNCIO,
          f.value:CUSTO_CONVERSAO::number(38,2) as CUSTO_CONVERSAO,
          f.value:GRUPO_ANUNCIO::varchar as GRUPO_ANUNCIO,
          f.value:ID_CAMPANHA::varchar as ID_CAMPANHA,
          f.value:ID_GRUPO_ANUNCIO::varchar as ID_GRUPO_ANUNCIO,
          f.value:IMPRESSOES::int as IMPRESSOES
          from GRADUADO.SELF_SERVICE_BI.GOOGLE_ANALYTICS a,
          lateral flatten (input => OVERVIEW_CAMPANHA) f
       ;;
  }

  dimension: chave {
    type: string
    sql: concat(${TABLE}."chave",${campanha}) ;;
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

  measure: total_clicks_anuncio {
    type: sum
    sql: ${TABLE}."CLICKS_ANUNCIO" ;;
    label: "Cliques"
    description: "Número total de vezes que os usuários clicaram em um anúncio."
  }

  measure: total_cpc {
    type: sum
    sql: ${TABLE}."CPC" ;;
    label: "CPC"
    description: "Custo para o anunciante por clique."
  }

  measure: total_ctr {
    type: sum
    sql: ${TABLE}."CTR" ;;
    label: "CTR"
    description: "Taxa de cliques para o anúncio."
  }

  measure: total_custo_anuncio {
    type: sum
    sql: ${TABLE}."CUSTO_ANUNCIO" ;;
    label: "Custo"
    description: "Custo derivado da campanha publicitária."
  }

  measure: total_custo_conversao {
    type: sum
    sql: ${TABLE}."CUSTO_CONVERSAO" ;;
    label: "Custo | Conversão"
    description: "O custo por conversão (incluindo comércio eletrônico e conversões de meta) do site."
  }

  measure: total_impressoes {
    type: sum
    sql: ${TABLE}."IMPRESSOES" ;;
    label: "Impressões"
    description: "Número total de impressões da campanha."
  }

  }
