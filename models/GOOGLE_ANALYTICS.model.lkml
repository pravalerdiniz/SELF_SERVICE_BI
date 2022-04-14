connection: "graduado"



include: "/**/*.view.lkml"

explore: ga_campanha_ads_cost {
  label: "Campanhas | Google Analytics"
  view_label: "Ga do lucas"
  description: "Informações das campanhas vindas do Google Analytics"

join: ga_overview_campanha {
  view_label: "Overview Campanha"
  sql_on: ${ga_campanha_ads_cost.id_campanha} = ${ga_overview_campanha.id_campanha} and ${ga_campanha_ads_cost.date_date} = ${ga_overview_campanha.date_date} ${ga_campanha_ads_cost.campanha} = ${ga_overview_campanha.campanha};;
  relationship: many_to_many
  type: left_outer
  }
}
