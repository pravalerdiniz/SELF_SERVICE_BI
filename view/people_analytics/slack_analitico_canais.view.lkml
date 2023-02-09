# The name of this view in Looker is "Slack Analitico Canais"
view: slack_analitico_canais {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."SLACK_ANALITICO_CANAIS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_criacao {
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
    sql: ${TABLE}."DATA_CRIACAO" ;;
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

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Descricao" in Explore.

  dimension: descricao {
    type: string
    sql: ${TABLE}."DESCRICAO" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: organizacoes_externas {
    type: string
    sql: ${TABLE}."ORGANIZACOES_EXTERNAS" ;;
  }

  dimension: qt_alteracao_nos_membros_que_postaram {
    type: number
    sql: ${TABLE}."QT_ALTERACAO_NOS_MEMBROS_QUE_POSTARAM" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_qt_alteracao_nos_membros_que_postaram {
    type: sum
    sql: ${qt_alteracao_nos_membros_que_postaram} ;;
  }

  measure: average_qt_alteracao_nos_membros_que_postaram {
    type: average
    sql: ${qt_alteracao_nos_membros_que_postaram} ;;
  }

  dimension: qt_convidados {
    type: number
    sql: ${TABLE}."QT_CONVIDADOS" ;;
  }

  dimension: qt_membros {
    type: number
    sql: ${TABLE}."QT_MEMBROS" ;;
  }

  dimension: qt_membros_ativos {
    type: number
    sql: ${TABLE}."QT_MEMBROS_ATIVOS" ;;
  }

  dimension: qt_membros_que_postaram {
    type: number
    sql: ${TABLE}."QT_MEMBROS_QUE_POSTARAM" ;;
  }

  dimension: qt_membros_que_reagiram {
    type: number
    sql: ${TABLE}."QT_MEMBROS_QUE_REAGIRAM" ;;
  }

  dimension: qt_membros_que_viram {
    type: number
    sql: ${TABLE}."QT_MEMBROS_QUE_VIRAM" ;;
  }

  dimension: qt_mensagens_postadas {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS" ;;
  }

  dimension: qt_mensagens_postadas_por_membros {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS_POR_MEMBROS" ;;
  }

  dimension: qt_reacoes_adicionadas {
    type: number
    sql: ${TABLE}."QT_REACOES_ADICIONADAS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
