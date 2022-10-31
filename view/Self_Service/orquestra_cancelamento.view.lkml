view: orquestra_cancelamento {
  sql_table_name: POS_GRADUADO.CS.ORQUESTRA_CANCELAMENTO
    ;;

  dimension: pagou_parcela {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Pagou Parcela?"
    description: "CAMPO DO FORMULÁRIO INFORMANDO SE O ALUNO JÁ PAGOU ALGUMA PARCELA"
    sql: ${TABLE}."ALUNOJAPAGOUALGUMAPARCELA" ;;
  }

  dimension: analise_efetuada {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Análise efetuada?"
    description: "CAMPO DO FORMULÁRIO INFORMANDO SE A ANÁLISE FOI EFETUADA"
    sql: ${TABLE}."ANALISEEFETUADA" ;;
  }

  dimension: area_executor {
    type: string
    group_label: "Dados do Executor"
    group_item_label: "Área do Executor"
    description: "NOME DA ÁREA DO USUARIO QUE REALIZOU/EXECUTOU A TAREFA (TASK)"
    sql: ${TABLE}."AREA_EXECUTOR" ;;
  }

  dimension: area_requisitante {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Área Requisitante"
    description: "NOME DA ÁREA QUE O REQUISITANTE FAZ PARTE"
    sql: ${TABLE}."AREA_REQUISITANTE" ;;
  }

  dimension: assuntoprincipaldocontato {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Assunto principal"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O ASSUNTO PRINCIPAL DO CONTATO"
    sql: ${TABLE}."ASSUNTOPRINCIPALDOCONTATO" ;;
  }

  dimension: autorizanovaanalisedaies {
    type: string
    group_label: "Dados do Chamado"
    group_item_label: "Autoriza nova análise da IES"
    description: "CAMPO DO FORMULÁRIO INFORMANDO SE AUTORIZA NOVA ANALISE DA IES"
    sql: ${TABLE}."AUTORIZANOVAANALISEDAIES" ;;
  }

  dimension: codigo_resultado {
    type: number
    group_label: "Dados do Chamado"
    group_item_label: "Código resultado"
    description: "INDICA O CODIGO DO RESULTADO DA TAREFA (TASK)"
    sql: ${TABLE}."CODIGO_RESULTADO" ;;
  }

  dimension: cpf {
    type: number
    group_label: "Dados do Requisitante"
    group_item_label: "CPF"
    description: "NUMERO DO CPF DO ALUNO/USUÁRIO SOLICITANTE"
    sql: ${TABLE}."CPF" ;;
  }


  dimension_group: data_atualizacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month,
      week_of_year
    ]
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
    group_item_label: "Data atualização"
    description: "DATA/HORA QUE O REGISTRO FOI ATUALIZADO"
  }

  dimension_group: data_carga {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month,
      week_of_year
    ]
    sql: ${TABLE}."DATA_CARGA" ;;
    group_item_label: "Data Carga"
    description: "DATA/HORA QUE O REGISTRO FOI CARREGADO"
  }

  dimension_group: data_expectativa_conclusao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month,
      week_of_year
    ]
    sql: ${TABLE}."DATA_EXPECTATIVA_CONCLUSAO" ;;
    group_item_label: "Data expectativa conclusão"
    description: "DATA DE EXPECTATIVA DA CONCLUSÃO DA TASK"
  }

  dimension_group: data_fim_task {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month,
      week_of_year
    ]
    sql: ${TABLE}."DATA_FIM_TASK" ;;
    group_item_label: "Data fim Task"
    description: "DATA E HORA DA FINALIZAÇÃO DA TAREFA (TASK)"
  }

  dimension_group: data_inicio_task {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month,
      week_of_year
    ]
    sql: ${TABLE}."DATA_INICIO_TASK" ;;
    group_item_label: "Data Início Task"
    description: "DATA E HORA DO INICIO DA TAREFA (TASK)"
  }

  dimension: descrevaoretornodoseucaso {
    type: string
    sql: ${TABLE}."DESCREVAORETORNODOSEUCASO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Descrição chamado"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O RETORNO DO CASO"
  }

  dimension: descricao_resultado {
    type: string
    sql: ${TABLE}."DESCRICAO_RESULTADO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Descrição Resultado"
    description: "DESCRIÇÃO DO RESULTADO DA TAREFA (TASK)"
  }

  dimension: descricaodasolicitacao {
    type: string
    sql: ${TABLE}."DESCRICAODASOLICITACAO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Descrição Solicitação"
    description: "CAMPO DO FORMULÁRIO INFORMANDO A DESCRIÇÃO DA SOLICITAÇÃO"
  }

  dimension: emaildoaluno {
    type: string
    sql: ${TABLE}."EMAILDOALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Email aluno"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O EMAIL DO ALUNO"
  }

  dimension: flg_primeira_task {
    type: string
    sql: ${TABLE}."FLG_PRIMEIRA_TASK" ;;
    group_label: "Dados da Task"
    group_item_label: "Flag primeira Task"
    description: "INDICA SE É A PRIMEIRA TAREFA (TASK) DO CHAMADO"
  }

  dimension: flg_processo_em_andamento {
    type: yesno
    sql: ${TABLE}."FLG_PROCESSO_EM_ANDAMENTO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Flag Processo em andamento"
    description: "INDICA SE O CHAMADO ESTÁ EM ANDAMENTO"
  }

  dimension: flg_task_em_andamento {
    type: yesno
    sql: ${TABLE}."FLG_TASK_EM_ANDAMENTO" ;;
    group_label: "Dados da Task"
    group_item_label: "Flag Task em andamento"
    description: "INDICA SE A TASK ESTÁ EM ANDAMENTO"
  }

  dimension: flg_task_sem_atraso {
    type: yesno
    sql: ${TABLE}."FLG_TASK_SEM_ATRASO" ;;
    group_label: "Dados da Task"
    group_item_label: "Flag Task sem atraso"
    description: "INDICA COMO TRUE SE A TASK FOI CONCLUÍDA SEM ATRASO"
  }

  dimension: flg_ultima_task {
    type: string
    sql: ${TABLE}."FLG_ULTIMA_TASK" ;;
    group_label: "Dados da Task"
    group_item_label: "Flag última Task"
    description: "INDICA SE É A ULTIMA TAREFA (TASK) ATÉ O MOMENTO"
  }

  dimension: flg_ultima_task_manual {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMA_TASK_MANUAL" ;;
    group_label: "Dados da Task"
    group_item_label: "Flag última task manual"
    description: "INDICA SE É A ULTIMA TAREFA DO CHAMADO COM INTERAÇÃO MANUAL"
  }

  dimension: haveracancelamento {
    type: string
    sql: ${TABLE}."HAVERACANCELAMENTO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Haverá cancelamento?"
    description: "CAMPO DO FORMULÁRIO INFORMANDO SE HAVERÁ CANCELAMENTO"
  }

  dimension: houverepasse {
    type: string
    sql: ${TABLE}."HOUVEREPASSE" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Houve Repasse?"
    description: "CAMPO DO FORMULÁRIO INFORMANDO SE HOUVE REPASSE"
  }

  dimension: id_instance_task {
    type: number
    sql: ${TABLE}."ID_INSTANCE_TASK" ;;
    group_label: "Dados da Task"
    group_item_label: "ID Task"
    description: "ID DA INSTÂNCIA DA TASK"
  }

  dimension: iesdoaluno {
    type: string
    sql: ${TABLE}."IESDOALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Nome Instituição aluno"
    description: "CAMPO DO FORMULÁRIO INFORMANDO A IES DO ALUNO"
  }

  dimension: lead_time_task {
    type: string
    sql: ${TABLE}."LEAD_TIME_TASK" ;;
    group_label: "Dados da Task"
    group_item_label: "Lead Time Task"
    description: "INDICA O LEAD TIME EM HORAS CADASTRADO PARA A TAREFA"
  }

  dimension: login_executor {
    type: string
    sql: ${TABLE}."LOGIN_EXECUTOR" ;;
    group_label: "Dados do Executor"
    group_item_label: "Login executor"
    description: "LOGIN DO USUARIO QUE REALIZOU/EXECUTOU A TAREFA (TASK)"
  }

  dimension: login_requisitante {
    type: string
    sql: ${TABLE}."LOGIN_REQUISITANTE" ;;
    group_label: "Dados do Requisitante"
    group_item_label: "Login Requisitante"
    description: "LOGIN DE QUEM ABRIU O CHAMADO"
  }

  dimension_group: max_data_chamado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month,
      week_of_year
    ]
    sql: ${TABLE}."MAX_DATA_CHAMADO" ;;
    group_item_label: "Data chamado - máximo"
    description: "MAIOR DATA/HORA DO CHAMADO"
  }

  dimension_group: min_data_chamado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month,
      week_of_year
    ]
    sql: ${TABLE}."MIN_DATA_CHAMADO" ;;
    group_item_label: "Data chamado - mínimo"
    description: "MENOR DATA/HORA DO CHAMADO"
  }

  dimension: motivodecancelamento {
    type: string
    sql: ${TABLE}."MOTIVODECANCELAMENTO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Motivo Cancelamento"
    description: "CAMPO DO FORMULÁRIO CONTENDO O MOTIVO DO CANCELAMENTO"
  }

  dimension: nome_executor {
    type: string
    sql: ${TABLE}."NOME_EXECUTOR" ;;
    group_label: "Dados Executor"
    group_item_label: "Nome executor"
    description: "NOME DO USUARIO QUE REALIZOU/EXECUTOU A TAREFA (TASK)"
  }

  dimension: nome_fila {
    type: string
    sql: ${TABLE}."NOME_FILA" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Nome Fila"
    description: "NOME DA FILA QUE O CHAMADO FOI ABERTO"
  }

  dimension: nome_requisitante {
    type: string
    sql: ${TABLE}."NOME_REQUISITANTE" ;;
    group_label: "Dados do Requisitante"
    group_item_label: "Nome Requisitante"
    description: "NOME DE QUEM ABRIU O CHAMADO"
  }

  dimension: nome_task {
    type: string
    sql: ${TABLE}."NOME_TASK" ;;
    group_label: "Dados da Task"
    group_item_label: "Nome Task"
    description: "NOME DA TASK QUE O CHAMADO PASSOU"
  }

  dimension: nomedoaluno {
    type: string
    sql: ${TABLE}."NOMEDOALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Nome Aluno"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O NOME DO ALUNO"
  }

  dimension: nomedocurso {
    type: string
    sql: ${TABLE}."NOMEDOCURSO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Nome Curso"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O NOME DO CURSO"
  }

  dimension: notificartier2 {
    type: string
    sql: ${TABLE}."NOTIFICARTIER2" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Notificar Tier 2"
    description: "CAMPO DO FORMULÁRIO INFORMANDO NOTIFICAR TIER 2"
  }

  dimension: numero_chamado {
    type: number
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Número chamado"
    description: "NUMERO DO CHAMADO NO ORQUESTRA"
  }

  dimension: numerodocontrato {
    type: string
    sql: ${TABLE}."NUMERODOCONTRATO" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Número do Contrato"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O NÚMERO DO CONTRATO"
  }

  dimension: numerodocontratoqueelequercancelar {
    type: string
    sql: ${TABLE}."NUMERODOCONTRATOQUEELEQUERCANCELAR" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Número do contrato que quer cancelar"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O NÚMERO DO CONTRATO QUE SE DESEJA CANCELAR"
  }

  dimension: numerototaldeparcelasemcontrato {
    type: string
    sql: ${TABLE}."NUMEROTOTALDEPARCELASEMCONTRATO" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Número parcelas - contrato"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O NÚMERO TOTAL DE PARCELAS SEM CONTRATO"
  }

  dimension: obj_mensagens {
    type: string
    sql: ${TABLE}."OBJ_MENSAGENS" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Mensagens"
    description: "OBJETO CONTENDO AS MENSAGENS QUE FORAM ENVIADAS NA TASK"
  }

  dimension: observacoes {
    type: string
    sql: ${TABLE}."OBSERVACOES" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Observações"
    description: "OBJETO CONTENDO AS MENSAGENS QUE FORAM ENVIADAS NA TASK"
  }

  dimension: observacoesdaanalise {
    type: string
    sql: ${TABLE}."OBSERVACOESDAANALISE" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Observações da análise"
    description: "CAMPO DO FORMULÁRIO INFORMANDO AS OBSERVAÇÕES DA ANÁLISE"
  }

  dimension: observacoessobreenviodecasoaies {
    type: string
    sql: ${TABLE}."OBSERVACOESSOBREENVIODECASOAIES" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Observações de envio"
    description: "CAMPO DO FORMULÁRIO INFORMANDO SOBRE O ENVIO"
  }

  dimension: posicao_executor {
    type: string
    sql: ${TABLE}."POSICAO_EXECUTOR" ;;
    group_label: "Dados do Executor"
    group_item_label: "Posição Executor"
    description: "POSICAO DO USUARIO QUE REALIZOU/EXECUTOU A TAREFA (TASK)"
  }

  dimension: posicao_requisitante {
    type: string
    sql: ${TABLE}."POSICAO_REQUISITANTE" ;;
    group_label: "Dados do Requisitante"
    group_item_label: "Posição Requisitante"
    description: "POSICAO QUE O REQUISITANTE OCUPA"
  }

  dimension: quantidadedemensalidades {
    type: string
    sql: ${TABLE}."QUANTIDADEDEMENSALIDADES" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Qtd mensalidades"
    description: "CAMPO DO FORMULÁRIO INFORMANDO A QUANTIDADE DE MENSALIDADES"
  }

  dimension: retornodaiescancelamentoindeferido {
    type: string
    sql: ${TABLE}."RETORNODAIESCANCELAMENTOINDEFERIDO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Retorno IES - Cancelamento indeferido"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O RETORNO DA IES"
  }

  dimension: selecionequalamodalidadedoalunoeseterareembolso {
    type: string
    sql: ${TABLE}."SELECIONEQUALAMODALIDADEDOALUNOESETERAREEMBOLSO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Modalidade do Curso"
    description: "CAMPO DO FORMULÁRIO INFORMANDO A MODALIDADE DO CURSO DO ALUNO"
  }

  dimension: sla {
    type: string
    sql: ${TABLE}."SLA" ;;
    group_label: "Dados do Chamado"
    group_item_label: "SLA"
    description: "INDICA O SLA CADASTRADO PARA A TAREFA"
  }

  dimension: status_processo {
    type: string
    sql: ${TABLE}."STATUS_PROCESSO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Status Processo"
    description: "STATUS ATUAL DO PROCESSO"
  }

  dimension: status_task {
    type: string
    sql: ${TABLE}."STATUS_TASK" ;;
    group_label: "Dados da Task"
    group_item_label: "Status Task"
    description: "STATUS ATUAL DA TASK"
  }

  dimension: tempo_desde_abertura_horas {
    type: string
    sql: ${TABLE}."TEMPO_DESDE_ABERTURA_HORAS" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Tempo desde a abertura"
    description: "INDICA O TEMPO QUE O CHAMADO ESTÁ ABERTO EM HORAS"
  }

  dimension: ticketzendesk {
    type: string
    sql: ${TABLE}."TICKETZENDESK" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Número ticket Zendesk"
    description: "NUMERO DO TICKET ABERTO NA ZENDESK"
  }

  dimension: valordoreembolso {
    type: string
    sql: ${TABLE}."VALORDOREEMBOLSO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Valor Reembolso"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O VALOR DO REEMBOLSO"
  }

  dimension: valorqueaiesdevolverzparaopravaler {
    type: string
    sql: ${TABLE}."VALORQUEAIESDEVOLVERZPARAOPRAVALER" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Valor devolução IES"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O VALOR QUE A IES DEVE DEVOLVER PARA O PRAVALER"
  }

  dimension: vencimentofimcancelado {
    type: string
    sql: ${TABLE}."VENCIMENTOFIMCANCELADO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Vencimento fim cancelamento"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O VENCIMENTO FIM CANCELADO"
  }

  dimension: vencimentoiniciocancelado {
    type: string
    sql: ${TABLE}."VENCIMENTOINICIOCANCELADO" ;;
    group_label: "Dados do Chamado"
    group_item_label: "Vencimento início cancelamento"
    description: "CAMPO DO FORMULÁRIO INFORMANDO O VENCIMENTO INICIO CANCELADO"
  }

  measure: count_chamados {
    type: count_distinct
    sql: ${numero_chamado} ;;
    drill_fields: [numero_chamado, nome_fila, area_requisitante, area_executor, descricao_resultado]
    group_label: "Métricas"
    group_item_label: "Qtd chamados"
    description: "Contagem de Chamados Únicos"
  }

}
