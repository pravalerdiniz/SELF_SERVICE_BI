view: orquestra_obj_campos {
  derived_table: {
    sql: select NUMERO_CHAMADO, NOME_TASK
    ,max(T.VALUE:"Categoria:"::varchar) categoria
    ,max(T.VALUE:"Nome do Aluno"::varchar) nome_do_aluno
    ,max(T.VALUE:"IES do Aluno"::varchar) ies_do_aluno
    ,max(T.VALUE:"Motivo de Contato"::varchar) motivo_de_contato
    ,max(T.VALUE:"Descrição da Solicitação"::varchar) descricao_da_solicitacao
    ,max(T.VALUE:"Área Responsável"::varchar) area_responsavel
        from GRADUADO.AD_HOC.ORQUESTRA A,
      lateral flatten (input=>OBJ_CAMPOS) T
      group by 1,2
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

  dimension: descricao_da_solicitacao {
    type: string
    sql: ${TABLE}."DESCRICAO_DA_SOLICITACAO" ;;
    label: "Descrição da Solicitação"
    #description: ""
  }

  dimension: area_responsavel {
    type: string
    sql: ${TABLE}."AREA_RESPONSAVEL" ;;
    label: "Área Responsável"
    #description: ""
  }

  set: detail {
    fields: [numero_chamado, categoria]
  }
}
