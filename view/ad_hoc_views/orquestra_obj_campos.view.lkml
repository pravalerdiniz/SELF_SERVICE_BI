view: orquestra_obj_campos {
  derived_table: {
    #sql: select NUMERO_CHAMADO, NOME_TASK -- bkp Mari
    sql: select NUMERO_CHAMADO
    ,max(coalesce(T.VALUE:"Categoria:"::varchar,T.VALUE:"Categoria:"::varchar)) categoria
    ,max(coalesce(T.VALUE:"Nome do Aluno:"::varchar,T.VALUE:"Nome Completo do Aluno:"::varchar)) nome_do_aluno
    ,max(coalesce(T.VALUE:"IES do Aluno"::varchar,T.VALUE:"IES do Aluno:"::varchar)) ies_do_aluno
    ,max(coalesce(T.VALUE:"Motivo de Contato"::varchar,T.VALUE:"Motivo"::varchar)) motivo_de_contato
    ,max(coalesce(T.VALUE:"Descrição da Solicitação"::varchar,T.VALUE:"Descrição da Solicitação:"::varchar)) descricao_da_solicitacao
    ,max(coalesce(T.VALUE:"Área Responsável"::varchar,T.VALUE:"Área Responsável:"::varchar,T.VALUE:"Qual área atende?"::varchar,T.VALUE:"Qual área será encaminhado?"::varchar,T.VALUE:"Quem atende esta solicitação?"::varchar,T.VALUE:"Responsável:"::varchar)) area_responsavel
    ,max(coalesce(T.VALUE:"Assunto principal do contato"::varchar,T.VALUE:"Assunto principal do contato:"::varchar)) assunto_principal_do_contato
    ,max(coalesce(T.VALUE:"Solicitação está correta?"::varchar,T.VALUE:"Solicitação está correta?"::varchar)) flg_solicitacao_correta
    ,max(coalesce(T.VALUE:"Possível Causa Raíz"::varchar,T.VALUE:"Possível Causa Raíz"::varchar)) possivel_causa_raiz
    ,max(coalesce(T.VALUE:"Ticket Zendesk:"::varchar,T.VALUE:"Ticket Zendesk:"::varchar)) ticket_zendesk
    ,max(coalesce(T.VALUE:"CPF"::varchar,T.VALUE:"CPF"::varchar)) cpf
    ,max(coalesce(T.VALUE:"Problema Relacionado a COVID - 19"::varchar,T.VALUE:"Problema Relacionado a COVID - 19"::varchar)) problema_covid_19
    ,max(coalesce(T.VALUE:"Matrícula"::varchar,T.VALUE:"Matrícula"::varchar)) matricula
    ,max(coalesce(T.VALUE:"Observações de Contato"::varchar,T.VALUE:"Observações:"::varchar)) obs_contato
    ,max(coalesce(T.VALUE:"E-mail do Aluno:"::varchar,T.VALUE:"E-mail do Aluno:"::varchar)) email_aluno
    ,max(coalesce(T.VALUE:"Aluno é P-FIES?"::varchar,T.VALUE:"Aluno é P-FIES?"::varchar)) flg_aluno_p_fies
    ,max(coalesce(T.VALUE:"Observação Análise:"::varchar,T.VALUE:"Observação Análise:"::varchar)) obs_analise
    ,max(coalesce(T.VALUE:"Anexo:"::varchar,T.VALUE:"Anexo:"::varchar)) anexo
    ,max(coalesce(T.VALUE:"Subcategoria Risco:"::varchar,T.VALUE:"Subcategoria Risco:"::varchar)) subcategoria_risco
    ,max(coalesce(T.VALUE:"Encaminhar para outro Time?"::varchar,T.VALUE:"Encaminhar para outro Time?"::varchar)) flg_encaminhar_outro_time
    ,max(coalesce(T.VALUE:"Atraso"::varchar,T.VALUE:"Atraso"::varchar)) atraso
    ,max(coalesce(T.VALUE:"Tempo de Postergação"::varchar,T.VALUE:"Tempo de Postergação"::varchar)) tempo_postergacao
    ,max(coalesce(T.VALUE:"Escolha a área para encaminhar:"::varchar,T.VALUE:"Selecione a(s) área(s) que deseja encaminhar o caso:"::varchar)) escolha_area_encaminhar
    ,max(coalesce(T.VALUE:"Resultado da Postergação"::varchar,T.VALUE:"Resultado da Postergação"::varchar)) resultado_postergacao
    ,max(coalesce(T.VALUE:"Retorno da IES:"::varchar,T.VALUE:"Retorno da IES:"::varchar)) retorno_ies
    ,max(coalesce(T.VALUE:"ID Hugme"::varchar,T.VALUE:"ID Hugme:"::varchar)) id_hugme
    ,max(coalesce(T.VALUE:"Retorno da Interfile:"::varchar,T.VALUE:"Retorno da Interfile:"::varchar)) retorno_interfile
    ,max(coalesce(T.VALUE:"Origem da Solicitação"::varchar,T.VALUE:"Origem da Solicitação:"::varchar)) origem_solicitacao
    ,max(coalesce(T.VALUE:"Subcategoria Contratos e Formalização"::varchar,T.VALUE:"Subcategoria Contratos e Formalização:"::varchar)) subcategoria_contratos_formalizacao
    ,max(coalesce(T.VALUE:"Descreva o problema informado pelo aluno:"::varchar,T.VALUE:"Descreva o problema informado pelo aluno:"::varchar)) desc_problema_inf_aluno
    ,max(coalesce(T.VALUE:"Observação de retorno da análise:"::varchar,T.VALUE:"Observação de retorno da análise:"::varchar)) obs_retorno_analise
    ,max(coalesce(T.VALUE:"Retorno do chamado:"::varchar,T.VALUE:"Retorno do chamado:"::varchar)) retorno_chamado
    ,max(coalesce(T.VALUE:"Aluno possui Ordem Judicial ou Reclame Aqui conosco:"::varchar,T.VALUE:"Aluno possui Ordem Judicial ou Reclame Aqui conosco?"::varchar)) flg_aluno_possui_ordem_judicial_reclameaqui

            from GRADUADO.AD_HOC.ORQUESTRA A,
      lateral flatten (input=>OBJ_CAMPOS) T
      where (nome_fila ilike 'P17%' or nome_fila ilike 'P24' or nome_fila ilike 'P33' or nome_fila ilike 'P40')
      --group by 1,2  -- bkp Mari
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
    group_label: "Dados Chamado"
    group_item_label: "Número Chamado"
  }

  dimension: nome_task {
    type: string
    sql: ${TABLE}."NOME_TASK" ;;
    hidden:  yes
  }

  dimension: categoria {
    type: string
    sql: ${TABLE}."CATEGORIA" ;;
    group_label: "Dados Chamado"
    group_item_label: ""
    #description: ""
  }

  dimension: nome_do_aluno {
    type: string
    sql: ${TABLE}."NOME_DO_ALUNO" ;;
    group_label: "Dados Aluno"
    group_item_label: "Nome"
    #description: ""
  }

  dimension: ies_do_aluno {
    type: string
    sql: ${TABLE}."IES_DO_ALUNO" ;;
    group_label: "Dados Aluno"
    group_item_label: "IES"
    #description: ""
  }

  dimension: motivo_de_contato {
    type: string
    sql: ${TABLE}."MOTIVO_DE_CONTATO" ;;
    group_label: "Dados Chamado"
    group_item_label: "Motivo Contato"
    #description: ""
  }


  dimension: area_responsavel {
    type: string
    sql: ${TABLE}."AREA_RESPONSAVEL" ;;
    group_label: "Dados Chamado"
    group_item_label: "Area Responsavel"
    #description: ""
  }

  dimension: assunto_principal_do_contato{
    type: string
    sql: ${TABLE}."ASSUNTO_PRINCIPAL_DO_CONTATO" ;;
    group_label: "Dados Chamado"
    group_item_label: "Assunto Principal"
    #description: ""
  }

  dimension: flg_solicitacao_correta {
    type: string
    sql: ${TABLE}."FLG_SOLICITACAO_CORRETA" ;;
    group_label: "Dados Chamado"
    group_item_label: "Solicitação Correta?"
    #description: ""
  }

  dimension: possivel_causa_raiz{
    type: string
    sql: ${TABLE}."POSSIVEL_CAUSA_RAIZ" ;;
    group_label: "Dados Chamado"
    group_item_label: "Causa Raiz"
    #description: ""
  }

  dimension: ticket_zendesk{
    type: string
    sql: ${TABLE}."TICKET_ZENDESK" ;;
    group_label: "Dados Chamado"
    group_item_label: "Ticket Zendesk"
    #description: ""
  }

  dimension: cpf{
    type: string
    sql: ${TABLE}."CPF" ;;
    group_label: "Dados Aluno"
    group_item_label: "CPF"
    #description: ""
  }

  dimension: problema_covid_19{
    type: string
    sql: ${TABLE}."PROBLEMA_COVID_19" ;;
    group_label: "Dados Aluno"
    group_item_label: "Problema Relacionado a COVID - 19?"
    #description: ""
  }

  dimension: matricula{
    type: string
    sql: ${TABLE}."MATRICULA" ;;
    group_label: "Dados Aluno"
    group_item_label: "Matrícula"
    #description: ""
  }

  dimension: obs_contato{
    type: string
    sql: ${TABLE}."OBS_CONTATO" ;;
    group_label: "Dados Aluno"
    group_item_label: "Observações de Contato"
    #description: ""
  }

  dimension: email_aluno{
    type: string
    sql: ${TABLE}."EMAIL_ALUNO" ;;
    group_label: "Dados Aluno"
    group_item_label: "E-mail do Aluno"
    #description: ""
  }

  dimension: flg_aluno_p_fies{
    type: string
    sql: ${TABLE}."FLG_ALUNO_P_FIES" ;;
    group_label: "Dados Aluno"
    group_item_label: "Aluno é P-FIES?"
    #description: ""
  }

  dimension: obs_analise{
    type: string
    sql: ${TABLE}."OBS_ANALISE" ;;
    group_label: "Dados Chamado"
    group_item_label: "Observação Análise"
    #description: ""
  }

  dimension: anexo{
    type: string
    sql: ${TABLE}."ANEXO" ;;
    group_label: "Dados Aluno"
    group_item_label: "Anexo"
    #description: ""
  }

  dimension: subcategoria_risco{
    type: string
    sql: ${TABLE}."SUBCATEGORIA_RISCO" ;;
    group_label: "Dados Chamado"
    group_item_label: "Subcategoria Risco"
    #description: ""
  }

  dimension: flg_encaminhar_outro_time{
    type: string
    sql: ${TABLE}."FLG_ENCAMINHAR_OUTRO_TIME" ;;
    group_label: "Dados Chamado"
    group_item_label: "Encaminhar para outro Time?"
    #description: ""
  }

  dimension: atraso{
    type: string
    sql: ${TABLE}."ATRASO" ;;
    group_label: "Dados Chamado"
    group_item_label: "Atraso"
    #description: ""
  }

  dimension: tempo_postergacao{
    type: string
    sql: ${TABLE}."TEMPO_POSTERGACAO" ;;
    group_label: "Dados Chamado"
    group_item_label: "Tempo de Postergação"
    #description: ""
  }


  dimension: escolha_area_encaminhar{
    type:string
    sql: ${TABLE}."ESCOLHA_AREA_ENCAMINHAR" ;;
    group_label: "Dados Chamado"
    group_item_label: "Encaminhar para área"
    #description: ""
  }

  dimension: resultado_postergacao{
    type: string
    sql: ${TABLE}."RESULTADO_POSTERGACAO" ;;
    group_label: "Dados Chamado"
    group_item_label: "Resultado da Postergação"
    #description: ""
  }

  dimension: retorno_ies{
    type: string
    sql: ${TABLE}."RETORNO_IES" ;;
    group_label: "Dados Chamado"
    group_item_label: "Retorno da IES"
    #description: ""
  }

  dimension: id_hugme {
    type: string
    sql: ${TABLE}."ID_HUGME" ;;
    group_label: "Dados Chamado"
    group_item_label: "ID Hugme"
    #description: ""
  }

  dimension: responsavel {
    type: string
    sql: ${TABLE}."RESPONSAVEL" ;;
    group_label: "Dados Chamado"
    group_item_label: "Responsável"
    #description: ""
  }

  dimension: retorno_interfile {
    type: string
    sql: ${TABLE}."RETORNO_INTERFILE" ;;
    group_label: "Dados Chamado"
    group_item_label: "Retorno da Interfile"
    #description: ""
  }

  dimension: origem_solicitacao {
    type: string
    sql: ${TABLE}."ORIGEM_SOLICITACAO" ;;
    group_label: "Dados Chamado"
    group_item_label: "Origem da Solicitação"
    #description: ""
  }

  dimension: subcategoria_contratos_formalizacao {
    type: string
    sql: ${TABLE}."SUBCATEGORIA_CONTRATOS_FORMALIZACAO" ;;
    group_label: "Dados Chamado"
    group_item_label: "Subcategoria Contratos e Formalização"
    #description: ""
  }

  dimension: desc_problema_inf_aluno {
    type: string
    sql: ${TABLE}."DESC_PROBLEMA_INF_ALUNO" ;;
    group_label: "Dados Aluno"
    group_item_label: "Descreva o problema informado pelo aluno"
    #description: ""
  }

  dimension: obs_retorno_analise {
    type: string
    sql: ${TABLE}."OBS_RETORNO_ANALISE" ;;
    group_label: "Dados Chamado"
    group_item_label: "Observação de retorno da análise"
    #description: ""
  }

  dimension: retorno_chamado {
    type: string
    sql: ${TABLE}."RETORNO_CHAMADO" ;;
    group_label: "Dados Chamado"
    group_item_label: "Retorno do chamado"
    #description: ""
  }

  dimension: flg_aluno_possui_ordem_judicial_reclameaqui {
    type: string
    sql: ${TABLE}."FLG_ALUNO_POSSUI_ORDEM_JUDICIAL_RECLAMEAQUI" ;;
    group_label: "Dados Aluno"
    group_item_label: "Aluno possui Ordem Judicial ou Reclame Aqui conosco?"
    #description: ""
  }


  set: detail {
    fields: [
      numero_chamado,
      categoria,
      possivel_causa_raiz,
      ticket_zendesk,
      cpf,
      problema_covid_19,
      matricula,
      obs_contato,
      email_aluno,
      flg_aluno_p_fies,
      obs_analise,
      anexo,
      subcategoria_risco,
      flg_encaminhar_outro_time,
      atraso,
      tempo_postergacao,
      escolha_area_encaminhar,
      resultado_postergacao,
      retorno_ies,
      id_hugme,
      responsavel,
      retorno_interfile,
      origem_solicitacao,
      subcategoria_contratos_formalizacao,
      desc_problema_inf_aluno,
      obs_retorno_analise,
      retorno_chamado,
      flg_aluno_possui_ordem_judicial_reclameaqui

      ]
  }
}
