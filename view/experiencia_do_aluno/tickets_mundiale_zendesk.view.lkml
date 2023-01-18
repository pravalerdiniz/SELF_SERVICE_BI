view: tickets_mundiale_zendesk {

  sql_table_name: "SELF_SERVICE_BI"."TICKETS_MUNDIALE_ZENDESK"
    ;;

  dimension: campanha {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Campanha"
    description: "Indica a campanha do ticket (WHATSAPP, PRAVALER_SITE, HOME, etc)."
    sql: ${TABLE}."CAMPANHA" ;;
  }

  dimension: canal_atendimento {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Canal Atendimento"
    description: "Indica o canal do atendimento (WHATSAPP, CHAT, LIGAÇÃO, etc)."
    sql: ${TABLE}."CANAL_ATENDIMENTO" ;;
  }

  dimension: comentario_nps_csat {
    type: string
    group_label: "Dados de Satisfação"
    group_item_label: "Comentário NPS/CSAT"
    description: "Comentário que o aluno deixou nas pesquisas de atendimento (Tanto em atendimentos da Mundiale quanto da Zendesk)."
    sql: ${TABLE}."COMENTARIO_NPS_CSAT" ;;
  }

  dimension: cpf_atendente {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "CPF"
    description: "CPF do atendente."
    sql: ${TABLE}."CPF_ATENDENTE" ;;
  }

  dimension: cpf_cliente {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "CPF"
    description: "Indica o CPF do aluno no formato texto."
    sql: ${TABLE}."CPF_CLIENTE" ;;
  }

  dimension: cpf_cliente_num {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "CPF (Numérico)"
    description: "Indica o CPF do aluno no formato numérico."
    sql: ${TABLE}."CPF_CLIENTE_NUM" ;;
  }

  dimension: email_atendente {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "E-mail"
    description: "E-mail do atendente"
    sql: ${TABLE}."EMAIL_ATENDENTE" ;;
  }

  dimension: email_cliente {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "E-mail"
    description: "E-mail do aluno"
    sql: ${TABLE}."EMAIL_CLIENTE" ;;
  }

  dimension: finalizado_por {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Finalizado Por"
    description: "Indica se o ticket foi finalizado no ATH (Atendimento Humano) ou no BOT (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."FINALIZADO_POR" ;;
  }

  dimension: formulario {
    type: string
    group_label: "Dados de Tabulação"
    group_item_label: "Formulário"
    description: "Indica o formulário utilizado para tabulação do ticket."
    drill_fields: [submotivo_contato_1]
    sql: ${TABLE}."FORMULARIO" ;;
  }

  dimension: formulario_motivo {
    type: string
    group_label: "Dados de Tabulação"
    group_item_label: "Formulário + Submotivos de Contato"
    description: "Indica o formulário e todos os submotivos de contato do ticket (Contém todos os níveis de tabulação do motivo de contato)."
    sql: ${TABLE}."FORMULARIO_MOTIVO" ;;
  }

  dimension: funcao_atendente {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "Função"
    description: "Indica a função do atendente."
    sql: ${TABLE}."FUNCAO_ATENDENTE" ;;
    hidden: yes
  }

  dimension: grupo_atendente {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Grupo"
    description: "Indica o grupo no qual o ticket foi finalizado (SAC, COBRANÇA, SAC TIER 2, CONTRATAÇÃO, etc)."
    sql: ${TABLE}."GRUPO_ATENDENTE" ;;
  }

  dimension: id_lead {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "ID Lead"
    description: "Indentificação da origem do aluno, como número de telefone."
    sql: ${TABLE}."ID_LEAD" ;;
  }

  dimension: id_ticket {
    type: number
    group_label: "Dados do Ticket"
    group_item_label: "ID Ticket - Mundiale"
    description: "ID do ticket na Mundiale."
    sql: ${TABLE}."ID_TICKET" ;;
  }

  dimension: nome_atendente {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "Nome"
    description: "Nome do Atendente."
    sql: ${TABLE}."NOME_ATENDENTE" ;;
  }

  dimension: nome_cliente {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Nome"
    description: "Nome do aluno."
    sql: ${TABLE}."NOME_CLIENTE" ;;
  }

  measure: nota_bot_mundiale {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "Nota Mundiale 1.Atendimento"
    description: "Indica a nota que o aluno avaliou o atendimento de 1 a 3 (Apenas em tickets da Mundiale). Nota 0 significa que o aluno não respondeu. Pergunta: O que achou do meu atendimento?"
    sql: ${TABLE}."NOTA_BOT_MUNDIALE" ;;
  }

  measure: nota_nps_mundiale {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "Nota Mundiale 3.NPS"
    description: "Indica a nota que o aluno recomenda o Pravaler entre 1 e 10 (Apenas em tickets da Mundiale). Nota 0 significa que o aluno não respondeu. Pergunta: Numa escala de 1 a 10, qual a probabilidade de você nos indicar para amigos, parentes e/ou terceiros??"
    sql: ${TABLE}."NOTA_NPS_MUNDIALE" ;;
  }

  measure: nota_pravaler_mundiale {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "Nota Mundiale 2.Pravaler"
    description: "Indica a nota que o aluno avaliou o Pravaler de 1 a 3 (Apenas em tickets da Mundiale). Nota 0 significa que o aluno não respondeu. Pergunta: De modo geral, como classifica a sua experiência com o Pravaler?"
    sql: ${TABLE}."NOTA_PRAVALER_MUNDIALE" ;;
  }

  dimension: nota_csat_zendesk {
    type: string
    group_label: "Dados de Satisfação"
    group_item_label: "Nota CSAT Zendesk"
    description: "Após o ticket ser finalizado na Zendesk, o aluno recebe uma pesquisa pedindo para ele avaliar o atendimento. OFFERED significa que a pesquisa foi disparada mas o aluno não avaliou, GOOD o aluno achou bom e BAD achou ruim (Apenas em tickets da Zendesk)."
    sql: ${TABLE}."NOTA_CSAT_ZENDESK" ;;
  }

  dimension: observacao_atendente {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Observação do Atendente"
    description: "Espaço dedicado para o Atendente registrar alguma observação no Ticket (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."OBSERVACAO_ATENDENTE" ;;
  }

  dimension: operacao {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "Empresa/Operação"
    description: "Indica a empresa ou operação do atendente."
    sql: ${TABLE}."OPERACAO" ;;
  }

  dimension: origem {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Origem (Mundiale/Zendesk)"
    description: "Campo para identificar se o ticket é da Mundiale ou da Zendesk."
    sql: ${TABLE}."ORIGEM" ;;
  }

  dimension: perfil {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Perfil"
    description: "Identifica o perfil do aluno no momento do contato (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."PERFIL" ;;
  }

  dimension: primeira_mensagem {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Primeira Mensagem"
    description: "Mostra a primeira mensagem do BOT (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."PRIMEIRA_MENSAGEM" ;;
  }

  dimension: retencao {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Retenção"
    description: "Indica se o ticket foi Retido no BOT, Abandonado ou Transbordado para ATH (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."RETENCAO" ;;
  }

  dimension: step {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Último Step"
    description: "Indica a última etapa marcada pelo BOT ou ATH (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."STEP" ;;
  }

  dimension: submotivo_contato_1 {
    type: string
    group_label: "Dados de Tabulação"
    group_item_label: "Submotivo 1"
    description: "Indica o primeiro motivo de contato utilizado para tabulação do ticket."
    drill_fields: [submotivo_contato_2]
    sql: ${TABLE}."SUBMOTIVO_CONTATO_1" ;;
  }

  dimension: submotivo_contato_2 {
    type: string
    group_label: "Dados de Tabulação"
    group_item_label: "Submotivo 2"
    description: "Indica o segundo motivo de contato utilizado para tabulação do ticket."
    drill_fields: [submotivo_contato_3]
    sql: ${TABLE}."SUBMOTIVO_CONTATO_2" ;;
  }

  dimension: submotivo_contato_3 {
    type: string
    group_label: "Dados de Tabulação"
    group_item_label: "Submotivo 3"
    description: "Indica o terceiro motivo de contato utilizado para tabulação do ticket (Poucos motivos chegam nesse nível) ."
    drill_fields: [submotivo_contato_4]
    sql: ${TABLE}."SUBMOTIVO_CONTATO_3" ;;
  }

  dimension: submotivo_contato_4 {
    type: string
    group_label: "Dados de Tabulação"
    group_item_label: "Submotivo 4"
    description: "Indica o quarto motivo de contato utilizado para tabulação do ticket (Poucos motivos chegam nesse nível) ."
    sql: ${TABLE}."SUBMOTIVO_CONTATO_4" ;;
  }

  dimension: submotivo_contato_5 {
    type: string
    hidden: yes
    group_label: "Dados de Tabulação"
    group_item_label: "Submotivo 5"
    description: "Indica o quarto motivo de contato utilizado para tabulação do ticket (Poucos motivos chegam nesse nível) ."
    sql: ${TABLE}."SUBMOTIVO_CONTATO_5" ;;
  }


  dimension: tags {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tags"
    description: "Indica as tags registradas no Ticket."
    sql: ${TABLE}."TAGS" ;;
  }

  dimension: telefone_cliente {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Celular"
    description: "Celular do Aluno."
    sql: ${TABLE}."TELEFONE_CLIENTE" ;;
  }

  dimension_group: ticket_atualizado_em {
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
    sql: ${TABLE}."TICKET_ATUALIZADO_EM" ;;
  }

  dimension_group: ticket_criado_em {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."TICKET_CRIADO_EM" ;;
  }

  dimension_group: ticket_finalizado_em {
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
    sql: ${TABLE}."TICKET_FINALIZADO_EM" ;;
  }

  dimension: tipo_contato {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tipo de Contato (Receptivo/Ativo)"
    description: "Regra de Negócio que indica se o contato foi receptivo ou ativo (De acordo com o campo TIPO DE CONTATO nas próprias ferramentas ou de acordo com o Grupo)."
    sql: ${TABLE}."TIPO_CONTATO" ;;
  }

  measure: tma_atendente {
    type: sum
    group_label: "Dados do Ticket"
    group_item_label: "TMA do Atendente"
    description: "Tempo Médio de Atendimento do atendente por ticket (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."TMA_ATENDENTE" ;;
  }

  dimension: transferencia_t2_ies {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Transferência T2/IES"
    description: "Regra de Negócio que indica os tickets que são transferidos para filas de T2 ou IES."
    sql: ${TABLE}."TRANSFERENCIA_T2_IES" ;;
  }

  dimension: zendesk_id {
    type: number
    primary_key: yes
    group_label: "Dados do Ticket"
    group_item_label: "ID Ticket - Zendesk"
    description: "ID do ticket na Zendesk."
    sql: ${TABLE}."ZENDESK_ID" ;;
  }

  measure: count {
    type: count
    group_label: "Dados do Ticket"
    group_item_label: "Quantidade de Tickets"
    description: "Contagem dos Registros da tabela."
    drill_fields: []
  }
}
