view: fato_status {
  sql_table_name: "VETERANO"."FATO"."FATO_STATUS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: ciclo {
    type: number
    sql: ${TABLE}."CICLO" ;;
  }

  dimension_group: data_carga {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_CARGA" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

   dimension: fonte {
    type: string
    sql: ${TABLE}."FONTE" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_elegivel {
    type: number
    sql: ${TABLE}."ID_ELEGIVEL" ;;
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: id_status_destino {
    type: string
    sql: ${TABLE}."ID_STATUS_DESTINO" ;;
  }

  dimension: id_status_origem {
    type: string
    sql: ${TABLE}."ID_STATUS_ORIGEM" ;;
  }

  dimension: id_usuario {
    type: number
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension: motivo_alteracao {
    type: string
    sql: ${TABLE}."MOTIVO_ALTERACAO" ;;
  }

  dimension: time {
    type: string
    sql: ${TABLE}."TIME" ;;
  }

  dimension: datetime {
    label: "DATA COMPLETA"
    type: date_raw
    sql: concat(${TABLE}."DATE",' ', ${TABLE}."TIME")::datetime ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: count_cpf {
    type:  count_distinct
    sql: ${id_cpf} ;;
  }

}
