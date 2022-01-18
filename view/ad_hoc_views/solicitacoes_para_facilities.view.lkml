view: solicitacoes_para_facilities {
  derived_table: {
    sql: select NUMERO_CHAMADO
    ,max(coalesce(T.VALUE:"Nome do Contato 1ª assinatura:"::varchar,T.VALUE:"Nome do Contato 1ª assinatura"::varchar)) nome_contato_1_assinatura
    ,max(coalesce(T.VALUE:"Horário 2ª assinatura"::varchar,T.VALUE:"Horário 2ª assinatura:"::varchar)) horario_2_assinatura
    ,max(coalesce(T.VALUE:"Solicitação está correta?"::varchar,T.VALUE:"Solicitação está correta?"::varchar)) flg_solicitacao_correta
    ,max(coalesce(T.VALUE:"Centro de Custo do solicitante"::varchar,T.VALUE:"Centro de Custo do solicitante:"::varchar)) centro_custo_solicitante
    ,max(coalesce(T.VALUE:"Qual a sua solicitação?"::varchar,T.VALUE:"Qual a sua solicitação?"::varchar)) qual_solicitacao
    ,max(coalesce(T.VALUE:"Endereço de coleta:"::varchar,T.VALUE:"Endereço de coleta:"::varchar)) endereco_coleta
    ,max(coalesce(T.VALUE:"Telefone do contato de coleta:"::varchar,T.VALUE:"Telefone do contato de coleta:"::varchar)) tel_contato_coleta
    ,max(coalesce(T.VALUE:"Endereço completo:"::varchar,T.VALUE:"Endereço completo:"::varchar)) endereco_completo
    ,max(coalesce(T.VALUE:"Observações da analise:"::varchar,T.VALUE:"Observações da analise:"::varchar)) obs_analise
    ,max(coalesce(T.VALUE:"Nome do Contato 2ª assinatura:":varchar,T.VALUE:"Nome do Contato 2ª assinatura:"::varchar)) nome_contato_2_assinatura
    ,max(coalesce(T.VALUE:"Endereço 2ª assinatura:"::varchar,T.VALUE:"Endereço 2ª assinatura:"::varchar)) endereco_2_assinatura
    ,max(coalesce(T.VALUE:"Precisará de assinatura de Diretor/Comex?"::varchar,T.VALUE:"Precisará de assinatura de Diretor/Comex?"::varchar)) flg_assinatura_diretor
    ,max(coalesce(T.VALUE:"Horário de recebimento:"::varchar,T.VALUE:"Horário de recebimento:"::varchar)) horario_recebimento
    ,max(coalesce(T.VALUE:"Horário 1ª assinatura:"::varchar,T.VALUE:"Horário 1ª assinatura:"::varchar)) horario_1_assinatura
    ,max(coalesce(T.VALUE:"Vai precisar de serviço de cartório?"::varchar,T.VALUE:"Vai precisar de serviço de cartório?"::varchar)) flg_servico_cartorio
    ,max(coalesce(T.VALUE:"Tel do contato que irá receber:"::varchar,T.VALUE:"Tel do contato que irá receber:"::varchar)) tel_contato_a_receber
    ,max(coalesce(T.VALUE:"Endereço 1ª assinatura:"::varchar,T.VALUE:"Endereço 1ª assinatura:"::varchar)) endereco_1_assinatura
    ,max(coalesce(T.VALUE:"Horário da coleta:"::varchar,T.VALUE:"Horário da coleta:"::varchar)) horario_coleta
    ,max(coalesce(T.VALUE:"Nome do Contato de coleta:"::varchar,T.VALUE:"Nome do Contato de coleta:"::varchar)) nome_contato_coleta
    ,max(coalesce(T.VALUE:"O documento está impresso?":::varchar,T.VALUE:"O documento está impresso?":::varchar)) flg_documento_impresso
    ,max(coalesce(T.VALUE:"Data de coleta:"::varchar,T.VALUE:"Data de coleta:"::varchar)) data_coleta
    ,max(coalesce(T.VALUE:"Tel de contato 2ª assinatura:"::varchar,T.VALUE:"Tel de contato 2ª assinatura:"::varchar)) tel_contato_2_assinatura
    ,max(coalesce(T.VALUE:"Qual a data que ele irá receber:"::varchar,T.VALUE:"Qual a data que ele irá receber:"::varchar)) data_recebimento
    ,max(coalesce(T.VALUE:"Nome do Contato que irá receber o documento final:"::varchar,T.VALUE:"Nome do Contato que irá receber o documento final:"::varchar)) nome_contato_recebimento_final
    ,max(coalesce(T.VALUE:"Data 2ª assinatura:"::varchar,T.VALUE: "Data 2ª assinatura:"::varchar)) data_2_assinatura
    ,max(coalesce(T.VALUE:"Tel contato 1ª assinatura:"::varchar,T.VALUE:"Tel contato 1ª assinatura:"::varchar)) tel_contato_1_assinatura
    ,max(coalesce(T.VALUE:"Data 1ª assinatura:"::varchar,T.VALUE: "Data 1ª assinatura:"::varchar)) data_1_assinatura
        from GRADUADO.AD_HOC.ORQUESTRA A,
    lateral flatten (input=>OBJ_CAMPOS) T
     where nome_fila ilike 'P37%'
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
    type: string
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

  dimension: qual_solicitacao {
    type: string
    sql: ${TABLE}."QUAL_SOLICITACAO" ;;
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

  dimension: endereco_completo {
    type: string
    sql: ${TABLE}."ENDERECO_COMPLETO" ;;
    label: "Endereço completo"
    #description: ""
  }

  dimension: obs_analise {
    type: string
    sql: ${TABLE}."OBS_ANALISE" ;;
    label: "Observações da analise"
    #description: ""
  }

  dimension: nome_contato_2_assinatura {
    type: string
    sql: ${TABLE}."NOME_CONTATO_2_ASSINATURA" ;;
    label: "Nome do contato 2ª assinatura"
    #description: ""
  }

  dimension: endereco_2_assinatura {
    type: string
    sql: ${TABLE}."ENDERECO_2_ASSINATURA" ;;
    label: "Endereço 2ª assinatura"
    #description: ""
  }

  dimension: flg_assinatura_diretor {
    type: string
    sql: ${TABLE}."FLG_ASSINATURA_DIRETOR" ;;
    label: "Precisará de assinatura de Diretor/Comex?"
    #description: ""
  }

  dimension: horario_recebimento {
    type: string
    sql: ${TABLE}."HORARIO_RECEBIMENTO" ;;
    label: "Horário de recebimento"
    #description: ""
  }

  dimension: horario_1_assinatura {
    type: string
    sql: ${TABLE}."HORARIO_1_ASSINATURA" ;;
    label: "Horário 1ª assinatura"
    #description: ""
  }

  dimension: flg_servico_cartorio {
    type: string
    sql: ${TABLE}."FLG_SERVICO_CARTORIO" ;;
    label: "Vai precisar de serviço de cartório?"
    #description: ""
  }

  dimension: tel_contato_a_receber {
    type: string
    sql: ${TABLE}."TEL_CONTATO_A_RECEBER" ;;
    label: "Tel do contato que irá receber"
    #description: ""
  }

  dimension: endereco_1_assinatura {
    type: string
    sql: ${TABLE}."ENDERECO_1_ASSINATURA" ;;
    label: "Endereço 1ª assinatura"
    #description: ""
  }

  dimension: horario_coleta {
    type: string
    sql: ${TABLE}."HORARIO_COLETA" ;;
    label: "Horário da coleta"
    #description: ""
  }

  dimension: nome_contato_coleta {
    type: string
    sql: ${TABLE}."NOME_CONTATO_COLETA" ;;
    label: "Nome do Contato de coleta"
    #description: ""
  }

  dimension: flg_documento_impresso {
    type: string
    sql: ${TABLE}."FLG_DOCUMENTO_IMPRESSO" ;;
    label: "O documento está impresso?"
    #description: ""
  }

  dimension: data_coleta {
    type: string
    sql: ${TABLE}."DATA_COLETA" ;;
    label: "Data de coleta"
    #description: ""
  }

  dimension: tel_contato_2_assinatura {
    type: string
    sql: ${TABLE}."TEL_CONTATO_2_ASSINATURA" ;;
    label: "Tel de contato 2ª assinatura"
    #description: ""
  }

  dimension: data_recebimento {
    type: string
    sql: ${TABLE}."DATA_RECEBIMENTO" ;;
    label: "Qual a data que ele irá receber"
    #description: ""
  }

  dimension: nome_contato_recebimento_final {
    type: string
    sql: ${TABLE}."NOME_CONTATO_RECEBIMENTO_FINAL" ;;
    label: "Nome do Contato que irá receber o documento final"
    #description: ""
  }

  dimension: data_2_assinatura {
    type: string
    sql: ${TABLE}."DATA_2_ASSINATURA" ;;
    label: "Data 2ª assinatura"
    #description: ""
  }

  dimension: tel_contato_1_assinatura {
    type: string
    sql: ${TABLE}."TEL_CONTATO_1_ASSINATURA" ;;
    label: "Tel contato 1ª assinatura"
    #description: ""
  }

  dimension: data_1_assinatura {
    type: string
    sql: ${TABLE}."DATA_1_ASSINATURA" ;;
    label: "Data 1ª assinatura"
    #description: ""
  }



  set: detail {
    fields: [
      numero_chamado,
      nome_task,
      flg_solicitacao_correta,
      nome_contato_1_assinatura,
      horario_2_assinatura,
      centro_custo_solicitante,
      qual_solicitacao,
      endereco_coleta,
      tel_contato_coleta,
      nome_solicitante_assinaturas,
      endereco_completo,
      obs_analise,
      nome_contato_2_assinatura,
      endereco_2_assinatura,
      flg_assinatura_diretor,
      horario_recebimento,
      horario_1_assinatura,
      flg_servico_cartorio,
      tel_contato_a_receber,
      endereco_1_assinatura,
      horario_coleta,
      nome_contato_coleta,
      flg_documento_impresso,
      data_coleta,
      tel_contato_2_assinatura,
      data_recebimento,
      nome_contato_recebimento_final,
      data_2_assinatura,
      tel_contato_1_assinatura,
      data_1_assinatura

    ]
  }
}
