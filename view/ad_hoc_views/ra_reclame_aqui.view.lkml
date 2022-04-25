# The name of this view in Looker is "Ra Tickets"
view: ra_reclame_aqui {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SELF_SERVICE_BI"."RA_TICKETS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avaliacao" in Explore.

  dimension: avaliacao {
    type: string
    sql: ${TABLE}."AVALIACAO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: avaliacao_data {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."AVALIACAO_DATA" ;;
  }

  dimension: avaliacao_tempo {
    type: string
    sql: ${TABLE}."AVALIACAO_TEMPO" ;;
  }

  dimension: campos_personalizados {
    type: string
    sql: ${TABLE}."CAMPOS_PERSONALIZADOS" ;;
  }

  dimension: cidade_cliente {
    type: string
    sql: ${TABLE}."CIDADE_CLIENTE" ;;
  }

  dimension: cliente_consideracao {
    type: string
    sql: ${TABLE}."CLIENTE_CONSIDERACAO" ;;
  }

  dimension_group: cliente_data_consideracao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CLIENTE_DATA_CONSIDERACAO" ;;
  }

  dimension: cliente_id {
    type: number
    sql: ${TABLE}."CLIENTE_ID" ;;
  }

  dimension: cliente_tags {
    type: string
    sql: ${TABLE}."CLIENTE_TAGS" ;;
  }

  dimension: cnpj_cliente {
    type: string
    sql: ${TABLE}."CNPJ_CLIENTE" ;;
  }

  dimension: conteudo_reclamacao {
    type: string
    sql: ${TABLE}."CONTEUDO_RECLAMACAO" ;;
  }

  dimension: cpf_cliente {
    type: string
    sql: ${TABLE}."CPF_CLIENTE" ;;
  }

  dimension_group: data_criacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_CRIACAO" ;;
  }

  dimension_group: data_ultima_modificacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_ULTIMA_MODIFICACAO" ;;
  }

  dimension_group: data_ultima_replica {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_ULTIMA_REPLICA" ;;
  }

  dimension: email_cliente {
    type: string
    sql: ${TABLE}."EMAIL_CLIENTE" ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}."EMPRESA" ;;
  }

  dimension: empresa_consideracao {
    type: string
    sql: ${TABLE}."EMPRESA_CONSIDERACAO" ;;
  }

  dimension_group: empresa_data_consideracao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EMPRESA_DATA_CONSIDERACAO" ;;
  }

  dimension_group: empresa_data_resposta {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EMPRESA_DATA_RESPOSTA" ;;
  }

  dimension: empresa_resposta {
    type: string
    sql: ${TABLE}."EMPRESA_RESPOSTA" ;;
  }

  dimension: estado_cliente {
    type: string
    sql: ${TABLE}."ESTADO_CLIENTE" ;;
  }

  dimension: estado_sigla_cliente {
    type: string
    sql: ${TABLE}."ESTADO_SIGLA_CLIENTE" ;;
  }

  dimension: flg_arquivada {
    type: yesno
    sql: ${TABLE}."FLG_ARQUIVADA" ;;
  }

  dimension: flg_avaliacao_sem_resposta {
    type: yesno
    sql: ${TABLE}."FLG_AVALIACAO_SEM_RESPOSTA" ;;
  }

  dimension: flg_comentario {
    type: yesno
    sql: ${TABLE}."FLG_COMENTARIO" ;;
  }

  dimension: flg_congelado {
    type: yesno
    sql: ${TABLE}."FLG_CONGELADO" ;;
  }

  dimension: flg_pedir_avaliacao {
    type: yesno
    sql: ${TABLE}."FLG_PEDIR_AVALIACAO" ;;
  }

  dimension: flg_pedir_moderacao {
    type: yesno
    sql: ${TABLE}."FLG_PEDIR_MODERACAO" ;;
  }

  dimension: flg_pode_curtir {
    type: yesno
    sql: ${TABLE}."FLG_PODE_CURTIR" ;;
  }

  dimension: flg_problema_resolvido {
    type: yesno
    sql: ${TABLE}."FLG_PROBLEMA_RESOLVIDO" ;;
  }

  dimension: flg_ra_blackfriday {
    type: yesno
    sql: ${TABLE}."FLG_RA_BLACKFRIDAY" ;;
  }

  dimension: flg_ra_processo_interno {
    type: yesno
    sql: ${TABLE}."FLG_RA_PROCESSO_INTERNO" ;;
  }

  dimension: flg_volta_fazer_negocio {
    type: yesno
    sql: ${TABLE}."FLG_VOLTA_FAZER_NEGOCIO" ;;
  }

  dimension: genero_cliente {
    type: string
    sql: ${TABLE}."GENERO_CLIENTE" ;;
  }

  dimension: hugme_status {
    type: string
    sql: ${TABLE}."HUGME_STATUS" ;;
  }

  dimension_group: moderacao_data_pedido {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."MODERACAO_DATA_PEDIDO" ;;
  }

  dimension_group: moderacao_data_resposta {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."MODERACAO_DATA_RESPOSTA" ;;
  }

  dimension: moderacao_motivo {
    type: string
    sql: ${TABLE}."MODERACAO_MOTIVO" ;;
  }

  dimension: moderacao_solicitante {
    type: string
    sql: ${TABLE}."MODERACAO_SOLICITANTE" ;;
  }

  dimension: moderacao_status {
    type: string
    sql: ${TABLE}."MODERACAO_STATUS" ;;
  }

  dimension_group: nascimento_cliente {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."NASCIMENTO_CLIENTE" ;;
  }

  dimension: nome_cliente {
    type: string
    sql: ${TABLE}."NOME_CLIENTE" ;;
  }

  dimension: origem {
    type: string
    sql: ${TABLE}."ORIGEM" ;;
  }

  dimension: origem_externa {
    type: string
    sql: ${TABLE}."ORIGEM_EXTERNA" ;;
  }

  dimension: origem_informacao {
    type: string
    sql: ${TABLE}."ORIGEM_INFORMACAO" ;;
  }

  dimension: qtd_atribuicoes {
    type: number
    sql: ${TABLE}."QTD_ATRIBUICOES" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_qtd_atribuicoes {
    type: sum
    sql: ${qtd_atribuicoes} ;;
  }

  measure: average_qtd_atribuicoes {
    type: average
    sql: ${qtd_atribuicoes} ;;
  }

  dimension: qtd_comentarios {
    type: number
    sql: ${TABLE}."QTD_COMENTARIOS" ;;
  }

  dimension: qtd_interacoes {
    type: number
    sql: ${TABLE}."QTD_INTERACOES" ;;
  }

  dimension: qtd_interacoes_cliente {
    type: number
    sql: ${TABLE}."QTD_INTERACOES_CLIENTE" ;;
  }

  dimension: qtd_interacoes_empresa {
    type: number
    sql: ${TABLE}."QTD_INTERACOES_EMPRESA" ;;
  }

  dimension: qtd_interacoes_nao_lidas {
    type: number
    sql: ${TABLE}."QTD_INTERACOES_NAO_LIDAS" ;;
  }

  dimension: qtd_mensagens {
    type: number
    sql: ${TABLE}."QTD_MENSAGENS" ;;
  }

  dimension: qtd_ra_replicas {
    type: number
    sql: ${TABLE}."QTD_RA_REPLICAS" ;;
  }

  dimension: qtd_tickets_moderacao {
    type: number
    sql: ${TABLE}."QTD_TICKETS_MODERACAO" ;;
  }

  dimension: qtd_tickets_pendentes_cliente {
    type: number
    sql: ${TABLE}."QTD_TICKETS_PENDENTES_CLIENTE" ;;
  }

  dimension_group: ra_data_desativacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."RA_DATA_DESATIVACAO" ;;
  }

  dimension: ra_motivo_desativacao {
    type: string
    sql: ${TABLE}."RA_MOTIVO_DESATIVACAO" ;;
  }

  dimension: ra_origem {
    type: string
    sql: ${TABLE}."RA_ORIGEM" ;;
  }

  dimension: ra_razao {
    type: string
    sql: ${TABLE}."RA_RAZAO" ;;
  }

  dimension: ra_sentimento {
    type: string
    sql: ${TABLE}."RA_SENTIMENTO" ;;
  }

  dimension: ra_status {
    type: string
    sql: ${TABLE}."RA_STATUS" ;;
  }

  dimension_group: rafone_data_expiracao {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."RAFONE_DATA_EXPIRACAO" ;;
  }

  dimension: rafone_status {
    type: string
    sql: ${TABLE}."RAFONE_STATUS" ;;
  }

  dimension: rg_cliente {
    type: string
    sql: ${TABLE}."RG_CLIENTE" ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}."TAGS" ;;
  }

  dimension: tempo_atendimento_publico {
    type: string
    sql: ${TABLE}."TEMPO_ATENDIMENTO_PUBLICO" ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}."TICKET_ID" ;;
  }

  dimension: ticket_id_interno {
    type: string
    sql: ${TABLE}."TICKET_ID_INTERNO" ;;
  }

  dimension: tipo_cliente {
    type: string
    sql: ${TABLE}."TIPO_CLIENTE" ;;
  }

  dimension: titulo_reclamacao {
    type: string
    sql: ${TABLE}."TITULO_RECLAMACAO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
