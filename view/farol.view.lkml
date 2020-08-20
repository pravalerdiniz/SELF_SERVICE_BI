view: farol {
  sql_table_name: "SELF_SERVICE_BI"."FAROL"
    ;;

  dimension_group: data_carga {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_CARGA" ;;
  }

  dimension: proc_neoxbo_2_37_dentro {
    type: number
    sql: ${TABLE}."PROC_NEOXBO_2_37_DENTRO" ;;
  }

  dimension: proc_neoxbo_2_37_fora {
    type: number
    sql: ${TABLE}."PROC_NEOXBO_2_37_FORA" ;;
  }

  dimension: proc_status_11_0_aluno_portal_da_ies_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_11_0_ALUNO_PORTAL_DA_IES_DENTRO" ;;
  }

  dimension: proc_status_11_0_aluno_portal_da_ies_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_11_0_ALUNO_PORTAL_DA_IES_FORA" ;;
  }

  dimension: proc_status_11_2_aluno_portal_ies_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_11_2_ALUNO_PORTAL_IES_DENTRO" ;;
  }

  dimension: proc_status_11_2_aluno_portal_ies_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_11_2_ALUNO_PORTAL_IES_FORA" ;;
  }

  dimension: proc_status_13_aluno_pendente_matricula_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_13_ALUNO_PENDENTE_MATRICULA_DENTRO" ;;
  }

  dimension: proc_status_13_aluno_pendente_matricula_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_13_ALUNO_PENDENTE_MATRICULA_FORA" ;;
  }

  dimension: proc_status_14_possui_divida_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_14_POSSUI_DIVIDA_DENTRO" ;;
  }

  dimension: proc_status_14_possui_divida_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_14_POSSUI_DIVIDA_FORA" ;;
  }

  dimension: proc_status_15_aluno_revertido_nova_analise_ies_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_15_ALUNO_REVERTIDO_NOVA_ANALISE_IES_DENTRO" ;;
  }

  dimension: proc_status_15_aluno_revertido_nova_analise_ies_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_15_ALUNO_REVERTIDO_NOVA_ANALISE_IES_FORA" ;;
  }

  dimension: proc_status_25_1_confirmacao_dados_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_25_1_CONFIRMACAO_DADOS_DENTRO" ;;
  }

  dimension: proc_status_25_1_confirmacao_dados_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_25_1_CONFIRMACAO_DADOS_FORA" ;;
  }

  dimension: proc_status_25_2_confirmacao_dados_bv_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_25_2_CONFIRMACAO_DADOS_BV_DENTRO" ;;
  }

  dimension: proc_status_25_2_confirmacao_dados_bv_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_25_2_CONFIRMACAO_DADOS_BV_FORA" ;;
  }

  dimension: proc_status_25_4_escolha_produto_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_25_4_ESCOLHA_PRODUTO_DENTRO" ;;
  }

  dimension: proc_status_25_4_escolha_produto_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_25_4_ESCOLHA_PRODUTO_FORA" ;;
  }

  dimension: proc_status_26_1_restritivo_bv_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_26_1_RESTRITIVO_BV_DENTRO" ;;
  }

  dimension: proc_status_26_1_restritivo_bv_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_26_1_RESTRITIVO_BV_FORA" ;;
  }

  dimension: proc_status_2_0_proposta_finalizada_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_2_0_PROPOSTA_FINALIZADA_DENTRO" ;;
  }

  dimension: proc_status_2_0_proposta_finalizada_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_2_0_PROPOSTA_FINALIZADA_FORA" ;;
  }

  dimension: proc_status_31_1_aprovado_pela_ies_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_31_1_APROVADO_PELA_IES_DENTRO" ;;
  }

  dimension: proc_status_31_1_aprovado_pela_ies_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_31_1_APROVADO_PELA_IES_FORA" ;;
  }

  dimension: proc_status_31_4_aguardando_geracao_contrato_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_31_4_AGUARDANDO_GERACAO_CONTRATO_DENTRO" ;;
  }

  dimension: proc_status_31_4_aguardando_geracao_contrato_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_31_4_AGUARDANDO_GERACAO_CONTRATO_FORA" ;;
  }

  dimension: proc_status_33_0_mesa_geracao_contratos_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_33_0_MESA_GERACAO_CONTRATOS_DENTRO" ;;
  }

  dimension: proc_status_33_0_mesa_geracao_contratos_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_33_0_MESA_GERACAO_CONTRATOS_FORA" ;;
  }

  dimension: proc_status_35_0_aprovado_para_gerar_contrato_35_0_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_35_0_APROVADO_PARA_GERAR_CONTRATO_35_0_DENTRO" ;;
  }

  dimension: proc_status_35_0_aprovado_para_gerar_contrato_35_0_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_35_0_APROVADO_PARA_GERAR_CONTRATO_35_0_FORA" ;;
  }

  dimension: proc_status_40_5_aguardando_assinatura_contrato_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_40_5_AGUARDANDO_ASSINATURA_CONTRATO_DENTRO" ;;
  }

  dimension: proc_status_40_5_aguardando_assinatura_contrato_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_40_5_AGUARDANDO_ASSINATURA_CONTRATO_FORA" ;;
  }

  dimension: proc_status_41_formalizado_cedido_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_41_FORMALIZADO_CEDIDO_DENTRO" ;;
  }

  dimension: proc_status_41_formalizado_cedido_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_41_FORMALIZADO_CEDIDO_FORA" ;;
  }

  dimension: proc_status_46_contrato_nao_cedido_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_46_CONTRATO_NAO_CEDIDO_DENTRO" ;;
  }

  dimension: proc_status_46_contrato_nao_cedido_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_46_CONTRATO_NAO_CEDIDO_FORA" ;;
  }

  dimension: proc_status_50_contrato_cedido_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_50_CONTRATO_CEDIDO_DENTRO" ;;
  }

  dimension: proc_status_50_contrato_cedido_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_50_CONTRATO_CEDIDO_FORA" ;;
  }

  dimension: proc_status_84_1_exclusivo_cessao_aluno_formalizado_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_84_1_EXCLUSIVO_CESSAO_ALUNO_FORMALIZADO_DENTRO" ;;
  }

  dimension: proc_status_84_1_exclusivo_cessao_aluno_formalizado_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_84_1_EXCLUSIVO_CESSAO_ALUNO_FORMALIZADO_FORA" ;;
  }

  dimension: proc_status_99_1_erros_cessao_dentro {
    type: number
    sql: ${TABLE}."PROC_STATUS_99_1_ERROS_CESSAO_DENTRO" ;;
  }

  dimension: proc_status_99_1_erros_cessao_fora {
    type: number
    sql: ${TABLE}."PROC_STATUS_99_1_ERROS_CESSAO_FORA" ;;
  }

  dimension: proc_validacao_dados_2_35_dentro {
    type: number
    sql: ${TABLE}."PROC_VALIDACAO_DADOS_2_35_DENTRO" ;;
  }

  dimension: proc_validacao_dados_2_35_fora {
    type: number
    sql: ${TABLE}."PROC_VALIDACAO_DADOS_2_35_FORA" ;;
  }

  dimension: status34_0_processo_emissao_contrato_dentro {
    type: number
    sql: ${TABLE}."Status34_0_Processo_Emissao_Contrato_Dentro" ;;
  }

  dimension: status34_0_processo_emissao_contrato_fora {
    type: number
    sql: ${TABLE}."Status34_0_Processo_Emissao_Contrato_Fora" ;;
  }

  dimension: status_11_0_aluno_no_portal_da_ies_dentro_sla {
    type: number
    sql: ${TABLE}."Status_11_0_Aluno_no_Portal_da_IES_Dentro_SLA" ;;
  }

  dimension: status_11_0_aluno_no_portal_da_ies_fora_sla {
    type: number
    sql: ${TABLE}."Status_11_0_Aluno_no_Portal_da_IES_FORA_SLA" ;;
  }

  dimension: status_11_2_aluno_no_portal_da_ies_dentro_sla {
    type: number
    sql: ${TABLE}."Status_11_2_Aluno_no_Portal_da_IES_Dentro_SLA" ;;
  }

  dimension: status_11_2_aluno_no_portal_da_ies_fora_sla {
    type: number
    sql: ${TABLE}."Status_11_2_Aluno_no_Portal_da_IES_FORA_SLA" ;;
  }

  dimension: status_13_aluno_pendente_matricula_dentro_sla {
    type: number
    sql: ${TABLE}."Status_13_Aluno_Pendente_Matricula_Dentro_SLA" ;;
  }

  dimension: status_13_aluno_pendente_matricula_fora_sla {
    type: number
    sql: ${TABLE}."Status_13_Aluno_Pendente_Matricula_Fora_SLA" ;;
  }

  dimension: status_14_aluno_possui_divida_ies_dentro_sla {
    type: number
    sql: ${TABLE}."Status_14_Aluno_Possui_Divida_IES_Dentro_SLA" ;;
  }

  dimension: status_14_aluno_possui_divida_ies_fora_sla {
    type: number
    sql: ${TABLE}."Status_14_Aluno_Possui_Divida_IES_Fora_SLA" ;;
  }

  dimension: status_15_aluno_revertido_nova_analise_ies_dentro_sla {
    type: number
    sql: ${TABLE}."Status_15_Aluno_Revertido_Nova_Analise_IES_Dentro_SLA" ;;
  }

  dimension: status_15_aluno_revertido_nova_analise_ies_fora_sla {
    type: number
    sql: ${TABLE}."Status_15_Aluno_Revertido_Nova_Analise_IES_Fora_SLA" ;;
  }

  dimension: status_25_1_confirmacao_dados_dentro {
    type: number
    sql: ${TABLE}."Status_25_1_Confirmacao_Dados_Dentro" ;;
  }

  dimension: status_25_1_confirmacao_dados_fora {
    type: number
    sql: ${TABLE}."Status_25_1_Confirmacao_Dados_Fora" ;;
  }

  dimension: status_25_2_confirmacao_dados_bv_dentro {
    type: number
    sql: ${TABLE}."Status_25_2_Confirmacao_Dados_BV_Dentro" ;;
  }

  dimension: status_25_2_confirmacao_dados_bv_fora {
    type: number
    sql: ${TABLE}."Status_25_2_Confirmacao_Dados_BV_Fora" ;;
  }

  dimension: status_25_4_escolha_produto_dentro {
    type: number
    sql: ${TABLE}."Status_25_4_Escolha_Produto_dentro" ;;
  }

  dimension: status_25_4_escolha_produto_fora {
    type: number
    sql: ${TABLE}."Status_25_4_Escolha_Produto_Fora" ;;
  }

  dimension: status_26_1_restritivo_bv_dentro {
    type: number
    sql: ${TABLE}."Status_26_1_Restritivo_BV_dentro" ;;
  }

  dimension: status_26_1_restritivo_bv_fora {
    type: number
    sql: ${TABLE}."Status_26_1_Restritivo_BV_Fora" ;;
  }

  dimension: status_2_0_proposta_finalizada_dentro {
    type: number
    sql: ${TABLE}."Status_2_0_Proposta_finalizada_dentro" ;;
  }

  dimension: status_2_0_proposta_finalizada_fora {
    type: number
    sql: ${TABLE}."Status_2_0_Proposta_finalizada_Fora" ;;
  }

  dimension: status_2_35_validacao_dados_analise_dentro {
    type: number
    sql: ${TABLE}."Status_2_35_Validacao_Dados_Analise_dentro" ;;
  }

  dimension: status_2_35_validacao_dados_analise_fora {
    type: number
    sql: ${TABLE}."Status_2_35_Validacao_Dados_Analise_Fora" ;;
  }

  dimension: status_2_37_integracao_neo_xbo_dentro {
    type: number
    sql: ${TABLE}."Status_2_37_Integracao_NeoXBo_dentro" ;;
  }

  dimension: status_2_37_integracao_neo_xbo_fora {
    type: number
    sql: ${TABLE}."Status_2_37_Integracao_NeoXBo_Fora" ;;
  }

  dimension: status_2_90_problemas_integracao_produtos_neo_xbo {
    type: number
    sql: ${TABLE}."Status_2_90_Problemas_Integracao_Produtos_NeoXBo" ;;
  }

  dimension: status_31_1_aprovado_pela_ies_dentro {
    type: number
    sql: ${TABLE}."Status_31_1_Aprovado_pela_IES_Dentro" ;;
  }

  dimension: status_31_1_aprovado_pela_ies_fora {
    type: number
    sql: ${TABLE}."Status_31_1_Aprovado_pela_IES_Fora" ;;
  }

  dimension: status_31_4_aguardando_geracao_contrato_dentro {
    type: number
    sql: ${TABLE}."Status_31_4_Aguardando_Geracao_contrato_Dentro" ;;
  }

  dimension: status_31_4_aguardando_geracao_contrato_fora {
    type: number
    sql: ${TABLE}."Status_31_4_Aguardando_Geracao_contrato_Fora" ;;
  }

  dimension: status_33_0_mesa_geracao_contratos_dentro {
    type: number
    sql: ${TABLE}."Status_33_0_Mesa_geracao_Contratos_Dentro" ;;
  }

  dimension: status_33_0_mesa_geracao_contratos_fora {
    type: number
    sql: ${TABLE}."Status_33_0_Mesa_geracao_Contratos_Fora" ;;
  }

  dimension: status_33_2_erro_geracao_contrato_dentro {
    type: number
    sql: ${TABLE}."Status_33_2_Erro_Geracao_Contrato_Dentro" ;;
  }

  dimension: status_33_2_erro_geracao_contrato_fora {
    type: number
    sql: ${TABLE}."Status_33_2_Erro_Geracao_Contrato_Fora" ;;
  }

  dimension: status_34_0_processo_emissao_contrato_dentro {
    type: number
    sql: ${TABLE}."Status_34_0_Processo_Emissao_Contrato_Dentro" ;;
  }

  dimension: status_34_0_processo_emissao_contrato_fora {
    type: number
    sql: ${TABLE}."Status_34_0_Processo_Emissao_Contrato_Fora" ;;
  }

  dimension: status_34_1_aluno_aprovado_resumo_contrato_dentro {
    type: number
    sql: ${TABLE}."Status_34_1_Aluno_Aprovado_Resumo_Contrato_Dentro" ;;
  }

  dimension: status_34_1_aluno_aprovado_resumo_contrato_fora {
    type: number
    sql: ${TABLE}."Status_34_1_Aluno_Aprovado_Resumo_Contrato_Fora" ;;
  }

  dimension: status_35_0_aprovado_para_gerar_contrato_dentro {
    type: number
    sql: ${TABLE}."Status_35_0_Aprovado_Para_Gerar_contrato_Dentro" ;;
  }

  dimension: status_35_0_aprovado_para_gerar_contrato_fora {
    type: number
    sql: ${TABLE}."Status_35_0_Aprovado_Para_Gerar_contrato_Fora" ;;
  }

  dimension: status_40_5_aguardando_assinatura_contrato_dentro {
    type: number
    sql: ${TABLE}."Status_40_5_Aguardando_Assinatura_Contrato_Dentro" ;;
  }

  dimension: status_40_5_aguardando_assinatura_contrato_fora {
    type: number
    sql: ${TABLE}."Status_40_5_Aguardando_Assinatura_Contrato_Fora" ;;
  }

  dimension: status_41_formalizado_dentro {
    type: number
    sql: ${TABLE}."Status_41_Formalizado_Dentro" ;;
  }

  dimension: status_41_formalizado_fora {
    type: number
    sql: ${TABLE}."Status_41_Formalizado_Fora" ;;
  }

  dimension: status_46_contrato_nao_concedido_dentro {
    type: number
    sql: ${TABLE}."Status_46_Contrato_Nao_Concedido_Dentro" ;;
  }

  dimension: status_46_contrato_nao_concedido_fora {
    type: number
    sql: ${TABLE}."Status_46_Contrato_Nao_Concedido_Fora" ;;
  }

  dimension: status_50_credito_cedido_dentro {
    type: number
    sql: ${TABLE}."Status_50_Credito_cedido_Dentro" ;;
  }

  dimension: status_50_credito_cedido_fora {
    type: number
    sql: ${TABLE}."Status_50_Credito_cedido_Fora" ;;
  }

  dimension: status_84_1_exclusivo_cessao_aluno_formalizado_dentro {
    type: number
    sql: ${TABLE}."Status_84_1_Exclusivo_cessao_Aluno_formalizado_Dentro" ;;
  }

  dimension: status_84_1_exclusivo_cessao_aluno_formalizado_fora {
    type: number
    sql: ${TABLE}."Status_84_1_Exclusivo_cessao_Aluno_formalizado_Fora" ;;
  }

  dimension: status_8_33_erro_bv_score {
    type: number
    sql: ${TABLE}."Status_8_33_Erro_BV_Score" ;;
  }

  dimension: status_8_mesa_bureaux {
    type: number
    sql: ${TABLE}."Status_8_Mesa_Bureaux" ;;
  }

  dimension: status_9090_dado_inconsistente {
    type: number
    sql: ${TABLE}."Status_9090_Dado_Inconsistente" ;;
  }

  dimension: status_99_1_erros_cessao_dentro {
    type: number
    sql: ${TABLE}."Status_99_1_Erros_Cessao_Dentro" ;;
  }

  dimension: status_99_1_erros_cessao_fora {
    type: number
    sql: ${TABLE}."Status_99_1_Erros_Cessao_Fora" ;;
  }

  dimension: status_9_confirmacao_cpf_rf {
    type: number
    sql: ${TABLE}."Status_9_Confirmacao_CPF_RF" ;;
  }
  #a

  measure: count {
    type: count
    drill_fields: []
  }
}
