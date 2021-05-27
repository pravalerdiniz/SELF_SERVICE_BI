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
  label: "Orçamento - Histórico"
  view_label: "Orçamento - Histórico"

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

explore: orcamento_atual {
  label: "Orçamento"
  access_filter: {
    field: descricao_cc
    user_attribute: acesso_orcamento
  }

}


explore: orcamento_frente {
  from: orcamento_atual
  label: "Orçamento Frente"
  access_filter: {
    field: frente
    user_attribute: orcamento_frente
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



explore: atribuicao_rv_itau {}

explore: orquestra_compra_carteira {
  label: "Orquestra - Compra de Carteira"
}

explore: base_trade {}

explore: report_builder_cargas {}
explore: report_builder_baixa {}
explore: curta_duracao {}

explore: jira {}

explore: pesquisa_perfil_aluno {

 join: pesquisa_perfil_aluno_banco {

  type:left_outer
  sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_perfil_aluno_banco.key_} ;;
  relationship: many_to_one
  }

  join: pesquisa_aluno_perfil_faz_com_frequencia {

    type:left_outer
    sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_aluno_perfil_faz_com_frequencia.key_} ;;
    relationship: many_to_one
  }

  join: pesquisa_aluno_perfil_servico_streaming {

    type:left_outer
    sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_aluno_perfil_servico_streaming.key_} ;;
    relationship: many_to_one
  }

  join: pesquisa_perfil_aluno_forma_pagamento {

    type:left_outer
    sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_perfil_aluno_forma_pagamento.key_} ;;
    relationship: many_to_one
  }

  join: pesquisa_perfil_aluno_jogos_online {

    type:left_outer
    sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_perfil_aluno_jogos_online.key_} ;;
    relationship: many_to_one
  }

  join: pesquisa_perfil_aluno_rede_social {

    type:left_outer
    sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_perfil_aluno_rede_social.key_} ;;
    relationship: many_to_one
  }

}
