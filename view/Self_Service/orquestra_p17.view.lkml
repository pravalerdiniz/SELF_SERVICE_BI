view: orquestra_p17 {
  sql_table_name: POS_GRADUADO.CS.ORQUESTRA_P17
    ;;


  dimension: acordotrocadevencimento {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Acordo Troca de Vencimento"
    description: "Informação para Risco P10"
    sql: ${TABLE}."ACORDOTROCADEVENCIMENTO" ;;
  }

  dimension: alunojapagoualgumaparcela {
    type: string
    hidden: yes
    group_label: "Dados do Chamado"
    group_item_label: "Aluno já pagou alguma parcela?"
    sql: ${TABLE}."ALUNOJAPAGOUALGUMAPARCELA" ;;
  }

  dimension: analiseefetuada {
    type: string
    hidden: yes
    group_label: "Dados do Chamado"
    group_item_label: "Análise efetuada?"
    sql: ${TABLE}."ANALISEEFETUADA" ;;
  }

  dimension: analiserealizada {
    type: string
    hidden: yes
    group_label: "Dados do Chamado"
    group_item_label: "Análise realizada?"
    sql: ${TABLE}."ANALISEREALIZADA" ;;
  }

  dimension: analisesolicitacaorealizadapelaarea {
    type: string
    hidden: yes
    group_label: "Dados do Chamado"
    group_item_label: "Solicitação realizada pela área?"
    description: "Ações tomadas no chamados especificos"
    sql: ${TABLE}."ANALISESOLICITACAOREALIZADAPELAAREA" ;;
  }

  dimension: area_responsavel {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Área Responsável"
    description: "Área responsavel pela tarefa"
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

  dimension: assunto_principal_contato_correcao {
    type: string
    hidden: yes
    group_label: "Dados do Chamado"
    group_item_label: "Assunto Principal do Contato (Correção)"
    description: "Ação de troca de status"
    sql: ${TABLE}."ASSUNTOPRINCIPALCONTATOCORRECAO" ;;
  }

  dimension: assunto_principal_contato {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Assunto Principal do Contato"
    description: "Motivo de contato"
    sql: ${TABLE}."ASSUNTOPRINCIPALDOCONTATO" ;;
  }

  dimension: automacaomarketingonline {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Automação Marketing Online"
    description: "Ação tomada em casos de MGM"
    sql: ${TABLE}."AUTOMACAOMARKETINGONLINE" ;;
  }

  dimension: automacao_tier2_troca_status {
    type: string
    group_label: "Dados da Tarefa"
    group_item_label: "Automação Tier 2 Troca de Status"
    description: "Informação da automação em troca de status"
    sql: ${TABLE}."AUTOMACAOTIER2TROCADESTATUS" ;;
  }

  dimension: autoriza_nova_analise_ies {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Autoriza nova análise da IES"
    description: "Subprocesso de Cancelamento"
    sql: ${TABLE}."AUTORIZANOVAANALISEDAIES" ;;
  }

  dimension: avaliacao_excecao {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Avaliação da Exceção"
    description: "Status da avaliação de exceção no chamado de Risco P10"
    sql: ${TABLE}."AVALIACAODAEXCECAO" ;;
  }

  dimension: casodepfies {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Caso de P-FIES"
    description: "Informação para Risco P10"
    sql: ${TABLE}."CASODEPFIES" ;;
  }

  dimension: categoria {
    type: string
    group_label: "Dados da Tarefa"
    group_item_label: "Categoria"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."CATEGORIA" ;;
  }

  dimension: cep {
    type: string
    hidden: yes
    group_label: "Dados do Requisitante"
    group_item_label: "CEP do Requisitante"
    description: "CEP do Requisitante"
    sql: ${TABLE}."CEP" ;;
  }

  dimension: chamadocentralatendimento {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Chamado Central de Atendimento"
    description: "Origem solicitada em casos de Risco P10"
    sql: ${TABLE}."CHAMADOCENTRALATENDIMENTO" ;;
  }

  dimension: compradecarteira {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Compra de Carteira"
    description: "Informação de origem em Anonimização"
    sql: ${TABLE}."COMPRADECARTEIRA" ;;
  }

  dimension: comunicacaodisparadaporitau {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Comunicação disparada por Itau"
    description: "Informação para Anonimização"
    sql: ${TABLE}."COMUNICACAODISPARADAPORITAU" ;;
  }

  dimension: cpf {
    type: string
    hidden: yes
    group_label: "Dados do Usuário"
    group_item_label: "CPF"
    description: "CPF do usuário que pediu a abertura do chamado"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: cpf_2 {
    type: string
    hidden: yes
    group_label: "Dados do Usuário"
    group_item_label: "CPF 2"
    sql: ${TABLE}."CPF_2" ;;
  }

  dimension: cpf_do_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "CPF do Aluno"
    sql: ${TABLE}."CPF_DO_ALUNO" ;;
  }

  dimension: cpf_aluno {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "CPF do Aluno"
    description: "Anonimização de dados - CPF do requisitante"
    sql: ${TABLE}."CPFDOCLIENTE" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: chamado_atualizacao {
    type: time
    label: "Chamado - Atualização"
    description: "Data de última atualização do chamado."
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

  dimension_group: tarefa_expectativa_conclusao {
    type: time
    label: "Tarefa - Expectativa Conclusão"
    description: "Data prevista para conclusão da tarefa, baseado no que é configurado de Lead Time."
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

  dimension_group: tarefa_finalizacao {
    type: time
    label: "Tarefa - Finalização"
    description: "Data de finalização da Tarefa."
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

  dimension_group: tarefa_inicio {
    type: time
    label: "Tarefa - Início"
    description: "Data de início da Tarefa."
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

  dimension: descricao_solicitacao {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Descrição da Solicitação"
    description: "Descrição do chamado"
    sql: ${TABLE}."DESCRICAODASOLICITACAO" ;;
  }

  dimension: descricao_solicitacao_exclusao {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Descrição da Solicitação de Exclusão"
    description: "Descrição do motivo para exclusão de dados"
    sql: ${TABLE}."DESCRICAODASOLICITACAODEEXCLUSAO" ;;
  }

  dimension: descricao_solicitao_2 {
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
    group_label: "Dados do Aluno"
    group_item_label: "E-mail do Aluno"
    description: "E-mail do Aluno"
    sql: ${TABLE}."EMAILDOALUNO" ;;
  }

  dimension: email_cliente {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "E-mail do Aluno"
    description: "E-mail do Aluno"
    sql: ${TABLE}."EMAILDOCLIENTE" ;;
  }

  dimension: flg_primeira_tarefa {
    type: yesno
    group_label: "Dados da Tarefa"
    group_item_label: "[FLG] Primeira tarefa?"
    description: "Identifica se é a primeira tarefa do chamado."
    sql: ${TABLE}."FLG_PRIMEIRA_TASK" ;;
  }

  dimension: flg_processo_em_andamento {
    type: yesno
    group_label: "Dados do Chamado"
    group_item_label: "[FLG] Chamado em andamento?"
    description: "Identifica se o chamado está em andamento"
    sql: ${TABLE}."FLG_PROCESSO_EM_ANDAMENTO" ;;
  }

  dimension: flg_tarefa_em_andamento {
    type: yesno
    group_label: "Dados da Tarefa"
    group_item_label: "[FLG] Tarefa em andamento?"
    description: "Identifica se a tarefa está em andamento"
    sql: ${TABLE}."FLG_TASK_EM_ANDAMENTO" ;;
  }

  dimension: flg_task_sem_atraso {
    type: yesno
    group_label: "Dados da Tarefa"
    group_item_label: "[FLG] Tarefa sem atraso?"
    description: "Identifica se a tarefa está em atraso"
    sql: ${TABLE}."FLG_TASK_SEM_ATRASO" ;;
  }

  dimension: flg_ultima_task {
    type: string
    group_label: "Dados da Tarefa"
    group_item_label: "[FLG] Última tarefa?"
    description: "Identifica se é a última tarefa"
    sql: ${TABLE}."FLG_ULTIMA_TASK" ;;
  }

  dimension: flg_ultima_tarefa_manual {
    type: yesno
    group_label: "Dados da Tarefa"
    group_item_label: "[FLG] Última tarefa manual?"
    description: "Identifica se é a última task"
    sql: ${TABLE}."FLG_ULTIMA_TASK_MANUAL" ;;
  }

  dimension: numero_tarefa {
    type: number
    group_label: "Dados da Tarefa"
    group_item_label: "Número da Tarefa"
    description: "Número/ID da Tarefa"
    sql: ${TABLE}."ID_INSTANCE_TASK" ;;
  }

  dimension: ies {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "IES"
    description: "IES"
    sql: ${TABLE}."IES" ;;
  }

  dimension: ies_cobranca {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "IES do Aluno (Chamado de Cobrança)"
    description: "IES do aluno do chamado de Cobrança"
    sql: ${TABLE}."IES1" ;;
  }

  dimension: ies_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "IES do Aluno"
    description: "IES do aluno"
    sql: ${TABLE}."IESDOALUNO" ;;
  }

  measure: lead_time_tarefa {
    type: sum
    group_label: "Dados da Tarefa"
    group_item_label: "Soma - Lead Time (Dias)"
    description: "Tempo em dias entre abertura e finalização da Tarefa."
    sql: ${TABLE}."LEAD_TIME_TASK" ;;
  }

  measure: lead_time_task_media {
    type: average
    group_label: "Dados da Tarefa"
    group_item_label: "Média - Lead Time (Dias)"
    description: "Média do tempo em dias entre abertura e finalização da Tarefa."
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
    group_label: "Dados do Aluno"
    group_item_label: "Matrícula do Aluno"
    description: "Número de matrícula do aluno"
    sql: ${TABLE}."MATRICULA" ;;
  }

  dimension_group: chamado_ultima_finalizacao {
    type: time
    label: "Chamado - Última Finalização"
    description: "Data de finalização da tarefa mais recente do chamado. Não quer dizer que o chamado já está finalizado."
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

  dimension_group: chamado_primeira_finalizacao {
    type: time
    label: "Chamado - Primeira Finalização"
    description: "Data de finalização da primeira tarefa dentro do chamado. Ou seja, data em que o chamado foi aberto."
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

  dimension: motivo_abertura_chamado {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Motivo Abertura Chamado (Cobrança)"
    description: "Motivo de contato de Cobrança"
    sql: ${TABLE}."MOTIVODAABERTURADOCHAMADO" ;;
  }

  dimension: motivo_excecao {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Motivo da Exceção"
    description: "Motivo do pedido de exceção no chamado de Risco P10"
    sql: ${TABLE}."MOTIVODAEXCECAO" ;;
  }

  dimension: motivodecancelamento {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
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
    description: "Nome da Fila/Processo da solicitação"
    sql: ${TABLE}."NOME_FILA" ;;
  }

  dimension: nome_requisitante {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Nome do Requisitante"
    description: "Nome do Requisitante"
    sql: ${TABLE}."NOME_REQUISITANTE" ;;
  }

  dimension: nome_tarefa {
    type: string
    group_label: "Dados da Tarefa"
    group_item_label: "Nome da Tarefa"
    description: "Nome da tarefa"
    sql: ${TABLE}."NOME_TASK" ;;
  }

  dimension: nome_completo {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Nome Completo"
    description: "Informação de nome em Anonimização"
    sql: ${TABLE}."NOMECOMPLETO" ;;
  }

  dimension: nome_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Nome do Aluno"
    description: "Nome do Aluno"
    sql: ${TABLE}."NOMEDOALUNO" ;;
  }

  dimension: numero_chamado {
    type: number
    group_label: "Dados do Chamado"
    group_item_label: "Número do Chamado"
    description: "Número/ID do chamado"
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
  }

  dimension: numero_chamado_atraso {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Número do Chamado em Atraso (P24)"
    description: "Número do chamado em atraso, para informação em P24"
    sql: ${TABLE}."NUMEROCHAMADOEMATRASO" ;;
  }

  dimension: numero_contrato_cancelar {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Número do Contrato para Cancelar"
    description: "Subprocesso de Cancelamento"
    sql: ${TABLE}."NUMERODOCONTRATOQUEELEQUERCANCELAR" ;;
  }

  dimension: observacoes {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Observações"
    description: "Retorno do chamado de Prioridade Zero"
    sql: ${TABLE}."OBSERVACOES1" ;;
  }

  dimension: origemdasolicitacao {
    type: string
    hidden: yes
    group_label: "Dados do Chamado"
    group_item_label: "Origem da Solicitação (P24)"
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

  dimension: precisa_reanalise_interfile {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Precisa Reanalise Interfile"
    description: "Informação em Análise de documentos"
    sql: ${TABLE}."PRECISAREANALISEINTERFILE" ;;
  }

  dimension: numero_contrato {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Numero do contrato"
    description: "Numero do contrato do aluno"
    sql: ${TABLE}."QUALONUMERODOCONTRATO" ;;
  }

  dimension: renda_atualizada {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Renda Atualizada"
    description: "Informação para Risco P10"
    sql: ${TABLE}."RENDAATUALIZADA" ;;
  }

  measure: sla {
    type: sum
    group_label: "Dados da Tarefa"
    group_item_label: "SLA para conclusão (Horas)"
    description: "SLA para conclusão da tarefa em horas"
    sql: ${TABLE}."SLA" ;;
  }

  dimension: status_chamado {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Status do Chamado"
    description: "Indica o status do chamado (CONCLUIDO, EM ANDAMENTO, REJEITADO...)"
    sql: ${TABLE}."STATUS_PROCESSO" ;;
  }

  dimension: status_tarefa {
    type: string
    group_label: "Dados da Tarefa"
    group_item_label: "Status da Tarefa"
    description: "Indica o status da tarefa (CONCLUIDO, EM ANDAMENTO, REJEITADO...)"
    sql: ${TABLE}."STATUS_TASK" ;;
  }

  dimension: subcategoria_app {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria App"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_APP" ;;
  }

  dimension: subcategoria_boletos {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Boletos"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_BOLETOS" ;;
  }

  dimension: subcategoria_canais_ies {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Canais IES"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_CANAIS_IES" ;;
  }

  dimension: subcategoria_cessao {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Cessão"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_CESSAO" ;;
  }

  dimension: subcategoria_cobranca {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Cobrança"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_COBRANCA" ;;
  }

  dimension: subcategoria_compra_carteira {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Compra de Carteira"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_COMPRA_CARTEIRA" ;;
  }

  dimension: subcategoria_contratacao_form {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Contratação Form"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_CONTRATACAO_FORM" ;;
  }

  dimension: subcategoria_infra_devops {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Infra DevOps"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_INFRA_DEVOPS" ;;
  }

  dimension: subcategoria_portal {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Portal"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_PORTAL" ;;
  }

  dimension: subcategoria_proposta {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Proposta"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_PROPOSTA" ;;
  }

  dimension: subcategoria_risco {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Risco"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_RISCO" ;;
  }

  dimension: subcategoria_sem_fiador {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Sem Fiador"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_SEM_FIADOR" ;;
  }

  dimension: subcategoria_site {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Subcategoria Site"
    description: "Motivo de contato de Helpdesk"
    sql: ${TABLE}."SUBCATEGORIA_SITE" ;;
  }

  dimension: supervisorresponsavel {
    type: string
    hidden: yes
    group_label: "Dados da Tarefa"
    group_item_label: "Supervisor Responsável"
    description: "Supervisor Responsável"
    sql: ${TABLE}."SUPERVISORRESPONSAVEL" ;;
  }

  dimension: celular {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Celular"
    description: "Telefone celular do aluno"
    sql: ${TABLE}."TELEFONECELULAR" ;;
  }

  dimension: temcontratacaocedida {
    type: string
    hidden: yes
    group_label: "Dados do Chamado"
    group_item_label: "Tem Contratação Cedida?"
    description: "Anonimização de dados - Contratação Cedida"
    sql: ${TABLE}."TEMCONTRATACAOCEDIDA" ;;
  }

  measure: tempo_desde_abertura_chamado {
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
    group_label: "Dados da Tarefa"
    group_item_label: "Tratativa do Caso"
    description: "Subprocesso de Cobrança"
    sql: ${TABLE}."TRATATIVADOCASO" ;;
  }

  measure: quantidade_chamados {
    type: count_distinct
    sql: ${numero_chamado} ;;
    group_item_label: "Quantidade Chamados"
    description: "Contagem de Chamados"
  }

  measure: quantidade_tarefas {
    type: count_distinct
    sql: ${numero_tarefa} ;;
    group_item_label: "Quantidade Tarefas"
    description: "Contagem de Tarefas"
  }

}
