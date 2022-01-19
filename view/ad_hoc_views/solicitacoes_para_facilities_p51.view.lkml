view: solicitacoes_para_facilities_p51 {
  derived_table: {
   sql: select NUMERO_CHAMADO
    ,max(coalesce(T.VALUE:"Campo auxiliar analista solicitante"::varchar,T.VALUE:"campoauxiliaranalistasolicitante"::varchar)) campo_auxiliar_analista_solicitante
    ,max(coalesce(T.VALUE:"Nome do Solicitante"::varchar,T.VALUE:"Nome do Solicitante"::varchar)) nome_solicitante
    ,max(coalesce(T.VALUE:"Justificativa"::varchar,T.VALUE:"Justificativa"::varchar)) justificativa
    ,max(coalesce(T.VALUE:"Precisa solicitar Motoboy/Correios?"::varchar,T.VALUE:"Precisa solicitar Motoboy/Correios?"::varchar)) flg_precisa_motoboy_correios
    ,max(coalesce(T.VALUE:"Centro de Custo do Solicitante"::varchar,T.VALUE:"Centro de Custo do Solicitante"::varchar)) centro_custo_solicitante
    ,max(coalesce(T.VALUE:"Número da linha com DDD"::varchar,T.VALUE:"Número da linha com DDD"::varchar)) numero_linha_ddd
    ,max(coalesce(T.VALUE:"Nome do Gestor Responsável"::varchar,T.VALUE:"Nome do Gestor Responsável"::varchar)) nome_gestor_responsavel
    ,max(coalesce(T.VALUE:"Observações da análise do Gestor"::varchar,T.VALUE:"Observações da análise do Gestor"::varchar)) obs_analise_gestor
    ,max(coalesce(T.VALUE:"Qual a sua solicitação?"::varchar,T.VALUE:"Qual a sua solicitação?"::varchar)) flg_qual_solicitação
    ,max(coalesce(T.VALUE:"Conclusão da solicitação"::varchar,T.VALUE:"Conclusão da solicitação"::varchar)) conclusao_solicitacao
    ,max(coalesce(T.VALUE:"Serviço a ser ativado"::varchar,T.VALUE:"Serviço a ser ativado"::varchar)) servico_ativado
    ,max(coalesce(T.VALUE:"Nome de usuário"::varchar,T.VALUE:"Nome de usuári"::varchar)) nome_usuario
    ,max(coalesce(T.VALUE:"Observações da análise de Facilities"::varchar,T.VALUE:"Observações da análise de Facilities"::varchar)) obs_analise_facilities
    ,max(coalesce(T.VALUE:"Especifique os requerimentos do novo aparelho:"::varchar,T.VALUE:"Especifique os requerimentos do novo aparelho:"::varchar)) esp_requerimentos_novo_aparelho
    ,max(coalesce(T.VALUE:"Qual deverá ser o DDD da linha?"::varchar,T.VALUE:"Qual deverá ser o DDD da linha?"::varchar)) qual_ddd
    ,max(coalesce(T.VALUE:"Endereço para coleta:"::varchar,T.VALUE:"Endereço para coleta:"::varchar)) endereco_coleta
    ,max(coalesce(T.VALUE:"Especifique o problema:"::varchar,T.VALUE:"Especifique o problema:"::varchar)) esp_problema
    ,max(coalesce(T.VALUE:"Data para coleta:"::varchar,T.VALUE:"Data para coleta:"::varchar)) data_coleta
    ,max(coalesce(T.VALUE:"Serviço a ser ativado:"::varchar,T.VALUE:"Serviço a ser ativado:"::varchar)) servico_ativar
    ,max(coalesce(T.VALUE:"Marca/Modelo:"::varchar,T.VALUE:"Marca/Modelo:"::varchar)) marca_modelo
    ,max(coalesce(T.VALUE:"Precisa de backup?"::varchar,T.VALUE:"Precisa de backup?"::varchar)) flg_precisa_backup
    ,max(coalesce(T.VALUE:"Endereço de entrega:"::varchar,T.VALUE:"Endereço de entrega:"::varchar)) endereco_entrega
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
    hidden: yes
  }

  dimension: nome_task {
    type: string
    sql: ${TABLE}."NOME_TASK" ;;
    hidden: yes
  }

  dimension: numero_chamado {
    type: string
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
    hidden: yes
  }

  dimension: campo_auxiliar_analista_solicitante {
    type: date
    sql: ${TABLE}."CAMPO_AUXILIAR_ANALISTA_SOLICITANTE" ;;
    group_item_label: "Campo auxiliar analista solicitante"
    group_label: "Dados Solicitante"
  }

  dimension: nome_solicitante {
    type: date
    sql: ${TABLE}."NOME_SOLICITANTE" ;;
    group_item_label: "Nome do Solicitante"
    group_label: "Dados Solicitante"
  }

  dimension: justificativa {
    type: date
    sql: ${TABLE}."JUSTIFICATIVA" ;;
    group_item_label: "Justificativa"
    group_label: "Informações Chamado"
  }

  dimension: flg_precisa_motoboy_correios {
    type: date
    sql: ${TABLE}."FLG_PRECISA_MOTOBOY_CORREIOS" ;;
    group_item_label: "Precisa solicitar Motoboy/Correios?"
    group_label: "Informações Chamado"
  }

  dimension: centro_custo_solicitante {
    type: date
    sql: ${TABLE}."MCENTRO_CUSTO_SOLICITANTE" ;;
    group_item_label: "Centro de Custo do Solicitante"
    group_label: "Informações Chamado"
  }

  dimension: numero_linha_ddd {
    type: date
    sql: ${TABLE}."NUMERO_LINHA_DDD" ;;
    group_item_label: "Número da linha com DDD"
    group_label: "Dados Solicitante"
  }

  dimension: nome_gestor_responsavel {
    type: date
    sql: ${TABLE}."NOME_GESTOR_RESPONSAVEL" ;;
    group_item_label: "Nome do Gestor Responsável"
    group_label: "Informações Chamado"
  }

  dimension: obs_analise_gestor {
    type: date
    sql: ${TABLE}."OBS_ANALISE_GESTOR" ;;
    group_item_label: "Observações da análise do Gestor"
    group_label: "Informações Chamado"
  }

  dimension: flg_qual_solicitação {
    type: date
    sql: ${TABLE}."FLG_QUAL_SOLICITACAO" ;;
    group_item_label: "Qual a sua solicitação?"
    group_label: "Informações Chamado"
  }

  dimension: conclusao_solicitacao {
    type: date
    sql: ${TABLE}."CONCLUSAO_SOLICITACAO" ;;
    group_item_label: "Conclusão da solicitação"
    group_label: "Informações Chamado"
  }

  dimension: servico_ativado {
    type: date
    sql: ${TABLE}."SERVICO_ATIVADO" ;;
    group_item_label: "Serviço a ser ativado"
    group_label: "Informações Chamado"
  }

  dimension: nome_usuario {
    type: date
    sql: ${TABLE}."NOME_USUARIO" ;;
    group_item_label: "Nome de usuário"
    group_label: "Dados Solicitante"
  }

  dimension: obs_analise_facilities {
    type: date
    sql: ${TABLE}."OBS_ANALISE_FACITILIES" ;;
    group_item_label: "Observações da análise de Facilities"
    group_label: "Informações Chamado"
  }

  set: detail {
    fields: [
      nome_task,
      numero_chamado,
      campo_auxiliar_analista_solicitante,
      nome_solicitante,
      justificativa,
      flg_precisa_motoboy_correios,
      centro_custo_solicitante,
      numero_linha_ddd,
      nome_gestor_responsavel,
      obs_analise_gestor,
      flg_qual_solicitação,
      conclusao_solicitacao,
      servico_ativado,
      nome_usuario,
      obs_analise_facilities
    ]
  }
}
