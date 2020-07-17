view: comunicacao_conversao_status_info {
  derived_table: {
    sql: select
      a.id_cpf,
      f.key as id_log,
      f.value:data_alteracao::datetime as data_log,
      f.value:id_proposta as id_proposta_log,
      f.value:status_atual::boolean as status_atual_cpf,
      f.value:status_origem::varchar as status_origem,
      f.value:status_destino::varchar as status_destino
      from graduado.ad_hoc.comunicacao_conversao a,
      lateral flatten (input => status_pos_contato_info) f
      where PRI_STATUS_POS_CONTATO_DATE is not null
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    label: "Quantidade de Logs"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    hidden: yes
  }

  dimension: id_log {
    type: string
    sql: ${TABLE}."ID_LOG" ;;
    label: "ID do Log"
    primary_key: yes
  }

  dimension_group: data_log {
    type: time
    timeframes: [
      raw,
      year,
      month,
      date
    ]
    sql: ${TABLE}."DATA_LOG" ;;
    label: "Log"
  }

  dimension: tempo_no_status {
    type: number
    sql: datediff('day',data_log,current_date) ;;
  }

  dimension: id_proposta_log {
    type: string
    sql: ${TABLE}."ID_PROPOSTA_LOG" ;;
    label: "ID Proposta do Log"
  }

  dimension: status_atual_cpf {
    type: yesno
    sql: ${TABLE}."STATUS_ATUAL_CPF" ;;
    label: "Status Atual do Aluno?"
  }

  dimension: status_origem {
    type: string
    sql: ${TABLE}."STATUS_ORIGEM" ;;
    label: "Status Origem"
  }

  dimension: status_destino {
    type: string
    sql: ${TABLE}."STATUS_DESTINO" ;;
    label: "Status Destino"
  }

  set: detail {
    fields: [
      id_cpf,
      id_log,
      data_log_raw,
      id_proposta_log,
      status_atual_cpf,
      status_origem,
      status_destino
    ]
  }
}
