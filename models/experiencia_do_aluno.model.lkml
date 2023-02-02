connection: "crm"

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


}
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

explore: interacoes {
  label: "Interações - Tickets"
  view_label: "Interações - Tickets"
  description: "Apresenta os dados de interações realizadas pela Central de Atendimento"
  fields: [ALL_FIELDS *,
    - ano_mes_carteira_ativa *,
    - alunos.flg_balcao
  ]
  access_filter: {
    field: EMPRESA_AGENTE

    user_attribute: grupo_bpo
  }

  join: interacoes_detalhes_ligacao {
    view_label: "Detalhes de ligação"
    type: full_outer
    sql_on: ${interacoes.id_ticket} = ${interacoes_detalhes_ligacao.id_ticket};;
    relationship: one_to_one
  }


  join: interacoes_metricas_tickets {
    view_label: "Métricas dos Tickets"
    type: left_outer
    sql_on: ${interacoes.id_ticket} = ${interacoes_metricas_tickets.ticket_id};;
    relationship: one_to_one
  }


  join: interacoes_apontamentos_monitoria {
    view_label: "Apontamentos de Monitoria"
    type: left_outer
    sql_on: ${interacoes.id_ticket} = ${interacoes_apontamentos_monitoria.id_ticket};;
    relationship: one_to_many

  }

  join: dim_cpf {
    view_label: "CPF"
    sql_on: ${interacoes.cpf_requester_num} = ${dim_cpf.cpf} ;;
    relationship: one_to_many
    type: left_outer
  }


  join: alunos {
    view_label: "Alunos"
    sql_on: ${dim_cpf.id_cpf} = ${alunos.id_cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: ano_mes_carteira_ativa {
    view_label: "Ano Mes Carteira Ativa"
    sql_on: ${dim_cpf.id_cpf} = ${ano_mes_carteira_ativa.id_cpf};;
    type: left_outer
    relationship: one_to_many
  }


  join: dados_jornada_interacoes {
    from: dados_jornada_interacoes
    view_label: "Jornada"
    sql_on: ${interacoes.cpf_requester}= ${dados_jornada_interacoes.cpf_requester} ;;
    relationship: many_to_many
    type: left_outer
  }

  join: twoclix_detalhes_avaliacao {
    view_label: "Monitoria - Detalhes Avaliação(TwoClix)"
    sql_on: ${interacoes.codigo_avaliacao}=${twoclix_detalhes_avaliacao.cod_avaliacao};;
    type: left_outer
    relationship: one_to_many
  }
}


explore: crx_agentes{
  label: "Interações - Métricas do agente"
  view_label: "Interações - Métricas do agente"
  description: "Apresenta os dados de pausas, disponibilidade, tempos médios por agente"
}

explore: crx_agentes_detalhes_pausas{
  label: "Interações - Métricas de pausa"
  view_label: "Interações - Métricas de pausa"
  description: "Apresenta os dados de pausas, disponibilidade, tempos médios por agente"
  fields: [ALL_FIELDS * ,
    - crx_agentes.count,
    - crx_agentes.nome_data ,
    - crx_agentes.dias_logados ,
    - crx_agentes.sum_dias_logados,
    - crx_agentes.media_tempo_logado_dia ,
    - crx_agentes.media_tempo_logado_sessao ,
    - crx_agentes.media_tempo_pausado_dia ,
    - crx_agentes.pausas ,
    - crx_agentes.produtividade ,
    - crx_agentes.qtd_atendimento_ativo ,
    - crx_agentes.qtd_atendimento_receptivo ,
    - crx_agentes.qtd_ligacoes_atendidas ,
    - crx_agentes.qtd_ligacoes_nao_atendidas ,
    - crx_agentes.qtd_pausas ,
    - crx_agentes.qtd_recusa ,
    - crx_agentes.sla_atendimento ,
    - crx_agentes.tempo_maximo_ligacao ,
    - crx_agentes.tempo_medio_falado ,
    - crx_agentes.tempo_medio_pausado ,
    - crx_agentes.tempo_minimo_ligacao ,
    - crx_agentes.tempo_ociosidade ,
    - crx_agentes.tempo_total_falado ,
    - crx_agentes.tempo_total_logado ,
    - crx_agentes.tempo_total_pausado ,
    - crx_agentes.media_sla_atendimento


  ]
  join: crx_agentes{
    view_label: "Detalhes do Agente"

    type: inner
    sql_on: ${crx_agentes.id} = ${crx_agentes_detalhes_pausas.id};;
    relationship: many_to_one
  }
}

explore: solucx {
  label: "SoluCX - NPS"
  view_label: "1. Solucx"
  description: "Dados da ferramenta de disparo das pesquisas de NPS Transacional e Relacional."


  join: depara_respondentes_ies {
    view_label: "1. Solucx"
    type: left_outer
    sql_on: ${solucx.email_aluno} = ${depara_respondentes_ies.email} ;;
    relationship: many_to_one
  }

  join: depara_grupo_gerente {
    view_label: "2. Gerente Atual"
    type: left_outer
    sql_on:  ${depara_grupo_gerente.grupo_instituicao} = ${depara_respondentes_ies.grupo};;
    relationship: many_to_one
    fields: [gerente]
  }

  join: solucx_transaction {
    view_label: "3. Transações"
    type: full_outer
    sql_on: ${solucx.id} = ${solucx_transaction.id} ;;
    relationship: many_to_many
  }
}

explore: solucx_nps_ajustado {
  label: "SoluCX - NPS Ajustado"
  description: "Para o cálculo da meta do NPS, ficou decidido comparar os respondentes de 2022 seguindo a distribuição média de respondentes de 2021. Foi preciso criar um SQL personalizado para tal acompanhamento."
}

explore: view_solucx_ajustado_meta {
  label: "SoluCX - NPS Ajustado Meta"
  description: "Para o cálculo da meta do NPS, ficou decidido comparar os respondentes de 2022 seguindo a distribuição média de respondentes de 2021. Foi preciso criar um SQL personalizado para tal acompanhamento."
}

explore: taxa_de_contato{
  label: "Taxa de Contato"
  description: " A taxa de contato faz um join entre a base de alunos, considerando todos os alunos ativos e cedidos por mês a partir de 2021, e a base de tickets, com a quantidade de tickets desses alunos em cada mês. Assim é possível calcular a taxa de contato."
}


explore: nps_nuvem_palavras_detratores {
  label: "SoluCX - Nuvem de Palavras (Detratores)"
  description: "Palavras mais comentadas pelos alunos detratores nas pesquisas de NPS Relacional no ano atual"
}

explore: nps_nuvem_palavras_neutros {
  label: "SoluCX - Nuvem de Palavras (Neutros)"
  description: "Palavras mais comentadas pelos alunos neutros nas pesquisas de NPS Relacional no ano atual"
}

explore: nps_nuvem_palavras_promotores {
  label: "SoluCX - Nuvem de Palavras (Promotores)"
  description: "Palavras mais comentadas pelos alunos promotores nas pesquisas de NPS Relacional no ano atual"
}

explore: nuvem_palavras_reclame_aqui_geral {
  label: "Reclame Aqui - Nuvem de Palavras"
  description: "Palavras mais comentadas pelos alunos que tiveram uma reclamação nas reclamações do Reclame Aqui nos últimos 6 meses"
}


explore: taxa_de_contato_alunos_ativos{
  label: "Taxa de Contato de Alunos Ativos"
  description: "A taxa de contato faz um join entre a base de alunos, considerando todos os alunos ativos por mês a partir de 2021, e a base de tickets, com a quantidade de tickets desses alunos em cada mês. Assim é possível calcular a taxa de contato."
}


explore: ra_tickets_metas{
  label: "Reclame Aqui - Metas"
  description: "Essa base trás o cálculo para avaliações faltantes para bater a meta dos indicadores de 'Voltaria Fazer Negócio' e 'Seu Problema foi Resolvido'."
}

explore: reclame_aqui{
  label: "Reclame Aqui"
  description: " Essa base trás as reclamações do Reclame Aqui."
}

explore: interacoes_metricas_tickets{
  label: "Interações - Métricas dos Tickets"
  description: " Essa base trás as métricas dos tickets."
}

explore: tickets_mundiale_zendesk {
  label: "Tickets Mundiale e Zendesk"
  view_label: "1. Mundiale e Zendesk"
  description: " Essa base trás as informações Mundiale (BOT, CHAT e WHATSAPP) e da Zendesk (LIGAÇÃO E T2) com revisão das Regras de Negócios."
  fields: [ALL_FIELDS *,
    - ano_mes_carteira_ativa *,
    - dim_cpf *,
    - interacoes_metricas_tickets.ticket_id,
    - alunos.ativo_ano_mes,
    - alunos.flg_balcao,
    - proposta.flag_elegivel_semfiador_testeab,
    - proposta.flag_produtos_semfiador_testeab
  ]

  join: interacoes_detalhes_ligacao {
    view_label: "2. Ligação (55pbx)"
    type: full_outer
    sql_on: ${tickets_mundiale_zendesk.zendesk_id} = ${interacoes_detalhes_ligacao.id_ticket};;
    relationship: one_to_one
  }

  join: interacoes_metricas_tickets {
    view_label: "3. Métricas dos Tickets da Zendesk"
    type: left_outer
    sql_on: ${tickets_mundiale_zendesk.zendesk_id} = ${interacoes_metricas_tickets.ticket_id};;
    relationship: one_to_one
  }

  join: alunos {
    view_label: "4. Alunos"
    sql_on: ${tickets_mundiale_zendesk.cpf_cliente_num} = ${alunos.cpf_aluno};;
    type: left_outer
    relationship: many_to_many
  }

  join: proposta {
    view_label: "5. Proposta"
    sql_on: ${tickets_mundiale_zendesk.cpf_cliente_num} = ${proposta.cpf_aluno};;
    type: left_outer
    relationship: many_to_many
  }

  join: dados_jornada_interacoes {
    view_label: "6. Jornada"
    sql_on: ${tickets_mundiale_zendesk.cpf_cliente}= ${dados_jornada_interacoes.cpf_requester} and ${proposta.id_proposta} = ${dados_jornada_interacoes.ID_PROPOSTA};;
    relationship: many_to_many
    type: left_outer
  }

  join: status {
    view_label: "7. Status"
    sql_on: ${tickets_mundiale_zendesk.cpf_cliente_num} = ${proposta.cpf_aluno} and ${proposta.id_proposta} = ${status.id_proposta} ;;
    relationship: many_to_many
    type: left_outer
  }

  join: nps_relacional_ultima_nota {
    view_label: "8. NPS mais Recente do Aluno"
    sql_on: ${tickets_mundiale_zendesk.cpf_cliente_num} = ${nps_relacional_ultima_nota.cpf_aluno};;
    type: left_outer
    relationship: many_to_many
  }

  join: dim_cpf {
    view_label: "CPF"
    sql_on: ${tickets_mundiale_zendesk.cpf_cliente_num} = ${dim_cpf.cpf} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: ano_mes_carteira_ativa {
    view_label: "Ano Mes Carteira Ativa"
    sql_on: ${dim_cpf.id_cpf} = ${ano_mes_carteira_ativa.id_cpf};;
    type: left_outer
    relationship: one_to_many
  }


}


explore: taxa_de_contato_alunos_ativos_nova{
  label: "Taxa de Contato de Alunos Ativos"
  view_label: "1. Taxa de Contato"
  description: "A taxa de contato faz um join entre a base de alunos, considerando todos os alunos ativos por mês a partir de 2021, e a base de tickets, contando a quantidade de tickets desses alunos em cada mês. Valores atualizados, considerando dados da Zendesk e da Mundiale, bem como revisão das regras de negócio."


  join: taxa_de_contato_analitico {
    view_label: "2. Analítico"
    sql_on: ${taxa_de_contato_alunos_ativos_nova.ano_mes} = ${taxa_de_contato_analitico.ano_mes};;
    type: left_outer
    relationship: one_to_many
  }

}




  explore: contatos_pravaler {
    label: "Contatos Pravaler"
    view_label: "1. Mundiale Zendesk e 55pbx"
    description: " Essa base trás as informações Mundiale (BOT, CHAT e WHATSAPP), Zendesk (LIGAÇÃO E T2) e 55PBX (URA) com revisão das Regras de Negócios."
    fields: [ALL_FIELDS *,
      - ano_mes_carteira_ativa *,
      - dim_cpf *,
      - interacoes_metricas_tickets.ticket_id,
      - alunos.ativo_ano_mes,
      - alunos.flg_balcao,
      - proposta.flag_elegivel_semfiador_testeab,
      - proposta.flag_produtos_semfiador_testeab
    ]

    join: interacoes_detalhes_ligacao {
      view_label: "2. Ligação (55pbx)"
      type: full_outer
      sql_on: ${contatos_pravaler.zendesk_id} = ${interacoes_detalhes_ligacao.id_ticket};;
      relationship: one_to_one
    }

    join: interacoes_metricas_tickets {
      view_label: "3. Métricas dos Tickets da Zendesk"
      type: left_outer
      sql_on: ${contatos_pravaler.zendesk_id} = ${interacoes_metricas_tickets.ticket_id};;
      relationship: one_to_one
    }

    join: alunos {
      view_label: "4. Alunos"
      sql_on: ${contatos_pravaler.cpf_aluno_num} = ${alunos.cpf_aluno};;
      type: left_outer
      relationship: many_to_many
    }

    join: proposta {
      view_label: "5. Proposta"
      sql_on: ${contatos_pravaler.cpf_aluno_num} = ${proposta.cpf_aluno};;
      type: left_outer
      relationship: many_to_many
    }

    join: dados_jornada_interacoes {
      view_label: "6. Jornada"
      sql_on: ${contatos_pravaler.cpf_aluno}= ${dados_jornada_interacoes.cpf_requester} and ${proposta.id_proposta} = ${dados_jornada_interacoes.ID_PROPOSTA};;
      relationship: many_to_many
      type: left_outer
    }

    join: status {
      view_label: "7. Status"
      sql_on: ${contatos_pravaler.cpf_aluno_num} = ${proposta.cpf_aluno} and ${proposta.id_proposta} = ${status.id_proposta} ;;
      relationship: many_to_many
      type: left_outer
    }

    join: nps_relacional_ultima_nota {
      view_label: "8. NPS mais Recente do Aluno"
      sql_on: ${contatos_pravaler.cpf_aluno_num} = ${nps_relacional_ultima_nota.cpf_aluno};;
      type: left_outer
      relationship: many_to_many
    }

    join: dim_cpf {
      view_label: "CPF"
      sql_on: ${contatos_pravaler.cpf_aluno_num} = ${dim_cpf.cpf} ;;
      relationship: one_to_many
      type: left_outer

    }

    join: ano_mes_carteira_ativa {
      view_label: "Ano Mes Carteira Ativa"
      sql_on: ${dim_cpf.id_cpf} = ${ano_mes_carteira_ativa.id_cpf};;
      type: left_outer
      relationship: one_to_many
    }



}
