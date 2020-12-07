connection: "veeterano"

include: "/**/*.view.lkml"                # include all views in the views/ folder in this project
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

explore: s_op_previsao {
  label: "S&OP"
  view_label: "S&OP"

  join: s_op_previsao_flatten {
    view_label: "S&OP desagrupado"
    sql_on: ${s_op_previsao.mes_inicio_proposta_raw} = ${s_op_previsao_flatten.mes_inicio_proposta_raw}
        and ${s_op_previsao.classe_modelo_iniciado} = ${s_op_previsao_flatten.classe_modelo_iniciado}
        and ${s_op_previsao.grupo_instituicao} = ${s_op_previsao_flatten.grupo_instituicao}
        and ${s_op_previsao.regiao_campus} = ${s_op_previsao_flatten.regiao_campus}
        and ${s_op_previsao.canal_url} = ${s_op_previsao_flatten.canal_url};;
    relationship: one_to_many
    type: left_outer
  }
}
