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
    ,max(coalesce(T.VALUE:"O documento está impresso?"::varchar,T.VALUE:"O documento está impresso?"::varchar)) flg_documento_impresso
    ,max(coalesce(T.VALUE:"Data de coleta:"::varchar,T.VALUE:"Data de coleta:"::varchar)) data_coleta
    ,max(coalesce(T.VALUE:"Tel de contato 2ª assinatura:"::varchar,T.VALUE:"Tel de contato 2ª assinatura:"::varchar)) tel_contato_2_assinatura
    ,max(coalesce(T.VALUE:"Qual a data que ele irá receber:"::varchar,T.VALUE:"Qual a data que ele irá receber:"::varchar)) data_recebimento
    ,max(coalesce(T.VALUE:"Nome do Contato que irá receber o documento final:"::varchar,T.VALUE:"Nome do Contato que irá receber o documento final:"::varchar)) nome_contato_recebimento_final
    ,max(coalesce(T.VALUE:"Data 2ª assinatura:"::varchar,T.VALUE: "Data 2ª assinatura:"::varchar)) data_2_assinatura
    ,max(coalesce(T.VALUE:"Tel contato 1ª assinatura:"::varchar,T.VALUE:"Tel contato 1ª assinatura:"::varchar)) tel_contato_1_assinatura
    ,max(coalesce(T.VALUE:"Data 1ª assinatura:"::varchar,T.VALUE: "Data 1ª assinatura:"::varchar)) data_1_assinatura

    ,max(coalesce(T.VALUE:"Prazo para retirar o pacote na casa do solicitante::"::varchar,T.VALUE:"Prazo para retirar o pacote na casa do solicitante:"::varchar)) prazo_retirada_solicitante
    ,max(coalesce(T.VALUE:"Código de rastreio:"::varchar,T.VALUE:"Código de rastreio:"::varchar)) codigo_rastreio
    ,max(coalesce(T.VALUE:"Solicitante recebeu a entrega?"::varchar,T.VALUE:"Solicitante recebeu a entrega?"::varchar)) flg_solicitante_recebeu
    ,max(coalesce(T.VALUE:"Vai usar o serviço de correios?"::varchar,T.VALUE:"Vai usar o serviço de correios?"::varchar)) flg_servico_correios
    ,max(coalesce(T.VALUE:"Haverá devolução de equipamento?"::varchar,T.VALUE:"Haverá devolução de equipamento?"::varchar)) flg_devolucao_equipamento
    ,max(coalesce(T.VALUE:"Data limite de entrega via correios:"::varchar,T.VALUE:"Data limite de entrega via correios:"::varchar)) data_limite_entrega_correios
    ,max(coalesce(T.VALUE:"Endereço de entrega:"::varchar,T.VALUE:"Endereço de entrega:"::varchar)) endereco_entrega
    ,max(coalesce(T.VALUE:"Data limite de entrega:"::varchar,T.VALUE:"Data limite de entrega:"::varchar)) data_limite_entrega
    ,max(coalesce(T.VALUE:"Código de postagem dos correios:"::varchar,T.VALUE:"Código de postagem dos correios:"::varchar)) codigo_postagem_correios
    ,max(coalesce(T.VALUE:"Nome do Solicitante:"::varchar,T.VALUE:"Nome do Solicitante:"::varchar)) nome_solicitante
    ,max(coalesce(T.VALUE:"Nome do Contato onde será entregue:"::varchar,T.VALUE:"Nome do Contato onde será entregue:"::varchar)) nome_contato_entrega
    ,max(coalesce(T.VALUE:"Horário da entrega:"::varchar,T.VALUE:"Horário da entrega:"::varchar)) horario_entrega
    ,max(coalesce(T.VALUE:"Telefone do contato de entrega:"::varchar,T.VALUE:"Telefone do contato de entrega:"::varchar)) tel_contato_entrega
    ,max(coalesce(T.VALUE:"Quem vai retirar o pacote para envio?"::varchar,T.VALUE:"Quem vai retirar o pacote para envio?"::varchar)) nome_retirar_pacote_envio
    ,max(coalesce(T.VALUE:"Correios fez a retirada?"::varchar,T.VALUE:"Correios fez a retirada?:"::varchar)) flg_correios_retirou
    ,max(coalesce(T.VALUE:"O que será transportado:"::varchar,T.VALUE:"O que será transportado:"::varchar)) obj_transportado
    ,max(coalesce(T.VALUE:"Data que a entrega foi realizada:"::varchar,T.VALUE:"Data que a entrega foi realizada:"::varchar)) data_entrega
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
    group_item_label: "Solicitação está correta?"
    group_label: "Informações Solicitante"

    #description: ""
  }

  dimension: nome_contato_1_assinatura {
    type: string
    sql: ${TABLE}."NOME_CONTATO_1_ASSINATURA" ;;
    group_item_label:"Nome do Contato 1ª Assinatura"
    group_label: "Dados Documentos"
    #description: ""
  }
  dimension: horario_2_assinatura {
    type: string
    sql: ${TABLE}."HORARIO_2_ASSINATURA" ;;
    group_item_label: "Horario 2ª Assinatura"
    group_label: "Dados Documentos"
    #description: ""
  }

  dimension: centro_custo_solicitante {
    type: string
    sql: ${TABLE}."CENTRO_CUSTO_SOLICITANTE" ;;
    group_item_label: "Centro de Custo do Solicitante"
    group_label: "Informações Solicitante"
    #description: ""
  }

  dimension: qual_solicitacao {
    type: string
    sql: ${TABLE}."QUAL_SOLICITACAO" ;;
    group_item_label: "Qual a sua solicitação?"
    group_label: "Informações Solicitante"
    #description: ""
  }

  dimension: endereco_coleta {
    type: string
    sql: ${TABLE}."ENDERECO_COLETA" ;;
    group_label: "Dados Coleta"
    group_item_label: "Endereço de Coleta"
    #description: ""
  }

  dimension: tel_contato_coleta {
    type: string
    sql: ${TABLE}."TEL_CONTATO_COLETA" ;;
    group_item_label: "Telefone do contato de Coleta"
    group_label: "Dados Coleta"
    #description: ""
  }

  dimension: endereco_completo {
    type: string
    sql: ${TABLE}."ENDERECO_COMPLETO" ;;
    group_item_label: "Endereço completo"
    group_label: "Informações Solicitante"
    #description: ""
  }

  dimension: obs_analise {
    type: string
    sql: ${TABLE}."OBS_ANALISE" ;;
    group_item_label: "Observações da analise"
    group_label: "Informações Solicitante"
    #description: ""
  }

  dimension: nome_contato_2_assinatura {
    type: string
    sql: ${TABLE}."NOME_CONTATO_2_ASSINATURA" ;;
    group_item_label: "Nome do contato 2ª assinatura"
    group_label: "Dados Documentos"
    #description: ""
  }

  dimension: endereco_2_assinatura {
    type: string
    sql: ${TABLE}."ENDERECO_2_ASSINATURA" ;;
    group_item_label: "Endereço 2ª assinatura"
    group_label: "Dados Documentos"
    #description: ""
  }

  dimension: flg_assinatura_diretor {
    type: string
    sql: ${TABLE}."FLG_ASSINATURA_DIRETOR" ;;
    group_item_label: "Precisará de assinatura de Diretor/Comex?"
    group_label: "Dados Documentos"
    #description: ""
  }

  dimension: horario_recebimento {
    type: string
    sql: ${TABLE}."HORARIO_RECEBIMENTO" ;;
    group_item_label: "Horário de recebimento"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: horario_1_assinatura {
    type: string
    sql: ${TABLE}."HORARIO_1_ASSINATURA" ;;
    group_item_label: "Horário 1ª assinatura"
    group_label: "Dados Documentos"
    #description: ""
  }

  dimension: flg_servico_cartorio {
    type: string
    sql: ${TABLE}."FLG_SERVICO_CARTORIO" ;;
    group_item_label: "Vai precisar de serviço de cartório?"
    group_label: "Informações Solicitante"
    #description: ""
  }

  dimension: tel_contato_a_receber {
    type: string
    sql: ${TABLE}."TEL_CONTATO_A_RECEBER" ;;
    group_item_label: "Tel do contato que irá receber"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: endereco_1_assinatura {
    type: string
    sql: ${TABLE}."ENDERECO_1_ASSINATURA" ;;
    group_item_label: "Endereço 1ª assinatura"
    group_label: "Dados Documentos"
    #description: ""
  }

  dimension: horario_coleta {
    type: string
    sql: ${TABLE}."HORARIO_COLETA" ;;
    group_label: "Dados Coleta"
    group_item_label: "Horário da coleta"
    #description: ""
  }

  dimension: nome_contato_coleta {
    type: string
    sql: ${TABLE}."NOME_CONTATO_COLETA" ;;
    group_item_label: "Nome do Contato de coleta"
    group_label: "Dados Coleta"
    #description: ""
  }

  dimension: flg_documento_impresso {
    type: string
    sql: ${TABLE}."FLG_DOCUMENTO_IMPRESSO" ;;
    group_item_label: "O documento está impresso?"
    group_label: "Dados Documentos"
    #description: ""
  }

  dimension: data_coleta {
    type: string
    sql: ${TABLE}."DATA_COLETA" ;;
    group_item_label: "Data de coleta"
    group_label: "Dados Coleta"
    #description: ""
  }

  dimension: tel_contato_2_assinatura {
    type: string
    sql: ${TABLE}."TEL_CONTATO_2_ASSINATURA" ;;
    group_item_label: "Tel de contato 2ª assinatura"
    group_label: "Dados Documentos"
    #description: ""
  }

  dimension: data_recebimento {
    type: string
    sql: ${TABLE}."DATA_RECEBIMENTO" ;;
    group_item_label: "Qual a data que ele irá receber"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: nome_contato_recebimento_final {
    type: string
    sql: ${TABLE}."NOME_CONTATO_RECEBIMENTO_FINAL" ;;
    group_item_label: "Nome do Contato que irá receber o documento final"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: data_2_assinatura {
    type: string
    sql: ${TABLE}."DATA_2_ASSINATURA" ;;
    group_item_label: "Data 2ª assinatura"
    group_label: "Dados Documentos"
    #description: ""
  }

  dimension: tel_contato_1_assinatura {
    type: string
    sql: ${TABLE}."TEL_CONTATO_1_ASSINATURA" ;;
    group_item_label: "Tel contato 1ª assinatura"
    group_label: "Dados Documentos"
    #description: ""
  }

  dimension: data_1_assinatura {
    type: string
    sql: ${TABLE}."DATA_1_ASSINATURA" ;;
    group_item_label: "Data 1ª assinatura"
    group_label: "Dados Documentos"
    #description: ""
  }






  dimension: prazo_retirada_solicitante {
    type: string
    sql: ${TABLE}."PRAZO_RETIRADA_SOLICITANTE" ;;
    group_item_label: "Prazo para retirar o pacote na casa do solicitante:"
    group_label: "Dados Coleta"
    #description: ""
  }

  dimension: codigo_rastreio {
    type: string
    sql: ${TABLE}."CODIGO_RASTREIO" ;;
    group_item_label: "Código de rastreio:"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: flg_solicitante_recebeu {
    type: string
    sql: ${TABLE}."FLG_SOLICITANTE_RECEBEU" ;;
    group_item_label: "Solicitante recebeu a entrega?"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: flg_servico_correios {
    type: string
    sql: ${TABLE}."FLG_SERVICO_CORREIOS" ;;
    group_item_label: "Vai usar o serviço de correios?"
    group_label: "Dados Correios"
    #description: ""
  }

  dimension: flg_devolucao_equipamento {
    type: string
    sql: ${TABLE}."FLG_DEVOLUCAO_EQUIPAMENTO" ;;
    group_item_label: "Haverá devolução de equipamento?"
    group_label: "Informações Solicitante"
    #description: ""
  }

  dimension: data_limite_entrega_correios {
    type: string
    sql: ${TABLE}."DATA_LIMITE_ENTREGA_CORREIOS" ;;
    group_item_label: "Data limite de entrega via correios"
    group_label: "Dados Correios"
    #description: ""
  }

  dimension: endereco_entrega {
    type: string
    sql: ${TABLE}."ENDERECO_ENTREGA" ;;
    group_item_label:: "Endereço de entrega"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: data_limite_entrega {
    type: string
    sql: ${TABLE}."DATA_LIMITE_ENTREGA" ;;
    group_item_label: "Data limite de entrega"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: codigo_postagem_correios {
    type: string
    sql: ${TABLE}."CODIGO_POSTAGEM_CORREIOS" ;;
    group_item_label: "Código de postagem dos correios"
    group_label: "Dados Correios"
    #description: ""
  }

  dimension: nome_solicitante {
    type: string
    sql: ${TABLE}."NOME_SOLICITANTE" ;;
    group_item_label: "Nome do Solicitante"
    group_label: "Informações Solicitante"
    #description: ""
  }

   dimension: nome_contato_entrega {
    type: string
    sql: ${TABLE}."NOME_CONTATO_ENTREGA" ;;
    group_item_label: "Nome do Contato onde será entregue"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: horario_entrega {
    type: string
    sql: ${TABLE}."HORARIO_ENTREGA" ;;
    group_item_label: "Horário da entrega"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: tel_contato_entrega {
    type: string
    sql: ${TABLE}."TEL_CONTATO_ENTREGA" ;;
    group_item_label: "Telefone do contato de entrega"
    group_label: "Dados Entrega"
    #description: ""
  }

  dimension: nome_retirar_pacote_envio {
    type: string
    sql: ${TABLE}."NOME_RETIRAR_PACOTE_ENVIO" ;;
    group_item_label: "Quem vai retirar o pacote para envio?"
    group_label: "Dados Coleta"
    #description: ""
  }

  dimension: flg_correios_retirou {
    type: string
    sql: ${TABLE}."FLG_CORREIOS_RETIROU" ;;
    group_item_label: "Correios fez a retirada?"
    group_label: "Dados Correios"
    #description: ""
  }

  dimension: obj_transportado {
    type: string
    sql: ${TABLE}."OBJ_TRANSPORTADO" ;;
    group_item_label: "O que será transportado"
    group_label: "Dados Coleta"
    #description: ""
  }

  dimension: data_entrega {
    type: string
    sql: ${TABLE}."DATA_ENTREGA" ;;
    group_item_label: "Data que a entrega foi realizada"
    group_label: "Dados Entrega"
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
      data_1_assinatura,
      prazo_retirada_solicitante,
      codigo_rastreio,
      flg_solicitante_recebeu,
      flg_servico_correios,
      flg_devolucao_equipamento,
      data_limite_entrega_correios,
      endereco_entrega,
      data_limite_entrega,
      codigo_postagem_correios,
      nome_solicitante,
      nome_contato_entrega,
      horario_entrega,
      tel_contato_entrega,
      nome_retirar_pacote_envio,
      flg_correios_retirou,
      obj_transportado,
      data_entrega
    ]
  }
}
