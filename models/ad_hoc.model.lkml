connection: "graduado"

include: "/**/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
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

access_grant: grupo_cpf {
  user_attribute: grupo_cpf
  allowed_values: ["grupo_cpf"]
}

explore: comunicacao_conversao {
  label: "Comunicação Conversão"
  view_label: "Comunicação Conversão"
  join: comunicacao_conversao_status_info {
    view_label: "Status Log Pós Contato"
    type: left_outer
    relationship: one_to_many
    sql_on: ${comunicacao_conversao.id_cpf} = ${comunicacao_conversao_status_info.id_cpf} ;;
  }
}
