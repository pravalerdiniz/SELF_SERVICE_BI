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
    label: "Data da criação da conta"
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
    label: "Data de desativação da conta"
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
    label: "Data da reivindicação da conta"
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
    label: "Data da última vez ativo"
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
    label: "Data da última vez ativo em dispositivo Android"
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
    label: "Data da última vez ativo em dispositivo IOS"
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
    label: "Data da última vez ativo em PC"
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
    label: "Email"
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: flg_incluido_fatura {
    label: "Membro incluído na fatura?"
    type: yesno
    sql: ${TABLE}."FLG_INCLUIDO_FATURA" ;;
  }

  dimension: id_usuario {
    label: "ID do usuário"
    type: string
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension: nome {
    label: "Nome"
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: nome_exibido {
    label: "Nome exibido"
    type: string
    sql: ${TABLE}."NOME_EXIBIDO" ;;
  }

  dimension: nome_usuario {
    label: "Nome de usuário"
    type: string
    sql: ${TABLE}."NOME_USUARIO" ;;
  }

  dimension: o_que_faco {
    label: "O que faz?"
    type: string
    sql: ${TABLE}."O_QUE_FACO" ;;
  }

  dimension: qt_dias_ativo {
    label: "Quantidade de dias ativo"
    type: number
    sql: ${TABLE}."QT_DIAS_ATIVO" ;;
  }

  dimension: qt_dias_ativo_android {
    label: "Quantidade de dias ativo em dispositivo Android"
    type: number
    sql: ${TABLE}."QT_DIAS_ATIVO_ANDROID" ;;
  }

  dimension: qt_dias_ativo_computador {
    label: "Quantidade de dias ativo em PC"
    type: number
    sql: ${TABLE}."QT_DIAS_ATIVO_COMPUTADOR" ;;
  }

  dimension: qt_dias_ativo_ios {
    label: "Quantidade de dias ativo em dispositivo IOS"
    type: number
    sql: ${TABLE}."QT_DIAS_ATIVO_IOS" ;;
  }

  dimension: qt_mensagens_postadas {
    label: "Quantidade de mensagens postadas"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS" ;;
  }

  dimension: qt_mensagens_postadas_em_canais {
    label: "Quantidade de mensagens postadas em canais"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS_EM_CANAIS" ;;
  }

  dimension: qt_reacoes_adicionadas {
    label: "Quantidade de reações adicionadas"
    type: number
    sql: ${TABLE}."QT_REACOES_ADICIONADAS" ;;
  }

  dimension: tipo_conta {
    label: "Tipo de conta"
    type: string
    sql: ${TABLE}."TIPO_CONTA" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
