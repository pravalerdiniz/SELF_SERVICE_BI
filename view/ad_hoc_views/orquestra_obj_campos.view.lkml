view: orquestra_obj_campos {
  derived_table: {
    #sql: select NUMERO_CHAMADO, NOME_TASK -- bkp Mari
    sql: select NUMERO_CHAMADO
    ,max(coalesce(T.VALUE:"Categoria:"::varchar,T.VALUE:"Categoria"::varchar)) categoria
    ,max(coalesce(T.VALUE:"Nome do Aluno"::varchar,T.VALUE:"Nome do Aluno:"::varchar,T.VALUE:"Nome Completo do Aluno:"::varchar,T.VALUE:"Nome do aluno:"::varchar)) nome_do_aluno
    ,max(coalesce(T.VALUE:"IES do Aluno"::varchar,T.VALUE:"IES do Aluno:"::varchar)) ies_do_aluno
    ,max(coalesce(T.VALUE:"Motivo de Contato"::varchar,T.VALUE:"Motivo de Contato:"::varchar,T.VALUE:"Assunto principal do contato:"::varchar)) motivo_de_contato
    ,max(coalesce(T.VALUE:"Descrição da Solicitação"::varchar,T.VALUE:"Descrição da Solicitação:"::varchar)) descricao_da_solicitacao
    ,max(coalesce(T.VALUE:"Área Responsável"::varchar,T.VALUE:"Área Responsável:"::varchar,T.VALUE:"Qual área atende?"::varchar,T.VALUE:"Qual área será encaminhado?"::varchar)) area_responsavel
    ,max(coalesce(T.VALUE:"Assunto principal do contato"::varchar,T.VALUE:"Assunto principal do contato:"::varchar)) assunto_principal_do_contato
    ,max(coalesce(T.VALUE:"Solicitação está correta?"::varchar,T.VALUE:"Solicitação está correta?"::varchar)) flg_solicitacao_correta
    ,max(coalesce(T.VALUE:"Possível Causa Raíz"::varchar,T.VALUE:"Possível Causa Raíz"::varchar)) possivel_causa_raiz
    ,max(coalesce(T.VALUE:"Ticket Zendesk:"::varchar,T.VALUE:"Ticket Zendesk:"::varchar)) ticket_zendesk
    ,max(coalesce(T.VALUE:"CPF"::varchar,T.VALUE:"CPF"::varchar)) cpf
    ,max(coalesce(T.VALUE:"Problema Relacionado a COVID - 19"::varchar,T.VALUE:"Problema Relacionado a COVID - 19"::varchar)) problema_covid_19
    ,max(coalesce(T.VALUE:"Matrícula"::varchar,T.VALUE:"Matrícula"::varchar)) matricula
    ,max(coalesce(T.VALUE:"Observações de Contato"::varchar,T.VALUE:"Observações de Contato"::varchar)) obs_contato
    ,max(coalesce(T.VALUE:"E-mail do Aluno:"::varchar,T.VALUE:"E-mail do Aluno:"::varchar)) email_aluno
    ,max(coalesce(T.VALUE:"Aluno é P-FIES?"::varchar,T.VALUE:"Aluno é P-FIES?"::varchar)) flg_aluno_p_fies
    ,max(coalesce(T.VALUE:"Observação Análise:"::varchar,T.VALUE:"Observação Análise:"::varchar)) obs_analise
    ,max(coalesce(T.VALUE:"Anexo:"::varchar,T.VALUE:"Anexo:"::varchar)) anexo
    ,max(coalesce(T.VALUE:"Observações:"::varchar,T.VALUE:"Observações:"::varchar)) observacoes
    ,max(coalesce(T.VALUE:"Subcategoria Risco:"::varchar,T.VALUE:"Subcategoria Risco:"::varchar)) subcategoria_risco
    ,max(coalesce(T.VALUE:"Encaminhar para outro Time?"::varchar,T.VALUE:"Encaminhar para outro Time?"::varchar)) flg_encaminhar_outro_time
    ,max(coalesce(T.VALUE:"Atraso":::varchar,T.VALUE:"Atraso":::varchar)) atraso
    ,max(coalesce(T.VALUE:"Tempo de Postergação"::varchar,T.VALUE:"Tempo de Postergação"::varchar)) tempo_postergacao
    ,max(coalesce(T.VALUE:"Motivo"::varchar,T.VALUE:"Motivo"::varchar)) motivo
    ,max(coalesce(T.VALUE:"Escolha a área para encaminhar:"::varchar,T.VALUE:"Escolha a área para encaminhar:"::varchar)) escolha_area_encaminhar
    ,max(coalesce(T.VALUE:"Resultado da Postergação"::varchar,T.VALUE:"Resultado da Postergação"::varchar)) resultado_postergacao
    ,max(coalesce(T.VALUE:"Retorno da IES:"::varchar,T.VALUE:"Retorno da IES:"::varchar)) retorno_ies
            from GRADUADO.AD_HOC.ORQUESTRA A,
      lateral flatten (input=>OBJ_CAMPOS) T
      where nome_fila ilike 'P17%'
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
    hidden:  yes
  }

  dimension: nome_task {
    type: string
    sql: ${TABLE}."NOME_TASK" ;;
    hidden:  yes
  }

  dimension: categoria {
    type: string
    sql: ${TABLE}."CATEGORIA" ;;
    group_label: "Categoria"
    group_item_label: ""
    #description: ""
  }

  dimension: nome_do_aluno {
    type: string
    sql: ${TABLE}."NOME_DO_ALUNO" ;;
    group_label: "Nome do Aluno"
    group_item_label: ""
    #description: ""
  }

  dimension: ies_do_aluno {
    type: string
    sql: ${TABLE}."IES_DO_ALUNO" ;;
    group_label: "IES do Aluno"
    group_item_label: ""
    #description: ""
  }

  dimension: motivo_de_contato {
    type: string
    sql: ${TABLE}."MOTIVO_DE_CONTATO" ;;
    group_label: "Motivo de Contato"
    group_item_label: ""
    #description: ""
  }


  dimension: area_responsavel {
    type: string
    sql: ${TABLE}."AREA_RESPONSAVEL" ;;
    group_label: "Área Responsável"
    group_item_label: ""
    #description: ""
  }

  dimension: assunto_principal_do_contato{
    type: string
    sql: ${TABLE}."ASSUNTO_PRINCIPAL_DO_CONTATO" ;;
    group_label: "Assunto Principal do Contato"
    group_item_label: ""
    #description: ""
  }

  dimension: solicitacao_correta{
    type: yesno
    sql: ${TABLE}."FLG_SOLICITACAO_CORRETA" ;;
    group_label: "Solicitação está correta?"
    group_item_label: ""
    #description: ""
  }

  dimension: possivel_causa_raiz{
    type: string
    sql: ${TABLE}."POSSIVEL_CAUSA_RAIZ" ;;
    group_label: "Possível Causa Raíz"
    group_item_label: ""
    #description: ""
  }

  dimension: ticket_zendesk{
    type: string
    sql: ${TABLE}."TCKET_ZENDESK" ;;
    group_label: "Ticket Zendesk"
    group_item_label: ""
    #description: ""
  }

  dimension: cpf{
    type: string
    sql: ${TABLE}."CPF" ;;
    group_label: "CPF"
    group_item_label: ""
    #description: ""
  }

  dimension: problema_covid_19{
    type: string
    sql: ${TABLE}."PROBLEMA_COVID_19" ;;
    group_label: "Problema Relacionado a COVID - 19?"
    group_item_label: ""
    #description: ""
  }

  dimension: matricula{
    type: string
    sql: ${TABLE}."MATRICULA" ;;
    group_label: "Matrícula?"
    group_item_label: ""
    #description: ""
  }

  dimension: obs_contato{
    type: string
    sql: ${TABLE}."OBS_CONTATO" ;;
    group_label: "Observações de Contato"
    group_item_label: ""
    #description: ""
  }

  dimension: email_aluno{
    type: string
    sql: ${TABLE}."EMAIL_ALUNO" ;;
    group_label: "E-mail do Aluno:"
    group_item_label: ""
    #description: ""
  }

  dimension: flg_aluno_p_fies{
    type: string
    sql: ${TABLE}."FLG_ALUNO_P_FIES" ;;
    group_label: "Aluno é P-FIES?"
    group_item_label: ""
    #description: ""
  }

  dimension: obs_analise{
    type: string
    sql: ${TABLE}."OBS_ANALISE" ;;
    group_label: "Observação Análise:"
    group_item_label: ""
    #description: ""
  }

  dimension: anexo{
    type: string
    sql: ${TABLE}."ANEXO" ;;
    group_label: "Anexo"
    group_item_label: ""
    #description: ""
  }

  dimension: observacoes{
    type: string
    sql: ${TABLE}."OBSERVACOES" ;;
    group_label: "Observações:"
    group_item_label: ""
    #description: ""
  }

  dimension: subcategoria_risco{
    type: string
    sql: ${TABLE}."SUBCATEGORIA_RISCO" ;;
    group_label: "Subcategoria Risco:"
    group_item_label: ""
    #description: ""
  }

  dimension: flg_encaminhar_outro_time{
    type: string
    sql: ${TABLE}."FLG_ENCAMINHAR_OUTRO_TIME" ;;
    group_label: "Encaminhar para outro Time?"
    group_item_label: ""
    #description: ""
  }

  dimension: atraso{
    type: string
    sql: ${TABLE}."ATRASO" ;;
    group_label: "Atraso"
    group_item_label: ""
    #description: ""
  }

  dimension: tempo_postergacao{
    type: string
    sql: ${TABLE}."TEMPO_POSTERGACAO" ;;
    group_label: "Solicitação está correta?"
    group_item_label: ""
    #description: ""
  }

  dimension: motivo{
    type: string
    sql: ${TABLE}."MOTIVO" ;;
    group_label: "Motivo"
    group_item_label: ""
    #description: ""
  }

  dimension: escolha_area_encaminhar{
    type:string
    sql: ${TABLE}."ESCOLHA_AREA_ENCAMINHAR" ;;
    group_label: "Escolha a área para encaminhar:"
    group_item_label: ""
    #description: ""
  }

  dimension: resultado_postergacao{
    type: string
    sql: ${TABLE}."RESULTADO_POSTERGACAO" ;;
    group_label: "Resultado da Postergação"
    group_item_label: ""
    #description: ""
  }

  dimension: retorno_ies{
    type: string
    sql: ${TABLE}."RESTORNO_IES" ;;
    group_label: "Retorno da IES:"
    group_item_label: ""
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
      observacoes,
      subcategoria_risco,
      flg_encaminhar_outro_time,
      atraso,
      tempo_postergacao,
      motivo,
      escolha_area_encaminhar,
      resultado_postergacao,
      retorno_ies
      ]
  }
}
