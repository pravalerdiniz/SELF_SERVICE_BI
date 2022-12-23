# The name of this view in Looker is "Log Usuarios"
view: log_usuarios {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "ONBOARDING"."LOG_USUARIOS";;

  dimension: id_usuario {
    type: number
    primary_key: yes
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension_group: data_hora_log {
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
    sql: ${TABLE}."DATA_HORA_LOG" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Descricao Log" in Explore.

  dimension: descricao_log {
    type: string
    sql: ${TABLE}."DESCRICAO_LOG" ;;
  }

  dimension: descricao_modulo {
    type: string
    sql: ${TABLE}."DESCRICAO_MODULO" ;;
  }

  dimension: flg_ultimo_log {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_LOG" ;;
  }

  dimension: id_log {
    type: number
    sql: ${TABLE}."ID_LOG" ;;
  }

  dimension: nome_modulo {
    type: string
    sql: ${TABLE}."NOME_MODULO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
