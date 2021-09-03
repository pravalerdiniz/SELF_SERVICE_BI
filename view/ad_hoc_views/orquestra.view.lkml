# The name of this view in Looker is "Orquestra"
view: orquestra {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."ORQUESTRA"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Area Executor" in Explore.

  dimension: area_executor {
    type: string
    #group_label: "Dados do Ticket"
    group_item_label: "Area do Executor"
    description: "Indica a área do executor."
    sql: ${TABLE}."AREA_EXECUTOR" ;;
  }

  dimension: area_requisitante {
    type: string
    sql: ${TABLE}."AREA_REQUISITANTE" ;;
  }

  dimension: codigo_resultado {
    type: number
    sql: ${TABLE}."CODIGO_RESULTADO" ;;
  }

  dimension: cpf {
    type: string
    sql: ${TABLE}."CPF" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    sql: ${TABLE}."DATA_FIM" ;;
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
    sql: ${TABLE}."DATA_INICIO" ;;
  }

  dimension: descricao_resultado {
    type: string
    sql: ${TABLE}."DESCRICAO_RESULTADO" ;;
  }

  dimension: flg_primeira_task {
    type: yesno
    sql: ${TABLE}."FLG_PRIMEIRA_TASK" ;;
  }

  dimension: flg_processo_em_andamento {
    type: yesno
    sql: ${TABLE}."FLG_PROCESSO_EM_ANDAMENTO" ;;
  }

  dimension: flg_ultima_task {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMA_TASK" ;;
  }

  dimension: login_executor {
    type: string
    sql: ${TABLE}."LOGIN_EXECUTOR" ;;
  }

  dimension: login_requisitante {
    type: string
    sql: ${TABLE}."LOGIN_REQUISITANTE" ;;
  }

  dimension: nome_executor {
    type: string
    sql: ${TABLE}."NOME_EXECUTOR" ;;
  }

  dimension: nome_fila {
    type: string
    sql: ${TABLE}."NOME_FILA" ;;
  }

  dimension: nome_requisitante {
    type: string
    sql: ${TABLE}."NOME_REQUISITANTE" ;;
  }

  dimension: nome_task {
    type: string
    sql: ${TABLE}."NOME_TASK" ;;
  }

  dimension: numero_chamado {
    type: string
    sql: ${TABLE}."NUMERO_CHAMADO" ;;
  }

  dimension: obj_campos {
    type: string
    sql: ${TABLE}."OBJ_CAMPOS" ;;
  }

  dimension: posicao_executor {
    type: string
    sql: ${TABLE}."POSICAO_EXECUTOR" ;;
  }

  dimension: posicao_requisitante {
    type: string
    sql: ${TABLE}."POSICAO_REQUISITANTE" ;;
  }

  dimension: tempo_desde_abertura_horas {
    type: number
    sql: ${TABLE}."TEMPO_DESDE_ABERTURA_HORAS" ;;
  }

  dimension: tkt_zendesk {
    type: string
    sql: ${TABLE}."TKT_ZENDESK" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }

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
    hidden: yes
    sql: ${tempo_desde_abertura_horas} ;;
  }

  measure: average_tempo_desde_abertura_horas {
    type: average
    hidden: yes
    sql: ${tempo_desde_abertura_horas} ;;
  }
}
