view: farol {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."FAROL"
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
    sql: case when ${okr_farol_check_data.data_carga_raw} is
        not null then 1 else 0
        end
        ;;

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






    measure: count {
      type: count
      drill_fields: []
    }




    measure: status_2_90 {
      type: sum
      sql: ${status_2_90_problemas_integracao_produtos_neo_xbo};;
      label: "Status 2.90 "
      group_label: "ANÁLISE DE RISCO E CREDITO"
      link: {
        label: "Detalhado"
        url: "/looks/449?&f[farol_detalhado.status]={{'2.90'}}"}

    }


    measure: status_8 {
      type: sum
      sql: ${status_8_mesa_bureaux};;
      label: "Status 8 Mesa Bureaux"
      group_label: "ANÁLISE DE RISCO E CREDITO"
      link: {
        label: "Detalhado"
        #url:"/looks/449?&f[farol_detalhado.status]={{'8.'}}%25" }
        #url:"/looks/449?&f[farol_detalhado.status]=-{{'8.33'}}"}
        url:"/looks/449?&f[farol_detalhado.status]=8.%25%2C-8.33" }
    }

    measure: status_9 {
      type: sum
      sql: ${status_9_confirmacao_cpf_rf};;
      label: "Status 9 Confirmação CPF na RF"
      group_label: "ANÁLISE DE RISCO E CREDITO"
      link: {
        label: "Detalhado"
        url: "/looks/449?&f[farol_detalhado.status]={{'9.'}}%25"}


    }



    measure: status_9090 {
      type: sum
      sql: ${status_9090_dado_inconsistente};;
      label: "Status 9090 Dado Inconsistente"
      group_label: "ANÁLISE DE RISCO E CREDITO"
      link: {
        label: "Detalhado"
        url: "/looks/449?&f[farol_detalhado.status]=%25{{'9090.'}}%25"}


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
      link: {
        label: "Detalhado"
        url: "/looks/449?&f[farol_detalhado.status]={{'11.0'}}"}


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
      link: {
        label: "Detalhado"
        url: "/looks/449?&f[farol_detalhado.status]={{'11.2'}}"}

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
      link: {
        label: "Detalhado"
        url: "/looks/449?&f[farol_detalhado.status]={{'13.'}}%25"}

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
      sql: ${status_15_aluno_revertido_nova_analise_ies_fora_sla};;
      label: "Status 15 - SLA Fora"
      group_label: "APROVAÇÃO IES"
      link: {
        label: "Detalhado"
        url: "/looks/449?&f[farol_detalhado.status]={{'15.'}}%25"}

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
      link: {
        label: "Detalhado"
        url: "/looks/449?&f[farol_detalhado.status]={{'14.'}}%25"}


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
        link: {
          label: "Detalhado"
          url: "/looks/449?&f[farol_detalhado.status]={{'2.0'}}"}

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
        link: {
          label: "Detalhado"
          url: "/looks/449?&f[farol_detalhado.status]={{'2.35'}}"}

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
          #drill_fields: [farol_detalhado.proposta]
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]=%25{{'2.37'}}%25"}

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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'25.1'}}"}


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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'25.2'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'25.4'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'26.1'}}"}
        }

        measure: status8_33_erro_bv {
          type: sum
          sql: ${status_8_33_erro_bv_score};;
          label: "Status 8.33"
          group_label: "CONFIRMAÇÃO DE DADOS"
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'8.33'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'41.'}}%25"}

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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'50.0'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'46.'}}%25"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'84.1'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]=%25{{'99.'}}%25"}

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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'31.1'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'31.4'}}"}
        }


        measure: status_33_0_sla_fora {
          type: sum
          sql: ${status_33_0_mesa_geracao_contratos_fora};;
          label: "Número - Status 33.0  - SLA Fora"
          group_label: "GERAÇÃO DE CONTRATO E FORMALIZAÇÃO"
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'33.0'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'33.2'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'34.0'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'34.1'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'35.0'}}"}
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
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'40.5'}}"}
        }




        measure: status_fora {
          type: number
          sql: ${status2_0_sla_fora}+
                  ${status2_35_sla_fora}+
                  ${status2_37_sla_fora}+
                  ${status11_sla_fora}+
                  ${status11_2_sla_fora}+
                  ${status13_sla_fora}+
                  ${status14_sla_fora}+
                  ${status15_sla_fora}+
                  ${status41_sla_fora}+
                  ${status25_1_sla_fora}+
                  ${status25_2_sla_fora}+
                  ${status26_1_sla_fora}+
                  ${status25_4_sla_fora}+
                  ${status46_sla_fora}+
                  ${status50_sla_fora}+
                  ${status84_sla_fora}+
                  ${status99_sla_fora}+
                  ${status_34_0_sla_fora}+
                  ${status_31_4_sla_fora}+
                  ${status_31_1_sla_fora}+
                  ${status_33_0_sla_fora}+
                  ${status_34_1_sla_fora}+
                  ${status_35_0_sla_fora}+
                  ${status_40_5_sla_fora}+
                  ${status_33_2_sla_fora}+
                  ${status_erro};;

          }




          measure: status_erro {
            type: number
            sql: ${status_8}+${status_2_90}+${status_9090}+${status_9} ;;
            hidden: yes
          }






          dimension: total_status_fora_novos {
            type: number
            label: "OKR 100% Diario - Alunos Novos"
            sql: CASE WHEN ${TABLE}."Status_11_2_Aluno_no_Portal_da_IES_FORA_SLA" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_15_Aluno_Revertido_Nova_Analise_IES_Fora_SLA" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_41_Formalizado_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_84_1_Exclusivo_cessao_Aluno_formalizado_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_99_1_Erros_Cessao_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_25_1_Confirmacao_Dados_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_25_2_Confirmacao_Dados_BV_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_25_4_Escolha_Produto_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_26_1_Restritivo_BV_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_31_1_Aprovado_pela_IES_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_31_4_Aguardando_Geracao_contrato_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_33_0_Mesa_geracao_Contratos_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_35_0_Aprovado_Para_Gerar_contrato_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_2_0_Proposta_finalizada_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_2_35_Validacao_Dados_Analise_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_2_37_Integracao_NeoXBo_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status34_0_Processo_Emissao_Contrato_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_33_2_Erro_Geracao_Contrato_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_34_1_Aluno_Aprovado_Resumo_Contrato_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_34_0_Processo_Emissao_Contrato_Fora" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_8_Mesa_Bureaux" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_8_33_Erro_BV_Score" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_9_Confirmacao_CPF_RF" = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_2_90_Problemas_Integracao_Produtos_NeoXBo"  = 0 THEN 1 ELSE 0 END+
              CASE WHEN ${TABLE}."Status_9090_Dado_Inconsistente"  = 0 THEN 1 ELSE 0 END

              ;;
            hidden: yes
          }


  dimension: total_status_fora_renovacao {
    type: number
    label: "OKR 100% Diario - Alunos Renovação"
    sql: CASE WHEN ${TABLE}."STATUS_2006_0_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2002_0_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2011_1_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2011_5_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2011_9_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2013_1_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2015_0_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2039_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2031_1_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2031_4_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2033_0_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2031_5_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2035_0_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2034_1_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2034_0_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2041_1_FORA" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2006_1" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2006_2" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2007_5" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2010_1" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2000_0" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2009_0" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2033_2" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2044_1" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2044_2" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2043_0" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2084_1" = 0 THEN 1 ELSE 0 END+
CASE WHEN ${TABLE}."STATUS_2099" = 0 THEN 1 ELSE 0 END
 ;;

    hidden: yes
    }


          measure: perc_okr_diario_renovacao {
            type: sum
            value_format: "0.0%"
            sql: ${total_status_fora_renovacao}/28 ;;
            label: "OKR Diário - Renovação"


          }




          measure: okr_trimestre_meta_novos {
            type: number
            label: "OKR TRIMESTRE - Novos"
            value_format: "0.0%"
            sql: CASE WHEN ${perc_okr_diario_novos} = 1 THEN 1 ELSE 0 END;;

          }


         measure: okr_trimestre_meta_renovacao {
         type: number
         label: "OKR TRIMESTRE - Renovação"
          value_format: "0.0%"
          sql: CASE WHEN ${perc_okr_diario_renovacao} = 1 THEN 1 ELSE 0 END;;

  }



  measure: perc_okr_diario_novos {
    type: sum
    value_format: "0.0%"
    sql: ${total_status_fora_novos}/25 ;;
    label: "OKR Diário - Novos"


  }


          dimension: status_2000_0 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2000_0" ;;
          }

          dimension: status_2002_0_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2002_0_DENTRO" ;;
          }

          dimension: status_2002_0_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2002_0_FORA" ;;
          }

          dimension: status_2006_0_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2006_0_DENTRO" ;;
          }

          dimension: status_2006_0_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2006_0_FORA" ;;
          }

          dimension: status_2006_1 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2006_1" ;;
          }

          dimension: status_2006_2 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2006_2" ;;
          }

          dimension: status_2007_2_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2007_2_DENTRO" ;;
          }

          dimension: status_2007_2_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2007_2_FORA" ;;
          }

          dimension: status_2007_5 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2007_5" ;;
          }

          dimension: status_2007_6_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2007_6_DENTRO" ;;
          }

          dimension: status_2007_6_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2007_6_FORA" ;;
          }

          dimension: status_2009_0 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2009_0" ;;
          }

          dimension: status_2010_1 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2010_1" ;;
          }

          dimension: status_2011_1_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2011_1_DENTRO" ;;
          }

          dimension: status_2011_1_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2011_1_FORA" ;;
          }

          dimension: status_2011_5_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2011_5_DENTRO" ;;
          }

          dimension: status_2011_5_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2011_5_FORA" ;;
          }

          dimension: status_2011_9_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2011_9_DENTRO" ;;
          }

          dimension: status_2011_9_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2011_9_FORA" ;;
          }

          dimension: status_2012_13_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2012_13_DENTRO" ;;
          }

          dimension: status_2012_13_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2012_13_FORA" ;;
          }

          dimension: status_2012_3_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2012_3_DENTRO" ;;
          }

          dimension: status_2012_3_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2012_3_FORA" ;;
          }

          dimension: status_2013_1_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2013_1_DENTRO" ;;
          }

          dimension: status_2013_1_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2013_1_FORA" ;;
          }

          dimension: status_2014_1_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2014_1_DENTRO" ;;
          }

          dimension: status_2014_1_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2014_1_FORA" ;;
          }

          dimension: status_2015_0_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2015_0_DENTRO" ;;
          }

          dimension: status_2015_0_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2015_0_FORA" ;;
          }

          dimension: status_2031_1_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2031_1_DENTRO" ;;
          }

          dimension: status_2031_1_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2031_1_FORA" ;;
          }

          dimension: status_2031_4_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2031_4_DENTRO" ;;
          }

          dimension: status_2031_4_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2031_4_FORA" ;;
          }

          dimension: status_2031_5_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2031_5_DENTRO" ;;
          }

          dimension: status_2031_5_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2031_5_FORA" ;;
          }

          dimension: status_2033_0_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2033_0_DENTRO" ;;
          }

          dimension: status_2033_0_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2033_0_FORA" ;;
          }

          dimension: status_2033_2 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2033_2" ;;
          }

          dimension: status_2034_0_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2034_0_DENTRO" ;;
          }

          dimension: status_2034_0_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2034_0_FORA" ;;
          }

          dimension: status_2034_1_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2034_1_DENTRO" ;;
          }

          dimension: status_2034_1_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2034_1_FORA" ;;
          }

          dimension: status_2035_0_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2035_0_DENTRO" ;;
          }

          dimension: status_2035_0_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2035_0_FORA" ;;
          }

          dimension: status_2039_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2039_DENTRO" ;;
          }

          dimension: status_2039_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2039_FORA" ;;
          }

          dimension: status_2040_0 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2040_0" ;;
          }

          dimension: status_2041_1_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2041_1_DENTRO" ;;
          }

          dimension: status_2041_1_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2041_1_FORA" ;;
          }

          dimension: status_2042_1 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2042_1" ;;
          }

          dimension: status_2042_2 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2042_2" ;;
          }

          dimension: status_2042_3 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2042_3" ;;
          }

          dimension: status_2042_4 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2042_4" ;;
          }

          dimension: status_2043_0 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2043_0" ;;
          }

          dimension: status_2044_1 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2044_1" ;;
          }

          dimension: status_2044_2 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2044_2" ;;
          }

          dimension: status_2044_3 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2044_3" ;;
          }

          dimension: status_2046_1_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2046_1_DENTRO" ;;
          }

          dimension: status_2046_1_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2046_1_FORA" ;;
          }

          dimension: status_2046_2_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2046_2_DENTRO" ;;
          }

          dimension: status_2046_2_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2046_2_FORA" ;;
          }

          dimension: status_2046_3_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2046_3_DENTRO" ;;
          }

          dimension: status_2046_3_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2046_3_FORA" ;;
          }

          dimension: status_2046_4_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2046_4_DENTRO" ;;
          }

          dimension: status_2046_4_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2046_4_FORA" ;;
          }

          dimension: status_2046_5_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2046_5_DENTRO" ;;
          }

          dimension: status_2046_5_fora {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2046_5_FORA" ;;
          }

          dimension: status_2084_1 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2084_1" ;;
          }

          dimension: status_2084_1_dentro {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2084_1_DENTRO" ;;
          }

          dimension: status_2099 {
            type: number
            group_label: "Renovação"
            sql: ${TABLE}."STATUS_2099" ;;
          }

          measure: sum_status_2006_0_fora {
            type: sum
            group_label: "ELEGIBILIDADE - RISCO"
            label: "Status 2006.0 -  Consulta aos restritivos internos BV"
            sql: ${status_2006_0_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2006.0'}}" }

          }



          measure: sum_status_2006_1 {
            type: sum
            group_label: "ELEGIBILIDADE - RISCO"
            label: "Status 2006.1 Fora - Erro ao consultar restrição - Banco Votorantim"
            sql: ${status_2006_1} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2006.1'}}" }

          }

          measure: sum_status_2006_2 {
            type: sum
            group_label: "ELEGIBILIDADE - RISCO"
            label: "Status 2006.2 Fora - Erro ao consultar restrição na confirmação de dados - Banco Votorantim"
            sql: ${status_2006_2} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2006.2'}}" }

          }

          measure: sum_status_2007_2 {
            type: sum
            group_label: "ELEGIBILIDADE - RISCO"
            label: "Status 2007.2 Fora -  Processo de troca de IES invalidado"
            sql: ${status_2007_2_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2007.2'}}" }

          }




          measure: sum_status_2007_5 {
            type: sum
            group_label: "ELEGIBILIDADE - RISCO"
            label: "Status 2007.5  - Recontratação erro consulta garantidor bureaux"
            sql: ${status_2007_5} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2007.5'}}" }

          }

          measure: sum_status_2007_6 {
            type: sum
            group_label: "ELEGIBILIDADE - RISCO"
            label: "Status 2007.6 Fora -  Troca de Garantidor: erro consulta aluno bureaux"
            sql: ${status_2007_6_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2007.6'}}" }

          }

          measure: sum_status_2010_1 {
            type: sum
            group_label: "ELEGIBILIDADE - RISCO"
            label: "Status 2010.0 -  Elegível ao Processo de Recontratação"
            sql: ${status_2010_1} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2010.1'}}" }

          }

          measure: sum_status_2012_13 {
            type: sum
            group_label: "ELEGIBILIDADE - RISCO"
            label: "Status 2012.13 Fora -  Aguardando Pagamento em Atraso(behaviour)"
            sql: ${status_2012_13_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2012.13'}}" }

          }

          measure: sum_status_2000_0 {
            type: sum
            group_label: "ELEGIBILIDADE - RISCO"
            label: "Status 2000.0 -  Recontratação Iniciada"
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2000.0'}}" }
            sql: ${status_2000_0} ;;

          }

          measure:sum_status_2012_3 {
            type: sum
            group_label: "ELEGIBILIDADE - RISCO"
            label: "Status 2012.3 Fora - 1º Processo - Mesa 1 - Tabela A"
            sql: ${status_2012_3_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2012.3'}}" }

          }


          measure: sum_status_2002_0 {
            type: sum
            group_label: "IES"
            label: "Status 2002.0 Fora - Aluno em Processo de Transferência de IES"
            sql: ${status_2002_0_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2002.0'}}" }

          }

          measure:sum_status_2009_0 {
            type: sum
            group_label: "IES"
            label: "Status 2009.0 - Ciclo de Recontratação Encerrado - Aluno Não avaliado pela IES"
            sql: ${status_2009_0} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2009.0'}}" }

          }
          measure: sum_status_2011_1 {
            type: sum
            group_label: "IES"
            label: "Status 2011.1 Fora - Aluno no portal da IES"
            sql: ${status_2011_1_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2011.1'}}" }

          }
          measure:sum_status_2011_5 {
            type: sum
            group_label: "IES"
            label: "Status 2011.5 Fora - 2º Processo Iniciado na Tabela A"
            sql: ${status_2011_5_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2011.5'}}" }

          }
          measure:sum_status_2011_9 {
            type: sum
            group_label: "IES"
            label: "Status 2011.9 Fora - 3º Processo Iniciado na Tabela A"
            sql: ${status_2011_9_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2011.9'}}" }


          }
          measure: sum_status_2013_1 {
            type: sum
            group_label: "IES"
            label: "Status 2013.1 Fora - Pendente de Matrícula sem Promessa"
            sql: ${status_2013_1_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2013.1'}}" }

          }
          measure:sum_status_2014_1  {
            type: sum
            group_label: "IES"
            label: "Status 2014.1 Fora - Pendente de Dívida sem Promessa"
            sql: ${status_2014_1_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2014.1'}}" }

          }
          measure: sum_status_2015_0 {
            type: sum
            group_label: "IES"
            label: "Status 2015.0 Fora - Aluno Revertido para Nova Avaliação da IES"
            sql: ${status_2015_0_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2015.0'}}" }

          }
          measure:sum_status_2039 {
            type: sum
            group_label: "IES"
            label: "Status 2039 Fora - Recontratação Reprovada na IES (Aluno Formado)"
            sql: ${status_2039_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]=%25{{'2039'}}%25" }

          }
          measure: sum_status_2031{
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2031 Fora Fora - Confirmado IES sem Promessa"
            sql: ${status_2031_1_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2031'}}" }

          }
          measure:sum_status_2033_2 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2033 Fora - Geração de Contratos - Erro na Geração"
            sql: ${status_2033_2} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2033.2'}}" }


          }

          measure:sum_status_2033_0 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2033.0 Fora - Mesa - Geração de contratos "
            sql: ${status_2033_0_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2033.0'}}" }
          }


          measure:sum_status_2031_4 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2031_4 Fora - Mesa - Limite de Comprometimento Satisfeito sem Promessa "
            sql: ${status_2031_4_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2031.4'}}" }

          }
          measure: sum_status_2031_5 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2031_5 Fora - Análise do Comitê de Parcelas "
            sql: ${status_2031_5_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2031.5'}}" }

          }
          measure: sum_status_2040_0 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2040.0 - Aguardando Confirmação de Dados  "
            sql: ${status_2040_0} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2040.0'}}" }

          }
          measure: sum_status_2042_1 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2042.1 - Documento(s) de Renda Pendente   "
            sql: ${status_2042_1} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2042.1'}}" }


          }
          measure: sum_status_2042_2 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2042.2 - Documento(s) de Renda e Outro(s) Documento(s) Pendente(s) "
            sql: ${status_2042_2} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2042.2'}}" }

          }
          measure: sum_status_2042_3 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2042.3 - Documento(s) Pendente(s) e Boleto em atraso"
            sql: ${status_2042_3} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2042.3'}}" }
          }

          measure: sum_status_2042_4 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2042.4 - Documento(s) Pendentes"
            sql: ${status_2042_4} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2042.4'}}" }

          }
          measure: sum_status_2044_1 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2044.1 - Contrato Disponibilizado Sem Troca de Garantidor"
            sql: ${status_2044_1} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2044.1'}}" }
          }

          measure: sum_status_2044_2 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2044.2 - Contrato Disponibilizado Com Troca de Garantidor Aprovado na Mesa 4"
            sql: ${status_2044_2} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2044.2'}}" }

          }
          measure: sum_status_2044_3 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2044.3 - Contrato Disponibilizado Com Garantidor Original na Mesa 3"
            sql: ${status_2044_3} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2044.3'}}" }

          }
          measure: sum_status_2043_0 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2043.0 - Contrato Disponibilizado Com Garantidor Original na Mesa 3"
            sql: ${status_2043_0} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2043.0'}}" }

          }
          measure: sum_status_2035_0 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2035.0 Fora - Aprovado na Pós-Validação de Emissão de Contrato"
            sql: ${status_2035_0_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2035.0'}}" }
          }

          measure: sum_status_2034_1 {
            type: sum
            group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
            label: "Status 2034.1 Fora - Aprovado das Políticas de Renovação"
            sql: ${status_2034_1_fora} ;;
            link: {
              label: "Detalhado"
              url: "/looks/449?&f[farol_detalhado.status]={{'2034.1'}}" }
          }

        measure: sum_status_2034_0 {
          type: sum
          group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
          label: "Status 2034.0 Fora - Aprovado para resumo de contrato"
          sql: ${status_2034_0_fora} ;;
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'2034.0'}}" }
        }

        measure: sum_status_2046_1 {
          type: sum
          group_label: "CESSÃO"
          label: "Status 2046.1 Fora - Recontratação reprovada - aluno não confirmou os dados do contrato"
          sql: ${status_2046_1_fora} ;;
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'2046.1'}}" }
        }
        measure: sum_status_2046_2 {
          type: sum
          group_label: "CESSÃO"
          label: "Status 2046.2 Fora - Recontratação reprovada - aluno não entregou o contrato"
          sql: ${status_2046_2_fora} ;;
          link: {
            label: "Detalhado"
            url: "/looks/449?&f[farol_detalhado.status]={{'2046.2'}}" }
        }


  measure: sum_status_2046_3 {
    type: sum
    group_label: "CESSÃO"
    label: "Status 2046.3 Fora - Recontratação reprovada - aluno entregou o contrato com pendência"
    sql: ${status_2046_3_fora} ;;
    link: {
      label: "Detalhado"
      url: "/looks/449?&f[farol_detalhado.status]={{'2046.3'}}" }
        }


  measure: sum_status_2046_4 {
    type: sum
    group_label: "CESSÃO"
    label: "Status 2046.4 Fora - Recontratação Reprovada - Não completou troca de Garantidor no Prazo"
    sql: ${status_2046_4_fora} ;;
    link: {
      label: "Detalhado"
      url: "/looks/449?&f[farol_detalhado.status]={{'2046.4'}}" }

        }
  measure: sum_status_2046_5 {
    type: sum
    group_label: "CESSÃO"
    label: "Status 2046.5 Fora- Recontratação Reprovada pela Cessão"
    sql: ${status_2046_5_fora} ;;
    link: {
      label: "Detalhado"
      url: "/looks/449?&f[farol_detalhado.status]={{'2046.5'}}" }
        }



  measure: sum_status_2084_1 {
    type: sum
    group_label: "CESSÃO"
    label: "Status 2084.1 - Uso exclusivo da cessão - Aluno formalizado."
    sql: ${status_2084_1} ;;
    link: {
      label: "Detalhado"
      url: "/looks/449?&f[farol_detalhado.status]={{'2084.1'}}" }

        }
  measure: sum_status_2099_1 {
    type: sum
    group_label: "CESSÃO"
    label: "Status -2099 - Exclusivo para Erros na Cessão."
    sql: ${status_2099} ;;
    link: {
      label: "Detalhado"
      url: "/looks/449?&f[farol_detalhado.status]=%25{{'-2099'}}%25" }

        }
  measure: sum_status_2041_1 {
    type: sum
    group_label: "CESSÃO"
    label: "Status 2041.1 - Aluno Formalizado sem Pendências."
    sql: ${status_2041_1_fora} ;;
    link: {
      label: "Detalhado"
      url: "/looks/449?&f[farol_detalhado.status]={{'2041.1'}}"}
  }

  measure: perc_status_2046_2_fora {
    type: sum
    value_format: "0.0%"
    group_label: "CESSÃO"
    label: "Porcentagem  status 2046 2  - Recontratação reprovada - aluno não entregou o contrato"
    sql: ${status_2046_2_fora}  / IFF ( ${status_2046_2_fora} + ${status_2046_2_dentro}=0,1,${status_2046_2_fora} + ${status_2046_2_dentro});;

  }

  measure: perc_status_2046_1_fora {
    type: sum
    value_format: "0.0%"
    group_label: "CESSÃO"
    label: "Porcentagem  status 2046 1  - Recontratação reprovada - aluno não confirmou os dados do contrato"
    sql: ${status_2046_1_fora}  / IFF  ( ${status_2046_1_fora} + ${status_2046_1_dentro}=0,1,${status_2046_1_fora} + ${status_2046_1_dentro});;

  }

  measure: perc_status_2046_3_fora {
    type: sum
    value_format: "0.0%"
    group_label: "CESSÃO"
    label: "Porcentagem  status 2046 3  - Recontratação reprovada - aluno entregou o contrato com pendência"
    sql:${status_2046_3_fora} / IFF ( ${status_2046_3_fora} + ${status_2046_3_dentro} =0,1,  ${status_2046_3_fora} + ${status_2046_3_dentro});;
}

  measure:perc_status_2046_4_fora {
    type: sum
    value_format: "0.0%"
    group_label: "CESSÃO"
    label: "Porcentagem  status 2046 4  - Recontratação Reprovada - Não completou troca de Garantidor no Prazo"
    sql: ${status_2046_4_fora}  / IFF ( ${status_2046_4_fora} + ${status_2046_4_dentro}=0,1,${status_2046_4_fora} + ${status_2046_4_dentro});;

  }

  measure: perc_status_2046_5_fora{
    type: sum
    value_format: "0.0%"
    group_label: "CESSÃO"
    label: "Porcentagem  status 2046 5  - Recontratação Reprovada pela Cessão"
    sql: ${status_2046_5_fora}  / IFF ( ${status_2046_5_fora} + ${status_2046_5_dentro}=0,1,${status_2046_5_fora} + ${status_2046_5_dentro});;
  }

  measure: perc_status_2084_1_fora{
    type: sum
    value_format: "0.0%"
    group_label: "CESSÃO"
    label: "Porcentagem  status 2084 1  - Uso exclusivo da cessão - Aluno formalizado."
    sql: ${status_2084_1} / IFF ( ${status_2084_1} + ${status_2084_1_dentro}=0,1,${status_2084_1} + ${status_2084_1_dentro});;
  }

  measure: perc_status_2041_1_fora {
    type: sum
    value_format: "0.0%"
    group_label: "CESSÃO"
    label: "Porcentagem  status 2041 1  - Aluno Formalizado sem Pendências"
    sql: ${status_2041_1_fora}  /  IFF ( ${status_2041_1_fora} + ${status_2041_1_dentro}=0,1,${status_2041_1_fora} + ${status_2041_1_dentro});;
  }

  measure:perc_status_2002_0_fora {
    type: sum
    value_format: "0.0%"
    group_label: "IES"
    label: "Porcentagem  status 2002 0  - Aluno em Processo de Transferência de IES"
    sql: ${status_2002_0_fora}  / IFF ( ${status_2002_0_fora} + ${status_2002_0_dentro}=0,1,${status_2002_0_fora} + ${status_2002_0_dentro});;
  }

  measure: perc_status_2011_1_fora{
    type: sum
    value_format: "0.0%"
    group_label: "IES"
    label: "Porcentagem  status 2011 1  - Aluno no portal da IES"
    sql: ${status_2011_1_fora}  / IFF ( ${status_2011_1_fora} + ${status_2011_1_dentro}=0,1,${status_2011_1_fora} + ${status_2011_1_dentro});;
  }

  measure: perc_status_2011_5_fora{
    type: sum
    value_format: "0.0%"
    group_label: "IES"
    label: "Porcentagem  status 2011 5  - 2º Processo Iniciado na Tabela A"
    sql: ${status_2011_5_fora}  / IFF ( ${status_2011_5_fora} + ${status_2011_5_dentro}=0,1,${status_2011_5_fora} + ${status_2011_5_dentro});;
  }

  measure: perc_status_2011_9_fora{
    type: sum
    value_format: "0.0%"
    group_label: "IES"
    label: "Porcentagem  status 2011 9  - 3º Processo Iniciado na Tabela A"
    sql: ${status_2011_9_fora}  / IFF ( ${status_2011_9_fora} + ${status_2011_9_dentro}=0,1,${status_2011_9_fora} + ${status_2011_9_dentro});;
  }

  measure: perc_status_2013_1_fora{
    type: sum
    value_format: "0.0%"
    group_label: "IES"
    label: "Porcentagem  status 2013 1  - Pendente de Matrícula sem Promessa"
    sql: ${status_2013_1_fora}  / IFF ( ${status_2013_1_fora} + ${status_2013_1_dentro}=0,1,${status_2013_1_fora} + ${status_2013_1_dentro});;
  }

  measure: perc_status_2014_1_fora{
    type: sum
    value_format: "0.0%"
    group_label: "IES"
    label: "Porcentagem  status 2014 1  - Pendente de Dívida sem Promessa"
    sql: ${status_2014_1_fora}  / IFF ( ${status_2014_1_fora} + ${status_2014_1_dentro}=0,1,${status_2014_1_fora} + ${status_2014_1_dentro});;
  }

  measure: perc_status_2015_0_fora {
    type: sum
    value_format: "0.0%"
    group_label: "IES"
    label: "Porcentagem  status 2015 0  - Aluno Revertido para Nova Avaliação da IES"
    sql: ${status_2015_0_fora}  / IFF (  ${status_2015_0_fora} + ${status_2015_0_dentro}=0,1,${status_2015_0_fora} + ${status_2015_0_dentro});;
  }

  measure: perc_status_2039_fora{
    type: sum
    value_format: "0.0%"
    group_label: "IES"
    label:  "Porcentagem  status 2039  - Recontratação Reprovada na IES (Aluno Formado)"
    sql: ${status_2039_fora}  / IFF (${status_2039_fora} + ${status_2039_dentro}=0,1,${status_2039_fora} + ${status_2039_dentro});;
  }

  measure: perc_status_2035_0_fora {
    type: sum
    value_format: "0.0%"
    group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
    label: "Porcentagem  status 2035 0  - Aprovado na Pós-Validação de Emissão de Contrato"
    sql: ${status_2035_0_fora}  / IFF ( ${status_2035_0_fora} + ${status_2035_0_dentro}=0,1,${status_2035_0_fora} + ${status_2035_0_dentro});;
  }

  measure: perc_status_2034_1_fora{
    type: sum
    value_format: "0.0%"
    group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
    label: "Porcentagem  status 2034 1  - Aprovado das Políticas de Renovação"
    sql: ${status_2034_1_fora}  / IFF ( ${status_2034_1_fora} + ${status_2034_1_dentro}=0,1,${status_2034_1_fora} + ${status_2034_1_dentro});;
  }

  measure: perc_status_2034_0_fora {
    type: sum
    value_format: "0.0%"
    group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
    label: "Porcentagem  status 2034 0  - Aprovado para resumo de contrato"
    sql: ${status_2034_0_fora}  / IFF (${status_2034_0_fora} + ${status_2034_0_dentro}=0,1,${status_2034_0_fora} + ${status_2034_0_dentro});;
  }

  measure: perc_status_2033_0_fora{
    type: sum
    value_format: "0.0%"
    group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
    label: "Porcentagem  status 2033 0  - Mesa - Geração de contratos"
    sql: ${status_2033_0_fora}  / IFF ( ${status_2033_0_fora} + ${status_2033_0_dentro}=0,1,${status_2033_0_fora} + ${status_2033_0_dentro});;
  }

  measure: perc_status_2031_5_fora{
    type: sum
    value_format: "0.0%"
    group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
    label: "Porcentagem  status 2031 5  - Análise do Comitê de Parcelas"
    sql:${status_2031_5_fora} / IFF ( ${status_2031_5_fora} + ${status_2031_5_dentro}=0,1,${status_2031_5_fora} + ${status_2031_5_dentro});;
  }

  measure:perc_status_2031_4_fora {
    type: sum
    value_format: "0.0%"
    group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
    label: "Porcentagem  status 2031 4  - Limite de Comprometimento Satisfeito sem Promessa"
    sql: ${status_2031_4_fora}  / IFF ( ${status_2031_4_fora} + ${status_2031_4_dentro}=0,1,${status_2031_4_fora} + ${status_2031_4_dentro});;
  }

  measure: perc_status_2031_1_fora{
    type: sum
    value_format: "0.0%"
    group_label: "FORMALIZAÇÃO E CONTRATAÇÃO"
    label: "Porcentagem  status 2031 1  - Confirmado IES sem Promessa"
    sql:${status_2031_1_fora} / IFF ( ${status_2031_1_fora} + ${status_2031_1_dentro}=0,1,${status_2031_1_fora} + ${status_2031_1_dentro});;
  }

  measure: perc_status_2006_0_fora{
    type: sum
    value_format: "0.0%"
    group_label: "ELEGIBILIDADE - RISCO"
    label:  "Porcentagem  status 2006 0  - Consulta aos restritivos internos BV"
    sql: ${status_2006_0_fora}  / IFF ( ${status_2006_0_fora} + ${status_2006_0_dentro}=0,1,${status_2006_0_fora} + ${status_2006_0_dentro});;
  }

  measure: perc_status_2007_2_fora{
    type: sum
    value_format: "0.0%"
    group_label: "ELEGIBILIDADE - RISCO"
    label: "Porcentagem  status 2007 2  - Processo de troca de IES invalidado"
    sql:${status_2007_2_fora} / IFF ( ${status_2007_2_fora} + ${status_2007_2_dentro}=0,1,${status_2007_2_fora} + ${status_2007_2_dentro});;
  }

  measure: perc_status_2007_6_fora{
    type: sum
    value_format: "0.0%"
    group_label: "ELEGIBILIDADE - RISCO"
    label: "Porcentagem  status 2007 6  - Troca de Garantidor: erro consulta aluno bureaux"
    sql: ${status_2007_6_fora}  / IFF ( ${status_2007_6_fora} + ${status_2007_6_dentro}=0,1,${status_2007_6_fora} + ${status_2007_6_dentro});;
  }

  measure: perc_status_2012_13_fora{
    type: sum
    value_format: "0.0%"
    group_label: "ELEGIBILIDADE - RISCO"
    label: "Porcentagem  status 2012 13  - Aguardando Pagamento em Atraso(behaviour)"
    sql: ${status_2012_13_fora} / IFF ( ${status_2012_13_fora} + ${status_2012_13_dentro}=0,1,${status_2012_13_fora} + ${status_2012_13_dentro});;
  }

  measure: perc_status_2012_3_fora{
    type: sum
    value_format: "0.0%"
    group_label: "ELEGIBILIDADE - RISCO"
    label: "Porcentagem  status 2012 3  - 1º Processo - Mesa 1 - Tabela A"
    sql: ${status_2012_3_fora}  / IFF (  ${status_2012_3_fora} + ${status_2012_3_dentro}=0,1,${status_2012_3_fora} + ${status_2012_3_dentro});;
  }

}
