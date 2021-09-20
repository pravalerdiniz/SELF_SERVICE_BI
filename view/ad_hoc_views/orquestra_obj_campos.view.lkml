view: orquestra_obj_campos {
  derived_table: {
    sql: select NUMERO_CHAMADO
    ,T.VALUE:"Categoria:"::varchar categoria
    ,T.VALUE:"IES do Aluno:"::varchar ies_do_aluno
    ,T.VALUE:"Descrição da Solicitação:"::descricao_da_solicitacao
        from GRADUADO.AD_HOC.ORQUESTRA A,
      lateral flatten (input=>OBJ_CAMPOS) T
      where T.VALUE:"Categoria:" IS NOT NULL
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

  dimension: categoria {
    type: string
    sql: ${TABLE}."CATEGORIA" ;;
    label: "Categoria"
    #description: ""
  }

  dimension: ies_do_aluno {
    type: string
    sql: ${TABLE}."IES_DO_ALUNO" ;;
    label: "IES do Aluno"
    #description: ""
  }

  dimension: descricao_da_solicitacao {
    type: string
    sql: ${TABLE}."DESCRICAO_DA_SOLICITACAO" ;;
    label: "Descrição da Solicitação"
    #description: ""
  }


  set: detail {
    fields: [numero_chamado, categoria]
  }
}
