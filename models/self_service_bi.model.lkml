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
  description: "Apresenta os dados das Instituições de Ensino com contrado com PRAVALER"

  join: alunos {
    view_label: "2. Alunos"
    sql_on: ${alunos.id_curso} = ${instituicao.id_curso} ;;
    relationship: many_to_one
    type: left_outer


  }

  join: proposta {
    view_label: "3. Proposta"
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


join: proposta_docs_pendentes {
  view_label: "1.1 Documentos Pendentes"
  sql_on: ${proposta_docs_pendentes.id_proposta} = ${proposta.id_proposta} ;;
  relationship: one_to_many
  type: left_outer
}


  join: financeiro {
    view_label: "2. Financeiro"
    sql_on: ${financeiro.id_contrato} = ${proposta.id_proposta} ;;
    relationship: one_to_many
    type: left_outer

  }



  join: status {
    view_label: "4. Status"
    sql_on: ${proposta.id_proposta} = ${status.id_proposta} ;;
    relationship: one_to_many
    type: left_outer
  }



}

explore: alunos {
  label: "Alunos"
  description: "Apresenta os dados de todos os alunos do PRAVALER"

join: alunos_produtos_aprovados {
  view_label: "1.1 Produtos Aprovados"
  sql_on: ${alunos_produtos_aprovados.id_cpf} = ${alunos.id_cpf} ;;
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
