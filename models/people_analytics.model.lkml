connection: "farol"

include: "/**/*.view.lkml"

# include all views in the views/ folder in this project
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

explore: dados_demograficos {
  view_label: "Dados Demográficos"
  description: "Informações sobre região onde residem os colaboradores do Pravaler"
}

explore: historico_demograficos {
  view_label: "Dados Demográficos"
  description: "Informações sobre histórico da região onde residem os colaboradores do Pravaler"
}

explore: historico_turnover {
  label: "Histórico de Turnovers"
  view_label: "Dados Turnover"
  description: "Informações históricas sobre Turnover dos colaboradores do Pravaler"
}

explore: vw_historico_turnover {
  label: "Histórico de Turnover"
  view_label: "Dados dos Pravalentes"
  description: "Informações históricas sobre Turnover dos colaboradores do Pravaler"
}

explore: nps_processo_seletivo {
  label: "NPS processo seletivo"
  view_label: "NPS processo seletivo"
  description: "Respostas coletadas pela pesquisa NPS do processo seletivo"
}

explore: gupy_candidaturas {
  label: "Dados sobre as candidaturas na GUPY"
  description: "Informações sobre vagas, candidatos e acompanhamento de candidaturas"

  join: gupy_vagas {
    view_label: "Gupy Vagas (Base Vagas)"
    relationship: many_to_one
    type: left_outer
    sql_on: ${gupy_candidaturas.id_vaga} = ${gupy_vagas.codigo} ;;
  }

}

explore: gupy_vagas_por_status {
  label: "Vagas Gupy por status"
  description: "Informações em formato de Snapshot para as vagas da Gupy"

  join: gupy_vagas  {
    view_label: "Gupy Vagas (Base Vagas)"
    relationship: one_to_one
    type: inner
    sql_on: ${gupy_vagas.codigo} = ${gupy_vagas_por_status.codigo} ;;
  }
}

explore: gupy_vagas {
  label: "Dados sobre as vagas na GUPY"
  description: "Informações sobre vagas cadastradas na plataforma Gupy"

  join: gupy_vagas_por_status {
    view_label: "Gupy Vagas (Por status)"
    relationship: one_to_one
    type: inner
    sql_on: ${gupy_vagas.codigo} = ${gupy_vagas_por_status.codigo} ;;
  }
}

explore: pulse {
  label: "Pulse"
  view_label: "Pulse"
  description: "Apresenta os resultados da pulse realizada com os pravalentes."
}

explore: enps {
  label: "e-NPS"
  view_label: "e-NPS"


  join: enps_flatten {
    view_label: "e-NPS por Palavra"
    relationship: one_to_many
    type: left_outer
    sql_on: ${enps.id_resposta} = ${enps_flatten.id_resposta} ;;
  }
}

# Comunicação Interna
explore: slack_resumo_analitico {
  label: "Slack - Resumo corporativo"
  view_label: "Resumo"
  description: "Informações analíticas sobre o uso corporativo do Slack"
}

explore: slack_analitico_canais {
  label: "Slack - Analítico canais"
  view_label: "Canal"
  description: "Informações analíticas sobre os canais do Slack"
}

explore: slack_analitico_membros {
  label: "Slack - Analítico membros"
  view_label: "Membros"
  description: "Informações analíticas sobre os membros do Slack"
}

# Employer branding
explore: instagram_insights {
  label: "Instagram - Insights e acompanhamentos"
  view_label: "Insights"
  description: "Informações analíticas sobre a página do Pravaler no Instagram"
}
