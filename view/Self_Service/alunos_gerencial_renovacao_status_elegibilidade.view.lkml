view: alunos_gerencial_renovacao_status_elegibilidade {
  derived_table: {
    sql: select * from GRADUADO.RISCO.VW_VALIDACAO_STATUS_RENOVACAO
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${cpf},${data_usuario_inserido_raw},${sl_data_date},${status_destino}) ;;





  }

measure: count_distinct {
  type: count_distinct
  sql: ${cpf} ;;
  label: "Quantidade de Cpfs"
  drill_fields: [detail*]

}


  dimension: safra {
    type: string
    label: "Safra - Status"
    sql: ${TABLE}."SAFRA" ;;
  }

  dimension: cpf {
    type: number
    label: "CPF"
    sql: ${TABLE}."CPF" ;;
  }

  dimension_group: sl_data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Renovação - Status"
    sql: ${TABLE}."SL_DATA" ;;
  }


  dimension_group: data_usuario_inserido {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_month,
      day_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Inserção - Elegibilidade"
    sql: ${TABLE}."DT_USUARIO_INS" ;;
  }




  dimension: status_origem {
    type: string
    group_label: "Dados de Status - Renovação"
    label: "Status Origem - Detalhado"
    sql: ${TABLE}."STATUS_ORIGEM" ;;
  }

  dimension: status_destino {
    type: string
    group_label: "Dados de Status - Renovação"
    label: "Status Destino - Detalhado"
    sql: ${TABLE}."STATUS_DESTINO" ;;
  }

  dimension: status_elegib {
    type: string
    group_label: "Dados de Status - Renovação"
    label: "Status - Elegibilidade"
    sql: ${TABLE}."STATUS_ELEGIB" ;;
  }

  dimension: status_aprov {
    type: string
    group_label: "Dados de Status - Renovação"
    label: "Status - Aprovado?"
    sql: ${TABLE}."STATUS_APROV" ;;
  }

  set: detail {
    fields: [
      safra,
      cpf,
      sl_data_raw,
      status_origem,
      status_destino,
      status_elegib,
      status_aprov,
      data_usuario_inserido_raw

    ]
  }
}
