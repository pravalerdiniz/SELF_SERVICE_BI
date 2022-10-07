view: orquestra_sla_task {
 # Or, you could make this view a derived table, like this:
 derived_table: {
   sql: SELECT A.NOME_FILA, A.NOME_TASK, A.NUMERO_CHAMADO, A.DATA_INICIO, SUM(datediff(HOURS, A.DATA_INICIO, A.DATA_FIM)) TEMPO_TASK
        from GRADUADO.AD_HOC.ORQUESTRA A
        where

        A.data_fim is not null

        GROUP BY A.NOME_FILA, A.NOME_TASK, A.NUMERO_CHAMADO, A.DATA_INICIO
       ;;
   }

   # Define your dimensions and measures here, like this:
  dimension: nome_fila {
     description: "Nome da fila (processo)."
     type: string
     sql: ${TABLE}."NOME_FILA" ;;
   }

  dimension: nome_task {
     description: "Nome da tarefa."
     type: string
     sql: ${TABLE}."NOME_TASK" ;;
   }

  dimension: numero_chamado {
    description: "Número do chamado."
    type: number
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
  }

  dimension: horas_task {
    group_label: "Dados da Solicitação"
    description: "Quantidade de horas gastas na tarefa."
    type: number
    sql: ${TABLE}."TEMPO_TASK" ;;
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

   measure:sum_horas_task {
     description: "Total de horas gastas na(s) tarefa(s). Cálculo realizado subtraindo a data_final pela data_inicial da tarefa."
     type: sum
     sql: ${horas_task} ;;
   }
}
