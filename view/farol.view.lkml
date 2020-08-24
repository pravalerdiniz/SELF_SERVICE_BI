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

dimension: ultima_data {
  type: number
   sql:row_number() over(order by ${TABLE}."DATA_CARGA" desc) ;;
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


  measure: status_2_90 {
    type: sum
    sql: ${status_2_90_problemas_integracao_produtos_neo_xbo};;
    label: "Status 2.90 "
    group_label: "ANÁLISE DE RISCO E CREDITO"

  }


  measure: status_8 {
    type: sum
    sql: ${status_8_mesa_bureaux};;
    label: "Status 8 Mesa Bureaux"
    group_label: "ANÁLISE DE RISCO E CREDITO"
    link: {
      label: "Detalhado"
    url:"/looks/449?&f[farol_detalhado.status]=-{{'8.33'}}&f[farol_detalhado.status]={{'8.'}}%25" }
     #url:"/looks/449?&f[farol_detalhado.status]=-{{'8.33'}}"}
  }

  measure: status_9 {
    type: sum
    sql: ${status_9_confirmacao_cpf_rf};;
    label: "Status 9 Confirmação CPF na RF"
    group_label: "ANÁLISE DE RISCO E CREDITO"

  }



  measure: status_9090 {
    type: sum
    sql: ${status_9090_dado_inconsistente};;
    label: "Status 9090 Dado Inconsistente"
    group_label: "ANÁLISE DE RISCO E CREDITO"

  }






  measure: perc_status11_sla_fora {
    type: sum
    sql: ${status_11_0_aluno_no_portal_da_ies_fora_sla}/IFF(${status_11_0_aluno_no_portal_da_ies_fora_sla} + ${status_11_0_aluno_no_portal_da_ies_dentro_sla}=0,1,
   ${status_11_0_aluno_no_portal_da_ies_fora_sla} + ${status_11_0_aluno_no_portal_da_ies_dentro_sla});;
    label: "Porcentagem - Status 11.0 - SLA Fora"
    group_label: "APROVAÇÃO IES"
    value_format: "0.0%"
  }

  measure: status11_sla_fora {
    type: sum
    sql: ${status_11_0_aluno_no_portal_da_ies_fora_sla};;
    label: "Status 11.0 - SLA Fora "
    group_label: "APROVAÇÃO IES"

  }


  measure: perc_status11_2_sla_fora {
    type: sum
    sql: ${status_11_2_aluno_no_portal_da_ies_fora_sla}/IFF(${status_11_2_aluno_no_portal_da_ies_dentro_sla} +   ${status_11_2_aluno_no_portal_da_ies_dentro_sla}=0,1,
   ${status_11_2_aluno_no_portal_da_ies_dentro_sla} +   ${status_11_2_aluno_no_portal_da_ies_dentro_sla}) ;;
    label: "Porcentagem - Status 11.2 - SLA Fora"
    group_label: "APROVAÇÃO IES"
    value_format: "0.0%"
  }

  measure: status11_2_sla_fora {
    type: sum
    sql: ${status_11_2_aluno_no_portal_da_ies_fora_sla};;
    label: "Status 11.2 - SLA Fora"
    group_label: "APROVAÇÃO IES"
  }




  measure: perc_status13_sla_fora {
    type: sum
    sql: ${status_13_aluno_pendente_matricula_fora_sla}/IFF( ${status_13_aluno_pendente_matricula_fora_sla} +  ${status_13_aluno_pendente_matricula_dentro_sla}=0,1,
   ${status_13_aluno_pendente_matricula_fora_sla} +  ${status_13_aluno_pendente_matricula_dentro_sla} );;
    label: "Porcentagem - Status 13 - SLA Fora"
    group_label: "APROVAÇÃO IES"
    value_format: "0.0%"
  }

  measure: status13_sla_fora {
    type: sum
    sql: ${status_13_aluno_pendente_matricula_fora_sla};;
    label: "Status 13 - SLA Fora"
    group_label: "APROVAÇÃO IES"
  }


  measure: perc_status15_sla_fora {
    type: sum
    sql: ${status_15_aluno_revertido_nova_analise_ies_fora_sla}/IFF(${status_15_aluno_revertido_nova_analise_ies_fora_sla} +  ${status_15_aluno_revertido_nova_analise_ies_dentro_sla}=0,1,
      ${status_15_aluno_revertido_nova_analise_ies_fora_sla} +  ${status_15_aluno_revertido_nova_analise_ies_dentro_sla});;
    label: "Porcentagem - Status 15 - SLA Fora"
    group_label: "APROVAÇÃO IES"
    value_format: "0.0%"
  }
  measure: status15_sla_fora {
    type: sum
    sql: ${status_15_aluno_revertido_nova_analise_ies_dentro_sla};;
    label: "Status 15 - SLA Fora"
    group_label: "APROVAÇÃO IES"
  }




  measure: perc_status14_sla_fora {
    type: sum
    sql: ${status_14_aluno_possui_divida_ies_fora_sla}/IFF(${status_14_aluno_possui_divida_ies_dentro_sla} +  ${status_15_aluno_revertido_nova_analise_ies_dentro_sla}=0,1,
     ${status_14_aluno_possui_divida_ies_dentro_sla} + ${status_14_aluno_possui_divida_ies_fora_sla});;
    label: "Porcentagem - Status 14 - SLA Fora"
    group_label: "APROVAÇÃO IES"
    value_format: "0.0%"
  }




  measure: status14_sla_fora {
    type: sum
    sql: ${status_14_aluno_possui_divida_ies_fora_sla};;
    label: "Status 14 - SLA Fora"
    group_label: "APROVAÇÃO IES"
  }








  measure: PERC_status2_0_sla_fora {
    type: sum
    sql: ${status_2_0_proposta_finalizada_fora}/

              IFF(${status_2_0_proposta_finalizada_dentro} + ${status_2_0_proposta_finalizada_fora}=0,1,

              ${status_2_0_proposta_finalizada_dentro} + ${status_2_0_proposta_finalizada_fora});;

      label: "Porcentagem - Status 2.0 - SLA Fora"

      group_label: "ANALISE DE RISCO E CREDITO"

      value_format: "0.0%"

    }

  measure: status2_0_sla_fora {
    type: sum
    sql: ${status_2_0_proposta_finalizada_fora};;
    label: "Status 2.0 - SLA Fora"
    group_label: "ANALISE DE RISCO E CREDITO"
  }




  measure: PERC_status2_35_sla_fora {
    type: sum
    sql: ${status_2_35_validacao_dados_analise_fora}/IFF(${status_2_35_validacao_dados_analise_dentro} + ${status_2_35_validacao_dados_analise_fora}=0,1,
    ${status_2_35_validacao_dados_analise_dentro} + ${status_2_35_validacao_dados_analise_fora});;
    label: "Porcentagem - Status 2.35 - SLA Fora"
    group_label: "ANALISE DE RISCO E CREDITO"
    value_format: "0.0%"
  }

  measure: status2_35_sla_fora {
    type: sum
    sql: ${status_2_35_validacao_dados_analise_fora};;
    label: "Status 2.35 - SLA Fora"
    group_label: "ANALISE DE RISCO E CREDITO"
  }



  measure: PERC_status2_37_sla_fora {
    type: sum
    sql: ${status_2_37_integracao_neo_xbo_fora}/

              IFF(${status_2_37_integracao_neo_xbo_dentro} + ${status_2_37_integracao_neo_xbo_fora}=0,1,

              ${status_2_37_integracao_neo_xbo_dentro} + ${status_2_37_integracao_neo_xbo_fora}  );;

      label: "Porcentagem - Status 2.37 - SLA Fora"

      group_label: "ANALISE DE RISCO E CREDITO"

      value_format: "0.0%"

    }


  measure: status2_37_sla_fora {
    type: sum
    sql: ${status_2_37_integracao_neo_xbo_fora};;
    label: "Status 2.37 - SLA Fora"
    group_label: "ANALISE DE RISCO E CREDITO"
    drill_fields: [farol_detalhado.proposta]
  }


  measure: PERC_status25_1_sla_fora {
    type: sum
    sql: ${status_25_1_confirmacao_dados_fora}/IFF(${status_25_1_confirmacao_dados_dentro} + ${status_25_1_confirmacao_dados_fora}=0,1,
    ${status_25_1_confirmacao_dados_dentro} + ${status_25_1_confirmacao_dados_fora}
    );;
    label: "Porcentagem - Status 25.1 - SLA Fora"
    group_label: "CONFIRMAÇÃO DE DADOS"
    value_format: "0.0%"
  }

  measure: status25_1_sla_fora {
    type: sum
    sql: ${status_25_1_confirmacao_dados_fora};;
    label: "Status 25.1 - SLA Fora"
    group_label: "CONFIRMAÇÃO DE DADOS"

  }



  measure: PERC_status25_2_sla_fora {
    type: sum
    sql: ${status_25_2_confirmacao_dados_bv_fora}/IFF(${status_25_2_confirmacao_dados_bv_dentro} + ${status_25_2_confirmacao_dados_bv_fora}=0,1,
   ${status_25_2_confirmacao_dados_bv_dentro} + ${status_25_2_confirmacao_dados_bv_fora} );;
    label: "Porcentagem - Status 25.2 - SLA Fora"
    group_label: "CONFIRMAÇÃO DE DADOS"
    value_format: "0.0%"
  }


  measure: status25_2_sla_fora {
    type: sum
    sql: ${status_25_2_confirmacao_dados_bv_fora};;
    label: "Status 25.2 - SLA Fora"
    group_label: "CONFIRMAÇÃO DE DADOS"
  }



  measure: PERC_status25_4_sla_fora {
    type: sum
    sql: ${status_25_4_escolha_produto_fora}/IFF(${status_25_4_escolha_produto_dentro} + ${status_25_4_escolha_produto_fora}=0,1,
    ${status_25_4_escolha_produto_dentro} + ${status_25_4_escolha_produto_fora});;
    label: "Porcentagem - Status 25.4 - SLA Fora"
    group_label: "CONFIRMAÇÃO DE DADOS"
    value_format: "0.0%"
  }


  measure:status25_4_sla_fora {
    type: sum
    sql: ${status_25_4_escolha_produto_fora};;
    label: "Status 25.4 - SLA Fora"
    group_label: "CONFIRMAÇÃO DE DADOS"
  }



  measure: PERC_status26_1_sla_fora {
    type: sum
    sql: ${status_26_1_restritivo_bv_fora}/IFF(${status_26_1_restritivo_bv_dentro} + ${status_26_1_restritivo_bv_fora}=0,1,
    ${status_26_1_restritivo_bv_dentro} + ${status_26_1_restritivo_bv_fora});;
    label: "Porcentagem - Status 26.1 - SLA Fora"
    group_label: "CONFIRMAÇÃO DE DADOS"
    value_format: "0.0%"
  }

  measure: status26_1_sla_fora {
    type: sum
    sql: ${status_26_1_restritivo_bv_fora};;
    label: "Status 26.1 - SLA Fora"
    group_label: "CONFIRMAÇÃO DE DADOS"
  }

  measure: status8_33_erro_bv {
    type: sum
    sql: ${status_8_33_erro_bv_score};;
    label: "Status 8.33"
    group_label: "CONFIRMAÇÃO DE DADOS"
  }



  measure: perc_status_41_1_sla_fora {
    type: sum
    sql: ${status_41_formalizado_fora}/

      IFF(${status_41_formalizado_fora} + ${status_41_formalizado_dentro}=0,1,

      ${status_41_formalizado_fora} + ${status_41_formalizado_dentro});;
    label: "Porcentagem - Status 41 - SLA Fora"
    group_label: "CESSÃO/CONTRATAÇÃO"
    value_format: "0.0%"
  }

  measure:status41_sla_fora {
    type: sum
    sql:${status_41_formalizado_fora};;
    label: "Status 41 - SLA Fora"
    group_label: "CESSÃO/CONTRATAÇÃO"

  }

  measure: perc_status_50_0_sla_fora {
    type: sum
    sql: ${status_50_credito_cedido_fora}/

      IFF( ${status_50_credito_cedido_fora} + ${status_50_credito_cedido_dentro}=0,1,

       ${status_50_credito_cedido_fora} + ${status_50_credito_cedido_dentro});;
    label: "Porcentagem - Status 50.0 - SLA Fora"
    group_label: "CRÉDITO CEDIDO"
    value_format: "0.0%"
  }


  measure:status50_sla_fora {
    type: sum
    sql: ${status_50_credito_cedido_fora};;
    label: "Status 50.0 - SLA Fora"
    group_label: "CRÉDITO CEDIDO"

  }



  measure: perc_status_46_sla_fora {
    type: sum
    sql: ${status_46_contrato_nao_concedido_fora}/

      IFF(${status_46_contrato_nao_concedido_fora} + ${status_46_contrato_nao_concedido_dentro}=0,1,

      ${status_46_contrato_nao_concedido_fora} + ${status_46_contrato_nao_concedido_dentro});;
    label: "Porcentagem - Status 46 - SLA Fora"
    group_label: "CONTRATO NÃO CONCEDIDO"
    value_format: "0.0%"
  }

  measure:status46_sla_fora {
    type: sum
    sql: ${status_46_contrato_nao_concedido_fora};;
    label: "Status 46 - SLA Fora"
    group_label: "CONTRATO NÃO CONCEDIDO"
  }

  measure: perc_status_84_1_sla_fora {
    type: sum
    sql: ${status_84_1_exclusivo_cessao_aluno_formalizado_fora}/

      IFF(${status_84_1_exclusivo_cessao_aluno_formalizado_fora} + ${status_84_1_exclusivo_cessao_aluno_formalizado_dentro}=0,1,

      ${status_84_1_exclusivo_cessao_aluno_formalizado_fora} + ${status_84_1_exclusivo_cessao_aluno_formalizado_dentro});;
    label: "Porcentagem - Status 84.1 - SLA Fora"
    group_label: "EXCLUSIVO DA CESSÃO - ALUNO FORMALIZAÇÃO"
    value_format: "0.0%"
  }


  measure:status84_sla_fora {
    type: sum
    sql: ${status_84_1_exclusivo_cessao_aluno_formalizado_fora};;
    label: "Status 84.1 - SLA Fora"
    group_label: "EXCLUSIVO DA CESSÃO - ALUNO FORMALIZAÇÃO"
  }







  measure: perc_status_99_1_sla_fora {
    type: sum
    sql: ${status_99_1_erros_cessao_fora}/

      IFF(${status_99_1_erros_cessao_fora} + ${status_99_1_erros_cessao_dentro}=0,1,

      ${status_99_1_erros_cessao_fora} + ${status_99_1_erros_cessao_dentro});;
    label: "Porcentagem - Status 99.1 - SLA Fora"
    group_label: "EXCLUSIVO PARA ERROS DA CESSÃO"
    value_format: "0.0%"
  }


  measure:status99_sla_fora {
    type: sum
    sql: ${status_99_1_erros_cessao_fora};;
    label: "Status -99 SLA Fora"
    group_label: "EXCLUSIVO PARA ERROS DA CESSÃO"

  }


  measure: perc_status_31_1_sla_fora {
    type: sum
    sql: ${status_31_1_aprovado_pela_ies_fora}/

      IFF(${status_31_1_aprovado_pela_ies_fora} + ${status_31_1_aprovado_pela_ies_dentro}=0,1,

      ${status_31_1_aprovado_pela_ies_fora} + ${status_31_1_aprovado_pela_ies_dentro});;
    label: "Porcentagem - Status 31.1 - SLA Dentro"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
    value_format: "0.0%"
  }

  measure: status_31_1_sla_fora {
    type: sum
    sql: ${status_31_1_aprovado_pela_ies_fora};;
    label: "Número - Status 31.1  - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"

  }

  measure: perc_status_31_4_sla_fora {
    type: sum
    sql: ${status_31_4_aguardando_geracao_contrato_fora}/

      IFF(${status_31_4_aguardando_geracao_contrato_fora} + ${status_31_4_aguardando_geracao_contrato_dentro}=0,1,

      ${status_31_4_aguardando_geracao_contrato_fora} + ${status_31_4_aguardando_geracao_contrato_dentro});;
    label: "Porcentagem - Status 31.4 - SLA Dentro"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
    value_format: "0.0%"
  }

  measure: status_31_4_sla_fora {
    type: sum
    sql: ${status_31_4_aguardando_geracao_contrato_fora};;
    label: "Número - Status 31.4  - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
  }


  measure: status_33_0_sla_fora {
    type: sum
    sql: ${status_33_0_mesa_geracao_contratos_fora};;
    label: "Número - Status 33.0  - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
  }

  measure: perc_status_33_0_sla_fora {
    type: sum
    sql: ${status_33_0_mesa_geracao_contratos_fora}/

      IFF(${status_33_0_mesa_geracao_contratos_fora} + ${status_33_0_mesa_geracao_contratos_dentro}=0,1,

     ${status_33_0_mesa_geracao_contratos_fora} + ${status_33_0_mesa_geracao_contratos_dentro});;
    label: "Porcentagem - Status 33.0 - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
    value_format: "0.0%"
  }



  measure: perc_status_33_2_sla_fora {
    type: sum
    sql: ${status_33_2_erro_geracao_contrato_fora}/IFF(${status_33_2_erro_geracao_contrato_fora} + ${status_33_2_erro_geracao_contrato_dentro}=0,1,
    ${status_33_2_erro_geracao_contrato_fora} + ${status_33_2_erro_geracao_contrato_dentro});;
    label: "Porcentagem - Status 33.2 - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
    value_format: "0.0%"
  }


  measure: status_33_2_sla_fora {
    type: sum
    sql: ${status_33_2_erro_geracao_contrato_fora};;
    label: "Status 33.2  - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
  }

  measure: perc_status_34_0_sla_fora {
    type: sum
    sql: ${status_34_0_processo_emissao_contrato_fora}/
    IFF(${status_34_0_processo_emissao_contrato_fora} + ${status_34_0_processo_emissao_contrato_dentro}=0,1,
    ${status_34_0_processo_emissao_contrato_fora} + ${status_34_0_processo_emissao_contrato_dentro})
    ;;
    label: "Porcentagem - Status 34.0 - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
    value_format: "0.0%"
  }


  measure: status_34_0_sla_fora {
    type: sum
    sql: ${status_34_0_processo_emissao_contrato_fora};;
    label: "Número - Status 34.0  - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALICAÇÃO"
  }

  measure: perc_status_34_1_sla_fora {
    type: sum
    sql: ${status_34_1_aluno_aprovado_resumo_contrato_fora}/IFF(${status_34_1_aluno_aprovado_resumo_contrato_fora} + ${status_34_1_aluno_aprovado_resumo_contrato_dentro}=0,1,
    ${status_34_1_aluno_aprovado_resumo_contrato_fora} + ${status_34_1_aluno_aprovado_resumo_contrato_dentro});;
    label: "Porcentagem - Status 34.1 - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
    value_format: "0.0%"
  }


  measure: status_34_1_sla_fora {
    type: sum
    sql: ${status_34_1_aluno_aprovado_resumo_contrato_fora};;
    label: "Número - Status 34.1  - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
  }

  measure: perc_status_35_0_sla_fora {
    type: sum
    sql: ${status_35_0_aprovado_para_gerar_contrato_fora}/IFF(${status_35_0_aprovado_para_gerar_contrato_fora} + ${status_35_0_aprovado_para_gerar_contrato_dentro}=0,1,
    ${status_35_0_aprovado_para_gerar_contrato_fora} + ${status_35_0_aprovado_para_gerar_contrato_dentro});;
    label: "Porcentagem - Status 35.0 - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
    value_format: "0.0%"
  }


  measure: status_35_0_sla_fora {
    type: sum
    sql: ${status_35_0_aprovado_para_gerar_contrato_fora};;
    label: "Número - Status 35.0  - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
  }

  measure: perc_status_40_5_sla_fora {
    type: sum
    sql: ${status_40_5_aguardando_assinatura_contrato_fora}/IFF(${status_40_5_aguardando_assinatura_contrato_fora} + ${status_40_5_aguardando_assinatura_contrato_dentro}=0,1,
    ${status_40_5_aguardando_assinatura_contrato_fora} + ${status_40_5_aguardando_assinatura_contrato_dentro}
    );;
    label: "Porcentagem - Status 40.5 - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
    value_format: "0.0%"
  }


  measure: status_40_5_sla_fora {
    type: sum
    sql: ${status_40_5_aguardando_assinatura_contrato_fora};;
    label: "Número - Status 40.5  - SLA Fora"
    group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
  }











}
