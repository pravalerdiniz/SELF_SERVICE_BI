connection: "graduado"

include: "/**/*.view.lkml"

explore: ga_campanha_ads_cost {
  label: "Campanhas"
  view_label: "2. Campanhas | Grupo de Anúncio"
  description: "Informações das campanhas vindas do Google Analytics"
  fields: [ALL_FIELDS *,
    - ga_overview_campanha.campanha,
    - ga_overview_campanha.grupo_anuncio,
    - ga_overview_campanha.id_grupo_anuncio,
    - ga_overview_campanha.id_campanha,
    - ga_campanha_ads_cost.total_cpl,
    - ga_campanha_ads_cost.total_cps,
    - ga_campanha_ads_cost.total_cpi,
    - ga_campanha_ads_cost.total_cpf,
    - ga_overview_campanha.grupo_anuncio,
    - ga_overview_campanha.grupo_anuncio,
    - ga_campanha_ads_etapas.campanha,
    - ga_campanha_ads_etapas.id_campanha,
    - ga_campanha_ads_etapas.grupo_anuncio,
    - ga_campanha_ads_etapas.id_grupo_anuncio,
    - ga_campanha_aquisicao_conversao.campanha,
    - ga_campanha_aquisicao_conversao.id_campanha,
    - ga_url_destino_aquisicao.campanha,
    - ga_url_destino_aquisicao.id_campanha,
    - ga_overview_campanha.total_cpc,
    - ga_url_destino_aquisicao.total_custo
  ]

  join: google_analytics {
    view_label: "1. Site | Geral"
    sql_on: ${ga_campanha_ads_cost.date_date} = ${google_analytics.date_date};;
    relationship: many_to_one
    type: full_outer
  }

  join: ga_etapas {
    view_label: "1. Site | Geral"
    sql_on: ${ga_campanha_ads_cost.date_date} = ${ga_etapas.date_date};;
    relationship: many_to_one
    type: full_outer
  }

  join: ga_overview_campanha {
    view_label: "2. Campanhas | Grupo de Anúncio"
    sql_on: ${ga_campanha_ads_cost.id_campanha} = ${ga_overview_campanha.id_campanha}
    and ${ga_campanha_ads_cost.date_date} = ${ga_overview_campanha.date_date};;
    relationship: many_to_many
    type: full_outer
  }

  join: ga_campanha_ads_etapas {
    view_label: "2. Campanhas | Grupo de Anúncio"
    sql_on: ${ga_campanha_ads_cost.id_campanha} = ${ga_campanha_ads_etapas.id_campanha}
    and ${ga_campanha_ads_cost.date_date} = ${ga_campanha_ads_etapas.date_date};;
    relationship: many_to_many
    type: full_outer
  }

  join: ga_campanha_aquisicao_conversao {
    view_label: "2. Campanhas | Grupo de Anúncio"
    sql_on: ${ga_campanha_aquisicao_conversao.id_campanha} = ${ga_campanha_ads_cost.id_campanha}
      and ${ga_campanha_ads_cost.date_date} = ${ga_campanha_aquisicao_conversao.date_date};;
    relationship: many_to_many
    type: full_outer
  }

  join: ga_url_destino_aquisicao {
    view_label: "2. Campanhas | Grupo de Anúncio"
    sql_on: ${ga_url_destino_aquisicao.id_campanha} = ${ga_campanha_ads_cost.id_campanha}
      and ${ga_campanha_ads_cost.date_date} = ${ga_url_destino_aquisicao.date_date};;
    relationship: many_to_many
    type: full_outer
  }
}

  explore: ga_origem_midia_aquisicao_conversao {
    label: "Origem/Mídia"
    view_label: "4. Origem e Mídia"
    description: "Informações sobre Origem e Mídia do Google Analytics"

    join: google_analytics {
      view_label: "1. Site | Geral"
      sql_on: ${ga_origem_midia_aquisicao_conversao.date_date} = ${google_analytics.date_date};;
      relationship: many_to_one
      type: full_outer
    }

    join: ga_etapas {
      view_label: "1. Site | Geral"
      sql_on: ${ga_origem_midia_aquisicao_conversao.date_date} = ${ga_etapas.date_date};;
      relationship: many_to_one
      type: full_outer
    }

    join: ga_origem_aquisicao_conversao {
      view_label: "2. Origem"
      sql_on: ${ga_origem_aquisicao_conversao.date_date} = ${ga_origem_midia_aquisicao_conversao.date_date};;
      relationship: many_to_many
      type: full_outer
    }

    join: ga_midia_aquisicao_conversao {
      view_label: "3. Mídia"
      sql_on: ${ga_midia_aquisicao_conversao.date_date} = ${ga_origem_midia_aquisicao_conversao.date_date};;
      relationship: many_to_many
      type: full_outer
    }
  }

    explore: ga_ads_conversao_hora {
      label: "Google Ads"
      view_label: "2. Grupo de Anúncio"
      description: "Informações sobre os Grupos de anúncios do Google Ads."
      fields: [ALL_FIELDS *,
        - ga_overview_campanha.grupo_anuncio,
        - ga_overview_campanha.id_grupo_anuncio
      ]

      join: google_analytics {
        view_label: "1. Site | Geral"
        sql_on: ${ga_ads_conversao_hora.date_date} = ${google_analytics.date_date};;
        relationship: many_to_one
        type: full_outer
      }

      join: ga_etapas {
        view_label: "1. Site | Geral"
        sql_on: ${ga_ads_conversao_hora.date_date} = ${ga_etapas.date_date};;
        relationship: many_to_one
        type: full_outer
      }

      join: ga_overview_campanha {
        view_label: "2. Grupo de Anúncio"
        sql_on: ${ga_ads_conversao_hora.id_grupo_anuncio} = ${ga_overview_campanha.id_grupo_anuncio}
          and ${ga_ads_conversao_hora.date_date} = ${ga_overview_campanha.date_date};;
        relationship: many_to_many
        type: full_outer
      }
    }

      explore: ga_canal_aquisicao_conversao {
        label: "Canais"
        view_label: "2. Canal"
        description: "Informações sobre os canais do Google Analytics"

        join: google_analytics {
          view_label: "1. Site | Geral"
          sql_on: ${ga_canal_aquisicao_conversao.date_date} = ${google_analytics.date_date};;
          relationship: many_to_one
          type: full_outer
        }

        join: ga_etapas {
          view_label: "1. Site | Geral"
          sql_on: ${ga_canal_aquisicao_conversao.date_date} = ${ga_etapas.date_date};;
          relationship: many_to_one
          type: full_outer
        }


  }
