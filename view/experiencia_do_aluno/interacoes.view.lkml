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

  dimension: atendente_grupo_ies {
    type: string
    case: {
      when: {
        sql: ${tags} like '%jessica_dos_santos_cerqueira%' ;;
        label: "Cerqueira"
      }
      when: {
        sql: ${tags} like '%jessica_da_silva_marques%' ;;
        label: "Marques"
      }
      when: {
        sql: ${tags} like '%beatriz_cunha%' ;;
        label: "Beatriz"
      }
      when: {
        sql: ${tags} like '%gisele_de_fatima_santana_silva%' ;;
        label: "Gisele"
      }

      else: "Outros"
    }
    group_label: "Nome Atendentes Grupo IES"
    group_item_label: "Nome Atendente"
    description: "Nome da Atendente do grupo IES"
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
    description: "Esse campo é uma regra de negócio*.Indica a data Fim do Chat"
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

  dimension: avaliacao_chat {
    type: string
    group_label: "Dados de Chat"
    group_item_label: "Avaliação Chat"
    description: "Indica a avaliação feito para o atendimento do chat."
    sql: ${TABLE}."AVALIACAO_CHAT" ;;
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
    group_item_label: "CPF (Antigo)"
    description: "Indica o CPF do Solicitante do ticket."
    sql: ${TABLE}."CPF_REQUESTER" ;;
  }

  dimension: cpf_requester_num {
    type: number
    group_label: "Dados do Solicitante"
    group_item_label: "CPF Num (Antigo)"
    description: "Indica o CPF do Solicitante do ticket.(Formato Numérico)"
    value_format: "0"
    sql: ${TABLE}."CPF_REQUESTER" ;;
  }

  dimension: cpf {
    type: string
    group_label: "Dados do Solicitante"
    group_item_label: "CPF (Corrigido)"
    description: "Indica o CPF do Solicitante do ticket."
    sql: ${TABLE}."CPF" ;;
  }

  dimension: cpf_num {
    type: number
    group_label: "Dados do Solicitante"
    group_item_label: "CPF Num (Corrigido)"
    description: "Indica o CPF do Solicitante do ticket.(Formato Numérico)"
    value_format: "0"
    sql: ${TABLE}."CPF_NUM" ;;
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

  dimension: analise_ytd {
    type: yesno
    group_label: "Filtros para Análise de Período"
    label: "YTD?"
    description: "Indica o acumulado no ano mês a mês."
    sql:
       (EXTRACT(DOY FROM ${data_finalizacao_raw}) < EXTRACT(DOY FROM GETDATE())
                OR
            (EXTRACT(DOY FROM ${data_finalizacao_raw}) = EXTRACT(DOY FROM GETDATE())))  ;;
  }

  dimension: data_monitoria {
    type: string
    group_label: "Dados de Monitoria"
    group_item_label: "Data de Registro"
    description: "Indica a data de registro da monitoria realizada."
    sql: ${TABLE}."DATA_MONITORIA" ;;
  }


  dimension: nome_procedimento {
    type: string
    label: "Apontamentos - Checklist"
    group_label: "Dados de Monitoria"
    description: "Indica o checklist completo com todos os apontamentos da monitoria por ticket"
    sql: ${interacoes_apontamentos_monitoria.nome_procedimento};;
    hidden: yes
  }

  dimension: conformidade_checklist {
    type: string
    label: "Conformidade - Apontamento Checklist"
    group_label: "Dados de Monitoria"
    description: "Indica a conformidade ou não do apontamento. Ex: Conforme, Não Conforme."
    sql: ${interacoes_apontamentos_monitoria.conformidade_checklist};;
    hidden: yes
  }





  dimension: procedimento {
    type: string
    label: "Checklist Detalhado"
    group_label: "Dados de Monitoria"
    description: "Indica o detalhamento do checklist da monitoria"
    sql: ${interacoes_apontamentos_monitoria.procedimento} ;;
    hidden: yes
  }

  dimension: nota {
    type: number
    label: "Peso - Nota por Apontamento - Checklist"
    group_label: "Dados de Monitoria"
    description: "Indica o peso da nota para cada apontamento da monitoria"
    sql: ${interacoes_apontamentos_monitoria.nota};;
    hidden: yes
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
    description: "Este campo é uma regra de negócio*.Indica se a pesquisa foi disparada ou não."
    link: {
      label: "Documentação - Pesquisa Disparada? "
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/1064566827/FLG+PESQUISA+DISPARADA"
    }
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
    primary_key: yes
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
    description: "Este campo é uma regra de negócio*.Indica o motivo de contato realizado no ticket."
    link: {
      label: "Documentação - Motivo de Contato "
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/1063813196/MOTIVO+DE+CONTATO"
    }
    sql: ${TABLE}."MOTIVO_CONTATO" ;;
  }

  dimension: formulario {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Formulário"
    description: "Este campo trás em qual formulário o Ticket está."
    sql: ${TABLE}."FORMULARIO" ;;
  }

  dimension: taxa_reclamacao {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Taxa de Reclamação"
    description: "Este campo é uma regra de negócio*.Classificação dos contatos de não conformidade."
    link: {
      label: "Documentação - Taxa de Reclamação "
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/1063813508/TAXA+DE+RECLAMA+O"
    }
    sql: ${TABLE}."TAXA_RECLAMACAO" ;;
  }

  dimension: taxa_contato {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Taxa de Contato"
    description: "Este campo é uma regra de negócio*.Segmenta os motivos de contato entre contratação, renovação, utilização e outros."
    link: {
      label: "Documentação - Taxa de Contato "
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/1064567182/TAXA+DE+CONTATO"
    }
    sql: ${TABLE}."TAXA_CONTATO" ;;
  }

  dimension: tipo_contato {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tipo de Contato"
    description: "Indica o tipo de contato realizado no ticket.Ex: Ativo, Receptivo, Não qualificado."
    link: {
      label: "Documentação - Tipo de Contato "
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/1064370185/TIPO+DE+CONTATO"
    }
    sql: ${TABLE}."TIPO_CONTATO" ;;
  }

  dimension: nome_assignee {
    type: string
    group_label: "Dados do Avaliado"
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

  dimension: status_atual {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Status Atual"
    description: "Indica o código do status de última proposta do aluno."
    sql: ${TABLE}."STATUS_ALUNO" ;;
  }

  dimension: descricao_status_atual{
    type: string
    group_item_label: "Status Atual - Descrição"
    group_label: "Dados do Aluno"
    description: "Indica a descrição do status de última proposta do aluno."
    sql: ${TABLE}."DESCRICAO_STATUS" ;;
  }

  dimension: status_ticket {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Status"
    description: "Indica o status do ticket.Ex: Closed, Open, Solved, Pending, New, Hold."
    sql: ${TABLE}."STATUS_TICKET" ;;
  }

  dimension: grupo_instituicao {
    type: string
    group_label: "Dados da Instituição"
    group_item_label: "Grupo Instituição - Backoffice"
    description: "Indica o nome do grupo da IES referente a última proposta do aluno preencida no Backoffice."
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
  }

  dimension: instituicao {
    type: string
    group_label: "Dados da Instituição"
    group_item_label: "Nome da Instituição - Backoffice"
    description: "Indica o nome da IES referente a última proposta do aluno preenchida no Backoffice."
    sql: ${TABLE}."INSTITUICAO" ;;
  }

    dimension: nome_ies {
    type: string
    label: "Nome da Insituição - Zendesk"
    group_label: "Dados da Instituição"
    description: "Indica o nome da IES preenchida na Zendesk."
    sql: ${TABLE}."NM_IES" ;;
  }

  dimension: grupo_ies {
    type: string
    label: "Grupo Instituição - Zendesk"
    group_label: "Dados da Instituição"
    description: "Indica o nome do grupo da IES preenchida na Zendesk."
    sql: ${TABLE}."GRUPO_IES" ;;
  }

  dimension: gerente_b2b {
    type: string
    label: "Gerente B2B"
    group_label: "Dados da Instituição"
    description: "Indica qual é o gerente do B2B preenchido na Zendesk."
    sql: ${TABLE}."GERENTE_B2B" ;;
  }



  dimension: nome_produto {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Nome do Produto"
    description: "Indica o nome do produto contratado pelo aluno referente a última proposta cedida"
    sql: ${TABLE}."NOME_PRODUTO" ;;
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
    description: "Este campo é uma regra de negócio*.Indica o e-mail do atendente do ticket."
    link: {
      label: "Documentação - E-mail Agente "
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/1063813264/E-MAIL+AGENTE"
    }
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

  dimension: mot_ctt_rel_ies {
    type: string
    label: "Motivo do Contato - Relacionamento IES"
    group_label: "Dados do Ticket"
    description: "Indica o motivo do contato realizado no ticket"
    sql: ${TABLE}."MOT_CTT_REL_IES" ;;
  }

  dimension: num_chamado_orquestra {
    type: string
    label: "Número do Chamado Orquestra"
    group_label: "Dados do Ticket"
    description: "Indica o número do chamado aberto no Orquestra (tier 2) após atendimento do ticket pela Zendesk."
    sql: ${TABLE}."NUM_CHAMADO_ORQUESTRA" ;;
  }




  dimension: status_aluno_zendesk {
    type: number
    label: "Status no Contato"
    group_label: "Dados do Aluno"
    description: "Indica o número do status do aluno no momento do contato."
    sql: ${TABLE}."STATUS_ALUNO_ZENDESK" ;;
  }

  dimension: status_detalhe_zendesk {
    type: number
    label: "Status Detalhe no Contato"
    group_label: "Dados do Aluno"
    description: "Indica o número do status detalhe do aluno no momento do contato."
    sql: ${TABLE}."STATUS_DETALHE_ZENDESK" ;;
  }

  dimension: desc_status_detalhe_zendesk {
    type: string
    label: "Status no Contato - Descrição"
    group_label: "Dados do Aluno"
    description: "Indica a descrição do status detalhe do aluno no momento do contato."
    sql: ${TABLE}."DESC_STATUS_DETALHE_ZENDESK" ;;
  }




  dimension: area_resp_atuacao {
    type: string
    label: "Área Responsável para atuação"
    group_label: "Dados do Atendente"
    description: "Indica qual a área do responsável para a atuação do ticket."
    sql:  ${TABLE}."AREA_RESP_ATUACAO" ;;
  }

  dimension: tipo_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Tipo de Aluno - Backoffice"
    description: "Indica o tipo da última proposta cedida do Aluno informada no Backoffice.Ex: Novo, Renovação, Segundo-Repasse, Intercâmbio."
    sql: ${TABLE}."TIPO_ALUNO" ;;
  }

  dimension: tipo_ultima_proposta{
    type: string
    group_item_label: "Tipo Proposta - Atual - Backoffice"
    group_label: "Dados do Aluno"
    description: "Indica o tipo da proposta atual do aluno informada no Backoffice. Ex: Novo, Renovação, Segundo-Repasse, Intercâmbio."
    sql: ${TABLE}."TIPO_ULTIMA_PROPOSTA" ;;
  }

  dimension: tipo_proposta {
    type:  string
    label: "Tipo da Proposta - Zendesk"
    group_label: "Dados do Aluno"
    description: "Indica o tipo da proposta do aluno informada na Zendesk. Ex: Novo, Renovação, Segundo-Repasse, Intercâmbio."
    sql: ${TABLE}. "TIPO_PROPOSTA" ;;
  }

  dimension: feedback{
    type: string
    group_item_label: "Feedback"
    group_label: "Dados de Monitoria"
    description: "Indica a descrição do feedback de monitoria."
    sql: ${TABLE}."FEEDBACK" ;;
    hidden: yes
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
    hidden: yes
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

  dimension: conformidade{
    type: string
    group_item_label: "Conformidade - Nota Geral"
    group_label: "Dados de Monitoria"
    description: "Esse campo é uma regra de negócio.* Indica se a nota da monitoria é ou não conforme."
    link: {
      label: "Documentação - Nota Geral"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/1064567021/CONFORMIDADE+-+NOTA+GERAL"
    }
    sql: ${TABLE}."CONFORMIDADE" ;;
    hidden: yes
  }

  dimension: erro_critico{
    type: string
    group_item_label: "Erro Crítico"
    group_label: "Dados de Monitoria"
    description: "Este campo é uma regra de negócio*.Qualifica a monitoria em erro crítico ou não erro crítico."
    link: {
      label: "Documentação - Erro Critico "
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/1064567070/ERRO+CR+TICO"
    }
    sql: ${TABLE}."ERRO_CRITICO" ;;
  }

  dimension: nota_monitoramento{
    type: number
    group_item_label: "Nota mon"
    group_label: "Dados de Monitoria"
    link: {
      label: "Documentação - Nota de Monitoramento "
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/1063813345/NOTA"
    }
    description: "Este campo é uma regra de negócio*.Indica a nota de monitoria."
    sql: ${TABLE}."NOTA" ;;
    hidden: yes
  }

  measure: nota_monitoramento_measure{
    type: average
    group_item_label: "Nota Média"
    group_label: "Dados de Monitoria"
    description: "Indica a nota média de monitoria."
    sql: ${TABLE}."NOTA" ;;
    hidden: yes
    #value_format: "#.#,00"
  }

  dimension: agent_monitoria{
    type: string
    group_item_label: "Atendente"
    group_label: "Dados de Monitoria"
    description: "Indica o nome do Atendente de monitoria."
    sql: ${TABLE}."AGENT_MONITORIA" ;;
    hidden: yes
  }

  dimension: avaliador_monitoria{
    type: string
    group_item_label: "Avaliador"
    group_label: "Dados de Monitoria"
    description: "Indica o nome do Avaliador de monitoria."
    sql: ${TABLE}."AVALIADOR_MONITORIA" ;;
    hidden: yes
  }

  dimension: nome_avaliador{
    type: string
    group_item_label: "Nome Avaliador"
    group_label: "Dados de Monitoria"
    description: "Indica o nome do Avaliador"
    sql: ${TABLE}."NM_AVALIADOR" ;;
  }





  dimension_group: data_avaliacao {
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
    sql: ${TABLE}."DATA_AVALIACAO" ;;
    label: "Monitoria - Data avaliação"
    description: "Indica a data da avaliação da monitoria."
  }

  dimension: tp_avaliacao{
    type: string
    group_item_label: "Tipo de Avaliação"
    group_label: "Dados de Monitoria"
    description: "Indica qual o tipo de avaliação. Ex: Qualidade, cliente.."
    sql: ${TABLE}."TP_AVALIACAO" ;;
    hidden: yes
  }

  dimension: codigo_avaliacao{
    type: number
    group_item_label: "Codigo da Avaliação"
    group_label: "Dados de Monitoria"
    description: "Indica qual o codigo da avaliação. Cada avaliação possui um codigo"
    sql: ${TABLE}."COD_AVALIACAO" ;;
  }

  dimension: nome_lider_equipe{
    type: string
    group_item_label: "Nome Lider Equipe"
    group_label: "Dados de Monitoria"
    description: "Indica o nome do lider daquela equipe"
    sql: ${TABLE}."NM_LIDER_EQUPE" ;;
  }

  dimension_group: data_inicio_produto {
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
    sql: ${TABLE}."DATA_INICIO_PRODUTO" ;;
    label: "Monitoria - Data Inicio Produto"
    description: "Indica a data em que o produto iniciou"
  }

  dimension_group: data_feedback {
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
    sql: ${TABLE}."DATA_FEEDBACK" ;;
    label: "Monitoria - Data Feedback"
    description: "Indica a data do feedback da monitoria"
  }

  dimension: login_avaliado{
    type: string
    group_item_label: "Login do Avaliado"
    group_label: "Dados de Monitoria"
    description: "Indica qual o login do avaliado"
    sql: ${TABLE}."LOGIN_AVALIADO" ;;
  }

  dimension: valor_nota_sem_ncg{
    type: number
    group_item_label: "Nota sem NCG"
    group_label: "Dados de Monitoria"
    description: "Indica o valor da Nota Sem Não Conformidade Grave"
    sql: ${TABLE}."VL_NOTA_SEM_NCG" ;;
  }

  measure: media_nota_sem_ncg{
    type: average
    group_item_label: "Nota Média Sem NCG"
    group_label: "Dados de Monitoria"
    description: "Indica a nota média sem NCG da monitoria."
    sql: ${valor_nota_sem_ncg} ;;
    #value_format: "#.#,00"
  }

  dimension: obs_avaliado{
    type: string
    group_item_label: "OBS do Avaliado"
    group_label: "Dados de Monitoria"
    description: "Indica se tem alguma observação do avaliado"
    sql: ${TABLE}."OBS_AVALIADO" ;;
  }

  dimension: obs_lider{
    type: string
    group_item_label: "OBS do Lider"
    group_label: "Dados de Monitoria"
    description: "Indica se tem alguma observação do lider"
    sql: ${TABLE}."OBS_LIDER" ;;
  }

  dimension: observacao{
    type: string
    group_item_label: "Observação"
    group_label: "Dados de Monitoria"
    description: "Indica se tem alguma observação naquela monitoria"
    sql: ${TABLE}."OBSERVACAO" ;;
  }

  dimension: qtd_arquivos_atendimento{
    type: number
    group_item_label: "Qtd Arquivos Atendimento"
    group_label: "Dados de Monitoria"
    description: "Indica a quantidade de arquivos de atendimento teve na monitoria"
    sql: ${TABLE}."QTD_ARQUIVOS_ATENDIMENTO" ;;
  }

  dimension: resultado_feedback{
    type: string
    group_item_label: "Resultado Feedback"
    group_label: "Dados de Monitoria"
    description: "Indica qual o resultado que o feedback teve"
    sql: ${TABLE}."RESULTADO_FDBK" ;;
  }

  dimension: status_feedback{
    type: string
    group_item_label: "Status Feedback"
    group_label: "Dados de Monitoria"
    description: "Indica qual o status do feedback"
    sql: ${TABLE}."STATUS_FDBK" ;;
  }

  dimension: tempo_feedback {
    type: number
    group_item_label: "Duração do Feedback"
    group_label: "Dados de Monitoria"
    description: "Indica qual o tempo de duração em segundos do feedback"
    sql: ${TABLE}."TEMPO_FDBK"/86400.0 ;;
    value_format: "[hh]:mm:ss"
  }


  dimension: tipo_avaliacao{
    type: string
    group_item_label: "Tipo de Avaliação"
    group_label: "Dados de Monitoria"
    description: "Indica qual o tipo de canal a avaliação teve. Ex: Monitoria>Voz, Auditoria, Monitoria>WhatsApp..."
    sql: ${TABLE}."TP_CANAL_AVALIACAO" ;;
  }

  dimension: campanha{
    type: string
    group_item_label: "Campanha (Area)"
    group_label: "Dados de Monitoria"
    description: "Indica qual a campanha da monitoria. Ex: CRX, Negociação"
    sql: ${TABLE}."CAMPANHA" ;;
  }

  dimension: conceito{
    type: string
    group_item_label: "Conceito"
    group_label: "Dados de Monitoria"
    description: "Indica qual o conceito da monitoria. Ex: Acima da meta, abaixo da meta"
    sql: ${TABLE}."CONCEITO" ;;
  }

  dimension: numero_matricula{
    type: string
    group_item_label: "Número da Matricula"
    group_label: "Dados de Monitoria"
    description: "Indica qual o número da matricula do aluno"
    sql: ${TABLE}."NUM_MATRICULA" ;;
  }

  dimension: valor_nota{
    type: number
    group_item_label: "Valor Nota"
    group_label: "Dados de Monitoria"
    description: "Indica qual a nota da monitoria"
    sql: ${TABLE}."VL_NOTA" ;;
  }

  measure: soma_nota{
    type: sum
    group_item_label: "Soma Nota"
    group_label: "Dados de Monitoria"
    description: "Indica a soma da nota da monitoria."
    sql: ${valor_nota} ;;
    #value_format: "#.#,00"
  }

  measure: media_nota{
    type: average
    group_item_label: "Nota Média"
    group_label: "Dados de Monitoria"
    description: "Indica a nota média da monitoria."
    sql: ${valor_nota} ;;
    #value_format: "#.#,00"
  }

  dimension: pontos_melhorar{
    type: string
    group_item_label: "Pontos Melhorar"
    group_label: "Dados de Monitoria"
    description: "Indica se possui pontos a melhorar"
    sql: ${TABLE}."PONTOS_MELHORAR" ;;
  }

  dimension: pontos_positivos{
    type: string
    group_item_label: "Pontos Positivos"
    group_label: "Dados de Monitoria"
    description: "Indica se possui pontos positivos"
    sql: ${TABLE}."PONTOS_POSITIVOS" ;;
  }

  dimension: processo{
    type: string
    group_item_label: "Processo"
    group_label: "Dados de Monitoria"
    description: "Indica qual o processo da monitoria. Ex: padrão, Motivos de Contatos..."
    sql: ${TABLE}."PROCESSO" ;;
  }

  dimension: cliente{
    type: string
    group_label: "Dados de Monitoria"
    group_item_label: "Cliente"
    description: "Indica a empresa/cliente do atendente do ticket."
    sql: ${TABLE}."EMPRESA_AGENTE" ;;
  }

  dimension: avaliado{
    type: string
    group_label: "Dados de Monitoria"
    group_item_label: "Avaliado"
    description: "Indica o nome do avaliado"
    sql: ${TABLE}."NM_AVALIADO" ;;
  }

  dimension: planilha{
    type: string
    group_label: "Dados de Monitoria"
    group_item_label: "Planilha"
    sql: ${TABLE}."PLANILHA" ;;
  }

  dimension: nome_responsavel_fdbk{
    type: string
    group_label: "Dados de Monitoria"
    group_item_label: "Nome Resp. FDBK"
    description: "Indica o nome do responsavel pelo faceback"
    sql: ${TABLE}."NM_RESPONSAVEL_FDBK" ;;
  }

  dimension: ciclo{
    type: string
    group_label: "Dados de Monitoria"
    group_item_label: "Ciclo"
    sql: ${TABLE}."CICLO" ;;
  }

  dimension: periodo{
    type: string
    group_label: "Dados de Monitoria"
    group_item_label: "Periodo"
    description: "Indica qual o periodo que foi feita a avaliação"
    sql: ${TABLE}."PERIODO" ;;
  }

  dimension: tempo_monitoria {
    type: number
    group_item_label: "Duração da Monitoria"
    group_label: "Dados de Monitoria"
    description: "Indica qual o tempo de duração em segundos da monitoria"
    sql: ${TABLE}."TEMPO_MONITORIA_SEG"/86400.0 ;;
    value_format: "[hh]:mm:ss"
    hidden: yes
  }

  measure: duracao_monitoria{
    type: sum
    group_label: "Dados de Monitoria"
    group_item_label: "Duração Monitoria"
    description: "Indica qual o tempo de duração em segundos da monitoria"
    sql: ${tempo_monitoria};;
    value_format: "[hh]:mm:ss"
  }

  measure: duracao_media_monitoria{
    type: average
    group_label: "Dados de Monitoria"
    group_item_label: "Duração Média Monitoria"
    description: "Indica qual o tempo medio de duração em segundos da monitoria"
    sql: ${tempo_monitoria};;
    value_format: "[hh]:mm:ss"
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

  dimension: mudou_etapa_3 {
    type: string
    case: {
      when: {
        sql: ${dados_jornada_interacoes.DT_STATUS_date}> ${data_finalizacao_date}
          AND ${dados_jornada_interacoes.DT_STATUS_date} <= DATEADD(day, 3, ${data_finalizacao_date}) ;;
        label: "1"
      }
      else: "0"
    }
    group_label: "Dados do Aluno"
    label: "Mudou de Etapa - 3 dias"
    description: "Indicador de mudança de status em até 3 dias depois da finalização do ticket"
  }

  dimension: mudou_etapa_2 {
    type: string
    case: {
      when: {
        sql:${dados_jornada_interacoes.DT_STATUS_date}> ${data_finalizacao_date}
          AND ${dados_jornada_interacoes.DT_STATUS_date} <= DATEADD(day, 2, ${data_finalizacao_date}) ;;
        label: "1"
      }
      else: "0"
    }
    group_label: "Dados do Aluno"
    label: "Mudou de Etapa - 2 dias"
    description: "Indicador de mudança de status em até 2 dias depois da finalização do ticket"
  }

  dimension: mudou_etapa_1 {
    type: string
    case: {
      when: {
        sql:  ${dados_jornada_interacoes.DT_STATUS_date}> ${data_finalizacao_date}
          AND ${dados_jornada_interacoes.DT_STATUS_date} <= DATEADD(day, 1, ${data_finalizacao_date}) ;;
        label: "1"
      }
      else: "0"
    }
    group_label: "Dados do Aluno"
    label: "Mudou de Etapa - 1 dia"
    description: "Indicador de mudança de status em até 1 dias depois da finalização do ticket"
  }

  dimension: tempo_finalizacao {
    type: number
    sql:  coalesce(datediff(day,${interacoes.data_criacao_date},${interacoes.data_finalizacao_date}),0) ;;
    group_label: "Dados do Ticket"
    label: "Qtd de dias para finalização"
    description: "Diferença de dias entre a data de criação do chamado e a data de finalização do chamado"
  }

  dimension: id_usuario {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "ID Usuário"
    description: "Indica o ID do Usuário (aluno) na Zendesk"
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension: nome_usuario {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Nome Usuário"
    description: "Indica o Nome do Usuário (aluno) na Zendesk"
    hidden: yes
    sql: ${TABLE}."NOME_USUARIO" ;;
  }

  dimension: email_usuario {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Email Usuário"
    description: "Indica o Email do Usuário (aluno) na Zendesk"
    sql: ${TABLE}."EMAIL_USUARIO" ;;
  }

  dimension: infos_usuario {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Infos Usuário"
    description: "Indica o Email do Usuário (aluno) na Zendesk"
    hidden: yes
    sql: ${TABLE}."INFOS_USUARIO" ;;
  }


}
