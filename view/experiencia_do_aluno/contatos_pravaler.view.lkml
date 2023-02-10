view: contatos_pravaler {

  sql_table_name: "SELF_SERVICE_BI"."CONTATOS_PRAVALER"
    ;;

  dimension: campanha {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Campanha"
    description: "Indica a campanha do ticket (WHATSAPP, PRAVALER_SITE, HOME, etc)."
    sql: ${TABLE}."CAMPANHA" ;;
  }

  dimension: canal {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Canal Atendimento"
    description: "Indica o canal do atendimento (WHATSAPP, CHAT, LIGAÇÃO, etc)."
    sql: ${TABLE}."CANAL" ;;
  }

  dimension: comentario_nota {
    type: string
    group_label: "Dados de Satisfação"
    group_item_label: "Comentários"
    description: "Comentário que o aluno deixou nas pesquisas de atendimento (Tanto em atendimentos da Mundiale quanto da Zendesk)."
    sql: ${TABLE}."COMENTARIO_NOTA" ;;
  }

  dimension: cpf_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "CPF"
    description: "Indica o CPF do aluno no formato texto."
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  dimension: cpf_aluno_num {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "CPF (Numérico)"
    description: "Indica o CPF do aluno no formato numérico."
    sql: ${TABLE}."CPF_ALUNO_NUM" ;;
  }

  dimension: cpf_atendente {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "CPF"
    description: "CPF do atendente."
    sql: ${TABLE}."CPF_ATENDENTE" ;;
  }

  dimension: disparo_resposta_aluno {
    type: string
    group_label: "Dados do Disparo"
    group_item_label: "Resposta do Aluno"
    description: "Indica a opção queo aluno escolheu ao interagir com o disparo."
    sql: ${TABLE}."DISPARO_RESPOSTA_ALUNO" ;;
  }

  dimension: disparo_template {
    type: string
    group_label: "Dados do Disparo"
    group_item_label: "Template"
    description: "Indica o template/campanha do disparo."
    sql: ${TABLE}."DISPARO_TEMPLATE" ;;
  }

  dimension: email_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "E-mail"
    description: "E-mail do aluno"
    sql: ${TABLE}."EMAIL_ALUNO" ;;
  }

  dimension: email_atendente {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "E-mail"
    description: "E-mail do atendente"
    sql: ${TABLE}."EMAIL_ATENDENTE" ;;
  }

  dimension: finalizado_por {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Finalizado Por"
    description: "Indica se o ticket foi finalizado no ATH (Atendimento Humano), URA (em caso de ligação) ou no BOT (Apenas em tickets da Mundiale)."
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

  dimension: formulario_submotivos {
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

  dimension: nome_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Nome"
    description: "Nome do aluno."
    sql: ${TABLE}."NOME_ALUNO" ;;
  }

  dimension: nome_atendente {
    type: string
    group_label: "Dados do Atendente"
    group_item_label: "Nome"
    description: "Nome do Atendente."
    sql: ${TABLE}."NOME_ATENDENTE" ;;
  }

  measure: nota_pergunta1_mundiale {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "Mundiale 1. Atendimento"
    description: "Nota de 1 a 3 (Nota 0 significa que o aluno não respondeu). Pergunta: O que achou do meu atendimento? "
    sql: ${TABLE}."NOTA_PERGUNTA1_MUNDIALE" ;;
  }

  measure: nota_pergunta2_mundiale {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "Mundiale 2. Pravaler"
    description: "Nota de 1 a 3 (Nota 0 significa que o aluno não respondeu). Pergunta: De modo geral, como classifica a sua experiência com o Pravaler?"
    sql: ${TABLE}."NOTA_PERGUNTA2_MUNDIALE" ;;
  }

  measure: nota_pergunta3_mundiale {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "Mundiale 3.NPS/Resolução"
    description: "Nota de 1 a 10 (Nota 0 significa que o aluno não respondeu). Pergunta: Numa escala de 1 a 10, qual a probabilidade de você nos indicar para amigos, parentes e/ou terceiros?"
    sql: ${TABLE}."NOTA_PERGUNTA2_MUNDIALE" ;;
  }

  dimension: nota_atendimento_zendesk {
    type: string
    group_label: "Dados de Satisfação"
    group_item_label: "Zendesk 1. Satisfação"
    description: "Após o ticket ser finalizado na Zendesk, o aluno recebe uma pesquisa pedindo para ele avaliar o atendimento. OFFERED significa que a pesquisa foi disparada mas o aluno não avaliou, GOOD o aluno achou bom e BAD achou ruim (Apenas em tickets da Zendesk)."
    sql: ${TABLE}."NOTA_ATENDIMENTO_ZENDESK" ;;
  }

  measure: nota_pergunta1_55pbx {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "55pbx 1. Atendimento"
    description: "Nota de 1 a 3 (Nota 0 significa que o aluno não respondeu). Pergunta: O que achou do meu atendimento? "
    sql: ${TABLE}."NOTA_PERGUNTA1_55PBX" ;;
  }

  measure: nota_pergunta2_55pbx {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "55pbx 2. Pravaler"
    description: "Nota de 1 a 3 (Nota 0 significa que o aluno não respondeu). Pergunta: De modo geral, como classifica a sua experiência com o Pravaler?"
    sql: ${TABLE}."NOTA_PERGUNTA2_55PBX" ;;
  }

  measure: nota_pergunta3_55pbx {
    type: sum
    group_label: "Dados de Satisfação"
    group_item_label: "55pbx 3. Resolução"
    description: "Pergunta: Conseguimos atender sua necessidade? Digite 1 para SIM e 2 para NÃO."
    sql: ${TABLE}."NOTA_PERGUNTA3_55PBX" ;;
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
    group_item_label: "Origem do Contato"
    description: "Campo para identificar se o ticket é da Mundiale, Zendesk, 55pbx (URA), etc."
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
    description: "Mostra a primeira mensagem do BOT ou primeira opção selecionada na URA."
    sql: ${TABLE}."PRIMEIRA_MENSAGEM" ;;
  }

  dimension: retencao {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Retenção"
    description: "Indica se o ticket foi Retido no BOT ou na URA, Abandonado ou Transbordado para ATH (Apenas em tickets da Mundiale e 55pbx)."
    sql: ${TABLE}."RETENCAO" ;;
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

  dimension: telefone_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Celular"
    description: "Celular do Aluno."
    sql: ${TABLE}."TELEFONE_ALUNO" ;;
  }



  # SOMA DAS MEDIDAS DE TEMPO
  measure: tempo_atendente {
    type: sum
    group_label: "Métricas do Ticket"
    group_item_label: "Soma - Tempo Atendente"
    description: "Tempo de Atendimento do Atendente."
    sql: ${TABLE}."TEMPO_ATENDENTE" ;;
  }

  measure: tempo_atendimento {
    type: sum
    group_label: "Métricas do Ticket"
    group_item_label: "Soma - Tempo Atendimento"
    description: "Tempo de Atendimento do ticket."
    sql: ${TABLE}."TEMPO_ATENDIMENTO" ;;
  }

  measure: tempo_autosservico {
    type: sum
    group_label: "Métricas do Ticket"
    group_item_label: "Soma - Tempo Autosserviço"
    description: "Tempo que o aluno ficou no BOT ou na URA do ticket (em construção)."
    sql: ${TABLE}."TEMPO_AUTOSSERVICO" ;;
  }

  measure: tempo_espera {
    type: sum
    group_label: "Métricas do Ticket"
    group_item_label: "Soma - Tempo Espera"
    description: "Tempo que o aluno esperou durante o atendimento (em construção)."
    sql: ${TABLE}."TEMPO_ESPERA" ;;
  }

  measure: tempo_primeira_resposta {
    type: sum
    group_label: "Métricas do Ticket"
    group_item_label: "Soma - Tempo Primeira Resposta"
    description: "Tempo que levou para o aluno receber a primeira resposta (em construção)."
    sql: ${TABLE}."TEMPO_PRIMEIRA_RESPOSTA" ;;
  }

  measure: tempo_total_atendimento {
    type: sum
    group_label: "Métricas do Ticket"
    group_item_label: "Soma - Tempo Total Atendimento"
    description: "Tempo total de atendimento, desde o autosserviço até o encerramento do contato (em construção)."
    sql: ${TABLE}."TEMPO_TOTAL_ATENDIMENTO" ;;
  }



# MÉDIA DAS MEDIDAS DE TEMPO
  measure: media_tempo_atendente {
    type: average
    group_label: "Métricas do Ticket"
    group_item_label: "Média - Tempo Atendente"
    description: "Tempo de Atendimento do Atendente."
    sql: ${TABLE}."TEMPO_ATENDENTE" ;;
  }

  measure: media_tempo_atendimento {
    type: average
    group_label: "Métricas do Ticket"
    group_item_label: "Média - Tempo Atendimento"
    description: "Tempo de Atendimento do ticket."
    sql: ${TABLE}."TEMPO_ATENDIMENTO" ;;
  }

  measure: media_tempo_autosservico {
    type: average
    group_label: "Métricas do Ticket"
    group_item_label: "Média - Tempo Autosserviço"
    description: "Tempo que o aluno ficou no BOT ou na URA do ticket (em construção)."
    sql: ${TABLE}."TEMPO_AUTOSSERVICO" ;;
  }

  measure: media_tempo_espera {
    type: average
    group_label: "Métricas do Ticket"
    group_item_label: "Média - Tempo Espera"
    description: "Tempo que o aluno esperou durante o atendimento (em construção)."
    sql: ${TABLE}."TEMPO_ESPERA" ;;
  }

  measure: media_tempo_primeira_resposta {
    type: average
    group_label: "Métricas do Ticket"
    group_item_label: "Média - Tempo Primeira Resposta"
    description: "Tempo que levou para o aluno receber a primeira resposta (em construção)."
    sql: ${TABLE}."TEMPO_PRIMEIRA_RESPOSTA" ;;
  }

  measure: media_tempo_total_atendimento {
    type: average
    group_label: "Métricas do Ticket"
    group_item_label: "Média - Tempo Total Atendimento"
    description: "Tempo total de atendimento, desde o autosserviço até o encerramento do contato (em construção)."
    sql: ${TABLE}."TEMPO_TOTAL_ATENDIMENTO" ;;
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

  dimension: ticket_mundiale {
    type: number
    group_label: "Dados do Ticket"
    group_item_label: "ID Ticket - Mundiale"
    description: "ID do ticket na Mundiale."
    sql: ${TABLE}."TICKET_MUNDIALE" ;;
  }

  dimension: ticket_zendesk {
    type: number
    #primary_key: yes
    group_label: "Dados do Ticket"
    group_item_label: "ID Ticket - Zendesk"
    description: "ID do ticket na Zendesk."
    sql: ${TABLE}."TICKET_ZENDESK" ;;
  }

  dimension: tipo_contato {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Tipo de Contato (Receptivo/Ativo)"
    description: "Regra de Negócio que indica se o contato foi receptivo ou ativo (De acordo com o campo TIPO DE CONTATO nas próprias ferramentas ou de acordo com o Grupo)."
    sql: ${TABLE}."TIPO_CONTATO" ;;
  }

  dimension: transferencia_t2_ies {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Transferência T2/IES"
    description: "Regra de Negócio que indica os tickets que são transferidos para filas de T2 ou IES."
    sql: ${TABLE}."TRANSFERENCIA_T2_IES" ;;
  }

  dimension: ultimo_passo {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "Último Passo Autosserviço"
    description: "Indica a última etapa marcada pelo BOT, URA ou ATH (Apenas em tickets da Mundiale e 55pbx)."
    sql: ${TABLE}."ULTIMO_PASSO" ;;
  }

  measure: quantidade_tickets {
    type: count
    group_item_label: "Quantidade de Tickets"
    description: "Contagem dos Registros da tabela."
    drill_fields: []
  }

  dimension: year_to_date {
    type: string
    group_label: "Dados do Ticket"
    group_item_label: "YTD"
    description: "Marca o YTD do ano atual e do ano passado para facilitar comparação entre os períodos."
    sql: ${TABLE}."YEAR_TO_DATE" ;;
  }


}
