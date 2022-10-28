view: orquestra_cancelamento {
  sql_table_name: POS_GRADUADO.CS.ORQUESTRA_CANCELAMENTO
    ;;

  dimension: pagou_parcela {
    type: string
    group_label: ""
    group_item_label: ""
    description: ""
    sql: ${TABLE}."ALUNOJAPAGOUALGUMAPARCELA" ;;
  }

  dimension: analise_efetuada {
    type: string
    group_label: ""
    group_item_label: ""
    description: ""
    sql: ${TABLE}."ANALISEEFETUADA" ;;
  }

  dimension: area_executor {
    type: string
    group_label: ""
    group_item_label: ""
    description: ""
    sql: ${TABLE}."AREA_EXECUTOR" ;;
  }

  dimension: area_requisitante {
    type: string
    group_label: ""
    group_item_label: ""
    description: ""
    sql: ${TABLE}."AREA_REQUISITANTE" ;;
  }

  dimension: assuntoprincipaldocontato {
    type: string
    group_label: ""
    group_item_label: ""
    description: ""
    sql: ${TABLE}."ASSUNTOPRINCIPALDOCONTATO" ;;
  }

  dimension: autorizanovaanalisedaies {
    type: string
    group_label: ""
    group_item_label: ""
    description: ""
    sql: ${TABLE}."AUTORIZANOVAANALISEDAIES" ;;
  }

  dimension: codigo_resultado {
    type: number
    group_label: ""
    group_item_label: ""
    description: ""
    sql: ${TABLE}."CODIGO_RESULTADO" ;;
  }

  dimension: cpf {
    type: string
    group_label: ""
    group_item_label: ""
    description: ""
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
    group_label: ""
    group_item_label: ""
    description: ""
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
    group_label: ""
    group_item_label: ""
    description: ""
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
    group_label: ""
    group_item_label: ""
    description: ""
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
    group_label: ""
    group_item_label: ""
    description: ""
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
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: descrevaoretornodoseucaso {
    type: string
    sql: ${TABLE}."DESCREVAORETORNODOSEUCASO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: descricao_resultado {
    type: string
    sql: ${TABLE}."DESCRICAO_RESULTADO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: descricaodasolicitacao {
    type: string
    sql: ${TABLE}."DESCRICAODASOLICITACAO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: emaildoaluno {
    type: string
    sql: ${TABLE}."EMAILDOALUNO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_primeira_task {
    type: string
    sql: ${TABLE}."FLG_PRIMEIRA_TASK" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_processo_em_andamento {
    type: yesno
    sql: ${TABLE}."FLG_PROCESSO_EM_ANDAMENTO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_task_em_andamento {
    type: yesno
    sql: ${TABLE}."FLG_TASK_EM_ANDAMENTO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_task_sem_atraso {
    type: yesno
    sql: ${TABLE}."FLG_TASK_SEM_ATRASO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_ultima_task {
    type: string
    sql: ${TABLE}."FLG_ULTIMA_TASK" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: flg_ultima_task_manual {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMA_TASK_MANUAL" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: haveracancelamento {
    type: string
    sql: ${TABLE}."HAVERACANCELAMENTO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: houverepasse {
    type: string
    sql: ${TABLE}."HOUVEREPASSE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: id_instance_task {
    type: number
    sql: ${TABLE}."ID_INSTANCE_TASK" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: iesdoaluno {
    type: string
    sql: ${TABLE}."IESDOALUNO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: lead_time_task {
    type: string
    sql: ${TABLE}."LEAD_TIME_TASK" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: login_executor {
    type: string
    sql: ${TABLE}."LOGIN_EXECUTOR" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: login_requisitante {
    type: string
    sql: ${TABLE}."LOGIN_REQUISITANTE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
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
    group_label: ""
    group_item_label: ""
    description: ""
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
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: motivodecancelamento {
    type: string
    sql: ${TABLE}."MOTIVODECANCELAMENTO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nome_executor {
    type: string
    sql: ${TABLE}."NOME_EXECUTOR" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nome_fila {
    type: string
    sql: ${TABLE}."NOME_FILA" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nome_requisitante {
    type: string
    sql: ${TABLE}."NOME_REQUISITANTE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nome_task {
    type: string
    sql: ${TABLE}."NOME_TASK" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nomedoaluno {
    type: string
    sql: ${TABLE}."NOMEDOALUNO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: nomedocurso {
    type: string
    sql: ${TABLE}."NOMEDOCURSO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: notificartier2 {
    type: string
    sql: ${TABLE}."NOTIFICARTIER2" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: numero_chamado {
    type: number
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: numerodocontrato {
    type: string
    sql: ${TABLE}."NUMERODOCONTRATO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: numerodocontratoqueelequercancelar {
    type: string
    sql: ${TABLE}."NUMERODOCONTRATOQUEELEQUERCANCELAR" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: numerototaldeparcelasemcontrato {
    type: string
    sql: ${TABLE}."NUMEROTOTALDEPARCELASEMCONTRATO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: obj_mensagens {
    type: string
    sql: ${TABLE}."OBJ_MENSAGENS" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: observacoes {
    type: string
    sql: ${TABLE}."OBSERVACOES" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: observacoesdaanalise {
    type: string
    sql: ${TABLE}."OBSERVACOESDAANALISE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: observacoessobreenviodecasoaies {
    type: string
    sql: ${TABLE}."OBSERVACOESSOBREENVIODECASOAIES" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: posicao_executor {
    type: string
    sql: ${TABLE}."POSICAO_EXECUTOR" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: posicao_requisitante {
    type: string
    sql: ${TABLE}."POSICAO_REQUISITANTE" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: quantidadedemensalidades {
    type: string
    sql: ${TABLE}."QUANTIDADEDEMENSALIDADES" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: retornodaiescancelamentoindeferido {
    type: string
    sql: ${TABLE}."RETORNODAIESCANCELAMENTOINDEFERIDO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: selecionequalamodalidadedoalunoeseterareembolso {
    type: string
    sql: ${TABLE}."SELECIONEQUALAMODALIDADEDOALUNOESETERAREEMBOLSO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: sla {
    type: string
    sql: ${TABLE}."SLA" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: status_processo {
    type: string
    sql: ${TABLE}."STATUS_PROCESSO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: status_task {
    type: string
    sql: ${TABLE}."STATUS_TASK" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: tempo_desde_abertura_horas {
    type: string
    sql: ${TABLE}."TEMPO_DESDE_ABERTURA_HORAS" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: ticketzendesk {
    type: string
    sql: ${TABLE}."TICKETZENDESK" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: valordoreembolso {
    type: string
    sql: ${TABLE}."VALORDOREEMBOLSO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: valorqueaiesdevolverzparaopravaler {
    type: string
    sql: ${TABLE}."VALORQUEAIESDEVOLVERZPARAOPRAVALER" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: vencimentofimcancelado {
    type: string
    sql: ${TABLE}."VENCIMENTOFIMCANCELADO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
  }

  dimension: vencimentoiniciocancelado {
    type: string
    sql: ${TABLE}."VENCIMENTOINICIOCANCELADO" ;;
    group_label: ""
    group_item_label: ""
    description: ""
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
