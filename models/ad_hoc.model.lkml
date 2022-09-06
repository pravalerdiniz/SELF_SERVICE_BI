connection: "jornada"

include: "/**/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project

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

datagroup: painel_de_carga {
   sql_trigger: SELECT max(dt_conclusao) data_carga FROM GRADUADO.MONITORIA_BANCO.PAINEL_CARGA;;
  max_cache_age: "1 hour"
}


explore: comunicacao_conversao {
  label: "Comunicação Conversão"
  view_label: "Comunicação Conversão"
  join: comunicacao_conversao_status_info {
    view_label: "Status Log Pós Contato"
    type: left_outer
    relationship: one_to_many
    sql_on: ${comunicacao_conversao.id_cpf} = ${comunicacao_conversao_status_info.id_cpf} ;;
  }
}



explore: orcamento {
  label: "Orçamento - Histórico"
  view_label: "Orçamento - Histórico"

  access_filter: {
    field: descricao_centro_de_custo
    user_attribute: acesso_orcamento
  }

  join: diretoria {
    from: centro_de_custo
    fields: [diretoria.diretoria]
    relationship: many_to_one
    sql_on: ${orcamento.centro_de_custo} = ${diretoria.centro_de_custo} ;;
  }
}

explore: orcamento_atual {
  label: "Orçamento"
  access_filter: {
    field: descricao_cc
    user_attribute: acesso_orcamento
  }

}


explore: orcamento_frente {
  from: orcamento_atual
  label: "Orçamento Frente"
  access_filter: {
    field: frente
    user_attribute: orcamento_frente
  }

}

explore: orcamento_ltm {
  label: "Orçamento LTM"
}

explore: orcameto_cc {
  label: "Orçamento CAC"
  view_label: "1. Orçamento CAC"

join: proposta {
  from: proposta
  view_label: "2. Proposta"
  sql_on:  ${proposta.data_concessao_month} = ${orcameto_cc.data_lancamento_month} ;;
  fields: [
    proposta.data_concessao_date,
    proposta.flg_contrato_cedido,
    proposta.ds_fundo_investimento,
    proposta.nm_produto,
    proposta.tipo_produto,
    proposta.cpf_aluno,
    proposta.tipo_proposta,
    proposta.data_concessao_date,
    proposta.data_concessao_day_of_year,
    proposta.data_concessao_month,
    proposta.data_concessao_month_name,
    proposta.data_concessao_quarter,
    proposta.data_concessao_week,
    proposta.data_concessao_year
  ]
  relationship: one_to_one
  type: left_outer
    }
}


explore: comparacao_ot {
  label: "Base Comparação PDD_OT"
  view_label:"1. Comparação PDD_OT"
  fields: [ ALL_FIELDS *,
    -financeiro.aluno_email,
    -financeiro.cpf_aluno,
    -financeiro.grupo_instituicao,
    -financeiro.aluno_celular,
    -financeiro.ds_campus,
    -financeiro.nm_modalidade_produto,
    -financeiro.nm_produto,
    -financeiro.ds_instituicao,
    -financeiro.ds_curso,
    -financeiro.aluno_nome,
    -financeiro.arrasto_dias_atraso,
    -financeiro.ipca_12m,
    -financeiro.sum_PDD
  ]

  join: financeiro {
    from: financeiro
    view_label: "2. Financeiro"
    sql_on: ${comparacao_ot.id_cpf} = ${financeiro.id_cpf}
    and ${comparacao_ot.id_fundo} = ${financeiro.id_fundo_investimento};;
    relationship: one_to_many
    type: left_outer

  }
}

explore: final_pdd {
  label: "Final PDD"
  view_label: "Final PDD"
}

explore: fato_swap {
  label: "Swap"
  view_label: "Swap"

  join: fato_swap_realizado {
    type: left_outer
    sql_on: ${fato_swap.fim_mes_referencia_date} = ${fato_swap_realizado.fim_mes_referencia_date} ;;
    relationship: many_to_one
  }


}

explore: unpivot_dre {
  label: "Demonstração do Resultado"
  view_label: "Demonstração do Resultado"
}

explore: itau {
  label: "ITAU"
}

explore: documentacao {}

explore: iniciados_x_finalizados_lead {}



explore: atribuicao_rv_itau {}

explore: orquestra_compra_carteira {
  label: "Orquestra - Compra de Carteira"
}

explore: orquestra {
  label: "Orquestra"
  view_label: "1. Orquestra"

  join: orquestra_obj_campos {
    type: left_outer
    sql_on: ${orquestra.numero_chamado}=${orquestra_obj_campos.numero_chamado};;
    #and ${orquestra.nome_task}=${orquestra_obj_campos.nome_task};; -- bkp Mari
    relationship: one_to_one
    view_label: "2. Informações Processos"
    }

  join: solicitacoes_para_facilities {
    type: left_outer
    sql_on: ${orquestra.numero_chamado}=${solicitacoes_para_facilities.numero_chamado};;
    #and ${orquestra.nome_task}=${orquestra_obj_campos.nome_task};; -- bkp Mari
    relationship: one_to_one
    view_label: "Processo P37"
  }

  join: solicitacoes_para_facilities_p51 {
    type: left_outer
    sql_on: ${orquestra.numero_chamado}=${solicitacoes_para_facilities_p51.numero_chamado};;
    #and ${orquestra.nome_task}=${orquestra_obj_campos.nome_task};; -- bkp Mari
    relationship: one_to_one
    view_label: "Processo P51"
  }

  join: solicitacoes_para_prevencao {
    type: left_outer
    sql_on: ${orquestra.numero_chamado}=${solicitacoes_para_prevencao.numero_chamado};;
    #and ${orquestra.nome_task}=${orquestra_obj_campos.nome_task};; -- bkp Mari
    relationship: one_to_one
    view_label: "Processo P28"
  }
}

explore: reclame_aqui {
  label: "Reclame Aqui"
}

explore: base_forecast_cs {
  label: "Forecast Contatos"
}

#Novo Modelo de Dados - Experiencia do Aluno - 26/07/22 Lulinha

# explore: taxa_de_contato{
#   label: "Taxa de Contato"
# }




# explore: taxa_de_contato_alunos_ativos{
#   label: "Taxa de Contato de Alunos Ativos"
# }

# explore: taxa_de_contato_motivo_de_contato{
#   label: "Taxa de Contato por Motivo de Contato"
# }

explore: campanha_valoriza {
  label: "Campanha Valoriza"
}

explore: treinamento_data_driven {
  label: "Capacitação - Data Driven"
}

explore: base_trade {}

explore: report_builder_cargas {}
explore: report_builder_baixa {}
explore: curta_duracao {}

explore: jira {}

explore: bv_export_boletos{}

explore: one_page_trade {}

explore: pesquisa_perfil_aluno {

 join: pesquisa_perfil_aluno_banco {

  type:left_outer
  sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_perfil_aluno_banco.key_} ;;
  relationship: many_to_one
  }

  join: pesquisa_aluno_perfil_faz_com_frequencia {

    type:left_outer
    sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_aluno_perfil_faz_com_frequencia.key_} ;;
    relationship: many_to_one
  }

  join: pesquisa_aluno_perfil_servico_streaming {

    type:left_outer
    sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_aluno_perfil_servico_streaming.key_} ;;
    relationship: many_to_one
  }

  join: pesquisa_perfil_aluno_forma_pagamento {

    type:left_outer
    sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_perfil_aluno_forma_pagamento.key_} ;;
    relationship: many_to_one
  }

  join: pesquisa_perfil_aluno_jogos_online {

    type:left_outer
    sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_perfil_aluno_jogos_online.key_} ;;
    relationship: many_to_one
  }

  join: pesquisa_perfil_aluno_rede_social {

    type:left_outer
    sql_on: ${pesquisa_perfil_aluno.key_} = ${pesquisa_perfil_aluno_rede_social.key_} ;;
    relationship: many_to_one
  }

}

explore: indicadores_comunicacao {}

explore: acompanhamento_fluxo_proposta {}

explore: distribuicao_finalizados_iniciados {}

explore: base_score{
  label: "Base - Treino Score"
}

explore: perfil_usuarios {}

explore: cruzeiro_evadidos {}

explore: cruzeiro_inadimplentes {}

explore: csat_nuvem_palavras_bad {}

explore: nps_nuvem_palavras_detratores {}

explore: nps_nuvem_palavras_neutros {}

explore: nps_nuvem_palavras_promotores {}

explore: nuvem_nps_ies {
  label: "Nuvem Palavras NPS IES"
}

explore: alunos_inadimplencia_2 {}

explore: uni_prv {}

explore: base_ot {
  label: "Base de Dados - Oliveira Trust"
}


explore: base_ot_analise {
  label: "Análise - Oliveira Trust"
}

explore: watson {}

explore: amigo_edu {
  label: "Amigo Edu"
}

explore: kpi_financeiro {
  label: "KPI Financeiro"
}

explore: kpi_controladoria {
  label: "KPI Controladoria"
}

explore: titulos_cnpj {
  label: "Titulos CNPJ"
}

explore: ipca_bv {
  label: "IPCA BV"
  join: ipca_bv_cpf {
    view_label: "Status CPF"
    sql_on: ${ipca_bv.cpf_aluno} = ${ipca_bv_cpf.cpf_aluno} ;;
    type: left_outer
    relationship: many_to_one
  }

}

explore: b3_taxa_ref_di {
  label: "Taxa B3"
}

explore: bc_expectativas_mercado {
  label: "Projeção IPCA"

  join: bc_expec_max_date {
    view_label: "Bc Expectativas Mercado"
    sql_on: ${bc_expectativas_mercado.data_date} = ${bc_expec_max_date.bc_max_date}
            and ${bc_expectativas_mercado.datareferencia} = ${bc_expec_max_date.datareferencia};;
    type: left_outer
    relationship: many_to_one
  }
}

explore: painel_de_carga{
  persist_with: painel_de_carga
}

explore: twoclix_detalhes_avaliacao {
  label: "TwoClix Detalhes Avaliação"
}

explore: correcao_ipca {
  label: "1. Correção IPCA"
  view_label: "1. Correção IPCA"

  join: carteira {
    view_label: "2. Carteira (base OT)"
    sql_on: ${carteira.id_cpf} = ${correcao_ipca.id_cpf}
            --and ${carteira.id_alu_contrato} = ${correcao_ipca.id_contrato}
            and ${carteira.data_vencimento_date} = ${correcao_ipca.data_vencimento_date};;
    fields: [
      carteira.nm_cedente,
      carteira.nm_fundo,
      carteira.data_referencia_date,
      carteira.data_emissao_date,
      carteira.id_seunum,
      carteira.valor_presente,
      carteira.valor_apropriado,
      carteira.valor_aquisicao,
      carteira.protesto,
      flg_ultima_base
    ]
    relationship: one_to_one
    type: left_outer
  }

  join: financeiro {
    view_label: "3. Financeiro"
    sql_on: ${financeiro.id_cpf} = ${correcao_ipca.id_cpf}
            and ${financeiro.id_contrato} = ${correcao_ipca.id_contrato}
            and ${financeiro.id_boleto} = ${correcao_ipca.id_boleto}
            and ${carteira.id_titulo_status} = 2;;
    fields: [
      financeiro.flg_boleto_pago
    ]
    relationship: one_to_one
    type: left_outer
  }
}
