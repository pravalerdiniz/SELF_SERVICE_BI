view: interacoes {
  sql_table_name: "SELF_SERVICE_BI"."INTERACOES"
    ;;

  dimension: canal {
    type: string
    group_label: "Dados do ticket"
    group_item_label: "Canal"
    description: "Indica o canal do ticket. Ex: Chat, Web, API."
    sql: ${TABLE}."CANAL" ;;
  }

  dimension: chat_agentes {
    type: string
    group_label: "Dados de Chat"
    group_item_label: "Agentes"
    description: "Indica o nome dos agentes responsáveis pelo ticket"
    sql: ${TABLE}."CHAT_AGENTES" ;;
  }

  dimension_group: chat_data_fim {
    type: time
    group_item_label: "Fim do Chat"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CHAT_DATA_FIM" ;;
    description: "Indica a data Fim do Chat"
  }

  dimension_group: chat_data_inicio {
    type: time
    group_item_label: "Inicio do Chat"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CHAT_DATA_INICIO" ;;
    description: "Indica a data de Inicio do Chat"
  }

  dimension: chat_duracao {
    type: number
    group_label: "Dados de Chat"
    group_item_label: "Duração do Chat"
    description: "Indica a duração do chat em segundos. A duração é calculada apenas durante o atendimento do ticket, tempo de espera não é considerado."
    sql: ${TABLE}."CHAT_DURACAO" ;;
  }

  dimension: chat_flg_nao_lido {
    type: yesno
    group_label: "Dados de Chat"
    group_item_label: "Não lido?"
    description: "Indica se o chat não foi lido."
    sql: ${TABLE}."CHAT_FLG_NAO_LIDO" ;;
  }

  dimension: chat_flg_perdido {
    type: yesno
    group_label: "Dados de Chat"
    group_item_label: "Perdido?"
    description: "Indica se o chat foi perdido ou não."
    sql: ${TABLE}."CHAT_FLG_PERDIDO" ;;
  }

  dimension: chat_nome_departamento {
    type: string
    group_label: "Dados de Chat"
    group_item_label: "Nome do Departamento"
    description: "Indica o nome do departamento por ticket."
    sql: ${TABLE}."CHAT_NOME_DEPARTAMENTO" ;;
  }

  dimension: chat_nome_visitante {
    type: string
    group_label: "Dados de Chat"
    group_item_label: "Nome do Visitante"
    description: "Indica o nome do visitante do ticket."
    sql: ${TABLE}."CHAT_NOME_VISITANTE" ;;
  }

  dimension: chat_tempo_max_resposta {
    type: number
    group_label: "Dados de Chat"
    group_item_label: "Máximo - Tempo de Resposta"
    description: "Indica o tempo máximo de resposta do chat."
    sql: ${TABLE}."CHAT_TEMPO_MAX_RESPOSTA" ;;
  }

  dimension: chat_tempo_medio_resposta {
    type: number
    group_label: "Dados de Chat"
    group_item_label: "Médio - Tempo de Resposta"
    description: "Indica o tempo médio de resposta do chat."
    sql: ${TABLE}."CHAT_TEMPO_MEDIO_RESPOSTA" ;;
  }

  dimension: chat_tempo_primeira_resposta {
    type: number
    group_label: "Dados de Chat"
    group_item_label: "Primeira - Tempo de Resposta"
    description: "Indica o tempo da primeira resposta do chat."
    sql: ${TABLE}."CHAT_TEMPO_PRIMEIRA_RESPOSTA" ;;
  }

  dimension: chat_total_mensagens {
    type: string
    group_label: "Dados de Chat"
    group_item_label: "Total de Mensagens"
    description: "Indica a quantidade de mensagens do agente e visitante e o total."
    sql: ${TABLE}."CHAT_TOTAL_MENSAGENS" ;;
  }

  dimension: comentario_pesquisa {
    type: string
    group_label: "Dados de Pesquisa de Satisfação"
    group_item_label: "Comentários"
    description: "Indica os comentários realizados na pesquisa de satisfação por ticket."
    sql: ${TABLE}."COMENTARIO_PESQUISA" ;;
  }

  dimension: contato_feito_por {
    type: string
    group_label: "Dados de Chat"
    group_item_label: "Quem realizou o contato?"
    description: "Indica quem realizou o contato no chat por ticket. Ex: Aluno, Garantidor, Aluno sem cadastro, Outros."
    sql: ${TABLE}."CONTATO_FEITO_POR" ;;
  }

  dimension: cpf_assignee {
    type: string
    group_item_label: "CPF Assigne"
    description: "Indica o CPF do Administrador (Agente)."
    sql: ${TABLE}."CPF_ASSIGNEE" ;;
  }




  dimension: cpf_requester {
    type: string
    group_item_label: "CPF Requester"
    description: "Indica o CPF do Solicitante do Chat."
    sql: ${TABLE}."CPF_REQUESTER" ;;
  }

  dimension: cpf_submitter {
    type: string
    group_label: "Função "
    group_item_label: "CPF Submitter"
    description: "Indica o CPF do Requisitante do chat."
    sql: ${TABLE}."CPF_SUBMITTER" ;;
  }

  dimension_group: data_atualizacao {
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
    group_item_label: "Atualização"
    description: "Indica a data de atualização do ticket."
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension_group: data_atualizacao_pesquisa {
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
    sql: ${TABLE}."DATA_ATUALIZACAO_PESQUISA" ;;
    group_item_label: "Pesquisa - Atualização"
    description: "Indica a data de atualização da pesquisa de satisfação."
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
    group_item_label: "Criação"
    description: "Indica da data de criação do ticket."
  }

  dimension_group: data_envio_pesquisa {
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
    sql: ${TABLE}."DATA_ENVIO_PESQUISA" ;;
    group_item_label: "Pesquisa - Envio"
    description: "Indica da data de envio da pesquisa de satisfação."
  }

  dimension_group: data_finalizacao {
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
    sql: ${TABLE}."DATA_FINALIZACAO" ;;
    group_item_label: "Finalização"
    description: "Indica da data de finalização do ticket."
  }

  dimension: data_monitoria {
    type: string
    group_label: "Dados de Monitoria"
    group_item_label: "Data de Monitoria"
    description: "Indica a data da monitoria realizada."
    sql: ${TABLE}."DATA_MONITORIA" ;;
  }

  dimension: detalhes_ligacao {
    type: string
    group_label: "Dados da Ligação"
    group_item_label: "Detalhes da Ligação"
    description: "Indica lista de detalhes atribuidos a ligação. Ex: Custo, Data, Duração, entre outros."
    sql: ${TABLE}."DETALHES_LIGACAO" ;;
  }

  dimension: fila {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Fila"
    description: "Indica a fila do ticket. Ex: Cobrança, SAC, KROTON."
    sql: ${TABLE}."FILA" ;;
  }

  dimension: flg_pesquisa_disparada {
    type: yesno
    group_label: "Dados da Pesquisa de Satisfação"
    group_item_label: "Pesquisa disparada?"
    description: "Indica se a pesquisa foi disparada ou não."
    sql: ${TABLE}."FLG_PESQUISA_DISPARADA" ;;
  }

  dimension: grupo {
    type: string
    group_label: "Dados da Pesquisa de Satisfação"
    group_item_label: "Pesquisa disparada?"
    description: "Indica se a pesquisa foi disparada ou não."
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: id_canal {
    type: number
    group_label: "Dados do ticket"
    group_item_label: "ID do Canal"
    description: "Indica o identificador do canal do ticket."
    sql: ${TABLE}."ID_CANAL" ;;
  }

  dimension: id_pesquisa {
    type: number
    group_label: "Dados da Pesquisa de Satisfação"
    group_item_label: "ID da Pesquisa"
    description: "Indica o identificador da pesquisa de satifação."
    sql: ${TABLE}."ID_PESQUISA" ;;
  }

  dimension: id_problema {
    type: number
    group_label: "Dados da Pesquisa de Satisfação"
    group_item_label: "ID da Pesquisa"
    description: "Indica o identificador da pesquisa de satifação."
    sql: ${TABLE}."ID_PROBLEMA" ;;
  }

  dimension: id_ticket {
    type: number
    group_label: "Dados do ticket"
    group_item_label: "ID do Ticket"
    description: "Indica o ID do Ticket."
    sql: ${TABLE}."ID_TICKET" ;;
  }

  dimension: justificativa_pesquisa {
    type: string
    group_label: "Dados da Pesquisa de Satisfação"
    group_item_label: "ID da Pesquisa"
    description: "Indica o identificador da pesquisa de satisfação."
    sql: ${TABLE}."JUSTIFICATIVA_PESQUISA" ;;
  }

  dimension: motivo_contato {
    type: string
    sql: ${TABLE}."MOTIVO_CONTATO" ;;
  }

  dimension: tipo_contato {
    type: string

    sql: ${TABLE}."TIPO_CONTATO" ;;
  }

  dimension: nome_assignee {
    type: string
    group_item_label: "Nome Assignee"
    description: "Indica o nome do assignee."
    sql: ${TABLE}."NOME_ASSIGNEE" ;;
  }

  dimension: nome_requester {
    type: string
    group_item_label: "Nome Requester"
    description: "Indica o nome do requester."
    sql: ${TABLE}."NOME_REQUESTER" ;;
  }

  dimension: nome_submitter {
    type: string
    group_item_label: "Nome Submitter"
    description: "Indica o nome do submitter."
    sql: ${TABLE}."NOME_SUBMITTER" ;;
  }

  dimension: prioridade {
    type: string
    group_label: "Dados do ticket"
    group_item_label: "Prioridade"
    description: "Indica a prioridade do ticket. Ex: Normal, High, Low, Urgent."
    sql: ${TABLE}."PRIORIDADE" ;;
  }

  dimension: requester_id {
    type: number
    group_item_label: "ID do Requester"
    sql: ${TABLE}."REQUESTER_ID" ;;
  }

  dimension: score {
    type: string
    group_label: "Dados da Pesquisa de Satisfação"
    group_item_label: "Score"
    description: "Indica o score atribuido para a pesquisa de satisfação."
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: status_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Status"
    description: "Indica o código do status da última proposta do aluno."
    sql: ${TABLE}."STATUS_ALUNO" ;;
  }

  dimension: status_ticket {
    type: string
    group_label: "Dados do ticket"
    group_item_label: "Status"
    description: "Indica o status do ticket.Ex: Closed, Open, Solved, Pending, New, Hold."
    sql: ${TABLE}."STATUS_TICKET" ;;
  }

  dimension: tipo_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Tipo de Aluno"
    description: "Indica o tipo de aluno.Ex: Novo, Renovação, Segundo-Repasse, Intercâmbio"
    sql: ${TABLE}."TIPO_ALUNO" ;;
  }

  dimension: titulo_ticket {
    type: string
    group_label: "Dados do ticket"
    group_item_label: "Título"
    description: "Indica o título do ticket."
    sql: ${TABLE}."TITULO_TICKET" ;;
  }

  dimension: total_abandono {
    type: number
    group_label: "Dados da Ligação"
    group_item_label: "Total de Abandono"
    description: "Indica o total de ligações de abandono."
    sql: ${TABLE}."TOTAL_ABANDONO" ;;
  }
  dimension: email_agente {
    type: string
    group_label: "Dados do Agente"
    group_item_label: "E-mail"
    description: "Indica o e-mail do agente do ticket."
    sql: ${TABLE}."EMAIL_AGENTE" ;;
  }


  dimension: EMPRESA_AGENTE{
    type: string
    group_label: "Dados do Agente"
    group_item_label: "Empresa"
    description: "Indica a empresa do agente do ticket."
    sql: ${TABLE}."EMPRESA_AGENTE" ;;
  }

  dimension: submitter_role{
    type: string
    group_item_label: "Função Submitter"
    sql: ${TABLE}."SUBMITTER_ROLE" ;;
  }


  dimension: assignee_role{
    type: string
    group_item_label: "Função Assignee"
    sql: ${TABLE}."ASSIGNEE_ROLE" ;;
  }


  dimension: requester_role{
    type: string
    group_item_label: "Função Requester"
    sql: ${TABLE}."REQUESTER_ROLE" ;;
  }


  dimension: tipo_ultima_proposta{
    type: string
    group_item_label: "Tipo Proposta"
    group_label: "Dados do Aluno"
    description: "Indica o tipo da última proposta do aluno."
    sql: ${TABLE}."TIPO_ULTIMA_PROPOSTA" ;;
  }

  dimension: descricao_status{
    type: string
    group_item_label: "Descrição do Status"
    group_label: "Dados do Aluno"
    description: "Indica a descrição do status da última proposta do aluno."
    sql: ${TABLE}."DESCRICAO_STATUS" ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
