connection: "crm"

include: "/**/*.view.lkml"               # include all views in the views/ folder in this project


map_layer: MAPA_ESTADO_ALUNO {
  file: "/MAPAS/uf.json"
}

map_layer: MAPA_CIDADE_ALUNO {
  file: "/MAPAS/municipio.json"
}


access_grant: grupo_cpf {
  user_attribute: grupo_cpf
  allowed_values: ["grupo_cpf"]
}

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


explore: instituicao_metas_gc {
  label: "Metas - Grupo"
  view_label: "1. Meta Grupo IES"
  join: dias_uteis
  {
    view_label: "5. Dias Úteis"
    sql_on:  ${instituicao_metas_gc.data_meta_date} = ${dias_uteis.ds_date};;
    type: left_outer
    relationship: many_to_one
  }

  join: engajometro
  {
    view_label: "4. Engajometro"
    sql_on:  ${instituicao_metas_gc.data_meta_date} = ${engajometro.data};;
    type: left_outer
    relationship: many_to_one
  }

  join: meta_conversao_grupo_ies
  {
    view_label: "3. Meta Conversão Grupo IES"
    sql_on:  ${instituicao_metas_gc.data_meta_month} = ${meta_conversao_grupo_ies.data_meta_month} and
      ${instituicao_metas_gc.grupo_instituicao} = ${meta_conversao_grupo_ies.grupo};;
    type: full_outer
    relationship: many_to_one
  }

  join: meta_conv_grupo_ies_new
  {
    view_label: "3. Meta Conversão Grupo IES Novo"
    sql_on:  ${instituicao_metas_gc.data_meta_date} = ${meta_conv_grupo_ies_new.data_meta_date} and
      ${instituicao_metas_gc.grupo_instituicao} = ${meta_conv_grupo_ies_new.grupo};;
    type: left_outer
    relationship: many_to_one
  }

  join: meta_sla_comercial
  {
    view_label: "2. Meta SLA"
    sql_on: ${instituicao_metas_gc.gerente} = ${meta_sla_comercial.gerente};;
    type: left_outer
    relationship: many_to_one
  }

  join: meta_comercial_grupo
  {
    view_label: "6. Meta Mensal Grupo (Simulador)"
    sql_on: ${instituicao_metas_gc.grupo_instituicao} = ${meta_comercial_grupo.grupo};;
    type: left_outer
    relationship: many_to_one
  }

  join: sazonalidade_mensal_meta
  {
    view_label: "7. Sazonalidade (Simulador)"
    sql_on: ${instituicao_metas_gc.data_meta_date} = ${sazonalidade_mensal_meta.date};;
    type: left_outer
    relationship: many_to_one
  }



}

explore: projecao_formalizados {
  label: "Projeção Formalizados Jornada"
  view_label: "Projeção Formalizados Jornada"
}

explore: projecao_formalizados_grupo_ies {
  label: "Projeção Formalizados - Grupo IES"
  view_label: "Projeção Formalizados - Grupo IES"
}

explore: vw_pipedrive_deals_pipeline {
  label: "Pipedrive Graduação"
  view_label: "1. Negócios"

  join: vw_pipedrive_deals_atividades {
    view_label: "2. Atividade"
    sql_on: ${vw_pipedrive_deals_pipeline.id_negocio}=${vw_pipedrive_deals_atividades.id_negocio} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: obj_pipedrive_etapa {
    view_label: "3. Etapas Funil"
    sql_on: ${vw_pipedrive_deals_pipeline.id_negocio} = ${obj_pipedrive_etapa.id_negocio} ;;
    type: left_outer
    relationship: one_to_many
  }
}


explore: aproveitamento_estoque_nok{
  label: "Aproveitamento Estoque"
}

#explore: metas_distribuidas {
#  label: "Comercial - Metas Distribuídas"
#}

explore: simulador_etapas {
  label: "Comercial - Simulador Etapas Funil"
}

explore: leads_afiliados {
  label: "Afiliados"
  view_label: "1. Leads Afiliados"
  fields: [ALL_FIELDS *,
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
    - jornada.flag_balcao,
    - jornada.flag_afiliados
  ]

  join: dim_cpf {
    from: dim_cpf
    view_label: "2. Dim cpf"
    sql_on: ${leads_afiliados.CPF_LEAD} = ${dim_cpf.cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: jornada {
    from:  jornada
    view_label: "2. Jornada"
    sql_on: ${jornada.id_cpf} = ${dim_cpf.id_cpf};;
    type: left_outer
    relationship: one_to_many
  }

}

explore: vw_homolog_comissao {
  label: "Comissão - Atendentes Afiliados"
  view_label: "Atendentes Balcão"
  description: "Informações relacionadas à comissão dos atendentes do balcão da IES"

  join: balcao_comissoes {
    view_label: "Comissões por atendente"
    sql_on: ${vw_homolog_comissao.cpf_atendente_ies} = ${balcao_comissoes.cpf_afiliado};;
    type: left_outer
    relationship: one_to_many
  }

  join: depara_grupo_gerente {
    view_label: "Atendentes Balcão"
    sql_on: ${vw_homolog_comissao.nome_grupo_instituicao} = ${depara_grupo_gerente.grupo_instituicao};;
    type: left_outer
    relationship: many_to_one
  }
}
