connection: "pos_graduado"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

access_grant: grupo_nome {
  user_attribute: grupo_nome
  allowed_values: ["grupo_nome"]

}
datagroup: pdd_gestao_default_datagroup {

  max_cache_age: "12 hour"
}
persist_with: pdd_gestao_default_datagroup


# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
 explore: pdd_gestao_garantido {
  persist_for: "24 hour"
  from: pdd_gestao_garantido
  label: "PDD Gestão Garantido"
  view_label: "PDD Gestão Garantido"
  description: "Mostra as informações de PDD para o Gestão Garantido."

 #  join: users {
 #    relationship: many_to_one
 #    sql_on: ${users.id} = ${orders.user_id} ;;
 #  }
 }
