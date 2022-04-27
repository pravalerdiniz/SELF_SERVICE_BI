# The name of this view in Looker is "Ra Tickets"
view: reclame_aqui {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SELF_SERVICE_BI"."RA_TICKETS"
    ;;



## DADOS DA AVALIAÇÃO ##



  dimension: avaliacao {
    type: string
    group_label: "Dados da Avaliação"
    group_item_label: "Nota Avaliação"
    description: "Nota da Avaliação em Texto"
    sql: ${TABLE}."AVALIACAO" ;;
  }

  measure: avaliacao_num {
    type: sum
    group_label: "Dados da Avaliação"
    group_item_label: "Nota Avaliação"
    description: "Nota da Avaliação Valor Numérico"
    sql: ${TABLE}."AVALIACAO" ;;
  }

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
    group_label: "Dados da Avaliação"
    label: "Avaliação"
    sql: ${TABLE}."AVALIACAO_DATA" ;;
  }

  dimension: avaliacao_tempo {
    type: string
    group_label: "Dados da Avaliação"
    group_item_label: "Tempo Avaliação"
    description: "Tempo da avaliação em minutos"
    sql: ${TABLE}."AVALIACAO_TEMPO" ;;
  }

  dimension: flg_avaliacao_sem_resposta {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Avaliação Sem Resposta?"
    description: "Flag Avaliação Sem Resposta? (Yes/No)"
    sql: ${TABLE}."FLG_AVALIACAO_SEM_RESPOSTA" ;;
  }

  dimension: flg_comentario {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Flag Comentário?"
    description: "Flag Comentário? (Yes/No)"
    sql: ${TABLE}."FLG_COMENTARIO" ;;
  }

  dimension: flg_congelado {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Flag Congelado?"
    description: "Flag Congelado? (Yes/No)"
    sql: ${TABLE}."FLG_CONGELADO" ;;
  }

  dimension: flg_pedir_avaliacao {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Flag Pedir Avaliação?"
    description: "Flag Pedir Avaliação? (Yes/No)"
    sql: ${TABLE}."FLG_PEDIR_AVALIACAO" ;;
  }

  dimension: flg_pedir_moderacao {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Flag Pedir Moderação?"
    description: "Flag Pedir Moderação? (Yes/No)"
    sql: ${TABLE}."FLG_PEDIR_MODERACAO" ;;
  }

  dimension: flg_pode_curtir {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Flag Pode Curtir?"
    description: "Flag Pode Curtir? (Yes/No)"
    sql: ${TABLE}."FLG_PODE_CURTIR" ;;
  }

  dimension: flg_problema_resolvido {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Seu Problema Resolvido?"
    description: "Flag Problema Resolvido? (Yes/No)"
    sql: ${TABLE}."FLG_PROBLEMA_RESOLVIDO" ;;
  }

  dimension: flg_ra_blackfriday {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Flag Blackfriday?"
    description: "Flag Blackfriday? (Yes/No)"
    sql: ${TABLE}."FLG_RA_BLACKFRIDAY" ;;
  }

  dimension: flg_ra_processo_interno {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Flag Processo Interno?"
    description: "Flag Processo Interno? (Yes/No)"
    sql: ${TABLE}."FLG_RA_PROCESSO_INTERNO" ;;
  }

  dimension: flg_volta_fazer_negocio {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Voltaria a Fazer Negócio?"
    description: "Flag Volta Fazer Negócio? (Yes/No)"
    sql: ${TABLE}."FLG_VOLTA_FAZER_NEGOCIO" ;;
  }

  dimension: cliente_consideracao {
    type: string
    group_label: "Dados da Avaliação"
    group_item_label: "Consideração do Cliente"
    description: "Consideração do Cliente"
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
    group_label: "Dados da Avaliação"
    label: "Consideração do Cliente"
    sql: ${TABLE}."CLIENTE_DATA_CONSIDERACAO" ;;
  }

  dimension: empresa_consideracao {
    type: string
    group_label: "Dados da Avaliação"
    group_item_label: "Consideração da Empresa"
    description: "Consideração da Empresa"
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
    group_label: "Dados da Avaliação"
    label: "Consideração da Empresa"
    sql: ${TABLE}."EMPRESA_DATA_CONSIDERACAO" ;;
  }


## DADOS DO CLIENTE ##



  dimension: cidade_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "Cidade"
    description: "Cidade do Cliente"
    sql: ${TABLE}."CIDADE_CLIENTE" ;;
  }

  dimension: cliente_id {
    type: number
    group_label: "Dados do Cliente"
    group_item_label: "ID do Cliente"
    description: "ID do Cliente"
    sql: ${TABLE}."CLIENTE_ID" ;;
  }

  dimension: nome_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "Nome do Cliente"
    description: "Nome do Cliente"
    sql: ${TABLE}."NOME_CLIENTE" ;;
  }

  dimension: cliente_tags {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "Tags"
    description: "Tags do Cliente"
    sql: ${TABLE}."CLIENTE_TAGS" ;;
  }

  dimension: cnpj_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "CNPJ do Cliente"
    description: "CNPJ do Cliente"
    sql: ${TABLE}."CNPJ_CLIENTE" ;;
  }

  dimension: cpf_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "CPF do Cliente"
    description: "CPF do Cliente"
    sql: ${TABLE}."CPF_CLIENTE" ;;
  }

  dimension: rg_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "RG do Cliente"
    description: "RG do Cliente"
    sql: ${TABLE}."RG_CLIENTE" ;;
  }

  dimension: email_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "E-mail do Cliente"
    description: "E-mail do Cliente"
    sql: ${TABLE}."EMAIL_CLIENTE" ;;
  }

  dimension: estado_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "Estado"
    description: "Estado do Cliente"
    sql: ${TABLE}."ESTADO_CLIENTE" ;;
  }

  dimension: estado_sigla_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "UF"
    description: "UF do Cliente (Sigla do Estado)"
    sql: ${TABLE}."ESTADO_SIGLA_CLIENTE" ;;
  }

  dimension: genero_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "Gênero do Cliente"
    description: "Gênero do Cliente"
    sql: ${TABLE}."GENERO_CLIENTE" ;;
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
    group_label: "Dados do Cliente"
    label: "Nascimento Cliente"
    convert_tz: no
    datatype: date
    sql: ${TABLE}."NASCIMENTO_CLIENTE" ;;
  }

  dimension: tipo_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "Tipo do Cliente"
    description: "Tipo do Cliente"
    sql: ${TABLE}."TIPO_CLIENTE" ;;
  }



  ## DADOS DA RECLAMAÇÃO ##



  dimension: conteudo_reclamacao {
    type: string
    group_label: "Dados da Reclamação"
    group_item_label: "Conteúdo da Reclamação"
    description: "Conteúdo da Reclamação"
    sql: ${TABLE}."CONTEUDO_RECLAMACAO" ;;
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
    group_label: "Dados da Reclamação"
    label: "Criação da Reclamação"
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
    group_label: "Dados da Reclamação"
    label: "Última Modificação da Reclamação "
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
    group_label: "Dados da Reclamação"
    label: "Última Replica da Reclamação"
    sql: ${TABLE}."DATA_ULTIMA_REPLICA" ;;
  }

  dimension: flg_arquivada {
    type: yesno
    group_label: "Dados da Reclamação"
    group_item_label: "Flag Reclamação Arquivada?"
    description: "Flag Reclamação Arquivada? (Yes/No)"
    sql: ${TABLE}."FLG_ARQUIVADA" ;;
  }

  dimension: titulo_reclamacao {
    type: string
    group_label: "Dados da Reclamação"
    group_item_label: "Título da Reclamação"
    description: "Título da Reclamação"
    sql: ${TABLE}."TITULO_RECLAMACAO" ;;
  }

  dimension: tempo_atendimento_publico {
    type: string
    group_label: "Dados da Reclamação"
    group_item_label: "Tempo primeira resposta (público)"
    description: "Tempo primeira resposta (público)"
    sql: ${TABLE}."TEMPO_ATENDIMENTO_PUBLICO" ;;
  }

  dimension: ticket_id {
    type: number
    group_label: "Dados da Reclamação"
    group_item_label: "ID Hugme"
    description: "ID de Reclamação"
    sql: ${TABLE}."TICKET_ID" ;;
  }

  dimension: hugme_status {
    type: string
    group_label: "Dados da Reclamação"
    group_item_label: "Status Hugme"
    description: "Hugme Status"
    sql: ${TABLE}."HUGME_STATUS" ;;
  }

  dimension: ra_status {
    type: string
    group_label: "Dados da Reclamação"
    group_item_label: "Status da Reclamação"
    description: "Status da Reclamação"
    sql: ${TABLE}."RA_STATUS" ;;
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
    group_label: "Dados da Reclamação"
    label: "Resposta da Empresa"
    sql: ${TABLE}."EMPRESA_DATA_RESPOSTA" ;;
  }

  dimension: qtd_ra_replicas {
    type: number
    group_label: "Dados da Reclamação"
    group_item_label: "Quantidade de Replicas"
    description: "Quantidade de Replicas da Reclamação"
    sql: ${TABLE}."QTD_RA_REPLICAS" ;;
  }

  dimension: ra_origem {
    type: string
    group_label: "Dados da Reclamação"
    group_item_label: "Origem da Reclamação"
    description: "Origem da Reclamação"
    sql: ${TABLE}."RA_ORIGEM" ;;
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
    group_label: "Dados da Reclamação"
    label: "Desativação"
    sql: ${TABLE}."RA_DATA_DESATIVACAO" ;;
  }

  dimension: ra_motivo_desativacao {
    type: string
    group_label: "Dados da Reclamação"
    group_item_label: "Motivo Desativação"
    description: "Motivo Desativação"
    sql: ${TABLE}."RA_MOTIVO_DESATIVACAO" ;;
  }

  dimension: qtd_interacoes_cliente {
    type: number
    group_label: "Dados da Reclamação"
    group_item_label: "Quantidade Interações Cliente"
    description: "Quantidade Interações Cliente"
    sql: ${TABLE}."QTD_INTERACOES_CLIENTE" ;;
  }

  dimension: qtd_interacoes_empresa {
    type: number
    group_label: "Dados da Reclamação"
    group_item_label: "Quantidade Interações Empresa"
    description: "Quantidade Interações Empresa"
    sql: ${TABLE}."QTD_INTERACOES_EMPRESA" ;;
  }



  ## DADOS DA EMPRESA ##



  dimension: empresa {
    type: string
    group_label: "Dados da Empresa"
    group_item_label: "Nome da Empresa"
    description: "Nome da Empresa"
    sql: ${TABLE}."EMPRESA" ;;
  }



## DADOS DA MODERAÇÃO ##



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
    group_label: "Dados da Moderação"
    label: "Pedido de Moderação"
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
    group_label: "Dados da Moderação"
    label: "Resposta da Moderação"
    sql: ${TABLE}."MODERACAO_DATA_RESPOSTA" ;;
  }

  dimension: moderacao_motivo {
    type: string
    group_label: "Dados da Moderação"
    group_item_label: "Motivo da Moderação"
    description: "Motivo da Moderação"
    sql: ${TABLE}."MODERACAO_MOTIVO" ;;
  }

  dimension: moderacao_solicitante {
    type: string
    group_label: "Dados da Moderação"
    group_item_label: "Solicitante da Moderação"
    description: "Solicitante da Moderação"
    sql: ${TABLE}."MODERACAO_SOLICITANTE" ;;
  }

  dimension: moderacao_status {
    type: string
    group_label: "Dados da Moderação"
    group_item_label: "Status da Moderação"
    description: "Status da Moderação"
    sql: ${TABLE}."MODERACAO_STATUS" ;;
  }



## OUTROS DADOS ##



  dimension: origem {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."ORIGEM" ;;
  }

  dimension: origem_externa {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."ORIGEM_EXTERNA" ;;
  }

  dimension: origem_informacao {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."ORIGEM_INFORMACAO" ;;
  }

  dimension: qtd_atribuicoes {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."QTD_ATRIBUICOES" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_qtd_atribuicoes {
    type: sum
    group_label: "Outros Dados"
    sql: ${qtd_atribuicoes} ;;
  }

  measure: average_qtd_atribuicoes {
    type: average
    group_label: "Outros Dados"
    sql: ${qtd_atribuicoes} ;;
  }

  dimension: qtd_comentarios {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."QTD_COMENTARIOS" ;;
  }

  dimension: qtd_interacoes {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."QTD_INTERACOES" ;;
  }

  dimension: qtd_interacoes_nao_lidas {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."QTD_INTERACOES_NAO_LIDAS" ;;
  }

  dimension: qtd_mensagens {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."QTD_MENSAGENS" ;;
  }

  dimension: qtd_tickets_moderacao {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."QTD_TICKETS_MODERACAO" ;;
  }

  dimension: qtd_tickets_pendentes_cliente {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."QTD_TICKETS_PENDENTES_CLIENTE" ;;
  }

  dimension: ra_razao {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."RA_RAZAO" ;;
  }

  dimension: ra_sentimento {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."RA_SENTIMENTO" ;;
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
    group_label: "Outros Dados"
    label: "Expiração"
    convert_tz: no
    datatype: date
    sql: ${TABLE}."RAFONE_DATA_EXPIRACAO" ;;
  }

  dimension: rafone_status {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."RAFONE_STATUS" ;;
  }

  dimension: tags {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."TAGS" ;;
  }

  dimension: ticket_id_interno {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."TICKET_ID_INTERNO" ;;
  }

  measure: count {
    type: count
    label: "Quantidade de Registros"
    drill_fields: []
  }
}
