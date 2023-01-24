connection: "graduado"

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
}# include all views in the views/ folder in this project
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

explore: vcom_erros {
  label: "Vcom"
  view_label: "1. Vcom Envio Diário"

  join: vcom_alunos {
    from: vcom_alunos
    view_label: "2. Vcom Alunos"
    sql_on: ${vcom_erros.id_cpf} = ${vcom_alunos.id_cpf} ;;
    relationship: one_to_one
    type: left_outer
  }

  join: vcom_titulos {
    from: vcom_titulos
    view_label: "3. Vcom Títulos"
    sql_on: ${vcom_erros.id_cpf} = ${vcom_titulos.id_cpf} and
    ${financeiro.id_boleto} = ${vcom_titulos.id_boleto} and
    ${financeiro.id_contrato} = ${vcom_titulos.contrato};;
    relationship: one_to_many
    type: left_outer
  }

  join: financeiro {
    from: financeiro
    view_label: "4. Financeiro"
    sql_on: ${financeiro.id_cpf} = ${vcom_erros.id_cpf} ;;
    fields: [
      financeiro.ativo_boleto,
      financeiro.ds_fundo_investimento,
      financeiro.ds_titulo_status,
      financeiro.id_titulo_status,
      financeiro.ds_titulo_classificacao,
      financeiro.id_titulo_classificacao,
      financeiro.ds_tipo_boleto,
      financeiro.id_contrato,
      financeiro.data_baixa_date,
      financeiro.data_pagamento_date,
      financeiro.dias_a_vencer,
      financeiro.faixa_adimple,
      financeiro.faixa_aging_a_vencer,
      financeiro.faixa_aging_vencidos,
      financeiro.data_vencimento_date,
      financeiro.flg_boleto_atrasado,
      financeiro.flg_boleto_pago,
      financeiro.flg_boleto_pago_em_dia,
      financeiro.vl_boleto

    ]
    relationship: one_to_one
    type: left_outer
  }

}

explore: alunos {
  view_label: "Alunos"
  label: "Crédito, Cobrança e Portfólio"

  fields: [ALL_FIELDS *,
    - financeiro.id_cpf,
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
    - proposta.gerente_atual,
    - proposta.nivel_curso,
    - proposta.flg_produto_ativo,
    - proposta.tipo_produto,
    - proposta.sum_qtd_mensalidade_contrato,
    - alunos_gerencial_renovacao_status_elegibilidade.count_distinct,
    - alunos_gerencial_renovacao_carteira_elegibilidade.count_cpf,
    - alunos_acordo_renegociacao.count_id_cpf,
    - alunos_acordo.count_id_cpf,
    - proposta.cont_cpf,
    - proposta.perc_cpf,
    - financeiro.count_alunos,
    - financeiro_extrato_titulo.alunos,
    - alunos_acordo_renegociacao.count,
    - financeiro.perc_alunos,
    - financeiro.arrasto_dias_atraso,
    - financeiro.ipca_12m,
    - financeiro.vl_ipca_acumulado,
    - financeiro.sum_PDD,
    - proposta.flag_elegivel_semfiador_testeab,
    - proposta.flag_eleito_semfiador_testeab,
    - leads_balcao *,
    - jornada_pivot *,
    - proposta_datas_interfile *,
    - proposta.flag_elegivel_semfiador_testeab,
    - proposta.flag_produtos_semfiador_testeab,
    - instituicao.regional
  ]

  join: alunos_produtos_aprovados {
    view_label: "Alunos - Produtos Aprovados"
    sql_on: ${alunos_produtos_aprovados.id_cpf} = ${alunos.id_cpf}  ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_log_negativacao{
    view_label: "Alunos - Negativação Logs"
    sql_on: ${alunos.id_cpf} = ${alunos_log_negativacao.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }


  join: alunos_inadimplencia_3_book {
    view_label: "Portfólio - Book Inadimplência"
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_3_book.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_book_produtos {
    view_label: "Portfólio - Book Inadimplência (Produtos)"
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_book_produtos.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_book_wo {
    view_label: "Portfólio - Book Inadimplência - W.O "
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_book_wo.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_fyf {
    view_label: "Portfólio - FYF - W.O "
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_fyf.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_carteira_atrasado {
    view_label: "Portfólio - Carteira - Atrasado"
    sql_on: ${alunos.cpf_aluno} = ${base_carteira_atrasado.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_carteira_atraso_produto {
    view_label: "Portfólio - Carteira - Atrasado (Produto)"
    sql_on: ${alunos.cpf_aluno} = ${base_carteira_atraso_produto.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: base_carteira_risco {
    view_label: "Portfólio - Carteira"
    sql_on: ${alunos.cpf_aluno} = ${base_carteira_risco.cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: base_caixa_projecao_carteira {
    view_label: "Portfólio - Carteira - Base Projeção"
    sql_on: ${alunos.cpf_aluno} = ${base_caixa_projecao_carteira.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_base_recuperacao {
    view_label: "Portfólio - Carteira - Recuperação"
    sql_on: ${alunos.cpf_aluno} = ${alunos_base_recuperacao.tdt_cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_inadimplencia_sp_fitch_rating {
    view_label: "Portfólio - Fitch Rating"
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_sp_fitch_rating.cpf};;
    type: left_outer
    relationship: one_to_many
  }


  join: custo_bv {
    view_label: "Portfólio - Custos BV"
    sql_on: ${alunos.cpf_aluno} = ${custo_bv.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: custo_bv_aluno {
    view_label: "Portfólio - Custos BV Aluno"
    sql_on: ${alunos.cpf_aluno} = ${custo_bv_aluno.cpf};;
    type: left_outer
    relationship: one_to_many
  }


  join: vw_contratos_inadimplencia {
    view_label: "Crédito - Inadimplência Nova"
    sql_on: ${alunos.cpf_aluno} = ${vw_contratos_inadimplencia.cpf} ;;
    type: left_outer
    relationship: one_to_many
  }



  join: alunos_inadimplencia_1 {
    view_label: "Crédito - Inadimplência"
    sql_on: ${alunos.id_cpf} = ${alunos_inadimplencia_1.id_cpf}  and ${alunos_inadimplencia_1.safra_cessao_cpf}  = ${alunos_inadimplencia_2.safra_cessao_cpf} ;;
    type: left_outer
    relationship: one_to_many

  }




  join: alunos_inadimplencia_2 {
    view_label: "Crédito - Inadimplência (Outras Informações)"
    sql_on: ${alunos.cpf_aluno} = ${alunos_inadimplencia_2.cpf}  ;;
    type: left_outer
    relationship: one_to_many
  }



  join: alunos_gerencial_renovacao_carteira_elegibilidade{
    view_label: "Crédito - Renovação - Gerencial da Carteira"
    sql_on: ${alunos.cpf_aluno} = ${alunos_gerencial_renovacao_carteira_elegibilidade.tdt_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_gerencial_renovacao_status_elegibilidade{
    view_label: "Crédito - Renovação - Status de Elegibilidade"
    sql_on: ${alunos.cpf_aluno} = ${alunos_gerencial_renovacao_status_elegibilidade.cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: vw_elegibilidade_comercial{
    view_label: "Crédito - Renovação - Potencial Renovação"
    sql_on: ${alunos.cpf_aluno} = ${vw_elegibilidade_comercial.cd_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }


  join: alunos_painel_risco {
    view_label: "Crédito - Análise de Risco e Crédito | Decisão"
    sql_on: ${alunos.id_cpf} = ${alunos_painel_risco.id_cpf} and ${proposta.id_proposta} = ${alunos_painel_risco.proposta} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_mesa_2{
    view_label: "Crédito - Mesa de Risco 2 - Check de Renda"
    sql_on: ${alunos.cpf_aluno} = ${alunos_mesa_2.sl_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_mesa_risco_3 {
    view_label: "Crédito - Mesa de Risco 3 - Renda"
    sql_on: ${alunos.cpf_aluno} = ${alunos_mesa_risco_3.cpf_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_worthy_credit {
    view_label: "Crédito - Modelo - Worthy Credit"
    sql_on: ${alunos.id_cpf} = ${alunos_worthy_credit.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_score_gh {
    view_label: "Crédito - GH"
    sql_on: ${alunos.id_cpf} = ${alunos_score_gh.id_cpf} and ${proposta.id_proposta} = ${alunos_score_gh.proposta} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: neurotech {
    view_label: "Crédito - Neurotech (Motor de Credito e Repescagem)"
    sql_on: ${alunos.cpf_aluno} = ${neurotech.prop_cpf_aluno} ;;
    type: left_outer
    relationship: one_to_many
  }


  join: proposta {
    view_label: "Proposta"
    sql_on:  ${alunos.id_cpf} = ${proposta.id_cpf} ;;
    type: left_outer
    relationship: one_to_many


  }

  join: instituicao {
    view_label: "Instituicao"
    sql_on:   ${instituicao.id_instituicao} = ${proposta.id_instituicao}
          AND  ${instituicao.id_campus} = ${proposta.id_campus}
          AND    ${instituicao.id_curso} =  ${proposta.id_curso}
          ;;
    relationship: many_to_one
    type:left_outer

  }

  join: proposta_projeto_decola {
    view_label: "Proposta - Projeto Decola"
    sql_on:  ${proposta_projeto_decola.id_cpf}  = ${alunos.id_cpf}
          and ${proposta_projeto_decola.id_proposta} = ${alunos_painel_risco.proposta}
          and ${alunos.ultimo_acordo_decola} = ${proposta_projeto_decola.id_acordo};;
    relationship: many_to_one
    type: left_outer

    }

  join: financeiro {
    view_label: "Financeiro"
    sql_on: ${alunos.id_cpf} = ${financeiro.id_cpf} and ${financeiro.id_contrato} = ${proposta.id_proposta};;
    type: left_outer
    relationship: one_to_one
  }

  join: taxa_instituicao_simplificada {
    view_label: "Taxas da Instituição por Produto Gestão - Simplificada"
    sql_on:  ${taxa_instituicao_simplificada.id_instituicao} = ${proposta.id_instituicao}
      and   ${taxa_instituicao_simplificada.id_ies_contrato} = ${financeiro.id_ies_contrato} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: financeiro_extrato_titulo {
    view_label: "Extrato Titulo - Gestão"
    sql_on: ${financeiro.id_titulo} = ${financeiro_extrato_titulo.id_titulo};;
    type: left_outer
    relationship: one_to_one
  }

  join: alunos_acordo {
    view_label: "Cobrança - Acordo Informações"
    sql_on: ${alunos.id_cpf} = ${alunos_acordo.id_cpf} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_acordo_renegociacao {
    view_label: "Cobrança - Acordo Renegociação Informações"
    sql_on: ${alunos.id_cpf} = ${alunos_acordo_renegociacao.id_cpf}
          AND ${proposta.id_proposta} = ${alunos_acordo_renegociacao.id_proposta_acordo}
          ;;
    type: left_outer
    relationship: one_to_many
  }


  join: alunos_cobranca_estrategia_operacional {
    view_label: "Cobrança - Estratégia Operacional"
    sql_on: ${alunos.cpf_aluno} = ${alunos_cobranca_estrategia_operacional.cpf};;
    type: left_outer
    relationship: many_to_one
  }

# Erro: SQL compilation error: Database 'STAGE' does not exist or not authorized.
  join: alunos_cobranca_pdd {
    view_label: "Cobrança - PDD "
    sql_on: ${alunos.cpf_aluno} = ${alunos_cobranca_pdd.cpf};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_cobranca_radar {
    view_label: "Cobrança - RADAR "
    sql_on: ${alunos.cpf_aluno} = ${alunos_cobranca_radar.cpf};;
    type: left_outer
    relationship: one_to_many
  }

# Erro: SQL compilation error: Database 'STAGE' does not exist or not authorized.
  join: alunos_cobranca_pdd_boletos {
    view_label: "Cobrança - PDD Boletos"
    sql_on: ${alunos.cpf_aluno} = ${alunos_cobranca_pdd_boletos.cpf};;
    relationship: one_to_many
  }

  join: alunos_mis_meritocracia {
    view_label: "Cobrança - Meritocracia"
    sql_on: ${alunos.cpf_aluno} = ${alunos_mis_meritocracia.cpf_join};;
    type: left_outer
    relationship: one_to_many
  }

  join: alunos_cobranca_e_risco {
    view_label: "Cobrança e Risco"
    sql_on: ${alunos.cpf_aluno} = ${alunos_cobranca_e_risco.cpf};;
    type: left_outer
    relationship: one_to_many
  }


  join: status {
    view_label: "Status"
    sql_on: ${alunos.id_cpf} = ${status.id_cpf} and ${proposta.id_proposta} = ${status.id_proposta} ;;
    relationship: one_to_many
    type: left_outer
  }

  join: ano_mes_carteira_ativa {

    fields: []
  }

  join: leads_balcao {
    view_label: "Alunos"
    sql_on: ${leads_balcao.cpf_lead} = ${alunos.cpf_aluno} ;;
    relationship: one_to_many
    type: left_outer
  }

join: dim_cpf {
  view_label: "dim_CPF"
  sql_on: ${alunos.cpf_aluno} = ${dim_cpf.cpf} ;;
  relationship: one_to_many
}

join: jornada_pivot {}
join: proposta_datas_interfile {}

join: jornada {
  view_label: "Jornada"
  sql_on:  ${alunos.id_proposta_atual} = ${jornada.id_proposta}  and ${alunos.cpf_aluno} = ${jornada.aluno_cpf};;
  type: left_outer
  relationship: one_to_many


}

join: fato_final_pdd {
  view_label: "Final PDD - Veterano/Fato"
  sql_on: ${alunos.id_cpf} = ${fato_final_pdd.id_cpf};;
  type: left_outer
  relationship: one_to_many
}

}
