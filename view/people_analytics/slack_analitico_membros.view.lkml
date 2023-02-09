# The name of this view in Looker is "Slack Analitico Membros"
view: slack_analitico_membros {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."SLACK_ANALITICO_MEMBROS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_criacao_conta {
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
    sql: ${TABLE}."DATA_CRIACAO_CONTA" ;;
  }

  dimension_group: data_desativacao_conta {
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
    sql: ${TABLE}."DATA_DESATIVACAO_CONTA" ;;
  }

  dimension_group: data_reivindicacao_conta {
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
    sql: ${TABLE}."DATA_REIVINDICACAO_CONTA" ;;
  }

  dimension_group: data_ultima_vez_ativo {
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
    sql: ${TABLE}."DATA_ULTIMA_VEZ_ATIVO" ;;
  }

  dimension_group: data_ultima_vez_ativo_android {
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
    sql: ${TABLE}."DATA_ULTIMA_VEZ_ATIVO_ANDROID" ;;
  }

  dimension_group: data_ultima_vez_ativo_ios {
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
    sql: ${TABLE}."DATA_ULTIMA_VEZ_ATIVO_IOS" ;;
  }

  dimension_group: data_ultima_vez_ativo_pc {
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
    sql: ${TABLE}."DATA_ULTIMA_VEZ_ATIVO_PC" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Email" in Explore.

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: flg_incluido_fatura {
    type: yesno
    sql: ${TABLE}."FLG_INCLUIDO_FATURA" ;;
  }

  dimension: id_usuario {
    type: string
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: nome_exibido {
    type: string
    sql: ${TABLE}."NOME_EXIBIDO" ;;
  }

  dimension: nome_usuario {
    type: string
    sql: ${TABLE}."NOME_USUARIO" ;;
  }

  dimension: o_que_faco {
    type: string
    sql: ${TABLE}."O_QUE_FACO" ;;
  }

  dimension: qt_dias_ativo {
    type: number
    sql: ${TABLE}."QT_DIAS_ATIVO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_qt_dias_ativo {
    type: sum
    sql: ${qt_dias_ativo} ;;
  }

  measure: average_qt_dias_ativo {
    type: average
    sql: ${qt_dias_ativo} ;;
  }

  dimension: qt_dias_ativo_android {
    type: number
    value_format_name: id
    sql: ${TABLE}."QT_DIAS_ATIVO_ANDROID" ;;
  }

  dimension: qt_dias_ativo_computador {
    type: number
    sql: ${TABLE}."QT_DIAS_ATIVO_COMPUTADOR" ;;
  }

  dimension: qt_dias_ativo_ios {
    type: number
    sql: ${TABLE}."QT_DIAS_ATIVO_IOS" ;;
  }

  dimension: qt_mensagens_postadas {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS" ;;
  }

  dimension: qt_mensagens_postadas_em_canais {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS_EM_CANAIS" ;;
  }

  dimension: qt_reacoes_adicionadas {
    type: number
    sql: ${TABLE}."QT_REACOES_ADICIONADAS" ;;
  }

  dimension: tipo_conta {
    type: string
    sql: ${TABLE}."TIPO_CONTA" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
