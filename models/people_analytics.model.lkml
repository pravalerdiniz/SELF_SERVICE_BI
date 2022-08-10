connection: "farol"

include: "/**/*.view.lkml"

# include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: dados_demograficos {
  view_label: "Dados Demográficos"
  description: "Informações sobre região onde residem os colaboradores do Pravaler"
}

explore: historico_demograficos {
  view_label: "Dados Demográficos"
  description: "Informações sobre histórico da região onde residem os colaboradores do Pravaler"


}

explore: gupy_candidaturas {
  label: "Dados sobre as candidaturas na GUPY"
  description: "Informações sobre vagas, candidatos e acompanhamento de candidaturas"

  join: gupy_vagas {
    view_label: "Gypy Vagas (Base Vagas)"
    relationship: many_to_one
    type: left_outer
    sql_on: ${gupy_candidaturas.id_vaga} = ${gupy_vagas.codigo} ;;
  }

}

explore: gupy_vagas {
  label: "Dados sobre as vagas na GUPY"
  description: "Informações sobre vagas cadastradas na plataforma Gupy"
}

explore: pulse {
  label: "Pulse"
  view_label: "Pulse"
  description: "Apresenta os resultados da pulse realizada com os pravalentes."
}

explore: enps {
  label: "e-NPS"
  view_label: "e-NPS"


  join: enps_flatten {
    view_label: "e-NPS por Palavra"
    relationship: one_to_many
    type: left_outer
    sql_on: ${enps.id_resposta} = ${enps_flatten.id_resposta} ;;
  }
}
