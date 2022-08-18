connection: "graduado"

include: "/**/*.view.lkml"
# include all views in the views/ folder in this project
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


datagroup: self_service_bi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "5 hour"

}

explore:  fato_lead_mgm {
  label: "MGM Leads"
  fields: [ALL_FIELDS *,
    - alunos.flg_balcao
  ]
  join: alunos {
    view_label: "Informações Alunos"
    sql_on: ${alunos.cpf_aluno} = ${fato_lead_mgm.cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: ano_mes_carteira_ativa {
    fields: []
    sql_on: ${ano_mes_carteira_ativa.id_cpf} = ${alunos.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: status {
    view_label: "Status"
    sql_on: ${status.id_cpf} = ${fato_lead_mgm.id_cpf} ;;
    relationship: one_to_many
    type: left_outer
    fields: [status.status_destino_geral,
      status.status_destino_detalhado]
  }

  join: financeiro {
    view_label: "Financeiro"
    sql_on: ${financeiro.id_cpf} = ${fato_lead_mgm.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
    fields: [financeiro.data_pagamento_date]
  }
}


explore: mgm_lista_resgate {
  label: "MGM - Lista Resgate"
}
explore: mgm_publico_alvo {
  label: "MGM - Público Alvo"
  fields: [ALL_FIELDS *,
    - alunos.id_cpf,
    - alunos.ativo_ano_mes,
    - jornada.cpf_aluno_proposta,
    - jornada.aluno_email,
    - jornada.aluno_nome,
    - jornada.aluno_celular,
    - jornada.grupo_instituicao,
    - jornada.ds_instituicao,
    - jornada.ds_campus,
    - jornada.nm_modalidade_produto,
    - jornada.nm_produto,
    - jornada.ds_curso,
    - jornada.total_renov,
    - jornada.tempo_aprovies_enviodoc,
    - jornada.tempo_enviodoc_aguass,
    - jornada.var_mensalidade_cadastro_analiseies,
    - jornada.var_mensalidade_informada_analiseies,
    - jornada.var_median_mensalidade_cadastro_analiseies,
    - jornada.var_median_mensalidade_informada_analiseies,
    - alunos.flg_balcao,
    - jornada.flag_balcao,
    - jornada.flag_afiliados
  ]

  join: dim_cpf {
    view_label: "CPF"
    sql_on: ${mgm_publico_alvo.cpf_lead} = ${dim_cpf.cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: alunos {
    view_label: "1.Alunos"
    sql_on: ${mgm_publico_alvo.cpf_lead} = ${alunos.cpf_aluno} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: jornada {
    view_label: "2.Jornada"
    sql_on: ${mgm_publico_alvo.cpf_lead} = ${jornada.aluno_cpf} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: ano_mes_carteira_ativa {
    sql_on: ${ano_mes_carteira_ativa.id_cpf} = ${dim_cpf.id_cpf};;
    relationship: many_to_one
    type: left_outer
  }

}


explore: mgm_publico_alvo_jornada {
  label: "MGM - Público Alvo + Jornada"
  fields: [ALL_FIELDS *,
    - alunos.id_cpf,
    - alunos.ativo_ano_mes,
    - alunos.flg_balcao
  ]

  join: dim_cpf {
    view_label: "CPF"
    sql_on: ${mgm_publico_alvo_jornada.cpf_lead} = ${dim_cpf.cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: alunos {
    view_label: "1.Alunos"
    sql_on: ${mgm_publico_alvo_jornada.cpf_lead} = ${alunos.cpf_aluno} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: ano_mes_carteira_ativa {
    sql_on: ${ano_mes_carteira_ativa.id_cpf} = ${dim_cpf.id_cpf};;
    relationship: many_to_one
    type: left_outer
  }
}

explore: mgm_publico_alvo_resgate{
  label: "MGM - Público Alvo Resgate"
}
explore: mgm_usuario {
  label: "MGM - Usuário"

  join: mgm_lista_resgate{
    view_label: "Solicitou resgate"
    sql_on: ${mgm_usuario.cpf}=${mgm_lista_resgate.cpf_player} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: mgm_publico_alvo_resgate{
    view_label: "Pagamento realizado - resgate"
    sql_on: ${mgm_usuario.cpf}=${mgm_publico_alvo_resgate.cpf_player} ;;
    relationship: one_to_many
    type: left_outer
  }
}
