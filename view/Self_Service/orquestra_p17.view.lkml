view: orquestra_p17 {
  sql_table_name: "CS"."ORQUESTRA_P17"
    ;;


  dimension: acordotrocadevencimento {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Acordo Troca de Vencimento"
    description: "Informação para Risco P10"
    sql: ${TABLE}."ACORDOTROCADEVENCIMENTO" ;;
  }

  dimension: alunojapagoualgumaparcela {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Aluno já pagou alguma parcela?"
    sql: ${TABLE}."ALUNOJAPAGOUALGUMAPARCELA" ;;
  }

  dimension: analiseefetuada {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Análise efetuada?"
    sql: ${TABLE}."ANALISEEFETUADA" ;;
  }

  dimension: analiserealizada {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Análise realizada?"
    sql: ${TABLE}."ANALISEREALIZADA" ;;
  }

  dimension: analisesolicitacaorealizadapelaarea {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Solicitação realizada pela área?"
    description: "Ações tomadas no chamados especificos"
    sql: ${TABLE}."ANALISESOLICITACAOREALIZADAPELAAREA" ;;
  }

  dimension: area {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Área"
    description: "Área responsavel pelo chamado"
    sql: ${TABLE}."AREA" ;;
  }

  dimension: area_executor {
    type: string
    group_label: "Dados do Executor"
    group_item_label: "Área do Executor"
    description: "Área de trabalho do executor da tarefa"
    sql: ${TABLE}."AREA_EXECUTOR" ;;
  }

  dimension: area_requisitante {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Área do Requisitante"
    description: "Área de trabalho do requisitante"
    sql: ${TABLE}."AREA_REQUISITANTE" ;;
  }

  dimension: assuntoprincipalcontatocorrecao {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Assunto Principal do Contato (Correção)"
    description: "Ação de troca de status"
    sql: ${TABLE}."ASSUNTOPRINCIPALCONTATOCORRECAO" ;;
  }

  dimension: assuntoprincipaldocontato {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Assunto Principal do Contato"
    description: "Motivo de contato"
    sql: ${TABLE}."ASSUNTOPRINCIPALDOCONTATO" ;;
  }

  dimension: automacaomarketingonline {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Automação Marketing Online"
    description: "Ação tomada em casos de MGM"
    sql: ${TABLE}."AUTOMACAOMARKETINGONLINE" ;;
  }

  dimension: automacaotier2_trocadestatus {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Automação Tier 2 Troca de Status"
    description: "Informação da automação em troca de status"
    sql: ${TABLE}."AUTOMACAOTIER2TROCADESTATUS" ;;
  }

  dimension: autorizanovaanalisedaies {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Autoriza nova análise da IES"
    description: "Subprocesso de Cancelamento"
    sql: ${TABLE}."AUTORIZANOVAANALISEDAIES" ;;
  }

  dimension: avaliacaodaexcecao {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Avaliação da Exceção"
    description: "Status da avaliação de exceção no chamado de Risco P10"
    sql: ${TABLE}."AVALIACAODAEXCECAO" ;;
  }

  dimension: casodepfies {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Caso de P-FIES"
    description: "Informação para Risco P10"
    sql: ${TABLE}."CASODEPFIES" ;;
  }

  dimension: categoria {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Caso de P-FIES"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."CATEGORIA" ;;
  }

  dimension: cep {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "CEP do Requisitante"
    description: "CEP do Requisitante"
    sql: ${TABLE}."CEP" ;;
  }

  dimension: chamadocentralatendimento {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Chamado Central de Atendimento"
    description: "Origem solicitada em casos de Risco P10"
    sql: ${TABLE}."CHAMADOCENTRALATENDIMENTO" ;;
  }

  dimension: compradecarteira {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Compra de Carteira"
    description: "Informação de origem em Anonimização"
    sql: ${TABLE}."COMPRADECARTEIRA" ;;
  }

  dimension: comunicacaodisparadaporitau {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Comunicação disparada por Itau"
    description: "Informação para Anonimização"
    sql: ${TABLE}."COMUNICACAODISPARADAPORITAU" ;;
  }

  dimension: cpf {
    type: string
    group_label: "Dados do Usuário"
    group_item_label: "CPF"
    description: "CPF do usuário que pediu a abertura do chamado"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: cpf_2 {
    type: string
    group_label: "Dados do Usuário"
    group_item_label: "CPF 2"
    sql: ${TABLE}."CPF_2" ;;
  }

  dimension: cpf_do_aluno {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "CPF do Aluno"
    sql: ${TABLE}."CPF_DO_ALUNO" ;;
  }

  dimension: cpfdocliente {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "CPF do Cliente"
    description: "Anonimização de dados - CPF do requisitante"
    sql: ${TABLE}."CPFDOCLIENTE" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_atualizacao {
    type: time
    label: "Atualização"
    description: "Data de atualização"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension_group: data_expectativa_conclusao {
    type: time
    label: "Expectativa Conclusão"
    description: "Data prevista para resolução baseado no que é configurado de Lead Time"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_EXPECTATIVA_CONCLUSAO" ;;
  }

  dimension_group: data_fim_task {
    type: time
    label: "Fim da Tarefa"
    description: "Fim da Tarefa"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_FIM_TASK" ;;
  }

  dimension_group: data_inicio_task {
    type: time
    label: "Início da Tarefa"
    description: "Início da Tarefa"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_INICIO_TASK" ;;
  }

  dimension: descricao_resultado {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Descrição Resultado"
    description: "Descrição do resultado do chamado"
    sql: ${TABLE}."DESCRICAO_RESULTADO" ;;
  }

  dimension: descricaodasolicitacao {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Descrição da Solicitação"
    description: "Descrição do chamado"
    sql: ${TABLE}."DESCRICAODASOLICITACAO" ;;
  }

  dimension: descricaodasolicitacaodeexclusao {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Descrição da Solicitação de Exclusão"
    description: "Descrição do motivo para exclusão de dados"
    sql: ${TABLE}."DESCRICAODASOLICITACAODEEXCLUSAO" ;;
  }

  dimension: descricaodasolicitao_2 {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Descrição da Solicitação 2"
    description: "Motivo de chamado de cobrança"
    sql: ${TABLE}."DESCRICAODASOLICITAO_2" ;;
  }

  dimension: detalhamento_solicitacao {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Detalhamento da Solicitação"
    description: "Detalhamento da Solicitação"
    sql: ${TABLE}."DETALHAMENTO_SOLICITACAO" ;;
  }

  dimension: email {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "E-mail do Requisitante"
    description: "E-mail do Requisitante"
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: emaildoaluno {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "E-mail do Aluno"
    description: "E-mail do Aluno"
    sql: ${TABLE}."EMAILDOALUNO" ;;
  }

  dimension: emaildocliente {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "E-mail do Cliente"
    description: "E-mail do Cliente"
    sql: ${TABLE}."EMAILDOCLIENTE" ;;
  }

  dimension: flg_primeira_task {
    type: yesno
    group_label: "Dados da Task"
    group_item_label: "FLG Primeira Task?"
    description: "Identifica se é a primeira task"
    sql: ${TABLE}."FLG_PRIMEIRA_TASK" ;;
  }

  dimension: flg_processo_em_andamento {
    type: yesno
    group_label: "Dados da Task"
    group_item_label: "FLG Processo em andamento?"
    description: "Identifica se o processo está em andamento"
    sql: ${TABLE}."FLG_PROCESSO_EM_ANDAMENTO" ;;
  }

  dimension: flg_task_em_andamento {
    type: yesno
    group_label: "Dados da Task"
    group_item_label: "FLG Task em andamento?"
    description: "Identifica se a task está em andamento"
    sql: ${TABLE}."FLG_TASK_EM_ANDAMENTO" ;;
  }

  dimension: flg_task_sem_atraso {
    type: yesno
    group_label: "Dados da Task"
    group_item_label: "FLG Task sem atraso?"
    description: "Identifica se a task está em atraso"
    sql: ${TABLE}."FLG_TASK_SEM_ATRASO" ;;
  }

  dimension: flg_ultima_task {
    type: string
    group_label: "Dados da Task"
    group_item_label: "FLG última Task?"
    description: "Identifica se é a última task"
    sql: ${TABLE}."FLG_ULTIMA_TASK" ;;
  }

  dimension: flg_ultima_task_manual {
    type: yesno
    group_label: "Dados da Task"
    group_item_label: "FLG última Task manual?"
    description: "Identifica se é a última task"
    sql: ${TABLE}."FLG_ULTIMA_TASK_MANUAL" ;;
  }

  dimension: id_instance_task {
    type: number
    group_label: "Dados da Task"
    group_item_label: "ID da Task"
    description: "Número da Task"
    sql: ${TABLE}."ID_INSTANCE_TASK" ;;
  }

  dimension: ies {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "IES"
    description: "IES"
    sql: ${TABLE}."IES" ;;
  }

  dimension: ies1 {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "IES do Aluno do Chamado de Cobrança"
    description: "IES do aluno do chamado de Cobrança"
    sql: ${TABLE}."IES1" ;;
  }

  dimension: iesdoaluno {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "IES do Aluno"
    description: "IES do aluno"
    sql: ${TABLE}."IESDOALUNO" ;;
  }

  measure: lead_time_task {
    type: sum
    group_label: "Dados da Task"
    group_item_label: "Lead Time da Task"
    description: "Lead Time de conclusão do chamado"
    sql: ${TABLE}."LEAD_TIME_TASK" ;;
  }

  dimension: login_executor {
    type: string
    group_label: "Dados do Executor"
    group_item_label: "Login Executor"
    description: "Login do executor da tarefa"
    sql: ${TABLE}."LOGIN_EXECUTOR" ;;
  }

  dimension: login_requisitante {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Login Requisitante"
    description: "Login do requisitante da tarefa"
    sql: ${TABLE}."LOGIN_REQUISITANTE" ;;
  }

  dimension: matricula {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Matrícula do Aluno"
    description: "Número de matrícula do aluno"
    sql: ${TABLE}."MATRICULA" ;;
  }

  dimension_group: max_data_chamado {
    type: time
    label: "Finalização Chamado Max"
    description: "Data Max de finalização da task"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."MAX_DATA_CHAMADO" ;;
  }

  dimension_group: min_data_chamado {
    type: time
    label: "Finalização Chamado Min"
    description: "Data Min de finalização da task"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."MIN_DATA_CHAMADO" ;;
  }

  dimension: motivo_contato {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Motivo de Contato"
    description: "Motivo de contato do chamado"
    sql: ${TABLE}."MOTIVO_CONTATO" ;;
  }

  dimension: motivodaaberturadochamado {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Motivo Abertura Chamado Cobrança"
    description: "Motivo de contato de Cobrança"
    sql: ${TABLE}."MOTIVODAABERTURADOCHAMADO" ;;
  }

  dimension: motivodaexcecao {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Motivo da Exceção"
    description: "Motivo do pedido de exceção no chamado de Risco P10"
    sql: ${TABLE}."MOTIVODAEXCECAO" ;;
  }

  dimension: motivodecancelamento {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Motivo de Cancelamento"
    description: "Subprocesso de Cancelamento"
    sql: ${TABLE}."MOTIVODECANCELAMENTO" ;;
  }

  dimension: nome_executor {
    type: string
    group_label: "Dados do Executor"
    group_item_label: "Nome Executor"
    description: "Nome do executor da tarefa"
    sql: ${TABLE}."NOME_EXECUTOR" ;;
  }

  dimension: nome_fila {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Nome da Fila"
    description: "Nome da Fila"
    sql: ${TABLE}."NOME_FILA" ;;
  }

  dimension: nome_requisitante {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Nome do Requisitante"
    description: "Nome do Requisitante"
    sql: ${TABLE}."NOME_REQUISITANTE" ;;
  }

  dimension: nome_task {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Nome da Task"
    description: "Nome da tarefa"
    sql: ${TABLE}."NOME_TASK" ;;
  }

  dimension: nomecompleto {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Nome Completo"
    description: "Informação de nome em Anonimização"
    sql: ${TABLE}."NOMECOMPLETO" ;;
  }

  dimension: nomedoaluno {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Nome do Aluno"
    description: "Nome do Aluno"
    sql: ${TABLE}."NOMEDOALUNO" ;;
  }

  dimension: numero_chamado {
    type: number
    group_label: "Dados do Chamado"
    group_item_label: "Número do Chamado"
    description: "ID do chamado"
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
  }

  dimension: numerochamadoematraso {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Número do Chamado em Atraso"
    description: "Número do chamado em atraso, para informação em P24"
    sql: ${TABLE}."NUMEROCHAMADOEMATRASO" ;;
  }

  dimension: numerodocontratoqueelequercancelar {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Número do Contrato para Cancelar"
    description: "Subprocesso de Cancelamento"
    sql: ${TABLE}."NUMERODOCONTRATOQUEELEQUERCANCELAR" ;;
  }

  dimension: observacoes1 {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Número do Contrato para Cancelar"
    description: "Retorno do chamado de Prioridade Zero"
    sql: ${TABLE}."OBSERVACOES1" ;;
  }

  dimension: origemdasolicitacao {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Origem da Solicitação"
    description: "Origem da solicitação em P24"
    sql: ${TABLE}."ORIGEMDASOLICITACAO" ;;
  }

  dimension: posicao_executor {
    type: string
    group_label: "Dados do Executor"
    group_item_label: "Posição Executor"
    description: "Posição do executor da tarefa"
    sql: ${TABLE}."POSICAO_EXECUTOR" ;;
  }

  dimension: posicao_requisitante {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Posição Requisitante"
    description: "Posição do requisitante da tarefa"
    sql: ${TABLE}."POSICAO_REQUISITANTE" ;;
  }

  dimension: precisareanaliseinterfile {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Precisa Reanalisar Interfile"
    description: "Informação em Análise de documentos"
    sql: ${TABLE}."PRECISAREANALISEINTERFILE" ;;
  }

  dimension: qualonumerodocontrato {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Numero do contrato do aluno"
    description: "Numero do contrato do aluno"
    sql: ${TABLE}."QUALONUMERODOCONTRATO" ;;
  }

  dimension: rendaatualizada {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Renda Atualizada"
    description: "Informação para Risco P10"
    sql: ${TABLE}."RENDAATUALIZADA" ;;
  }

  measure: sla {
    type: sum
    group_label: "Dados do Chamado"
    group_item_label: "SLA"
    description: "SLA do Chamado"
    sql: ${TABLE}."SLA" ;;
  }

  dimension: status_processo {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Status do Processo"
    description: "Status do Chamado"
    sql: ${TABLE}."STATUS_PROCESSO" ;;
  }

  dimension: status_task {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Status Task"
    description: "Status da Task"
    sql: ${TABLE}."STATUS_TASK" ;;
  }

  dimension: subcategoria_app {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria App"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_APP" ;;
  }

  dimension: subcategoria_boletos {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Boletos"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_BOLETOS" ;;
  }

  dimension: subcategoria_canais_ies {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Canais IES"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_CANAIS_IES" ;;
  }

  dimension: subcategoria_cessao {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Cessão"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_CESSAO" ;;
  }

  dimension: subcategoria_cobranca {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Cobrança"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_COBRANCA" ;;
  }

  dimension: subcategoria_compra_carteira {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Compra de Carteira"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_COMPRA_CARTEIRA" ;;
  }

  dimension: subcategoria_contratacao_form {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Contratação Form"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_CONTRATACAO_FORM" ;;
  }

  dimension: subcategoria_infra_devops {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Infra DevOps"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_INFRA_DEVOPS" ;;
  }

  dimension: subcategoria_portal {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Portal"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_PORTAL" ;;
  }

  dimension: subcategoria_proposta {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Proposta"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_PROPOSTA" ;;
  }

  dimension: subcategoria_risco {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Risco"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_RISCO" ;;
  }

  dimension: subcategoria_sem_fiador {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Sem Fiador"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_SEM_FIADOR" ;;
  }

  dimension: subcategoria_site {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Subcategoria Site"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_SITE" ;;
  }

  dimension: supervisorresponsavel {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Supervisor Responsável"
    description: "Supervisor Responsável"
    sql: ${TABLE}."SUPERVISORRESPONSAVEL" ;;
  }

  dimension: telefonecelular {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Celular"
    description: "Telefone celular do requisitante"
    sql: ${TABLE}."TELEFONECELULAR" ;;
  }

  dimension: temcontratacaocedida {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Tem Contratação Cedida?"
    description: "Anonimização de dados - Contratação Cedida"
    sql: ${TABLE}."TEMCONTRATACAOCEDIDA" ;;
  }

  measure: tempo_desde_abertura_horas {
    type: sum
    group_label: "Dados do Chamado"
    group_item_label: "Tempo desde Abertura (Horas)"
    description: "Tempo desde a abertura do chamado"
    sql: ${TABLE}."TEMPO_DESDE_ABERTURA_HORAS" ;;
  }

  dimension: ticketzendesk {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Ticket Zendesk"
    description: "Ticket do Zendesk relativo a abertura do chamado"
    sql: ${TABLE}."TICKETZENDESK" ;;
  }

  dimension: tratativadocaso {
    type: string
    group_label: "Dados da Task"
    group_item_label: "Tratativa do Caso"
    description: "Subprocesso de Cobrança"
    sql: ${TABLE}."TRATATIVADOCASO" ;;
  }

}
