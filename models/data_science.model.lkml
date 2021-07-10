connection: "jornada"

access_grant: grupo_nome {
  user_attribute: grupo_nome
  allowed_values: ["grupo_nome"]

}

access_grant: grupo_telefone {
  user_attribute: grupo_telefone
  allowed_values: ["grupo_telefone"]
}


access_grant: grupo_endereco {
  user_attribute: grupo_endereco
  allowed_values: ["grupo_endereco"]
}

access_grant: grupo_email {
  user_attribute: grupo_email
  allowed_values: ["grupo_email"]
}

access_grant: grupo_renda {
  user_attribute: grupo_renda
  allowed_values: ["grupo_renda"]
}

access_grant: grupo_cpf {
  user_attribute: grupo_cpf
  allowed_values: ["grupo_cpf"]
}

map_layer: MAPA_ESTADO_ALUNO {
  file: "/MAPAS/uf.json"
}

map_layer: MAPA_CIDADE_ALUNO {
  file: "/MAPAS/municipio.json"
}

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
  view_label: "1. S&OP"

  join: s_op_previsao_flatten {
    view_label: "2. S&OP desagrupado"
    sql_on: ${s_op_previsao.mes_inicio_proposta_raw} = ${s_op_previsao_flatten.mes_inicio_proposta_raw}
        and ${s_op_previsao.classe_modelo_iniciado} = ${s_op_previsao_flatten.classe_modelo_iniciado}
        and ${s_op_previsao.grupo_instituicao} = ${s_op_previsao_flatten.grupo_instituicao}
        and ${s_op_previsao.regiao_campus} = ${s_op_previsao_flatten.regiao_campus}
        and ${s_op_previsao.canal_url} = ${s_op_previsao_flatten.canal_url};;
    relationship: one_to_many
    type: left_outer
  }

  join: proposta {
    view_label: "3. Proposta"
    sql_on: ${proposta.data_preenchimento_month} = ${s_op_previsao.mes_inicio_proposta_month}
        and ${proposta.classe_modelo_iniciado} = ${s_op_previsao.classe_modelo_iniciado}
        and ${s_op_previsao.canal_url} = ${proposta.canal_acesso_conversao}
        and ${s_op_previsao.grupo_instituicao} = ${proposta.grupo_instituicao}
        and ${s_op_previsao.regiao_campus} = ${proposta.regiao_campus};;
    relationship: one_to_many
    type: left_outer
    fields: [proposta.id_proposta, proposta.id_cpf, proposta.cpf_aluno, proposta.data_formalizacao_prevista_raw]
  }
}
