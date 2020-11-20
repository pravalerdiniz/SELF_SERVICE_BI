view: interacoes {
  sql_table_name: "SELF_SERVICE_BI"."INTERACOES"
    ;;

  dimension: canal {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Canal"
    description: "Indica o canal do ticket. Ex: Chat, Web, API."
    sql: ${TABLE}."CANAL" ;;
  }

  dimension: originador {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Originador"
    description: "Indica o originador da proposta do aluno."
    sql: ${TABLE}."ORIGINADOR" ;;
  }

  dimension: tags {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tags"
    description: "Indica a tag utilizada no ticket"
    sql: ${TABLE}."TAGS" ;;
  }

  dimension: chat_agentes {
    type: string
    group_label: "Dados de Chat"
    group_item_label: "Atendentes"
    hidden: yes
    description: "Indica o nome dos atendentes responsáveis pelo ticket"
    sql: ${TABLE}."CHAT_AGENTES" ;;
  }

  dimension_group: chat_data_fim {
    type: time
    label: "Chat - Finalização"
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
    label: "Chat - Inicio"
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
    hidden: yes
    description: "Indica a duração do chat em segundos. A duração é calculada apenas durante o atendimento do ticket, tempo de espera não é considerado."
    sql: ${TABLE}."CHAT_DURACAO" ;;
  }

  dimension: chat_flg_nao_lido {
    type: yesno
    group_label: "Dados de Chat"
    group_item_label: "Chat Não lido?"
    description: "Indica se o chat não foi lido."
    sql: ${TABLE}."CHAT_FLG_NAO_LIDO" ;;
  }

  dimension: chat_flg_perdido {
    type: yesno
    group_label: "Dados de Chat"
    group_item_label: "Chat Perdido?"
    description: "Indica se o chat foi perdido."
    sql: ${TABLE}."CHAT_FLG_PERDIDO" ;;
  }

  dimension: chat_nome_departamento {
    type: string
    group_label: "Dados de Chat"
    group_item_label: "Nome do Grupo"
    description: "Indica o nome do grupo do atendente por ticket."
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
    hidden: yes
    sql: ${TABLE}."CHAT_TEMPO_MAX_RESPOSTA" ;;
  }

  dimension: chat_tempo_medio_resposta {
    type: number
    group_label: "Dados de Chat"
    group_item_label: "Médio - Tempo de Resposta"
    description: "Indica o tempo médio de resposta do chat."
    hidden: yes
    sql: ${TABLE}."CHAT_TEMPO_MEDIO_RESPOSTA" ;;
  }

  dimension: chat_tempo_primeira_resposta {
    type: number
    group_label: "Dados de Chat"
    group_item_label: "Primeira - Tempo de Resposta"
    description: "Indica o tempo de primeira resposta do chat."
    hidden: yes
    sql: ${TABLE}."CHAT_TEMPO_PRIMEIRA_RESPOSTA" ;;
  }

  dimension: chat_total_mensagens {
    type: string
    group_label: "Dados de Chat"
    group_item_label: "Total de Mensagens"
    hidden: yes
    description: "Indica a quantidede de mensagens do agente e visitante e o total."
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
    description: "Indica quem realizou o contato no chat por ticket. Ex: Aluno, Garantidor, Aluno sem cadestro, Outros."
    sql: ${TABLE}."CONTATO_FEITO_POR" ;;
  }

  dimension: cpf_assignee {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "CPF"
    description: "Indica o CPF do Atendente responsável pelo ticket."
    sql: ${TABLE}."CPF_ASSIGNEE" ;;
  }




  dimension: cpf_requester {
    type: string
    group_label: "Dados do Solicitante"
    group_item_label: "CPF"
    description: "Indica o CPF do Solicitante do ticket."
    sql: ${TABLE}."CPF_REQUESTER" ;;
  }

  dimension: cpf_submitter {
    type: string
    group_item_label: "CPF"
    group_label: "Dados do Transmissor"
    description: "Indica o CPF do transmissor do ticket."
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
    label: "Ticket - Atualização"
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
    label: "Pesquisa - Atualização"
    description: "Indica a data de atualização de pesquisa de satisfação."
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
      hour_of_day,
      year
    ]
    sql: ${TABLE}."DATA_CRIACAO" ;;
    label: "Ticket - Criação"
    description: "Indica de data de criação do ticket."
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
    label: "Pesquisa - Envio"
    description: "Indica a data de envio da pesquisa de satisfação."
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
    label: "Ticket - Finalização"
    description: "Indica a data de finalização do ticket."
  }

  dimension: data_monitoria {
    type: string
    group_label: "Dados de Monitoria"
    group_item_label: "Data de Registro"
    description: "Indica a data de registro da monitoria realizada."
    sql: ${TABLE}."DATA_MONITORIA" ;;
  }

  dimension: detalhes_ligacao {
    type: string
    group_label: "Dados de Ligação"
    group_item_label: "Detalhes de Ligação"
    hidden: yes
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
    group_label: "Dados de Pesquisa de Satisfação"
    group_item_label: "Pesquisa disparada?"
    description: "Indica se a pesquisa foi disparada ou não."
    sql: ${TABLE}."FLG_PESQUISA_DISPARADA" ;;
  }

  dimension: grupo {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "Grupo"
    description: "Indica qual é o grupo do Atendente. Ex: SAC, Cobrança,SAC Atento, SAC Action Line. "
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: id_canal {
    type: number
    group_label: "Dados do Ticket"
    group_item_label: "ID do Canal"
    hidden: yes
    description: "Indica o identificador do canal do ticket."
    sql: ${TABLE}."ID_CANAL" ;;
  }

  dimension: id_pesquisa {
    type: number
    group_label: "Dados de Pesquisa de Satisfação"
    group_item_label: "ID da Pesquisa"
    description: "Indica o identificador de pesquisa de satifação."
    sql: ${TABLE}."ID_PESQUISA" ;;
  }

  dimension: id_problema {
    type: number
    group_label: "Dados do Ticket"
    group_item_label: "ID do Problema"
    description: "Indica o identificador do problema do ticket."
    sql: ${TABLE}."ID_PROBLEMA" ;;
  }

  dimension: id_ticket {
    type: number
    group_label: "Dados do Ticket"
    group_item_label: "ID do Ticket"
    description: "Indica o ID do Ticket."
    sql: ${TABLE}."ID_TICKET" ;;
  }

  dimension: justificativa_pesquisa {
    type: string
    group_label: "Dados de Pesquisa de Satisfação"
    group_item_label: "Justificativa da Pesquisa"
    description: "Indica a justificativa de pesquisa de satisfação."
    sql: ${TABLE}."JUSTIFICATIVA_PESQUISA" ;;
  }

  dimension: motivo_contato {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Motivo de Contato"
    description: "Indica o motivo de contato realizado no ticket."
    sql: ${TABLE}."MOTIVO_CONTATO" ;;
  }

  dimension: tipo_contato {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tipo de Contato"
    description: "Indica o tipo de contato realizado no ticket.Ex: Ativo, Receptivo, Não qualificado."
    sql: ${TABLE}."TIPO_CONTATO" ;;
  }

  dimension: nome_assignee {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "Nome"
    description: "Indica o nome do atendente."
    sql: ${TABLE}."NOME_ASSIGNEE" ;;
  }

  dimension: nome_requester {
    type: string
    group_label: "Dados do Solicitante"
    group_item_label: "Nome"
    description: "Indica o nome do solicitante do ticket. Este campo pode ser atribuido com o nome do aluno, garantidor, agente."
    sql: ${TABLE}."NOME_REQUESTER" ;;
  }

  dimension: nome_submitter {
    type: string
    group_label: "Dados do Transmissor"
    group_item_label: "Nome"
    description: "Indica o nome do transmissor."
    sql: ${TABLE}."NOME_SUBMITTER" ;;
  }

  dimension: prioridade {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Prioridade"
    description: "Indica a prioridade do ticket. Ex: Normal, High, Low, Urgent."
    sql: ${TABLE}."PRIORIDADE" ;;
  }

  dimension: requester_id {
    type: number
    group_item_label: "ID do Solicitante"
    group_label: "Dados do Solicitante"
    hidden: yes
    description: "Indica o identificador do solicitante do ticket."
    sql: ${TABLE}."REQUESTER_ID" ;;
  }

  dimension: score {
    type: string
    group_label: "Dados de Pesquisa de Satisfação"
    group_item_label: "Score"
    description: "Indica o score atribuido para a pesquisa de satisfação."
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: status_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Status - Atual"
    description: "Indica o código do status de última proposta do aluno."
    sql: ${TABLE}."STATUS_ALUNO" ;;
  }

  dimension: status_ticket {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Status"
    description: "Indica o status do ticket.Ex: Closed, Open, Solved, Pending, New, Hold."
    sql: ${TABLE}."STATUS_TICKET" ;;
  }

  dimension: tipo_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Tipo de Aluno"
    description: "Indica o tipo da última proposta cedida do Aluno.Ex: Novo, Renovação, Segundo-Repasse, Intercâmbio"
    sql: ${TABLE}."TIPO_ALUNO" ;;
  }

  dimension: titulo_ticket {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Título"
    description: "Indica o título do ticket."
    sql: ${TABLE}."TITULO_TICKET" ;;
  }

  dimension: total_abandono {
    type: number
    group_label: "Dados de Ligação"
    group_item_label: "Total de Abandono"
    hidden: yes
    description: "Indica o total de ligações de abandono."
    sql: ${TABLE}."TOTAL_ABANDONO" ;;
  }
  dimension: email_agente {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "E-mail"
    description: "Indica o e-mail do atendente do ticket."
    sql: ${TABLE}."EMAIL_AGENTE" ;;
  }


  dimension: EMPRESA_AGENTE{
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "Empresa"
    description: "Indica a empresa do atendente do ticket."
    sql: ${TABLE}."EMPRESA_AGENTE" ;;
  }

  dimension: submitter_role{
    type: string
    group_label: "Dados do Transmissor"
    group_item_label: "Função"
    description: "Indica a função do transmissor do ticket. Ex: AGENT, END_USER, ADMIN"
    sql: ${TABLE}."SUBMITTER_ROLE" ;;
  }


  dimension: assignee_role{
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "Função"
    description: "Indica a função do atendente no ticket. Ex: AGENT, ADMIN"
    sql: ${TABLE}."ASSIGNEE_ROLE" ;;
  }


  dimension: requester_role{
    type: string
    group_label: "Dados do Solicitante"
    group_item_label: "Função"
    description: "Indica a função do solicitante no ticket. Ex: AGENT, END_USER, ADMIN"
    sql: ${TABLE}."REQUESTER_ROLE" ;;
  }


  dimension: tipo_ultima_proposta{
    type: string
    group_item_label: "Tipo Proposta - Atual"
    group_label: "Dados do Aluno"
    description: "Indica o tipo da proposta atual do aluno. Ex: Novo, Renovação, Segundo-Repasse, Intercâmbio"
    sql: ${TABLE}."TIPO_ULTIMA_PROPOSTA" ;;
  }

  dimension: descricao_status{
    type: string
    group_item_label: "Descrição do Status - Atual"
    group_label: "Dados do Aluno"
    description: "Indica a descrição do status de última proposta do aluno."
    sql: ${TABLE}."DESCRICAO_STATUS" ;;
  }

  dimension: feedback{
    type: string
    group_item_label: "Feedback"
    group_label: "Dados de Monitoria"
    description: "Indica a descrição do feedback de monitoria."
    sql: ${TABLE}."FEEDBACK" ;;
  }

  dimension_group: data_criacao_monitoria {
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
    sql: ${TABLE}."DATA_CRIACAO_MONITORIA" ;;
    label: "Monitoria - Criação"
    description: "Indica a data de criação da monitoria."
  }

  dimension_group: data_atualizacao_monitoria {
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
    sql: ${TABLE}."DATA_ATUALIZACAO_MONITORIA" ;;
    label: "Monitoria - Atualização"
    description: "Indica a data de atualização da monitoria."
  }

  dimension: flg_primeira_avaliacao{
    type: yesno
    group_item_label: "Primeira Avaliação?"
    group_label: "Dados de Monitoria"
    description: "Indica se é a primeira avaliação de monitoria."
    sql: ${TABLE}."FLG_PRIMERA_AVALIACAO" ;;
  }

  dimension: tipo_checklist{
    type: string
    group_item_label: "Tipo de Checklist"
    group_label: "Dados de Monitoria"
    description: "Indica a descrição do Tipo de Checklist de monitoria."
    sql: ${TABLE}."TIPO_CHECKLIST" ;;
  }

  dimension: nota_monitoramento{
    type: number
    group_item_label: "Nota"
    group_label: "Dados de Monitoria"
    description: "Indica a nota de monitoria."
    sql: ${TABLE}."NOTA" ;;
  }

  dimension: agent_monitoria{
    type: string
    group_item_label: "Atendente"
    group_label: "Dados de Monitoria"
    description: "Indica o nome do Atendente de monitoria."
    sql: ${TABLE}."AGENT_MONITORIA" ;;
  }

  dimension: avaliador_monitoria{
    type: string
    group_item_label: "Avaliador"
    group_label: "Dados de Monitoria"
    description: "Indica o nome do Avaliador de monitoria."
    sql: ${TABLE}."AVALIADOR_MONITORIA" ;;
  }

  measure: media_primeiro_tempo_resposta {
    type: average
    group_label: "Dados de Chat"
    label: "Tempo Médio de Primeira Resposta"
    description: "Tempo médio de primeira resposta chat em HH:MM:SS."
    sql: ${TABLE}."CHAT_TEMPO_PRIMEIRA_RESPOSTA"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }



  measure: duracao_chat {
    type: average
    group_label: "Dados de Chat"
    label: "Tempo Médio de Duração"
    description: "Tempo médio de duração do chat em HH:MM:SS."
    sql: ${TABLE}."CHAT_DURACAO"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }



  measure: tempo_medio_resposta {

    type: average
    group_label: "Dados de Chat"
    label: "Tempo Médio de Resposta"
    description: "Tempo médio de resposta do chat em HH:MM:SS."
    sql: ${TABLE}."CHAT_TEMPO_MEDIO_RESPOSTA"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }




  measure: tempo_maximo_resposta {
    type: average
    group_label: "Dados de Chat"
    label: "Tempo Máximo de Resposta"
    description: "Média do tempo máximo de resposta do chat em HH:MM:SS."
    sql: ${TABLE}."CHAT_TEMPO_MAX_RESPOSTA"/ 86400.0;;
    value_format: "[hh]:mm:ss"
  }


measure: sum_total_abadono {
  type: sum
  group_label: "Dados de Ligação"
  label: "Total de Abandono"
  description: "Total ligações abandonadas"
  sql: ${total_abandono};;




}

  measure: count {
    type: count
    label: "Quantidade de Tickets"
    drill_fields: []
  }
}
