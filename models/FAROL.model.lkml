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


join: okr_farol_check_data {
  relationship: many_to_one
  type: left_outer
  sql_on: ${farol.data_carga_raw} = ${okr_farol_check_data.data_carga_raw} ;;
  fields: []
}


  }

datagroup: max_data_carga_farol {
  sql_trigger:
      SELECT max(DATA_CARGA) FROM "GRADUADO"."SELF_SERVICE_BI"."FAROL";;
  max_cache_age: "30 minutes"
  label: "Última data de Carga - Farol"
}



  explore: farol_detalhado {}

  explore: imagens {}
