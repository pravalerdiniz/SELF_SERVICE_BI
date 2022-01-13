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
        from GRADUADO.AD_HOC.ORQUESTRA A,
      lateral flatten (input=>OBJ_CAMPOS) T
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
    label: "Categoria"
    #description: ""
  }

  dimension: nome_do_aluno {
    type: string
    sql: ${TABLE}."NOME_DO_ALUNO" ;;
    label: "Nome do Aluno"
    #description: ""
  }

  dimension: ies_do_aluno {
    type: string
    sql: ${TABLE}."IES_DO_ALUNO" ;;
    label: "IES do Aluno"
    #description: ""
  }

  dimension: motivo_de_contato {
    type: string
    sql: ${TABLE}."MOTIVO_DE_CONTATO" ;;
    label: "Motivo de Contato"
    #description: ""
  }


  dimension: area_responsavel {
    type: string
    sql: ${TABLE}."AREA_RESPONSAVEL" ;;
    label: "Área Responsável"
    #description: ""
  }

  dimension: assunto_principal_do_contato{
    type: string
    sql: ${TABLE}."ASSUNTO_PRINCIPAL_DO_CONTATO" ;;
    label: "Assunto Principal do Contato"
    #description: ""
  }

  dimension: solicitacao_correta{
    type: yesno
    sql: ${TABLE}."FLG_SOLICITACAO_CORRETA" ;;
    label: "Solicitação está correta?"
    #description: ""
  }

  set: detail {
    fields: [numero_chamado, categoria]
  }
}
