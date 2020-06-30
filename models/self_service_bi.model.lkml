connection: "graduado"

map_layer: MAPA_ESTADO_ALUNO {
  file: "/MAPAS/uf.json"
}

map_layer: MAPA_CIDADE_ALUNO {
  file: "/MAPAS/municipio.json"
}
include: "/*/*.view.lkml"

datagroup: self_service_bi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: self_service_bi_default_datagroup

explore: beneficiados {
  label: "Histórico de Beneficiados"
  view_label: "Histórico de Beneficiados"
  description: "Mostra os dados de todos os contratos cedidos pelo PRAVALER"
}


explore: instituicao {
  label: "Instituição"
  view_label: "1. Instituição"
  description: "Apresenta os dados das Instituições de Ensino com contrado com PRAVALER"
  fields: [ALL_FIELDS *,
    - proposta.flg_instituicao_ativa,
    - proposta.cidade_instituicao,
    - proposta.uf_instituicao,
    - proposta.id_instituicao,
    - proposta.ds_instituicao,
    - proposta.id_originadores_ativos_ies,
    - proposta.grupo_instituicao,
    - proposta.flg_contrato_ies_ativo,
    - proposta.flg_wo_ies,
    - proposta.id_ies_contrato,
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


  join: proposta {
    view_label: "2. Proposta"
    sql_on: ${proposta.id_curso} = ${instituicao.id_curso} ;;
    relationship: one_to_many
    type: left_outer

  }


}

explore: status {
  label: "Status"
  description: "Apresenta os dados de todos status que a proposta do aluno esteve."
}


explore: jornada {
  view_label: "1. Jornada"
  description: "Apresenta toda a jornada do aluno dentro da esteira de contração do PRAVALER"
fields: [ALL_FIELDS *, - proposta.id_status_detalhado,
  - proposta.id_status_geral,
  - proposta.ds_ult_status,
  - proposta.id_status_detalhado,
  - proposta.vl_ult_status,
  - proposta.tipo_proposta,
  - proposta.id_proposta,
  - proposta.flg_proposta_ativa,
  - proposta.id_elegivel,
  - proposta.etapa_ult_status,
  - proposta.count_tipo_proposta_novo,
  - proposta.count_tipo_proposta_reempacotado,
  - proposta.count_tipo_proposta_renegociacao,
  - proposta.count_tipo_proposta_renovacao,
  - proposta.count_tipo_proposta_seg_repasse



  ]

  join: proposta {
    view_label: "2. Proposta"
    sql_on: ${proposta.id_proposta} = ${jornada.id_proposta} ;;
    relationship: many_to_one
    type: left_outer

  }
}


explore: financeiro {
  label: "Financeiro"
  view_label: "1. Financeiro"
  description: "Apresenta os dados de todos os títulos gerados para os Alunos no PRAVALER"

  join: financeiro_extrato_titulo {
    view_label: "1.1 Extrato Título"
    sql_on: ${financeiro_extrato_titulo.id_titulo} = ${financeiro.id_titulo} ;;
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
        - status.flg_proposta_ativa,
        - status.id_cpf,
        - status.id_elegivel,
        - status.id_proposta,
        - status.tipo_proposta, ]

join: proposta_docs_pendentes {
  view_label: "1.1 Documentos Pendentes"
  sql_on: ${proposta_docs_pendentes.id_proposta} = ${proposta.id_proposta} ;;
  relationship: one_to_many
  type: left_outer
}



  join: status {
    view_label: "2. Status"
    sql_on: ${proposta.id_proposta} = ${status.id_proposta} ;;
    relationship: one_to_many
    type: left_outer
  }



}

explore: alunos {
  view_label: "1. Alunos"
  description: "Apresenta os dados de todos os alunos do PRAVALER"
  fields: [ALL_FIELDS*,
    - financeiro.id_cpf,
    - financeiro.id_contrato]
join: alunos_produtos_aprovados {
  view_label: "1.1 Produtos Aprovados"
  sql_on: ${alunos_produtos_aprovados.id_cpf} = ${alunos.id_cpf} ;;
  type: left_outer
  relationship: one_to_many

}



join: financeiro {
  view_label: "2. Financeiro"
  sql_on: ${alunos.id_cpf} = ${financeiro.id_cpf} ;;
  type: left_outer
  relationship: one_to_many



}


}

explore: inep {
  label: "Inep"
  view_label: "Inep"
  description: "Censo da Educacional Superior de 2014 a 2018"

  join: curso_qtd_vagas_inep {
    type: left_outer
    sql_on: ${inep.id_curso} = ${curso_qtd_vagas_inep.id_curso} ;;
    fields: []
    relationship: many_to_one


  }
}
