connection: "pos_graduado"

include: "/**/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.dashboard.lookml"            # include all files dashboard.lookml
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

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

explore: student_intercambio {
  label: "Intercambio - Produto Piloto"
  description: "Dados gerais do produto piloto de intercambio"

  join: contracts_intercambio {
    view_label: "Contratos - Intercambio"
    relationship: one_to_many
    type: left_outer
    sql_on: ${student_intercambio.id_aluno} = ${contracts_intercambio.id_aluno};;
  }

  join: status_intercambio {
    view_label: "Status Intercambio"
    relationship: one_to_many
    type: left_outer
    sql_on: ${student_intercambio.id_aluno} = ${status_intercambio.id_aluno};;
}
}
