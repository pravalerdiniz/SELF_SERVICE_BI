connection: "graduado"

include: "/**/*.dashboard.lookml"

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

datagroup: self_service_bi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "5 hour"
}

persist_with: self_service_bi_default_datagroup

explore: beneficiados {
  persist_for: "24 hours"
  label: "Histórico de Beneficiados"
  view_label: "Histórico de Beneficiados"
  description: "Mostra os dados de todos os contratos cedidos pelo PRAVALER"
  fields: [ALL_FIELDS *,
    - jornada.id_cpf,
    - jornada.id_proposta,

  ]

  join: proposta {
    view_label: "Proposta"
    sql_on: ${beneficiados.id_proposta} = ${proposta.id_proposta} ;;
    type: left_outer
    relationship: one_to_many
    fields: [proposta.carteira_atual,
             proposta.carteira_original,
             proposta.regional_atual,
             proposta.regional_original,
             proposta.cp_atual,
             proposta.cp_original,
             proposta.gerente_atual,
             proposta.gerente_original,
             proposta.conversao_atual,
             proposta.conversao_original,
             proposta.representante_atual,
             proposta.representante_original,
             proposta.regional_atual,
             proposta.regional_original,
             proposta.tipo_atual,
             proposta.tipo_original,
             proposta.id_fundo_investimento,
             proposta.ds_fundo_investimento,
             proposta.nm_originador,
             proposta.canal_detalhado_conversao,
             proposta.canal_detalhado_descoberta,
             proposta.canal_acesso_conversao,
             proposta.canal_acesso_descoberta,
             proposta.ds_url_conversao,
             proposta.ds_url_descoberta,
             proposta.cpf_aluno,
            proposta.nm_produto_comercial

             ]

  }


  join: jornada {
    view_label: "Jornada"
    sql_on:  ${beneficiados.id_proposta} = ${jornada.id_proposta} ;;
    type: left_outer
    relationship: one_to_many



  }

  join: dim_cpf {
    view_label: "1. CPF"
    sql_on: ${jornada.id_cpf} = ${dim_cpf.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }


  join: jornada_pivot {
    view_label: "1.2 Jornada Pivot "
    sql_on: ${jornada_pivot.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_one
    type: left_outer
  }

}

explore: inep {
  label: "Inep"
  view_label: "Inep"
  description: "Censo da Educacional Superior de 2014 a 2018"

  join: inep_curso_qtd_vagas_inep {
    view_label: "Inep - Quantidade de Vagas Curso"
    type: left_outer
    sql_on: ${inep.id_curso} = ${inep_curso_qtd_vagas_inep.id_curso} and
          ${inep.ano_censo} = ${inep_curso_qtd_vagas_inep.ano_censo} and
          ${inep.id_ies} = ${inep_curso_qtd_vagas_inep.id_ies};;
    relationship: many_to_one

  }
}

explore: inep_lgpd {
  label: "Inep - Estrutura LGPD"
  view_label: "Inep - Estrutura LGPD"
  description: "Censo da Educacional Superior de 2020 em diante (Readequação dos dados disponibilizados pelo INEP)."
}

explore: instituicao_metas_gc {

  join: dias_uteis
  {
    sql_on:  ${instituicao_metas_gc.data_meta_date} = ${dias_uteis.ds_date};;
    type: left_outer
    relationship: many_to_one
  }

  join: engajometro
  {
    sql_on:  ${instituicao_metas_gc.data_meta_date} = ${engajometro.data};;
    type: left_outer
    relationship: many_to_one
  }

  join: meta_conversao_grupo_ies
  {
    sql_on:  ${instituicao_metas_gc.data_meta_month} = ${meta_conversao_grupo_ies.data_meta_month} and
             ${instituicao_metas_gc.grupo_instituicao} = ${meta_conversao_grupo_ies.grupo};;
    type: full_outer
    relationship: many_to_one
  }

  join: meta_conv_grupo_ies_new
  {
    sql_on:  ${instituicao_metas_gc.data_meta_date} = ${meta_conv_grupo_ies_new.data_meta_date} and
             ${instituicao_metas_gc.grupo_instituicao} = ${meta_conv_grupo_ies_new.grupo};;
    type: left_outer
    relationship: many_to_one
  }

  join: meta_sla_comercial
  {
    sql_on: ${instituicao_metas_gc.gerente} = ${meta_sla_comercial.gerente};;
    type: left_outer
    relationship: many_to_one
  }

}

explore: status {
  persist_for: "1 hours"
  access_filter: {
    field: grupo_instituicao
    user_attribute: grupo_ies
  }
  label: "Status"
  view_label: "1. Status "
  description: "Apresenta os dados de todos status que a proposta do aluno esteve."
  fields: [ALL_FIELDS *,
    - proposta.id_cpf,
    - proposta.id_elegivel,
    - proposta.id_proposta,
    - proposta.tipo_proposta,
    - financeiro.id_cpf,
    - alunos.id_cpf,
    - alunos.ativo_ano_mes
  ]

  join: proposta
  {
    view_label: "2. Proposta"
    sql_on:  ${proposta.id_proposta} = ${status.id_proposta};;
    type: left_outer
    relationship: many_to_one
  }

  join: proposta_projeto_decola {
    view_label: "2.1 Acordos - Projeto Decola"
    sql_on: ${proposta_projeto_decola.id_proposta} = ${proposta.id_proposta} and
          ${proposta_projeto_decola.id_cpf} = ${proposta.id_cpf}
          ;;
    relationship: one_to_many
    type: left_outer
  }


  join: alunos {
    view_label: "3. Alunos"
    sql_on: ${alunos.id_cpf} = ${status.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }


  join: financeiro {
    view_label: "4. Financeiro"
    sql_on: ${status.id_cpf} = ${financeiro.id_cpf} and ${status.id_proposta} = ${financeiro.id_contrato} ;;
    relationship: one_to_many
    type: left_outer
  }




}

explore: jornada {
  view_name: jornada
  persist_for: "1 hours"
  access_filter: {
    field: grupo_instituicao
    user_attribute: grupo_ies
  }
  view_label: "1. Jornada"
  description: "Apresenta toda a jornada do aluno dentro da esteira de contração do PRAVALER"
  fields: [ALL_FIELDS *, - proposta.id_status_detalhado,
    - proposta.ds_ult_status,
    - proposta.id_status_detalhado,
    - proposta.tipo_proposta,
    - proposta.id_proposta,
    - proposta.id_elegivel,
    - proposta.etapa_ult_status,
    - proposta.count_tipo_proposta_novo,
    - proposta.count_tipo_proposta_reempacotado,
    - proposta.count_tipo_proposta_renegociacao,
    - proposta.count_tipo_proposta_renovacao,
    - proposta.count_tipo_proposta_seg_repasse,
    - status.id_cpf,
    - status.flg_proposta_atual,
    - status.tipo_proposta,
    - alunos.id_cpf,
- alunos.id_proposta_atual,
- alunos.aluno_nome,
- alunos.aluno_idade,
- alunos.aluno_genero,
- alunos.email,
- alunos.celular,
- alunos.escolaridade,
- alunos.numero_dependentes,
- alunos.cep,
- alunos.bairro,
- alunos.cidade,
- alunos.uf,
- alunos.tipo_residencia,
- alunos.estado_civil,
- alunos.tempo_empresa,
- alunos.natureza_ocupacao,
- alunos.profissao,
- alunos.nacionalidade,
- alunos.renda_mensal,
- alunos.renda_fam_mensal,
- alunos.ds_trabalha,
- alunos.ano_termino_ensino_medio,
- alunos.flg_pai_falecido,
- alunos.flg_mae_falecida,
- alunos.id_fia_cpf_atual,
- alunos.fia_nome,
- alunos.fia_email,
- alunos.fia_celular,
- alunos.fia_escolaridade,
- alunos.fia_numero_dependentes,
- alunos.fia_cep,
- alunos.fia_bairro,
- alunos.fia_cidade,
- alunos.fia_uf,
- alunos.fia_tipo_residencia,
- alunos.fia_estado_civil,
- alunos.fia_tempo_empresa,
- alunos.fia_natureza_ocupacao,
- alunos.fia_profissao,
- alunos.fia_nacionalidade,
- alunos.fia_renda_mensal,
- alunos.fia_parentesco,
- alunos.fia_idade,
- alunos.cpf_fiador,
- alunos.qtd_cursos_procurados,
- alunos.id_curso,
- alunos.ds_curso,
- alunos.flg_curso_ativo,
- alunos.periodo_curso,
- alunos.area_conhecimento_curso,
- alunos.enfase_curso,
- alunos.qtd_semestre_curso,
- alunos.nivel_curso,
- alunos.id_instituicao,
- alunos.ds_instituicao,
- alunos.grupo_instituicao,
- alunos.cidade_instituicao,
- alunos.uf_instituicao,
- alunos.flg_instituicao_ativa,
- alunos.qtd_campus_procurados,
- alunos.id_campus,
- alunos.ds_campus,
- alunos.flg_campus_ativo,
- alunos.cidade_campus,
- alunos.uf_campus,
- alunos.id_produto,
- alunos.nm_produto,
- alunos.flg_produto_ativo,
- alunos.nm_modalidade_produto,
- alunos.tipo_produto,
- alunos.fia_endereco,
- alunos.mapa_uf_fiador,
- alunos.mapa_uf_aluno,
- alunos.mapa_uf_campus,
- alunos.mapa_uf_instituicao,
- alunos.cpf_aluno,
- alunos.endereco,
- alunos.ds_fundo_investimento,
- alunos.id_fundo_investimento,
- alunos.ativo_ano_mes


  ]


  join: atribuicao_nova {
    view_label: "1.1. Atribuição"
    sql_on:  ${atribuicao_nova.id_cpf} = ${jornada.id_cpf} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: atribuicao_urls {
    view_label: "1.1. Atribuição"
    sql_on:  ${atribuicao_urls.id_cpf} = ${jornada.id_cpf} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: proposta {
    view_label: "2. Proposta"
    sql_on: ${proposta.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_one
    type: left_outer
  }

join: flag_unico_aluno {
  view_label: "2. Proposta"
  sql_on: ${jornada.id_proposta} = ${flag_unico_aluno.id_proposta} ;;
  relationship: one_to_one
  type: left_outer
}

  join: flag_unico_garantidor {
    view_label: "2. Proposta"
    sql_on: ${jornada.id_proposta} = ${flag_unico_garantidor.id_proposta} ;;
    relationship: one_to_one
    type: left_outer
  }

  join: flag_renda_presumida {
    view_label: "2. Proposta"
    sql_on: ${jornada.id_proposta} = ${flag_renda_presumida.id_proposta} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: flag_renda_presumida_garant {
    view_label: "2. Proposta"
    sql_on: ${jornada.id_proposta} = ${flag_renda_presumida_garant.id_proposta} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: jornada_pivot {
    view_label: "1.2 Jornada Pivot "
    sql_on: ${jornada_pivot.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_one
    type: left_outer
  }

 # join: instituicao {
#    view_label: "3. Instituição "
  #  sql_on: ${proposta.id_instituicao} = ${instituicao.id_instituicao} and ${proposta.id_proposta} = ${jornada.id_proposta};;
  #  relationship: many_to_many
  #  type: left_outer

  #}

  join: instituicao_contrato_produto_info {
    view_label: "3.1 Instituição - Contrato por Produto"
    sql_on: ${jornada.id_instituicao} = ${instituicao_contrato_produto_info.id_instituicao} ;;
    relationship: many_to_many
    type: left_outer
  }



  join: instituicao_metas_gc {
    view_label: "2.1 Metas GC"
    sql_on: ${proposta.grupo_instituicao} = ${instituicao_metas_gc.grupo_instituicao} and ${jornada.dt_status_date} = ${instituicao_metas_gc.data_meta_date} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: meta_sla_comercial
  {
    sql_on: ${jornada.etapa} = ${meta_sla_comercial.etapa_funil} and
            ${proposta.gerente_atual}=${meta_sla_comercial.gerente};;
    type: left_outer
    relationship: many_to_one
  }

  join: status {
    view_label: "4. Status"
    sql_on: ${jornada.id_cpf} = ${status.id_cpf} and ${jornada.id_proposta} = ${status.id_proposta} ;;
    relationship: one_to_many
    type: left_outer


  }


  join: alunos_hotlead {
    view_label: "5. Campanhas DBM"
    sql_on: ${jornada.id_cpf} = ${alunos_hotlead.id_cpf};;
    relationship: many_to_one
    type: left_outer


  }

  join: proposta_projeto_decola {
    view_label: "2.2 Projeto Decola"
    sql_on: ${jornada.id_cpf} = ${proposta_projeto_decola.id_cpf} and ${jornada.id_proposta} = ${proposta_projeto_decola.id_proposta};;
    relationship: many_to_one
    type: left_outer


  }

  join: instituicao {
    from: instituicao
    view_label: "3. Instituição"
    sql_on: ${jornada.id_instituicao} = ${instituicao.id_instituicao} ;;
    relationship: many_to_many
    type: left_outer
  }

  join: dim_cpf {
    view_label: "1. CPF"
    sql_on: ${jornada.id_cpf} = ${dim_cpf.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: fato_mongo_lead {
    view_label: "1. Jornada"
    sql_on: ${jornada.id_cpf} = ${fato_mongo_lead.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: dim_field_group_mongo {
    view_label: "1. Jornada"
    sql_on: ${fato_mongo_lead.mongo_fieldgroup} = ${dim_field_group_mongo.mongo_fieldgroup};;
    relationship: many_to_one
    type: left_outer
  }

  join: alunos {
    view_label: "6. Alunos"
    sql_on:  ${alunos.id_cpf} = ${jornada.id_cpf} ;;
    type: left_outer
    relationship: many_to_one}

  join: aproveitamento_estoque_nok {
    view_label: "7. Aproveitamento Estoque NOK"
    sql_on:  ${proposta.gerente_atual} = ${aproveitamento_estoque_nok.gerente} and
            ${jornada.etapa} = ${aproveitamento_estoque_nok.etapa};;
    type: left_outer
    relationship: many_to_one}
}

explore: instituicao {
  persist_for: "24 hours"
  access_filter: {
    field: grupo
    user_attribute: grupo_ies
  }

  label: "Instituição"
  view_label: "1. Instituição"
  description: "Apresenta os dados das Instituições de Ensino com contrado com PRAVALER"
  fields: [ALL_FIELDS *,
    - proposta.flg_instituicao_ativa,
    - proposta.cidade_instituicao,
    - proposta.uf_instituicao,
    - proposta.id_originadores_ativos_ies,
    - proposta.grupo_instituicao,
    - proposta.flg_contrato_ies_ativo,
    - proposta.flg_wo_ies,
    - proposta.flg_ipca_ies,
    - proposta.cidade_campus,
    - proposta.ds_campus,
    - proposta.flg_campus_ativo,
    - proposta.id_campus,
    - proposta.uf_campus,
    - proposta.regional_atual,
    - proposta.representante_original,
    - proposta.cargo_original,
    - proposta.cp_original,
    - proposta.carteira_original,
    - proposta.id_curso,
    - proposta.area_conhecimento_curso,
    - proposta.ds_curso,
    - proposta.flg_curso_ativo,
    - proposta.qtd_semestre_curso,
    - proposta.enfase_curso,
    - proposta.perc_comissao,
    - proposta.perc_desagio,
    - proposta.gerente_original,
    - proposta.tipo_original,
    - proposta.conversao_original,
    - proposta.vl_dias_wo_ies,
    - proposta.perc_tx_subsidiado_ies

  ]


  join: instituicao_contrato_produto_info {
    view_label: "1.1. Contrato da Instituição por Produto"
    sql_on: ${instituicao.id_instituicao} = ${instituicao_contrato_produto_info.id_instituicao} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: produto_ies_snapshot {
    view_label: "1.1. Contrato da Instituição por Produto - (Histórico)"
    sql_on: ${instituicao.id_instituicao} = ${produto_ies_snapshot.id_instituicao} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: dim_cpf {
    view_label: "1. CPF"
    sql_on: ${jornada.id_cpf} = ${dim_cpf.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: jornada_pivot {
    view_label: "1.2 Jornada Pivot "
    sql_on: ${jornada_pivot.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: instituicao_taxas_antecipacao {
    view_label: "1.2. Taxas da Instituição por Produto Antecipação"
    sql_on: ${instituicao.id_instituicao} = ${instituicao_taxas_antecipacao.id_instituicao}
        --AND ${instituicao_contrato_produto_info.id_ies_contrato} = ${instituicao_taxas_antecipacao.id_contrato_instituicao}
      ;;
    relationship: one_to_many
    type: left_outer
  }

  join: instituicao_taxas_gestao {
    view_label: "1.3. Taxas da Instituição por Produto Gestão"
    sql_on: ${instituicao_taxas_gestao.id_instituicao} = ${instituicao.id_instituicao}
      and ${instituicao_contrato_produto_info.id_produto} = ${instituicao_taxas_gestao.id_produto}  ;;
    relationship: one_to_many
    type: left_outer

  }
  join: taxa_instituicao_simplificada {
    view_label: "1.4. Taxas da Instituição Simplificada"
    sql_on: ${taxa_instituicao_simplificada.id_instituicao} = ${instituicao.id_instituicao}
      and ${instituicao_contrato_produto_info.id_produto} = ${taxa_instituicao_simplificada.id_produto}  ;;
    relationship: one_to_many
    type: left_outer

  }

  join: instituicao_metas_gc {
    view_label: "1.4 Metas - GC"
    sql_on: ${instituicao_metas_gc.grupo_instituicao}=${instituicao.grupo} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: proposta {
    view_label: "2. Proposta"
    sql_on: ${proposta.id_instituicao}  = ${instituicao.id_instituicao}
          AND ${proposta.id_campus} = ${instituicao.id_campus}
          AND    ${proposta.id_curso} = ${instituicao.id_curso} and ${instituicao_contrato_produto_info.id_produto} = ${proposta.id_produto};;
    relationship: one_to_many
    type: left_outer

  }

  join: proposta_projeto_decola {
    view_label: "2.1 Acordos - Projeto Decola"
    sql_on: ${proposta_projeto_decola.id_proposta} = ${proposta.id_proposta} and
          ${proposta_projeto_decola.id_cpf} = ${proposta.id_cpf}
          ;;
    relationship: one_to_many
    type: left_outer
  }

  join: alunos {
    view_label: "3. Alunos"
    sql_on: ${alunos.id_instituicao}  = ${instituicao.id_instituicao}
          AND    ${alunos.id_curso} = ${instituicao.id_curso}
          and   ${alunos.id_produto} = ${instituicao_contrato_produto_info.id_produto};;
    relationship: one_to_many
    type: left_outer

  }

  join: status {
    view_label: "4. Status"
    sql_on: ${proposta.id_instituicao}  = ${instituicao.id_instituicao}
          AND ${proposta.id_campus} = ${instituicao.id_campus}
          AND ${proposta.id_curso} = ${instituicao.id_curso}
          and ${instituicao_contrato_produto_info.id_produto} = ${proposta.id_produto}
          and ${proposta.id_proposta} = ${status.id_proposta};;
    relationship: one_to_many
    type: left_outer

  }

  join: jornada {
    view_label: "5. Jornada"
    sql_on: ${jornada.id_instituicao} = ${instituicao.id_instituicao} and ${proposta.id_instituicao}  = ${instituicao.id_instituicao}
          AND ${proposta.id_campus} = ${instituicao.id_campus}
          AND ${proposta.id_curso} = ${instituicao.id_curso}
          and ${instituicao_contrato_produto_info.id_produto} = ${proposta.id_produto}
          and ${proposta.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_many
    type: left_outer
  }

  join: ano_mes_carteira_ativa {
    fields: []
    sql_on: ${ano_mes_carteira_ativa.id_cpf} = ${alunos.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: inep_instituicao {
    fields: []
    sql_on: ${instituicao.grupo}=${inep_instituicao.grupo} and ${instituicao.id_instituicao} = ${inep_instituicao.id_ies} ;;
    relationship: one_to_many
    type: left_outer



  }

  join: inep {
    sql_on: ${instituicao.id_instituicao} = ${inep_instituicao.id_ies} and ${instituicao.grupo} = ${inep.grupo}  ;;
    relationship: one_to_many
    type: left_outer
    view_label: "Inep - Instituição"
  }



}


explore: financeiro {
  persist_for: "1 hours"
  access_filter: {
    field: grupo_instituicao
    user_attribute: grupo_ies
  }
  label: "Financeiro"
  view_label: "1. Financeiro"
  description: "Apresenta os dados de todos os títulos gerados para os Alunos no PRAVALER"
  fields: [ ALL_FIELDS *,
          - proposta.id_cpf,
          - proposta.id_proposta,
          - financeiro_extrato_titulo.id_contrato,
          - financeiro_extrato_titulo.id_cpf,
          - financeiro_extrato_titulo.id_titulo,
          - proposta.max_boleto_atrasado
          ]

  join: financeiro_extrato_titulo {
    view_label: "1.1 Extrato Título"
    sql_on: ${financeiro.id_titulo} = ${financeiro_extrato_titulo.id_titulo} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: financeiro_log_titulo {
    view_label: "1.2 Log Título "
    sql_on: ${financeiro_log_titulo.id_titulo} = ${financeiro.id_titulo} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: proposta {
    view_label: "2. Proposta"
    sql_on: ${proposta.id_proposta}=${financeiro.id_contrato} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: instituicao {
    view_label: "3. Instituicao"
    sql_on:   ${instituicao.id_instituicao} = ${proposta.id_instituicao}
          AND  ${instituicao.id_campus} = ${proposta.id_campus}
          AND    ${instituicao.id_curso} =  ${proposta.id_curso}  ;;
    relationship: many_to_one
    type:left_outer

  }

  join: instituicao_contrato_produto_info {
    view_label: "3.1. Contrato da Instituição por Produto"
    sql_on: ${instituicao.id_instituicao} = ${instituicao_contrato_produto_info.id_instituicao} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: produto_ies_snapshot {
    view_label: "3.1. Contrato da Instituição por Produto - (Histórico)"
    sql_on: ${instituicao.id_instituicao} = ${produto_ies_snapshot.id_instituicao} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: instituicao_taxas_antecipacao {
    view_label: "3.2. Taxas da Instituição por Produto Antecipação"
    sql_on: ${instituicao.id_instituicao} = ${instituicao_taxas_antecipacao.id_instituicao}
        --AND ${instituicao_contrato_produto_info.id_ies_contrato} = ${instituicao_taxas_antecipacao.id_contrato_instituicao}
      ;;
    relationship: one_to_many
    type: left_outer
  }

  join: instituicao_taxas_gestao {
    view_label: "3.3. Taxas da Instituição por Produto Gestão"
    sql_on: ${instituicao_taxas_gestao.id_instituicao} = ${instituicao.id_instituicao}
      and ${instituicao_contrato_produto_info.id_produto} = ${instituicao_taxas_gestao.id_produto}  ;;
    relationship: one_to_many
    type: left_outer

  }


  join: taxa_instituicao_simplificada {
    view_label: "3.4. Taxas da Instituição Simplificada"
    sql_on: ${taxa_instituicao_simplificada.id_instituicao} = ${instituicao.id_instituicao}
      and ${instituicao_contrato_produto_info.id_produto} = ${taxa_instituicao_simplificada.id_produto}  ;;
    relationship: one_to_many
    type: left_outer

  }


join: proposta_projeto_decola {
    view_label: "2.1 Acordos - Projeto Decola"
    sql_on: ${proposta_projeto_decola.id_proposta} = ${proposta.id_proposta} and
          ${proposta_projeto_decola.id_cpf} = ${proposta.id_cpf}
          ;;
    relationship: one_to_many
    type: left_outer
  }

}

explore: proposta {

  persist_for: "1 hours"
  access_filter: {
    field: grupo_instituicao
    user_attribute: grupo_ies
  }
  label: "Proposta"
  view_label: "1. Proposta"
  description: "Apresenta os dados de todas as propostas do PRAVALER"
fields: [ALL_FIELDS *,
        - status.flg_proposta_atual,
        - status.id_cpf,
        - status.id_elegivel,
        - status.id_proposta,
        - status.tipo_proposta,
        - alunos.id_cpf,
- alunos.id_proposta_atual,
- alunos.aluno_nome,
- alunos.aluno_idade,
- alunos.aluno_genero,
- alunos.email,
- alunos.celular,
- alunos.escolaridade,
- alunos.numero_dependentes,
- alunos.cep,
- alunos.bairro,
- alunos.cidade,
- alunos.uf,
- alunos.tipo_residencia,
- alunos.estado_civil,
- alunos.tempo_empresa,
- alunos.natureza_ocupacao,
- alunos.profissao,
- alunos.nacionalidade,
- alunos.renda_mensal,
- alunos.renda_fam_mensal,
- alunos.ds_trabalha,
- alunos.ano_termino_ensino_medio,
- alunos.flg_pai_falecido,
- alunos.flg_mae_falecida,
- alunos.ds_cal_vet,
- alunos.id_fia_cpf_atual,
- alunos.fia_nome,
- alunos.fia_email,
- alunos.fia_celular,
- alunos.fia_escolaridade,
- alunos.fia_numero_dependentes,
- alunos.fia_cep,
- alunos.fia_bairro,
- alunos.fia_cidade,
- alunos.fia_uf,
- alunos.fia_tipo_residencia,
- alunos.fia_estado_civil,
- alunos.fia_tempo_empresa,
- alunos.fia_natureza_ocupacao,
- alunos.fia_profissao,
- alunos.fia_nacionalidade,
- alunos.fia_renda_mensal,
- alunos.fia_parentesco,
- alunos.fia_idade,
- alunos.cpf_fiador,
- alunos.qtd_cursos_procurados,
- alunos.id_curso,
- alunos.ds_curso,
- alunos.flg_curso_ativo,
- alunos.periodo_curso,
- alunos.area_conhecimento_curso,
- alunos.enfase_curso,
- alunos.qtd_semestre_curso,
- alunos.nivel_curso,
- alunos.id_instituicao,
- alunos.ds_instituicao,
- alunos.grupo_instituicao,
- alunos.cidade_instituicao,
- alunos.uf_instituicao,
- alunos.flg_instituicao_ativa,
- alunos.qtd_campus_procurados,
- alunos.id_campus,
- alunos.ds_campus,
- alunos.flg_campus_ativo,
- alunos.cidade_campus,
- alunos.uf_campus,
- alunos.id_produto,
- alunos.nm_produto,
- alunos.flg_produto_ativo,
- alunos.nm_modalidade_produto,
- alunos.tipo_produto,
- alunos.fia_endereco,
- alunos.mapa_uf_fiador,
- alunos.mapa_uf_aluno,
- alunos.mapa_uf_campus,
- alunos.mapa_uf_instituicao,
- alunos.cpf_aluno,
- alunos.endereco,
- alunos.ds_fundo_investimento,
- alunos.id_fundo_investimento,
- alunos.ativo_ano_mes,
- jornada.aluno_cpf,
- jornada.email_aluno,
- jornada.nome_aluno,
- jornada.celular_aluno,
- jornada.total_renov





        ]


  join: proposta_produtos_aprovados {
    view_label: "1.1 Produtos Aprovados"
    sql_on: ${proposta.id_proposta} = ${proposta_produtos_aprovados.id_proposta}  ;;
    relationship: one_to_many
    type: left_outer
  }

  join: fato_ies_aval {
    view_label: "1. Proposta"
    sql_on: ${proposta.id_proposta} = ${fato_ies_aval.id_proposta} ;;
    relationship: one_to_many
    type: left_outer
  }

join: proposta_docs_pendentes {
  view_label: "1.2 Documentos Pendentes"
  sql_on: ${proposta_docs_pendentes.id_proposta} = ${proposta.id_proposta} ;;
  relationship: one_to_many
  type: left_outer
}

  join: proposta_docs_entregues {
    view_label: "1.3 Documentos Entregues"
    sql_on: ${proposta_docs_entregues.id_proposta} = ${proposta.id_proposta} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: proposta_motivo_rejeicao_docs {
    view_label: "1.4 Documentos Rejeitados"
    sql_on: ${proposta_motivo_rejeicao_docs.id_proposta} = ${proposta.id_proposta} ;;
    relationship: one_to_many
    type: left_outer
  }
  join: instituicao_metas_gc {
    view_label: "1.5 Metas GC"
    sql_on: ${proposta.grupo_instituicao} = ${instituicao_metas_gc.grupo_instituicao}  ;;
    relationship: one_to_many
    type: left_outer
  }

  join: proposta_projeto_decola {
    view_label: "1.6 Acordos - Projeto Decola"
    sql_on: ${proposta_projeto_decola.id_proposta} = ${proposta.id_proposta} and
    ${proposta_projeto_decola.id_cpf} = ${proposta.id_cpf}
    ;;
    relationship: one_to_many
    type: left_outer
  }

  join: proposta_datas_interfile {
    view_label: "1.7 Dados Interfile"
    sql_on: ${proposta_datas_interfile.id_proposta} = ${proposta.id_proposta} and
    ${proposta.release_contrato} = ${proposta_datas_interfile.release_contrato}
          ;;
    relationship: one_to_many
    type: left_outer
  }

  join: instituicao {
    view_label: "5. Instituicao"
    sql_on:   ${instituicao.id_instituicao} = ${proposta.id_instituicao}
          AND  ${instituicao.id_campus} = ${proposta.id_campus}
          AND    ${instituicao.id_curso} =  ${proposta.id_curso}  ;;
    relationship: many_to_one
    type:left_outer

  }



  join: status {
    view_label: "4. Status"
    sql_on: ${proposta.id_proposta} = ${status.id_proposta} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: alunos {
    view_label: "2. Alunos"
    sql_on:  ${alunos.id_cpf} = ${proposta.id_cpf} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: alunos_painel_risco {
    view_label: "2.1 Análise de Risco e Crédito - Decisão"
    sql_on: ${alunos.id_cpf} = ${alunos_painel_risco.id_cpf} and ${proposta.id_proposta} = ${alunos_painel_risco.proposta} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: financeiro {
    view_label: "3. Financeiro"
    sql_on: ${proposta.id_proposta} = ${financeiro.id_contrato} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: financeiro_parcelas_futuro {
    view_label: "3.1 Boletos Futuros "
    sql_on: ${proposta.id_proposta} = ${financeiro_parcelas_futuro.contrato} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: financeiro_count_titulo {
    view_label: "3. Financeiro"
    sql_on: ${proposta.id_proposta} = ${financeiro_count_titulo.proposta_id_contrato} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: jornada {
    view_label: "6. Jornada"
    sql_on:  ${proposta.id_proposta} = ${jornada.id_proposta} ;;
    type: left_outer
    relationship: one_to_many

  }

  join: atribuicao_nova{
    view_label: "6.1. Atribuição"
    sql_on:  ${atribuicao_nova.id_cpf} = ${proposta.id_cpf} ;;
    type: left_outer
    relationship: many_to_one
  }

  join: flag_unico_aluno {
    view_label: "1. Proposta"
    sql_on: ${proposta.id_contrato} = ${flag_unico_aluno.id_proposta} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: flag_unico_garantidor {
    view_label: "1. Proposta"
    sql_on: ${proposta.id_contrato} = ${flag_unico_garantidor.id_proposta} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: flag_renda_presumida {
    view_label: "1. Proposta"
    sql_on: ${proposta.id_contrato} = ${flag_renda_presumida.id_proposta} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: flag_renda_presumida_garant {
    view_label: "1. Proposta"
    sql_on: ${proposta.id_contrato} = ${flag_renda_presumida_garant.id_proposta} ;;
    type: left_outer
    relationship: one_to_one
  }

}

explore: alunos {
  persist_for: "1 hours"
  access_filter: {
    field: grupo_instituicao
    user_attribute: grupo_ies
  }
  view_label: "1. Alunos"
  description: "Apresenta os dados de todos os alunos do PRAVALER"
  fields: [ALL_FIELDS *,
    - financeiro.id_cpf,
    - jornada.id_cpf,
- proposta.aluno_celular,
- proposta.aluno_cidade,
- proposta.aluno_email,
- proposta.aluno_escolaridade,
- proposta.aluno_genero,
- proposta.aluno_idade,
- proposta.aluno_nome,
- proposta.aluno_renda,
- proposta.aluno_uf,
- proposta.uf_instituicao,
- proposta.id_campus,
- proposta.ds_campus,
- proposta.flg_campus_ativo,
- proposta.cidade_campus,
- proposta.uf_campus,
- proposta.fia_email,
- proposta.fia_celular,
- proposta.fia_genero,
- proposta.fia_escolaridade,
- proposta.ds_fia_trabalha,
- proposta.fia_idade,
- proposta.fia_renda,
- proposta.fia_cidade,
- proposta.fia_uf,
- proposta.cpf_aluno,
- proposta.fia_uf,
- proposta.regional_atual,
- proposta.carteira_atual,
- proposta.gerente_atual,
- proposta.conversao_atual,
- proposta.representante_atual,
- proposta.cargo_atual,
- proposta.tipo_atual,
- proposta.cp_atual,
- proposta.nivel_curso,
- proposta.flg_produto_ativo,
- proposta.tipo_produto,
- proposta.sum_qtd_mensalidade_contrato




    ]

join: alunos_produtos_aprovados {
  view_label: "1.1 Produtos Aprovados"
  sql_on: ${alunos_produtos_aprovados.id_cpf} = ${alunos.id_cpf}  ;;
  type: left_outer
  relationship: one_to_many
  }


  join: alunos_inadimplencia_1 {
    view_label: "1.2 Inadimplência"
    sql_on: ${alunos.id_cpf} = ${alunos_inadimplencia_1.id_cpf}  and ${alunos_inadimplencia_1.safra_cessao_cpf}  = ${alunos_inadimplencia_2.safra_cessao_cpf} ;;
    type: left_outer
    relationship: one_to_many

 }

join: alunos_inadimplencia_2 {
  view_label: "1.2.1 Inadimplência (Outras Informações)"
  sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_2.cpf}  ;;
  type: left_outer
  relationship: one_to_many
}

  join: alunos_inadimplencia_3_book {
    view_label: "1.2.2 Book Inadimplência"
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_3_book.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_book_produtos {
    view_label: "1.2.2.1 Book Inadimplência (Produtos)"
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_book_produtos.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_book_wo {
    view_label: "1.2.3 Book Inadimplência - W.O "
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_book_wo.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_fyf {
    view_label: "1.2.4 FYF - W.O "
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_fyf.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_carteira_atrasado {
    view_label: "1.2.6 Carteira - Atrasado"
    sql_on: ${alunos.cpf_aluno} = ${base_carteira_atrasado.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_carteira_atraso_produto {
    view_label: "1.2.7 Carteira - Atrasado (Produto)"
    sql_on: ${alunos.cpf_aluno} = ${base_carteira_atraso_produto.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_carteira_risco {
    view_label: "1.2.5 Carteira"
    sql_on: ${alunos.cpf_aluno} = ${base_carteira_risco.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_caixa_projecao_carteira {
    view_label: "1.2.8 Carteira - Base Projeção"
    sql_on: ${alunos.cpf_aluno} = ${base_caixa_projecao_carteira.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_base_recuperacao {
    view_label: "1.2.9 Carteira - Recuperação"
    sql_on: ${alunos.cpf_aluno} = ${alunos_base_recuperacao.tdt_cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_sp_fitch_rating {
    view_label: "1.2.10 S&P - Fitch Rating"
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_sp_fitch_rating.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_negativacao_info{
    view_label: "1.3 Negativação Informações"
    sql_on: ${alunos.id_cpf} = ${alunos_negativacao_info.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_log_negativacao{
    view_label: "1.3.1 Negativação Logs"
    sql_on: ${alunos.id_cpf} = ${alunos_log_negativacao.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_gerencial_renovacao_carteira_elegibilidade{
    view_label: "1.4 Renovação - Gerencial da Carteira"
    sql_on: ${alunos.cpf_aluno} = ${alunos_gerencial_renovacao_carteira_elegibilidade.tdt_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_gerencial_renovacao_status_elegibilidade{
    view_label: "1.4.1 Renovação - Status de Elegibilidade"
    sql_on: ${alunos.cpf_aluno} = ${alunos_gerencial_renovacao_status_elegibilidade.cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: dim_cpf {
    view_label: "1. CPF"
    sql_on: ${jornada.id_cpf} = ${dim_cpf.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: alunos_acordo {
    view_label: "1.5 Acordo Informações"
    sql_on: ${alunos.id_cpf} = ${alunos_acordo.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_acordo_renegociacao {
    view_label: "1.5.2 Acordo Renegociação Informações"
    sql_on: ${alunos.id_cpf} = ${alunos_acordo_renegociacao.id_cpf}
    AND ${proposta.id_proposta} = ${alunos_acordo_renegociacao.id_proposta_acordo}
    ;;
    type: left_outer
    relationship: one_to_many
  }

  join: pdd {
    view_label: "1.6 PDD"
    sql_on: ${alunos.id_cpf} = ${pdd.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_painel_risco {
    view_label: "1.7 Análise de Risco e Crédito - Decisão"
    sql_on: ${alunos.id_cpf} = ${alunos_painel_risco.id_cpf} and ${proposta.id_proposta} = ${alunos_painel_risco.proposta} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_mesa_2{
    view_label: "1.7.1 Mesa de Risco 2 - Check de Renda"
    sql_on: ${alunos.cpf_aluno} = ${alunos_mesa_2.sl_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_mesa_risco_3 {
    view_label: "1.7.2 Mesa de Risco 3 - Renda"
    sql_on: ${alunos.cpf_aluno} = ${alunos_mesa_risco_3.cpf_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_worthy_credit {
    view_label: "1.7.3 Modelo - Worthy Credit"
    sql_on: ${alunos.id_cpf} = ${alunos_worthy_credit.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_score_gh {
    view_label: "1.7.4 GH"
    sql_on: ${alunos.id_cpf} = ${alunos_score_gh.id_cpf} and ${proposta.id_proposta} = ${alunos_score_gh.proposta} ;;
    type: left_outer
    relationship: one_to_many
  }


  join: alunos_hotlead {
    view_label: "1.8 Campanhas DBM"
    sql_on: ${alunos.id_cpf} = ${alunos_hotlead.id_cpf} ;;
    type: left_outer
    relationship: one_to_one
  }

  join: alunos_cobranca_estrategia_operacional {
    view_label: "1.9 Cobrança - Estratégia Operacional"
    sql_on: ${alunos.cpf_aluno} = ${alunos_cobranca_estrategia_operacional.cpf};;
    type: left_outer
    relationship: many_to_one
  }

  join: alunos_cobranca_pdd {
    view_label: "1.9.1 Cobrança - PDD "
    sql_on: ${alunos.cpf_aluno} = ${alunos_cobranca_pdd.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_cobranca_radar {
    view_label: "1.9.2 Cobrança - RADAR "
    sql_on: ${alunos.cpf_aluno} = ${alunos_cobranca_radar.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_cobranca_pdd_boletos {
    view_label: "1.9.6 Cobrança - PDD Boletos"
    sql_on: ${alunos.cpf_aluno} = ${alunos_cobranca_pdd_boletos.cpf};;
    relationship: one_to_many
  }

  join: alunos_mis_meritocracia {
    view_label: "1.9.7 Cobrança - Meritocracia"
    sql_on: ${alunos.cpf_aluno} = ${alunos_mis_meritocracia.cpf_join};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_cobranca_e_risco {
    view_label: "1.9.8 Cobrança e Risco"
    sql_on: ${alunos.cpf_aluno} = ${alunos_cobranca_e_risco.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: custo_bv {
    view_label: "1.10 Custos BV"
    sql_on: ${alunos.cpf_aluno} = ${custo_bv.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: custo_bv_aluno {
    view_label: "1.10.1 Custos BV Aluno"
    sql_on: ${alunos.cpf_aluno} = ${custo_bv_aluno.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: proposta {
    view_label: "2. Proposta"
    sql_on:  ${alunos.id_cpf} = ${proposta.id_cpf} ;;
    type: left_outer
    relationship: one_to_many


  }

  join: proposta_projeto_decola {
    view_label: "2.1 Projeto Decola"
    sql_on:  ${proposta_projeto_decola.id_cpf}  = ${alunos.id_cpf}
    and ${proposta_projeto_decola.id_proposta} = ${alunos_painel_risco.proposta}
    and ${alunos.ultimo_acordo_decola} = ${proposta_projeto_decola.id_acordo};;
    relationship: many_to_one
    type: left_outer


  }

  join: status {
    view_label: "5. Status"
    sql_on: ${alunos.id_cpf} = ${status.id_cpf} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: ano_mes_carteira_ativa {
    fields: []
    sql_on: ${ano_mes_carteira_ativa.id_cpf} = ${alunos.id_cpf} AND ${ano_mes_carteira_ativa.ano_mes} = ${financeiro.data_trunc};;
    relationship: many_to_one
    type: left_outer
  }



join: financeiro {
  view_label: "3. Financeiro"
  sql_on: ${alunos.id_cpf} = ${financeiro.id_cpf} and ${financeiro.id_contrato} = ${proposta.id_proposta};;
  type: left_outer
  relationship: one_to_one
}

  join: financeiro_extrato_titulo {
    view_label: "3.1. Extrato Titulo - Gestão"
    sql_on: ${financeiro.id_titulo} = ${financeiro_extrato_titulo.id_titulo};;
    type: left_outer
    relationship: one_to_one
  }


  join: jornada {
    view_label: "4. Jornada"
    sql_on: ${alunos.id_cpf} = ${jornada.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: jornada_pivot {
    view_label: "1.2 Jornada Pivot "
    sql_on: ${jornada_pivot.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: alunos_ativos_carteira {
    view_label: "6. Alunos Ativos na Carteira"
    sql_on: ${alunos.id_cpf} = ${alunos_ativos_carteira.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: atribuicao_nova {
    view_label: "4.1. Atribuição"
    sql_on: ${alunos.id_cpf} = ${atribuicao_nova.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_ativos_carteira_2 {
    view_label: "6.1 Carteira"
    sql_on: ${alunos.cpf_aluno} = ${alunos_ativos_carteira_2.tdt_cpf};;
    type: left_outer
    relationship: one_to_many
  }



}


explore: solucx {
  label: "SoluCX - NPS"


join: depara_respondentes_ies {
  view_label: "Solucx"
  type: left_outer
  sql_on: ${solucx.email_aluno} = ${depara_respondentes_ies.email} ;;
  relationship: many_to_one
}
  }


explore: interacoes {
  label: "Interações - Tickets"
  view_label: "Interações - Tickets"
  description: "Apresenta os dados de interações realizadas pela Central de Atendimento"
  fields: [ALL_FIELDS *,
     - alunos *,
    alunos.id_proposta_atual
  ]
  access_filter: {
    field: EMPRESA_AGENTE

    user_attribute: grupo_bpo
  }

  join: interacoes_detalhes_ligacao {
    view_label: "Detalhes de ligação"

    type: full_outer
    sql_on: ${interacoes.id_ticket} = ${interacoes_detalhes_ligacao.id_ticket};;
    relationship: many_to_one
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

#  join: jornada {
 #   view_label: "Jornada"
  #  sql_on: ${jornada.id_proposta} = ${alunos.id_proposta_atual};;
   # type: left_outer
  #  relationship: one_to_many
  #}

  join: dados_jornada_interacoes {
    from: dados_jornada_interacoes
    view_label: "1. Jornada"
    sql_on: ${interacoes.cpf_requester}= ${dados_jornada_interacoes.cpf_requester} ;;
    relationship: many_to_many
    type: left_outer
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



explore: dados_demograficos {}

explore: historico_demograficos {
  label: "Histórico demográficos"
  view_label: "Histórico demográficos"
}

explore: new_relic {}

explore: log_negativacao {
  view_label: "Log de Negativação"
}


explore: documentos_solicitados {
  view_label: "Documentos Solicitados"
}

explore:  fato_lead_mgm {
  view_label: "Leads MGM"

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

explore: atribuicao_nova {
  view_label: "Atribuição"
  fields: [ALL_FIELDS * ,
    - proposta.vl_acordo,
    - proposta.data_acordo,
    - jornada.aluno_cpf,
    - jornada.email_aluno,
    - jornada.nome_aluno,
    - jornada.celular_aluno,
    - jornada.total_renov,
    - alunos.ativo_ano_mes]

join: proposta {
  view_label: "Proposta"
  sql_on:  ${atribuicao_nova.id_cpf} = ${proposta.id_cpf} ;;
  type: left_outer
  relationship: one_to_many
}

  join: jornada {
    view_label: "Jornada"
    sql_on:  ${atribuicao_nova.id_cpf} = ${jornada.id_cpf} ;;
    type: left_outer
    relationship: one_to_many

  }

  join: alunos {
    view_label: "Alunos"
    sql_on: ${alunos.id_cpf} = ${atribuicao_nova.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }
}

explore: alunos_ativos_carteira {}

explore: projecao_formalizados {
  label: "Projeção Formalizados Jornada"
  view_label: "Projeção Formalizados Jornada"
}

explore: projecao_formalizados_grupo_ies {
  label: "Projeção Formalizados - Grupo IES"
  view_label: "Projeção Formalizados - Grupo IES"
}

explore: crm_customer {
  label: "1. CRM - Customer io"

  join: dados_jornada_crm {
    from: dados_jornada_crm
    view_label: "2. Dados da Jornada"
    sql_on: ${crm_customer.id_cpf}= ${dados_jornada_crm.id_cpf} ;;
    relationship: many_to_many
    type: left_outer
  }

  join: crm_dados_zendesk {
    from: crm_dados_zendesk
    view_label: "3. Dados da Zendesk"
    sql_on: ${crm_customer.id_envio}= ${crm_dados_zendesk.ID_TICKET} ;;
    relationship: many_to_many
    type: left_outer
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
    - jornada.total_renov
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

}

explore: mgm_publico_alvo_jornada {
  label: "MGM - Público Alvo + Jornada"
  fields: [ALL_FIELDS *,
    - alunos.id_cpf,
    - alunos.ativo_ano_mes,
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

explore: instituicao_contrato_produto_info{
  label: "Instituicao contrato produto"
  hidden: yes
}

explore: instituicao_taxas_antecipacao{
  label: "Instituicao taxa antecipacao"
  hidden: yes
}

  explore: tetris_withoutproducts {
    label: "Tetris (Without Product)"

}

explore: prv_log {
  label: "PRV LOG"
  }

explore: aproveitamento_estoque_nok{
  label: "Aproveitamento Estoque"
}

explore: tela_atendimento{
  label: "Tela de Atendimento"
  description: "Informações sobre os registros da Tela de Atendimento - Célula Final de Funil"
}

explore: gupy_candidaturas {
  label: "Dados GUPY"
  description: "Informações sobre vagas, candidatos e acompanhamento de candidaturas"
}

explore: google_analytics {
  label: "Google Analytics"
  description: "Informações sobre o site do Pravaler pelo Google Analytics"

  join: ga_origem_aquisicao_conversao {
    view_label: "Google Analytics"
    sql_on: ${google_analytics.date_date} = ${ga_origem_aquisicao_conversao.date_date} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: ga_ads_conversao_hora {
    view_label: "Google Analytics"
    sql_on: ${google_analytics.date_date} = ${ga_ads_conversao_hora.date_date} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: ga_origem_midia_aquisicao_conversao {
    view_label: "Google Analytics"
    sql_on: ${google_analytics.date_date} = ${ga_origem_midia_aquisicao_conversao.date_date} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: ga_midia_aquisicao_conversao {
    view_label: "Google Analytics"
    sql_on: ${google_analytics.date_date} = ${ga_midia_aquisicao_conversao.date_date} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: ga_canal_aquisicao_conversao {
    view_label: "Google Analytics"
    sql_on: ${google_analytics.date_date} = ${ga_canal_aquisicao_conversao.date_date} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: ga_url_destino_aquisicao {
    view_label: "Google Analytics"
    sql_on: ${google_analytics.date_date} = ${ga_url_destino_aquisicao.date_date} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: ga_campanha_aquisicao_conversao {
    view_label: "Google Analytics"
    sql_on: ${google_analytics.date_date} = ${ga_campanha_aquisicao_conversao.date_date} ;;
    relationship: one_to_many
    type: left_outer
  }

}

explore: dados_intake {
  label: "Dados Intake"
}
