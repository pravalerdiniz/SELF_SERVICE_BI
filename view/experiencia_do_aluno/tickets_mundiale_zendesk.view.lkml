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

  dimension: comentario_nps {
    type: string
    group_label: "Dados de Satisfação"
    group_item_label: "Comentário NPS"
    description: "Comentário que o aluno deixou via Chat ou WhatsApp para a pergunta de NPS no final do atendimento (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."COMENTARIO_NPS" ;;
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
    group_label: "Dados do Ticket"
    group_item_label: "Tabulação - Formulário"
    description: "Indica o formulário utilizado para tabulação do ticket."
    sql: ${TABLE}."FORMULARIO" ;;
  }

  dimension: formulario_motivo {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tabulação - Formulário/Motivo de Contato"
    description: "Indica o formulário, motivo e submotivos de contato do ticket (Contém todos os níveis de tabulação do motivo de contato)."
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
    group_label: "Dados do Ticket"
    group_item_label: "Grupo"
    description: "Indentificação do contato do Aluno."
    sql: ${TABLE}."ID_LEAD" ;;
    hidden: yes
  }

  dimension: id_ticket {
    type: number
    group_label: "Dados do Ticket"
    group_item_label: "ID Ticket - Mundiale"
    description: "ID do ticket na Mundiale."
    sql: ${TABLE}."ID_TICKET" ;;
  }

  dimension: motivo_contato {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tabulação - Motivo de Contato"
    description: "Indica o primeiro motivo de contato utilizado para tabulação do ticket (À partir de 12/08/2022)."
    sql: ${TABLE}."MOTIVO_CONTATO" ;;
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

  measure: nota_bot {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "Nota BOT"
    description: "Indica a nota que o aluno avaliou o BOT de 1 a 3 (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."NOTA_BOT" ;;
  }

  measure: nota_nps {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "Nota NPS"
    description: "Indica a nota que o aluno recomenda o Pravaler entre 0 e 10 (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."NOTA_NPS" ;;
  }

  measure: nota_pravaler {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "Nota Pravaler"
    description: "Indica a nota que o aluno avaliou o Pravaler de 1 a 3 (Apenas em tickets da Mundiale)."
    sql: ${TABLE}."NOTA_PRAVALER" ;;
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

  dimension: submotivo_contato {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tabulação - Submotivo de Contato"
    description: "Indica o submotivo de contato utilizado para tabulação do ticket (À partir de 12/08/2022)."
    sql: ${TABLE}."SUBMOTIVO_CONTATO" ;;
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
