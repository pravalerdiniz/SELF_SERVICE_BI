# The name of this view in Looker is "Prv Log"
view: prv_log {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "TECH"."PRV_LOG"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
    label: "ID"
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Data" in Explore.

  dimension: data {
    type: string
    sql: ${TABLE}."DATA" ;;
    label: "Data"
  }

  dimension: end_mac {
    type: string
    sql: ${TABLE}."END_MAC" ;;
    label: "END_MAC"
  }

  dimension: hora {
    type: string
    sql: ${TABLE}."HORA" ;;
    label: "Hora"
  }

  dimension: id_monitor {
    type: string
    sql: ${TABLE}."ID_MONITOR" ;;
    label: "ID Monitor"
  }

  dimension: ip {
    type: string
    sql: ${TABLE}."IP" ;;
    label: "IP"
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}."LATITUDE" ;;
    label: "Latitude"
  }

  dimension: log {
    type: string
    sql: ${TABLE}."LOG" ;;
    label: "Log"
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}."LONGITUDE" ;;
    label: "Longitude"
  }

  dimension: modulo {
    type: string
    sql: ${TABLE}."MODULO" ;;
    label: "Módulo"
  }

  dimension: porta {
    type: string
    sql: ${TABLE}."PORTA" ;;
    label: "Porta"
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
    label: "Tipo"
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}."USER_AGENT" ;;
    label: "User Agent"
  }

  dimension: usuario {
    type: string
    sql: ${TABLE}."USUARIO" ;;
    label: "Usuário"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
