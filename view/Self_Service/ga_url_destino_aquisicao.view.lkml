view: ga_url_destino_aquisicao {
 derived_table: {
    persist_for: "1 hour"
    sql: select a.date,
          f.key as chave,
          f.value:CAMPANHA::varchar as CAMPANHA,
          f.value:CLIQUES::number(38,2) as CLIQUES,
          f.value:CPC::number(38,2) as CPC,
          f.value:CUSTO::number(38,2) as CUSTO,
          f.value:ID_CAMPANHA::varchar as ID_CAMPANHA,
          f.value:MIDIA::varchar as MIDIA,
          f.value:URL_DESTINO::varchar as URL_DESTINO
          from GRADUADO.SELF_SERVICE_BI.GOOGLE_ANALYTICS a,
          lateral flatten (input => URLDESTINO_AQUISICAO) f
       ;;
  }

  dimension: chave {
    type: string
    sql: concat(${TABLE}."chave", ${date_date}) ;;
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
    description: "São os nomes das campanhas de anúncios on-line"
  }

  dimension: id_campanha {
    type: string
    sql: ${TABLE}."ID_CAMPANHA" ;;
    label: "ID da Campanha"
    description: "ID da Campanha pelo AdWords."
  }

  dimension: midia {
    type: string
    sql: ${TABLE}."MIDIA" ;;
    label: "Mídia"
    description: "O tipo de referências."
  }

  dimension: url_destino {
    type: string
    sql: ${TABLE}."URL_DESTINO" ;;
    label: "URL de destino"
    description: "O URL para o qual os anúncios do AdWords direcionaram o tráfego."
  }

  measure: total_cpc {
    type: sum
    sql: ${TABLE}."CPC" ;;
    label: "CPC"
    description: "Custo para o anuncio por clique."
  }

  measure: total_custo {
    type: sum
    sql: ${TABLE}."CUSTO";;
    label: "Custo"
    description: "Custo derivado da campanha publicitária."
  }

  measure: total_cliques {
    type: sum
    sql: ${TABLE}."CLIQUES";;
    label: "Cliques"
    description: "O número de vezes que os utilizadores clicam no anúncio."
  }

}
