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

explore: farol {
  label: "FAROL DE STATUS"
  view_label: "FAROL"

  join: farol_detalhado {
    from: farol_detalhado
    type: inner
    relationship: many_to_many
    sql_where: ${farol_detalhado.data_date} between dateadd(minute,${farol.data_carga_time}, -30) and ${farol.data_carga_time};;
  }

  }

#explore: farol_detalhado {}
