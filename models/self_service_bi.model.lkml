connection: "graduado"

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
  max_cache_age: "1 hour"
}

persist_with: self_service_bi_default_datagroup

explore: beneficiados {
  label: "Histórico de Beneficiados"
  view_label: "Histórico de Beneficiados"
  description: "Mostra os dados de todos os contratos cedidos pelo PRAVALER"


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
             proposta.midia_acesso_conversao,
             proposta.midia_acesso_descoberta,
             proposta.canal_acesso_conversao,
             proposta.canal_acesso_descoberta,
             proposta.ds_url_conversao,
             proposta.ds_url_descoberta,
             proposta.campanha_acesso_conversao,
             proposta.campanha_acesso_descoberta,
             proposta.cpf_aluno


             ]

  }


  join: jornada {
    view_label: "Jornada"
    sql_on:  ${beneficiados.id_proposta} = ${jornada.id_proposta} ;;
    type: left_outer
    relationship: one_to_many



  }


  join: jornada_pivot {
    view_label: "1.2 Jornada Pivot "
    sql_on: ${jornada_pivot.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_one
    type: left_outer
  }

}


explore: instituicao {
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
    - proposta.perc_tx_subsidiado_ies,

    ]


join: instituicao_contrato_produto_info {
  view_label: "1.1. Contrato da Instituição por Produto"
  sql_on: ${instituicao.id_instituicao} = ${instituicao_contrato_produto_info.id_instituicao} ;;
  relationship: one_to_many
  type: left_outer

}

join: instituicao_taxas_antecipacao {
  view_label: "1.2. Taxas da Instituição por Produto Antecipação"
  sql_on: ${instituicao.id_instituicao} = ${instituicao_taxas_antecipacao.id_instituicao}
  AND ${instituicao_contrato_produto_info.id_ies_contrato} = ${instituicao_taxas_antecipacao.id_contrato_instituicao}
;;
  relationship: one_to_many
  type: left_outer
}

  join: instituicao_taxas_gestao {
    view_label: "1.3. Taxas da Instituição por Produto Gestão"
    sql_on: ${instituicao_taxas_gestao.id_instituicao} = ${instituicao.id_instituicao}
      AND ${instituicao_contrato_produto_info.flg_ativo} = 1;;
    relationship: one_to_many
    type: left_outer

  }

  join: proposta {
    view_label: "2. Proposta"
    sql_on: ${proposta.id_instituicao}  = ${instituicao.id_instituicao}
    AND ${proposta.id_campus} = ${instituicao.id_campus}
    AND    ${proposta.id_curso} = ${instituicao.id_curso} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: alunos {
    view_label: "3. Alunos"
    sql_on: ${alunos.id_instituicao}  = ${instituicao.id_instituicao}
          AND ${alunos.id_campus} = ${instituicao.id_campus}
          AND    ${alunos.id_curso} = ${instituicao.id_curso} ;;
    relationship: one_to_many
    type: left_outer

  }

  join: ano_mes_carteira_ativa {
    fields: []
    sql_on: ${ano_mes_carteira_ativa.id_cpf} = ${alunos.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }




}

explore: status {
  label: "Status"
  view_label: "1. Status "
  description: "Apresenta os dados de todos status que a proposta do aluno esteve."
  fields: [ALL_FIELDS *,
    - proposta.flg_proposta_atual,
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
  view_label: "1. Jornada"
  description: "Apresenta toda a jornada do aluno dentro da esteira de contração do PRAVALER"
fields: [ALL_FIELDS *, - proposta.id_status_detalhado,
  - proposta.ds_ult_status,
  - proposta.id_status_detalhado,
  - proposta.tipo_proposta,
  - proposta.id_proposta,
  - proposta.flg_proposta_atual,
  - proposta.id_elegivel,
  - proposta.etapa_ult_status,
  - proposta.count_tipo_proposta_novo,
  - proposta.count_tipo_proposta_reempacotado,
  - proposta.count_tipo_proposta_renegociacao,
  - proposta.count_tipo_proposta_renovacao,
  - proposta.count_tipo_proposta_seg_repasse,


  ]

  join: proposta {
    view_label: "2. Proposta"
    sql_on: ${proposta.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_one
    type: left_outer
  }

  join: jornada_pivot {
    view_label: "1.2 Jornada Pivot "
    sql_on: ${jornada_pivot.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_one
    type: left_outer
}

  join: instituicao_contrato_produto_info {
    view_label: "2.1 Instituição - Contrato por Produto"
    sql_on: ${proposta.id_instituicao} = ${instituicao_contrato_produto_info.id_instituicao} ;;
    relationship: many_to_many
    type: left_outer
  }
}

explore: financeiro {
  label: "Financeiro"
  view_label: "1. Financeiro"
  description: "Apresenta os dados de todos os títulos gerados para os Alunos no PRAVALER"
  fields: [ALL_FIELDS * ,
          proposta.id_cpf,
          proposta.id_proposta,
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

}


explore: proposta {
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
- alunos.ativo_ano_mes





        ]

join: proposta_docs_pendentes {
  view_label: "1.1 Documentos Pendentes"
  sql_on: ${proposta_docs_pendentes.id_proposta} = ${proposta.id_proposta} ;;
  relationship: one_to_many
  type: left_outer
}

  join: proposta_docs_entregues {
    view_label: "1.2 Documentos Entregues"
    sql_on: ${proposta_docs_entregues.id_proposta} = ${proposta.id_proposta} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: proposta_motivo_rejeicao_docs {
    view_label: "1.3 Documentos Rejeitados"
    sql_on: ${proposta_motivo_rejeicao_docs.id_proposta} = ${proposta.id_proposta} ;;
    relationship: one_to_many
    type: left_outer
  }


  join: status {
    view_label: "3. Status"
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



}

explore: alunos {
  view_label: "1. Alunos"
  description: "Apresenta os dados de todos os alunos do PRAVALER"
  fields: [ALL_FIELDS *,
    - financeiro.id_cpf,
    - jornada.id_cpf,
    - jornada.id_proposta,
    - proposta.aluno_cal_vet,
- proposta.aluno_celular,
- proposta.aluno_cidade,
- proposta.aluno_email,
- proposta.aluno_escolaridade,
- proposta.aluno_genero,
- proposta.aluno_idade,
- proposta.aluno_nome,
- proposta.aluno_renda,
- proposta.aluno_uf,
- proposta.id_instituicao,
- proposta.ds_instituicao,
- proposta.grupo_instituicao,
- proposta.cidade_instituicao,
- proposta.uf_instituicao,
- proposta.flg_instituicao_ativa,
- proposta.id_campus,
- proposta.ds_campus,
- proposta.flg_campus_ativo,
- proposta.cidade_campus,
- proposta.uf_campus,
- proposta.id_fia_cpf,
- proposta.fia_nome,
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
- proposta.cpf_garantidor,
- proposta.fia_uf,
- proposta.regional_atual,
- proposta.carteira_atual,
- proposta.gerente_atual,
- proposta.conversao_atual,
- proposta.representante_atual,
- proposta.cargo_atual,
- proposta.tipo_atual,
- proposta.cp_atual,
- proposta.id_curso,
- proposta.ds_curso,
- proposta.flg_curso_ativo,
- proposta.periodo_curso,
- proposta.area_conhecimento_curso,
- proposta.enfase_curso,
- proposta.qtd_semestre_curso,
- proposta.nivel_curso,
- proposta.id_produto,
- proposta.nm_produto,
- proposta.flg_produto_ativo,
- proposta.nm_modalidade_produto,
- proposta.tipo_produto,





    ]

join: alunos_produtos_aprovados {
  view_label: "1.1 Produtos Aprovados"
  sql_on: ${alunos_produtos_aprovados.id_cpf} = ${alunos.id_cpf} ;;
  type: left_outer
  relationship: one_to_many
  }


  join: alunos_maturidade_info {
    view_label: "1.2 Maturidade Informações"
    sql_on: ${alunos.id_cpf} = ${alunos_maturidade_info.id_cpf} ;;
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
    view_label: "1.4 Negativação Logs"
    sql_on: ${alunos.id_cpf} = ${alunos_log_negativacao.id_cpf} ;;
    type: left_outer
    relationship: one_to_many

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


  join: proposta {
    view_label: "2. Proposta"
    sql_on:  ${alunos.id_cpf} = ${proposta.id_cpf} ;;
    type: left_outer
    relationship: one_to_many


  }

  join: status {
    view_label: "5. Status"
    sql_on: ${alunos.id_cpf} = ${status.id_cpf} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: ano_mes_carteira_ativa {
    fields: []
    sql_on: ${ano_mes_carteira_ativa.id_cpf} = ${alunos.id_cpf} ;;
    relationship: many_to_one
    type: left_outer
  }



join: financeiro {
  view_label: "3. Financeiro"
  sql_on: ${alunos.id_cpf} = ${financeiro.id_cpf} ;;
  type: left_outer
  relationship: one_to_many
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


}

explore: inep {
  label: "Inep"
  view_label: "Inep"
  description: "Censo da Educacional Superior de 2014 a 2018"

  join: inep_curso_qtd_vagas_inep {
  view_label: "Inep - Quantidade de Vagas Curso"

    type: left_outer
    sql_on: ${inep.id_curso} = ${inep_curso_qtd_vagas_inep.id_curso} and ${inep.ano_censo} = ${inep_curso_qtd_vagas_inep.ano_censo};;
    relationship: many_to_one
    fields: []

  }
  }

explore: interacoes {
  label: "Interações"
  view_label: "Interações"
  description: "Apresenta os dados de interações realizadas pela Central de Atendimento"

  join: interacoes_detalhes_ligacao {
    view_label: "Detalhes de ligação"

    type: left_outer
    sql_on: ${interacoes.id_ticket} = ${interacoes_detalhes_ligacao.id_ticket};;
    relationship: many_to_one
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
          - crx_agentes.data_registro,
          - crx_agentes.media_sla_atendimento


  ]
  join: crx_agentes{
    view_label: "Detalhes do Agente"

    type: inner
    sql_on: ${crx_agentes.id} = ${crx_agentes_detalhes_pausas.id};;
    relationship: many_to_one
  }
}
