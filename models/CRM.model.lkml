connection: "crm"

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

include: "/**/*.view.lkml"

explore: tela_atendimento{
  label: "Tela de Atendimento"
  fields: [ALL_FIELDS *,
    - alunos.id_cpf,
    - alunos.ativo_ano_mes,
    - jornada.tempo_aprovies_enviodoc,
    - jornada.tempo_enviodoc_aguass,
    - jornada.var_mensalidade_cadastro_analiseies,
    - jornada.var_mensalidade_informada_analiseies,
    - jornada.var_median_mensalidade_cadastro_analiseies,
    - jornada.var_median_mensalidade_informada_analiseies,
    - proposta.flag_elegivel_semfiador_testeab,
    - proposta.flag_eleito_semfiador_testeab
  ]
  view_label: "1. Tela atendimento - Célula contratação"
  description: "Informações sobre os registros da Tela de Atendimento - Célula Final de Funil"

  join: chamados_tela_atendimento {
    view_label: "1. Tela atendimento - Todos chamados"
    sql_on: ${tela_atendimento.id_cpf}=${chamados_tela_atendimento.id_cpf} ;;
    relationship: many_to_many
    type: full_outer
  }

  join: tela_atendimento_jornada {
    view_label: "2. Jornada"
    sql_on: ${tela_atendimento.id_cpf}=${tela_atendimento_jornada.id_cpf} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: alunos {
    from: alunos
    view_label: "3. Dados Aluno"
    sql_on: ${tela_atendimento.id_cpf}=${alunos.id_cpf};;
    relationship: many_to_one
    type: left_outer
  }

  join: obj_persona_tela {
    view_label: "4. Persona - Germina"
    sql_on:  ${tela_atendimento.id_cpf}=${obj_persona_tela.id_cpf};;
    type: left_outer
    relationship: many_to_one
  }

  join: ano_mes_carteira_ativa {
    view_label: "5. Dados Aluno Ativo"
    sql_on: ${ano_mes_carteira_ativa.id_cpf} = ${tela_atendimento.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: proposta {
    view_label: "7. Proposta"
    sql_on: ${tela_atendimento_jornada.ID_PROPOSTA}=${proposta.id_proposta} ;;
    relationship: many_to_many
    type: full_outer
  }

  join: status {
    view_label: "6. Status"
    sql_on: ${tela_atendimento.id_cpf}=${status.id_cpf} ;;
    relationship: many_to_many
    type: full_outer
  }

  join: jornada {
    view_label: "8. Jornada"
    sql_on: ${tela_atendimento.id_cpf}=${jornada.id_cpf} ;;
    relationship: many_to_many
    type: full_outer
  }

  join: dim_cpf {
    view_label: "9. Dim cpf"
    sql_on: ${tela_atendimento.id_cpf}=${dim_cpf.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: jornada_pivot {
    view_label: "10. Jornada Pivot "
    sql_on: ${jornada_pivot.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_one
    type: left_outer
  }
}

explore: crm_customer {
  label: "CRM - Customer io"
  view_label: "1. CRM - Customer io"

#  join: dados_jornada_crm {
#    from: dados_jornada_crm
#    view_label: "2. Dados da Jornada"
#    sql_on: ${crm_customer.id_cpf}= ${dados_jornada_crm.id_cpf} ;;
#    relationship: many_to_many
#    type: left_outer
#  }

  join: crm_dados_zendesk {
    from: crm_dados_zendesk
    view_label: "3. Dados da Zendesk"
    sql_on: ${crm_customer.email}= ${crm_dados_zendesk.email} ;;
    relationship: many_to_many
    type: left_outer
  }
  }

explore: semestre_financiado {
    label: "Semestre Financiado Validação"
  }
