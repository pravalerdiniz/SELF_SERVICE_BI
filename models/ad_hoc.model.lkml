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



explore: orcamento {
  label: "Orçamento"
  view_label: "Orçamento"

  access_filter: {
    field: descricao_centro_de_custo
    user_attribute: acesso_orcamento
  }

  join: diretoria {
    from: centro_de_custo
    fields: [diretoria.diretoria]
    relationship: many_to_one
    sql_on: ${orcamento.centro_de_custo} = ${diretoria.centro_de_custo} ;;
  }
}

explore: fato_swap {
  label: "Swap"
  view_label: "Swap"

  join: fato_swap_realizado {
    type: left_outer
    sql_on: ${fato_swap.fim_mes_referencia_date} = ${fato_swap_realizado.fim_mes_referencia_date} ;;
    relationship: many_to_one
  }


}

explore: unpivot_dre {
  label: "Demonstração do Resultado"
  view_label: "Demonstração do Resultado"
}

explore: itau {
  label: "ITAU"
}

explore: documentacao {}

explore: iniciados_x_finalizados_lead {}
