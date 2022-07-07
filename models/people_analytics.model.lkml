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
  label: "Dados GUPY"
  description: "Informações sobre vagas, candidatos e acompanhamento de candidaturas"
}
