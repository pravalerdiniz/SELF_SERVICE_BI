view: solicitacoes_para_facilities_p51 {
  derived_table: {
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
      where nome_fila ilike 'P51%'
      --group by 1,2  -- bkp Mari
      group by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: nome_fila {
    type: string
    sql: ${TABLE}."NOME_FILA" ;;
  }

  dimension: nome_task {
    type: string
    sql: ${TABLE}."NOME_TASK" ;;
  }

  dimension: numero_chamado {
    type: string
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
  }

  dimension: nome_requisitante {
    type: string
    sql: ${TABLE}."NOME_REQUISITANTE" ;;
  }

  dimension: login_requisitante {
    type: string
    sql: ${TABLE}."LOGIN_REQUISITANTE" ;;
  }

  dimension: area_requisitante {
    type: string
    sql: ${TABLE}."AREA_REQUISITANTE" ;;
  }

  dimension: posicao_requisitante {
    type: string
    sql: ${TABLE}."POSICAO_REQUISITANTE" ;;
  }

  dimension_group: data_inicio {
    type: time
    sql: ${TABLE}."DATA_INICIO" ;;
  }

  dimension_group: data_fim {
    type: time
    sql: ${TABLE}."DATA_FIM" ;;
  }

  dimension: flg_processo_em_andamento {
    type: string
    sql: ${TABLE}."FLG_PROCESSO_EM_ANDAMENTO" ;;
  }

  dimension: codigo_resultado {
    type: number
    sql: ${TABLE}."CODIGO_RESULTADO" ;;
  }

  dimension: descricao_resultado {
    type: string
    sql: ${TABLE}."DESCRICAO_RESULTADO" ;;
  }

  dimension: nome_executor {
    type: string
    sql: ${TABLE}."NOME_EXECUTOR" ;;
  }

  dimension: login_executor {
    type: string
    sql: ${TABLE}."LOGIN_EXECUTOR" ;;
  }

  dimension: area_executor {
    type: string
    sql: ${TABLE}."AREA_EXECUTOR" ;;
  }

  dimension: posicao_executor {
    type: string
    sql: ${TABLE}."POSICAO_EXECUTOR" ;;
  }

  dimension: tkt_zendesk {
    type: string
    sql: ${TABLE}."TKT_ZENDESK" ;;
  }

  dimension: cpf {
    type: string
    sql: ${TABLE}."CPF" ;;
  }

  dimension: obj_campos {
    type: string
    sql: ${TABLE}."OBJ_CAMPOS" ;;
  }

  dimension: flg_primeira_task {
    type: string
    sql: ${TABLE}."FLG_PRIMEIRA_TASK" ;;
  }

  dimension: flg_ultima_task {
    type: string
    sql: ${TABLE}."FLG_ULTIMA_TASK" ;;
  }

  dimension: tempo_desde_abertura_horas {
    type: number
    sql: ${TABLE}."TEMPO_DESDE_ABERTURA_HORAS" ;;
  }

  dimension: sla {
    type: number
    sql: ${TABLE}."SLA" ;;
  }

  dimension: min_data_chamado {
    type: date
    sql: ${TABLE}."MIN_DATA_CHAMADO" ;;
  }

  dimension: max_data_chamado {
    type: date
    sql: ${TABLE}."MAX_DATA_CHAMADO" ;;
  }

  set: detail {
    fields: [
      nome_fila,
      nome_task,
      numero_chamado,
      nome_requisitante,
      login_requisitante,
      area_requisitante,
      posicao_requisitante,
      data_inicio_time,
      data_fim_time,
      flg_processo_em_andamento,
      codigo_resultado,
      descricao_resultado,
      nome_executor,
      login_executor,
      area_executor,
      posicao_executor,
      tkt_zendesk,
      cpf,
      obj_campos,
      flg_primeira_task,
      flg_ultima_task,
      tempo_desde_abertura_horas,
      sla,
      min_data_chamado,
      max_data_chamado
    ]
  }
}
