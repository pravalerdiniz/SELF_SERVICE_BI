connection: "graduado"

include: "/**/*.view.lkml"

explore: ga_campanha_ads_cost {
  label: "Campanhas | Google Analytics"
  view_label: "Ga do lucas"
  description: "Informações das campanhas vindas do Google Analytics"

  join: google_analytics {
    view_label: "Tabela principal"
    sql_on: ${ga_campanha_ads_cost.date_date} = ${google_analytics.date_date};;
    relationship: many_to_one
    type: full_outer
  }

  join: ga_overview_campanha {
    view_label: "Overview Campanha"
    sql_on: ${ga_campanha_ads_cost.id_campanha} = ${ga_overview_campanha.id_campanha}
    and ${ga_campanha_ads_cost.date_date} = ${ga_overview_campanha.date_date};;
    relationship: many_to_many
    type: full_outer
  }

  join: ga_campanha_ads_etapas {
    view_label: "Ads etapas"
    sql_on: ${ga_campanha_ads_cost.id_campanha} = ${ga_campanha_ads_etapas.id_campanha}
    and ${ga_campanha_ads_cost.date_date} = ${ga_campanha_ads_etapas.date_date};;
    relationship: many_to_many
    type: full_outer
  }
}
