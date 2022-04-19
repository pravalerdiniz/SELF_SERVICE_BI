view: solicitacoes_para_prevencao {
    derived_table: {
      sql: select NUMERO_CHAMADO
      ,max(coalesce(T.VALUE:"Balanço Patrimonial:"::varchar,T.VALUE:"Balanço Patrimonial:"::varchar)) balanco_patrimonial
      ,max(coalesce(T.VALUE:"CNPJ:"::varchar,T.VALUE:"CNPJ:"::varchar)) cnpj
      ,max(coalesce(T.VALUE:"Código do banco:"::varchar,T.VALUE:"Código do banco:"::varchar)) codigo_banco
      ,max(coalesce(T.VALUE:"Evidencia de contrato assinado (QItech):"::varchar,T.VALUE:"Evidencia de contrato assinado (QItech):"::varchar)) evidencia_contrato_assinado_qitech
      ,max(coalesce(T.VALUE:"Nome da IES/Escola:"::varchar,T.VALUE:"Nome da IES/Escola:"::varchar)) nome_ies_escola
      ,max(coalesce(T.VALUE:"Nome do banco:"::varchar,T.VALUE:"Nome do banco:"::varchar)) nome_banco
      ,max(coalesce(T.VALUE:"Observações análise de antifraude:"::varchar,T.VALUE:"Observações análise de antifraude:"::varchar)) obs_analise_antifraude
      ,max(coalesce(T.VALUE:"Quem assinou?"::varchar,T.VALUE:"Quem assinou?"::varchar)) quem_assinou
      ,max(coalesce(T.VALUE:"Tabela de Cursos:"::varchar,T.VALUE:"Tabela de Cursos:"::varchar)) tabela_cursos
      ,max(coalesce(T.VALUE:"Agência:"::varchar,T.VALUE:"Agência:"::varchar)) agencia
      ,max(coalesce(T.VALUE:"Análise de Antifraude:"::varchar,T.VALUE:"Análise de Antifraude:"::varchar)) analise_antifraude
      ,max(coalesce(T.VALUE:"Análise de Compliance:"::varchar,T.VALUE:"Análise de Compliance:"::varchar)) analise_compliance
      ,max(coalesce(T.VALUE:"Análise de Risco Modelagem:"::varchar,T.VALUE:"Análise de Risco Modelagem:"::varchar)) analise_risco_modelagem
      ,max(coalesce(T.VALUE:"Análise de Risco Portfólio:"::varchar,T.VALUE:"Análise de Risco Portfólio:"::varchar)) analise_risco_portfolio
      ,max(coalesce(T.VALUE:"Anexo Contrato (Ajustes IES):"::varchar,T.VALUE:"Anexo Contrato (Ajustes IES):"::varchar)) anexo_contrato_ajuste_ies
      ,max(coalesce(T.VALUE:"Anexo contrato:"::varchar,T.VALUE:"Anexo contrato:"::varchar)) anexo_contrato
      ,max(coalesce(T.VALUE:"Anexo documentação pessoal Representante Legal:"::varchar,T.VALUE:"Anexo documentação pessoal Representante Legal:"::varchar)) anexo_documentacao_pessoal_representante_legal
      ,max(coalesce(T.VALUE:"Anexo Extra:"::varchar,T.VALUE:"Anexo Extra:"::varchar)) anexo_extra
      ,max(coalesce(T.VALUE:"Conta:"::varchar,T.VALUE:"Conta:"::varchar)) conta
      ,max(coalesce(T.VALUE:"Contrato Social da IES:"::varchar,T.VALUE:"Contrato Social da IES:"::varchar)) contrato_social_ies
      ,max(coalesce(T.VALUE:"Convênio QItech (Contrato):"::varchar,T.VALUE:"Convênio QItech (Contrato):"::varchar)) convenio_qitech_contrato
      ,max(coalesce(T.VALUE:"Demonstrativo do Fluxo de Caixa:"::varchar,T.VALUE:"Demonstrativo do Fluxo de Caixa:"::varchar)) demonstrativo_fluxo_caixa
      ,max(coalesce(T.VALUE:"E-mail ou dados do sócio:"::varchar,T.VALUE:"E-mail ou dados do sócio:"::varchar)) email_ou_dados_socio
      ,max(coalesce(T.VALUE:"Encaminhado para o banco?"::varchar,T.VALUE:"Encaminhado para o banco?"::varchar)) encaminhado_para_banco
      ,max(coalesce(T.VALUE:"Escola com menos de 1 ano fiscal OU do cluster estratégico?"::varchar,T.VALUE:"Escola com menos de 1 ano fiscal OU do cluster estratégico?"::varchar)) escola_menos_1ano_fiscal_cluster_estrategico
      ,max(coalesce(T.VALUE:"Evidencia de contrato assinado:"::varchar,T.VALUE:"Evidencia de contrato assinado:"::varchar)) evidencia_contrato_assinado
      ,max(coalesce(T.VALUE:"IES Validou?"::varchar,T.VALUE:"IES Validou?"::varchar)) ies_validou
      ,max(coalesce(T.VALUE:"Logo da Escola:"::varchar,T.VALUE:"Logo da Escola:"::varchar)) logo_escola
      ,max(coalesce(T.VALUE:"Mantenedora (Razão Social):"::varchar,T.VALUE:"Mantenedora (Razão Social):"::varchar)) mantenedora
      ,max(coalesce(T.VALUE:"O banco retornou?"::varchar,T.VALUE:"O banco retornou?"::varchar)) banco_retornou
      ,max(coalesce(T.VALUE:"Observações análise compliance:"::varchar,T.VALUE:"Observações análise compliance:"::varchar)) obs_analise_compliance
      ,max(coalesce(T.VALUE:"Observações análise Jurídico:"::varchar,T.VALUE:"Observações análise Jurídico:"::varchar)) obs_analse_juridico
      ,max(coalesce(T.VALUE:"Observações análise Risco Modelagem:"::varchar,T.VALUE:"Observações análise Risco Modelagem:"::varchar)) obs_analise_risco_modelagem
      ,max(coalesce(T.VALUE:"Observações análise Risco Portfólio:"::varchar,T.VALUE:"Observações análise Risco Portfólio:"::varchar)) obs_analise_risco_portfolio
      ,max(coalesce(T.VALUE:"Observações extras:"::varchar,T.VALUE:"Observações extras:"::varchar)) obs_extras
      ,max(coalesce(T.VALUE:"Observações sobre o retorno do banco:"::varchar,T.VALUE:"Observações sobre o retorno do banco:"::varchar)) obs_sobre_retorno_banco
      ,max(coalesce(T.VALUE:"Ofertas:"::varchar,T.VALUE:"Ofertas:"::varchar)) ofertas
      ,max(coalesce(T.VALUE:"Retorno do banco:"::varchar,T.VALUE:"Retorno do banco:"::varchar)) retorno_banco
      ,max(coalesce(T.VALUE:"Site da Escola"::varchar,T.VALUE:"Site da Escola"::varchar)) site_escola
      ,max(coalesce(T.VALUE:"Unidades/Franquias:"::varchar,T.VALUE:"Unidades/Franquias:"::varchar)) unidades_franquias

    lateral flatten (input=>OBJ_CAMPOS) T
     where nome_fila ilike 'P28%'
    group by 1
    ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: numero_chamado {
    type: string
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
    hidden:  yes
  }

  dimension: nome_task {
    type: string
    sql: ${TABLE}."NOME_TASK" ;;
    hidden:  yes
  }

  dimension: flg_solicitacao_correta {
    type: string
    sql: ${TABLE}."FLG_SOLICITACAO_CORRETA" ;;
    group_item_label: "Solicitação está correta?"
    group_label: "Informações Solicitante"
    }

  dimension: balanco_patrimonial {
    type: string
    sql: ${TABLE}."BALANCO_PATRIMONIAL" ;;
    }

  dimension: cnpj {
    type: string
    sql: ${TABLE}."CNPJ" ;;
  }

  dimension: codigo_banco{
    type: string
    sql: ${TABLE}."CODIGO_BANCO" ;;
  }

  dimension: evidencia_contrato_assinado_qitech {
    type: string
    sql: ${TABLE}."EVIDENCIA_CONTRATO_ASSINADO_QITECH" ;;
  }

  dimension: nome_ies_escola {
    type: string
    sql: ${TABLE}."NOME_IES_ESCOLA" ;;
  }

  dimension: nome_banco {
    type: string
    sql: ${TABLE}."NOME_BANCO" ;;
  }

  dimension: obs_analise_antifraude {
    type: string
    sql: ${TABLE}."OBS_ANALISE_ANTIFRAUDE" ;;
  }
  dimension: quem_assinou {
    type: string
    sql: ${TABLE}."QUEM_ASSINOU" ;;
  }
  dimension: tabela_cursos {
    type: string
    sql: ${TABLE}."TABELA_CURSOS" ;;
  }
  dimension: agencia {
    type: string
    sql: ${TABLE}."AGENCIA" ;;
  }
  dimension: analise_antifraude {
    type: string
    sql: ${TABLE}."ANALISE_ANTIFRAUDE" ;;
  }
  dimension: analise_risco_modelagem {
    type: string
    sql: ${TABLE}."ANALISE_RISCO_MODELAGEM" ;;
  }
  dimension: analise_risco_portfolio {
    type: string
    sql: ${TABLE}."ANALISE_RISCO_PORTFOLIO" ;;
  }
  dimension: anexo_contrato_ajuste_ies {
    type: string
    sql: ${TABLE}."ANEXO_CONTRATO_AJUSTE_IES" ;;
  }
  dimension: anexo_contrato {
    type: string
    sql: ${TABLE}."ANEXO_CONTRATO" ;;
  }
  dimension: anexo_documentacao_pessoal_representante_legal {
    type: string
    sql: ${TABLE}."ANEXO_DOCUMENTACAO_PESSOAL_REPRESENTANTE_LEGAL" ;;
  }
  dimension: anexo_extra {
    type: string
    sql: ${TABLE}."ANEXO_EXTRA" ;;
  }
  dimension: conta {
    type: string
    sql: ${TABLE}."CONTA" ;;
  }
  dimension: contrato_social_ies {
    type: string
    sql: ${TABLE}."CONTRATO_SOCIAL_IES" ;;
  }
  dimension: convenio_qitech_contrato {
    type: string
    sql: ${TABLE}."CONVENIO_QITECH_CONTRATO" ;;
  }
  dimension: demonstrativo_fluxo_caixa {
    type: string
    sql: ${TABLE}."DEMONSTRATIVO_FLUXO_CAIXA" ;;
  }
  dimension: email_ou_dados_socio {
    type: string
    sql: ${TABLE}."EMAIL_OU_DADOS_SOCIO" ;;
  }
  dimension: encaminhado_para_banco {
    type: string
    sql: ${TABLE}."ENCAMINHADO_PARA_BANCO" ;;
  }
  dimension: escola_menos_1ano_fiscal_cluster_estrategico {
    type: string
    sql: ${TABLE}."ESCOLA_MENOS_1ANO_FISCAL_CLUSTER_ESTRATEGICO" ;;
  }
  dimension: evidencia_contrato_assinado {
    type: string
    sql: ${TABLE}."EVIDENCIA_CONTRATO_ASSINADO" ;;
  }
  dimension: ies_validou {
    type: string
    sql: ${TABLE}."IES_VALIDOU" ;;
  }
  dimension: logo_escola {
    type: string
    sql: ${TABLE}."LOGO_ESCOLA" ;;
  }

  dimension: mantenedora {
    type: string
    sql: ${TABLE}."MANTENEDORA" ;;
  }
  dimension: banco_retornou {
    type: string
    sql: ${TABLE}."BANCO_RETORNOU" ;;
  }
  dimension: obs_analise_compliance {
    type: string
    sql: ${TABLE}."OBS_ANALISE_COMPLIANCE" ;;
  }
  dimension: obs_analse_juridico {
    type: string
    sql: ${TABLE}."OBS_ANALSE_JURIDICO" ;;
  }
  dimension: obs_analise_risco_modelagem {
    type: string
    sql: ${TABLE}."OBS_ANALISE_RISCO_MODELAGEM" ;;
  }
  dimension: obs_analise_risco_portfolio {
    type: string
    sql: ${TABLE}."OBS_ANALISE_RISCO_PORTFOLIO" ;;
  }
  dimension: obs_extras {
    type: string
    sql: ${TABLE}."OBS_EXTRAS" ;;
  }
  dimension: obs_sobre_retorno_banco {
    type: string
    sql: ${TABLE}."OBS_SOBRE_RETORNO_BANCO" ;;
  }
  dimension: ofertas {
    type: string
    sql: ${TABLE}."OFERTAS" ;;
  }
  dimension: retorno_banco {
    type: string
    sql: ${TABLE}."RETORNO_BANCO" ;;
  }
  dimension: site_escola {
    type: string
    sql: ${TABLE}."SITE_ESCOLA" ;;
  }
  dimension: unidades_franquias {
    type: string
    sql: ${TABLE}."UNIDADES_FRANQUIAS" ;;
  }

  set: detail {
    fields: [
      numero_chamado,
      nome_task,
      flg_solicitacao_correta,
      balanco_patrimonial,
      cnpj,
      codigo_banco,
      evidencia_contrato_assinado_qitech,
      nome_ies_escola,
      nome_banco,
      obs_analise_antifraude,
      quem_assinou,
      tabela_cursos,
      agencia,
      analise_antifraude,
      analise_risco_modelagem,
      analise_risco_portfolio,
      anexo_contrato_ajuste_ies,
      anexo_contrato,
      anexo_documentacao_pessoal_representante_legal,
      anexo_extra,
      conta,
      contrato_social_ies,
      convenio_qitech_contrato,
      demonstrativo_fluxo_caixa,
      email_ou_dados_socio,
      encaminhado_para_banco,
      escola_menos_1ano_fiscal_cluster_estrategico,
      evidencia_contrato_assinado,
      ies_validou,
      logo_escola,
      mantenedora,
      banco_retornou,
      obs_analise_compliance,
      obs_analse_juridico,
      obs_analise_risco_modelagem,
      obs_analise_risco_portfolio,
      obs_extras,
      obs_sobre_retorno_banco,
      ofertas,
      retorno_banco,
      site_escola,
      unidades_franquias,
    ]
  }
  }
