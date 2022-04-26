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
    group_label: "Dados da Avaliação"
    group_item_label: "Data Avaliação"
    description: "Data da Avaliação"
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
    group_label: "Dados da Avaliação"
    group_item_label: "Tempo Avaliação (em segundos)"
    description: "Tempo da avaliação em segundos"
    sql: ${TABLE}."AVALIACAO_TEMPO" ;;
  }



## DADOS DO CLIENTE ##



  dimension: cidade_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "Cidade"
    description: "Cidade do Cliente"
    sql: ${TABLE}."CIDADE_CLIENTE" ;;
  }

  dimension: cliente_consideracao {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "Consideração do Cliente"
    description: "Consideração do Cliente"
    sql: ${TABLE}."CLIENTE_CONSIDERACAO" ;;
  }

  dimension_group: cliente_data_consideracao {
    type: time
    group_label: "Dados do Cliente"
    group_item_label: "Data da Consideração"
    description: "Data da Consideração do Cliente"
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
    group_item_label: "Tags do Cliente"
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
    group_item_label: "Estado do Cliente"
    description: "Estado do Cliente"
    sql: ${TABLE}."ESTADO_CLIENTE" ;;
  }

  dimension: estado_sigla_cliente {
    type: string
    group_label: "Dados do Cliente"
    group_item_label: "UF do Cliente"
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
    group_label: "Dados do Cliente"
    group_item_label: "Data de Nascimento"
    description: "Data de Nascimento do Cliente"
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
    group_label: "Dados da Reclamação"
    group_item_label: "Data de Criação da Reclamação"
    description: "Data de Criação da Reclamação"
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
    group_label: "Dados da Reclamação"
    group_item_label: "Data da Última Modificação da Reclamação"
    description: "Data da Última Modificação da Reclamação"
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
    group_label: "Dados da Reclamação"
    group_item_label: "Data da Última Replica da Reclamação"
    description: "Data da Última Replica da Reclamação"
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



  ## DADOS DA EMPRESA ##



  dimension: empresa {
    type: string
    group_label: "Dados da Empresa"
    group_item_label: "Nome da Empresa"
    description: "Nome da Empresa"
    sql: ${TABLE}."EMPRESA" ;;
  }

  dimension: empresa_consideracao {
    type: string
    group_label: "Dados da Empresa"
    group_item_label: "Consideração da Empresa"
    description: "Consideração da Empresa"
    sql: ${TABLE}."EMPRESA_CONSIDERACAO" ;;
  }

  dimension_group: empresa_data_consideracao {
    type: time
    group_label: "Dados da Empresa"
    group_item_label: "Data da Consideração"
    description: "Data da Consideração da Empresa"
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
    group_label: "Dados da Empresa"
    group_item_label: "Data da Resposta"
    description: "Data da Resposta da Empresa"
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
    group_label: "Dados da Empresa"
    group_item_label: "Resposta da Empresa"
    description: "Resposta da Empresa"
    sql: ${TABLE}."EMPRESA_RESPOSTA" ;;
  }



## DADOS DA AVALIAÇÃO ##



  dimension: flg_avaliacao_sem_resposta {
    type: yesno
    group_label: "Dados da Avaliação"
    group_item_label: "Flag Avaliação Sem Resposta?"
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
    group_item_label: "Flag Problema Resolvido?"
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
    group_item_label: "Flag Volta Fazer Negócio?"
    description: "Flag Volta Fazer Negócio? (Yes/No)"
    sql: ${TABLE}."FLG_VOLTA_FAZER_NEGOCIO" ;;
  }

    dimension: hugme_status {
    type: string
      group_label: "Dados da Avaliação"
      group_item_label: "Hugme Status"
      description: "Hugme Status"
    sql: ${TABLE}."HUGME_STATUS" ;;
  }



## DADOS DA MODERAÇÃO ##



  dimension_group: moderacao_data_pedido {
    type: time
    group_label: "Dados da Moderação"
    group_item_label: "Data Pedido de Moderação"
    description: "Data Pedido de Moderação? (Yes/No)"
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
    group_label: "Dados da Moderação"
    group_item_label: "Data Resposta da Moderação"
    description: "Data Resposta da Moderação"
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

  dimension: qtd_interacoes_cliente {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."QTD_INTERACOES_CLIENTE" ;;
  }

  dimension: qtd_interacoes_empresa {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."QTD_INTERACOES_EMPRESA" ;;
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

  dimension: qtd_ra_replicas {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."QTD_RA_REPLICAS" ;;
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

  dimension_group: ra_data_desativacao {
    type: time
    group_label: "Outros Dados"
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
    group_label: "Outros Dados"
    sql: ${TABLE}."RA_MOTIVO_DESATIVACAO" ;;
  }

  dimension: ra_origem {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."RA_ORIGEM" ;;
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

  dimension: ra_status {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."RA_STATUS" ;;
  }

  dimension_group: rafone_data_expiracao {
    type: time
    group_label: "Outros Dados"
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
    group_label: "Outros Dados"
    sql: ${TABLE}."RAFONE_STATUS" ;;
  }

  dimension: tags {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."TAGS" ;;
  }

  dimension: tempo_atendimento_publico {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."TEMPO_ATENDIMENTO_PUBLICO" ;;
  }

  dimension: ticket_id {
    type: number
    group_label: "Outros Dados"
    sql: ${TABLE}."TICKET_ID" ;;
  }

  dimension: ticket_id_interno {
    type: string
    group_label: "Outros Dados"
    sql: ${TABLE}."TICKET_ID_INTERNO" ;;
  }



  measure: count {
    type: count
    drill_fields: []
  }
}
