# The name of this view in Looker is "Orquestra"
view: orquestra {

  sql_table_name: "AD_HOC"."ORQUESTRA"
    ;;

  ## USUÁRIO

  dimension: nome_executor {
    type: string
    group_label: "Dados do Executor"
    group_item_label: "Nome do Executor"
    description: "Nome da pessoa que executa uma tarefa no Orquestra"
    sql: ${TABLE}."NOME_EXECUTOR" ;;
  }

  dimension: login_executor {
    type: string
    group_label: "Dados do Executor"
    group_item_label: "Login do Executor"
    description: "Login da pessoa que executa uma tarefa no Orquestra"
    sql: ${TABLE}."LOGIN_EXECUTOR" ;;
  }

  dimension: area_executor {
    type: string
    group_label: "Dados do Executor"
    group_item_label: "Area do Executor"
    description: "Área da pessoa que executa uma tarefa no Orquestra"
    sql: ${TABLE}."AREA_EXECUTOR" ;;
  }

  dimension: posicao_executor {
    type: string
    group_label: "Dados do Executor"
    group_item_label: "Função do Executor"
    description: "Função da pessoa que executa uma tarefa no Orquestra"
    sql: ${TABLE}."POSICAO_EXECUTOR" ;;
  }


  ## REQUISITANTE

  dimension: nome_requisitante {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Nome do requisitante"
    description: "Nome do requisitante da requisição"
    sql: ${TABLE}."NOME_REQUISITANTE" ;;
  }

  dimension: login_requisitante {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Login do requisitante"
    description: "Login do requisitante da requisição"
    sql: ${TABLE}."LOGIN_REQUISITANTE" ;;
  }

  dimension: area_requisitante {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Área do requisitante"
    description: "Área do requisitante da requisição"
    sql: ${TABLE}."AREA_REQUISITANTE" ;;
  }

  dimension: posicao_requisitante {
    type: string
    group_label: "Dados do Requisitante"
    group_item_label: "Função do requisitante"
    description: "Função do requisitante da requisição"
    sql: ${TABLE}."POSICAO_REQUISITANTE" ;;
  }

  ## SOLICITAÇÃO


  dimension: nome_fila {
    type: string
    group_label: "Dados da Solicitação"
    group_item_label: "Nome do processo"
    description: "Nome do processo para consulta (Ex. P17, P24, P40...)"
    sql: ${TABLE}."NOME_FILA" ;;
  }

  dimension: numero_chamado {
    type: string
    group_label: "Dados da Solicitação"
    group_item_label: "Número do chamado"
    description: "Número do chamado da Solicitação"
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
  }

  dimension: tkt_zendesk {
    type: string
    group_label: "Dados da Solicitação"
    group_item_label: "Ticket do Zendesk"
    description: "Número do ticket aberto no Zendesk no atendimento do aluno"
    sql: ${TABLE}."TKT_ZENDESK" ;;
  }

  dimension: codigo_resultado {
    type: number
    group_label: "Dados da Solicitação"
    group_item_label: "Código do resultado"
    description: "Código do resultado que a solicitação teve após finalizada - Botão de Ação"
    sql: ${TABLE}."CODIGO_RESULTADO" ;;
  }


  dimension: descricao_resultado {
    type: string
    group_label: "Dados da Solicitação"
    group_item_label: "Descrição do resultado"
    description: "Descrição do resultado que a solicitação teve após finalizada - Botão de Ação"
    sql: ${TABLE}."DESCRICAO_RESULTADO" ;;
  }

  dimension: flg_processo_em_andamento {
    type: string
    group_label: "Dados da Solicitação"
    group_item_label: "Flg Processo em Andamento?"
    description: "Verifica se o chamado está em andamento/tratativa ou não"
    sql: ${TABLE}."FLG_PROCESSO_EM_ANDAMENTO" ;;
  }

  dimension: tempo_desde_abertura_horas {
    type: number
    group_label: "Dados da Solicitação"
    group_item_label: "Tempo desde abertura (Horas)"
    description: "Tempo em horas corridas entre abertura e finalização da solicitação"
    sql: ${TABLE}."TEMPO_DESDE_ABERTURA_HORAS" ;;
  }

  dimension: obj_campos {
    type: string
    group_label: "Dados da Solicitação"
    group_item_label: "Objetos da Solicitação"
    description: "Todas as informações que foram preenchidas no formulário do processo"
    sql: ${TABLE}."OBJ_CAMPOS" ;;
  }

  measure:  min_data {
    type: date
    group_label: "Dados da Solicitação"
    label: "Solicitação Início"
    hidden:  yes
    sql: min(${data_inicio_date})
      ;;
  }

  #dimension:  max_data {
    #type: date
    #group_label: "Dados da Solicitação"
    #label: "Solicitação Fim"
    #sql:case when ${flg_processo_em_andamento} = false then max(${data_inicio_date}) else null end
    #  ;;
  #}


  ## TAREFA


  dimension: nome_task {
    type: string
    group_label: "Dados da Tarefa"
    group_item_label: "Nome da Tarefa"
    description: "Tarefas da solicitação"
    sql: ${TABLE}."NOME_TASK" ;;
  }

  dimension_group: data_inicio {
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
    label: "Tarefa Início"
    sql: ${TABLE}."DATA_INICIO" ;;
  }

  measure: data_inicio_min {
    type: date
    label: "Chamado Início"
    hidden:  yes
    sql: min(${TABLE}."DATA_INICIO") over (partition by ${numero_chamado} order by ${numero_chamado});;
  }

  measure: data_fim_max {
    type: date
    label: "Chamado Última atualização"
    hidden:  yes
    sql: max(${TABLE}."DATA_FIM") over (partition by ${numero_chamado} order by ${numero_chamado});;
  }

  dimension: min_data_chamado {
    type: date
    group_label: "Dados da Solicitação"
    label: "Início do Chamado"
    hidden:  no
    sql: ${TABLE}."MIN_DATA_CHAMADO";;
  }

  dimension: max_data_chamado {
    type: date
    group_label: "Dados da Solicitação"
    label: "Última Atualização do Chamado"
    hidden:  no
    sql: ${TABLE}."MAX_DATA_CHAMADO";;
  }

  dimension_group: data_fim {
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
    label: "Tarefa Fim"
    sql: ${TABLE}."DATA_FIM" ;;
  }



  dimension: flg_primeira_task {
    type: yesno
    group_label: "Dados da Tarefa"
    group_item_label: "Flg Primeira task?"
    sql: ${TABLE}."FLG_PRIMEIRA_TASK" ;;
  }

  dimension: flg_ultima_task {
    type: yesno
    group_label: "Dados da Tarefa"
    group_item_label: "Flg Última task?"
    description: "Esta FLG indica se é a ultima task do chamado, incluindo as tasks que são automaticas, como por exemplo, M01 - "
    sql: ${TABLE}."FLG_ULTIMA_TASK" ;;
  }

  dimension: flg_ultima_task_manual {
    type: yesno
    group_label: "Dados da Tarefa"
    group_item_label: "Flg Última task manual?"
    description: "Está FLG indica se é a ultima task manual do chamado, ou seja, não entra as tarefas que são automaticas, como por exemplo, mensagens M01 - "
    sql: ${TABLE}."FLG_ULTIMA_TASK_MANUAL" ;;
  }

  dimension: concluido {
    type: yesno
    group_label: "Dados da Tarefa"
    group_item_label: "Chamado concluido?"
    sql: ${TABLE}."FLG_ULTIMA_TASK_MANUAL" = 'Yes'
      and ${solicitacoes_para_facilities.data_entrega} is not null
      OR ${orquestra.data_fim_date} is not null  ;;
  }

  ## ALUNOS

  dimension: cpf {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "CPF do Aluno"
    sql: ${TABLE}."CPF" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  #measure: count {
  #  type: count
  #  group_item_label: "Quantidade de Chamados"
  #  sql: ${numero_chamado};;
  #  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_codigo_resultado {
    type: sum
    hidden: yes
    sql: ${codigo_resultado} ;;
  }

  measure: average_codigo_resultado {
    type: average
    hidden: yes
    sql: ${codigo_resultado} ;;
  }

  measure: total_tempo_desde_abertura_horas {
    type: sum
    hidden: no
    sql: ${tempo_desde_abertura_horas} ;;
  }

  measure: average_tempo_desde_abertura_horas {
    type: average
    hidden: yes
    sql: ${tempo_desde_abertura_horas} ;;
  }

  measure: count_chamados {
    type: count_distinct
    sql: ${numero_chamado} ;;
    drill_fields: [numero_chamado,
      nome_fila, data_inicio_date, area_requisitante, data_fim_date, area_executor, descricao_resultado]
    group_label: "Quantidade de Chamados"
    group_item_label: "Valor"
    description: "Contagem de Chamados Únicos"
  }
}
