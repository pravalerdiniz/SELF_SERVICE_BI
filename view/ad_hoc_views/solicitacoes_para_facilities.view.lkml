view: solicitacoes_para_facilities {
  derived_table: {
    sql: select NUMERO_CHAMADO
    ,max(coalesce(T.VALUE:"Nome do Contato 1ª assinatura:"::varchar,T.VALUE:"Nome do Contato 1ª assinatura"::varchar)) nome_contato_1_assinatura
    ,max(coalesce(T.VALUE:"Horário 2ª assinatura"::varchar,T.VALUE:"Horário 2ª assinatura:"::)) horario_2_assinatura
    ,max(coalesce(T.VALUE:"Solicitação está correta?"::varchar,T.VALUE:"Solicitação está correta?"::varchar)) flg_solicitacao_correta
    ,max(coalesce(T.VALUE:"Centro de Custo do solicitante"::varchar,T.VALUE:"Centro de Custo do solicitante:"::varchar)) centro_custo_solicitante
    ,max(coalesce(T.VALUE:"Qual a sua solicitação?"::varchar,T.VALUE:"Qual a sua solicitação?"::varchar)) solicitacao
    ,max(coalesce(T.VALUE:"Endereço de coleta:"::varchar,T.VALUE:"Endereço de coleta:"::varchar)) endereco_coleta
    ,max(coalesce(T.VALUE:"Telefone do contato de coleta:"::varchar,T.VALUE:"Telefone do contato de coleta:"::varchar)) tel_contato_coleta
    ,max(coalesce(T.VALUE:"Nome solicitante das assinaturas:"::varchar,T.VALUE:"Nome solicitante das assinaturas:"::varchar)) nome_solicitante_assinaturas
    from GRADUADO.AD_HOC.ORQUESTRA A,
    lateral flatten (input=>OBJ_CAMPOS) T
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

  dimension: solicitacao_correta {
    type: yesno
    sql: ${TABLE}."FLG_SOLICITACAO_CORRETA" ;;
    label: "Solicitação está correta?"
    #description: ""
  }

  dimension: nome_contato_1_assinatura {
    type: string
    sql: ${TABLE}."NOME_CONTATO_1_ASSINATURA" ;;
    label: "Nome do Contato 1ª Assinatura"
    #description: ""
  }
  dimension: horario_2_assinatura {
    type: number
    sql: ${TABLE}."HORARIO_2_ASSINATURA" ;;
    label: "Horario 2ª Assinatura"
    #description: ""
  }

  dimension: centro_custo_solicitante {
    type: string
    sql: ${TABLE}."CENTRO_CUSTO_SOLICITANTE" ;;
    label: "Centro de Custo do Solicitante"
    #description: ""
  }

  dimension: solicitacao {
    type: string
    sql: ${TABLE}."SOLICITACAO" ;;
    label: "Qual a sua solicitação?"
    #description: ""
  }

  dimension: endereco_coleta {
    type: string
    sql: ${TABLE}."ENDERECO_COLETA" ;;
    label: "Endereço de Coleta"
    #description: ""
  }

  dimension: tel_contato_coleta {
    type: string
    sql: ${TABLE}."TEL_CONTATO_COLETA" ;;
    label: "Telefone do contato de Coleta"
    #description: ""
  }
  dimension: nome_solicitante_assinaturas {
    type: string
    sql: ${TABLE}."NOME_SOLICITANTE_ASSINATURAS" ;;
    label: "Nome solicitante das assinaturas"
    #description: ""
  }



  set: detail {
    fields: [
      numero_chamado,
      nome_task,
      solicitacao_correta,
      nome_contato_1_assinatura,
      horario_2_assinatura,
      centro_custo_solicitante,
      solicitacao,
      endereco_coleta,
      tel_contato_coleta,
      nome_solicitante_assinaturas

    ]
  }
}
