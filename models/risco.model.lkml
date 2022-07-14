connection: "graduado"

include: "/**/*.view.lkml"

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
}# include all views in the views/ folder in this project
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



explore: alunos {
  label: "Portfólio"

  join: alunos_inadimplencia_3_book {
    view_label: "1.2 Book Inadimplência"
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_3_book.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_book_produtos {
    view_label: "1.3 Book Inadimplência (Produtos)"
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_book_produtos.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_book_wo {
    view_label: "1.4 Book Inadimplência - W.O "
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_book_wo.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_fyf {
    view_label: "1.5 FYF - W.O "
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_fyf.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_carteira_atrasado {
    view_label: "1.6.1 Carteira - Atrasado"
    sql_on: ${alunos.cpf_aluno} = ${base_carteira_atrasado.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_carteira_atraso_produto {
    view_label: "1.6.2 Carteira - Atrasado (Produto)"
    sql_on: ${alunos.cpf_aluno} = ${base_carteira_atraso_produto.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_carteira_risco {
    view_label: "1.6 Carteira"
    sql_on: ${alunos.cpf_aluno} = ${base_carteira_risco.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_caixa_projecao_carteira {
    view_label: "1.6.3 Carteira - Base Projeção"
    sql_on: ${alunos.cpf_aluno} = ${base_caixa_projecao_carteira.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_base_recuperacao {
    view_label: "1.6.4 Carteira - Recuperação"
    sql_on: ${alunos.cpf_aluno} = ${alunos_base_recuperacao.tdt_cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_sp_fitch_rating {
    view_label: "1.7 S&P - Fitch Rating"
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_sp_fitch_rating.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: ano_mes_carteira_ativa {}






}
