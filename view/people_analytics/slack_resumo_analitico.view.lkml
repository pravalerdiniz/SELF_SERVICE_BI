# The name of this view in Looker is "Slack Resumo Analitico"
view: slack_resumo_analitico {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."SLACK_RESUMO_ANALITICO"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_referencia {
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
    sql: ${TABLE}."DATA_REFERENCIA" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Nome" in Explore.

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: perc_mensagens_canais_privados {
    type: number
    sql: ${TABLE}."PERC_MENSAGENS_CANAIS_PRIVADOS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_perc_mensagens_canais_privados {
    type: sum
    sql: ${perc_mensagens_canais_privados} ;;
  }

  measure: average_perc_mensagens_canais_privados {
    type: average
    sql: ${perc_mensagens_canais_privados} ;;
  }

  dimension: perc_mensagens_canais_publicos {
    type: number
    sql: ${TABLE}."PERC_MENSAGENS_CANAIS_PUBLICOS" ;;
  }

  dimension: perc_mensagens_mds {
    type: number
    sql: ${TABLE}."PERC_MENSAGENS_MDS" ;;
  }

  dimension: perc_visualizacoes_canais_privados {
    type: number
    sql: ${TABLE}."PERC_VISUALIZACOES_CANAIS_PRIVADOS" ;;
  }

  dimension: perc_visualizacoes_canais_publicos {
    type: number
    sql: ${TABLE}."PERC_VISUALIZACOES_CANAIS_PUBLICOS" ;;
  }

  dimension: perc_visualizacoes_mds {
    type: number
    sql: ${TABLE}."PERC_VISUALIZACOES_MDS" ;;
  }

  dimension: qt_arquivos_enviados {
    type: number
    sql: ${TABLE}."QT_ARQUIVOS_ENVIADOS" ;;
  }

  dimension: qt_canais_publicos {
    type: number
    sql: ${TABLE}."QT_CANAIS_PUBLICOS" ;;
  }

  dimension: qt_convidados {
    type: number
    sql: ${TABLE}."QT_CONVIDADOS" ;;
  }

  dimension: qt_convidados_declarados {
    type: number
    sql: ${TABLE}."QT_CONVIDADOS_DECLARADOS" ;;
  }

  dimension: qt_convidados_habilitados {
    type: number
    sql: ${TABLE}."QT_CONVIDADOS_HABILITADOS" ;;
  }

  dimension: qt_inscricoes_habilitadas {
    type: number
    sql: ${TABLE}."QT_INSCRICOES_HABILITADAS" ;;
  }

  dimension: qt_membros {
    type: number
    sql: ${TABLE}."QT_MEMBROS" ;;
  }

  dimension: qt_membros_ativos_por_dia {
    type: number
    sql: ${TABLE}."QT_MEMBROS_ATIVOS_POR_DIA" ;;
  }

  dimension: qt_membros_ativos_por_semana {
    type: number
    sql: ${TABLE}."QT_MEMBROS_ATIVOS_POR_SEMANA" ;;
  }

  dimension: qt_membros_declarados {
    type: number
    sql: ${TABLE}."QT_MEMBROS_DECLARADOS" ;;
  }

  dimension: qt_membros_habilitados {
    type: number
    sql: ${TABLE}."QT_MEMBROS_HABILITADOS" ;;
  }

  dimension: qt_membros_internos {
    type: number
    sql: ${TABLE}."QT_MEMBROS_INTERNOS" ;;
  }

  dimension: qt_membros_internos_declarados {
    type: number
    sql: ${TABLE}."QT_MEMBROS_INTERNOS_DECLARADOS" ;;
  }

  dimension: qt_membros_que_postam_mensagens_por_dia {
    type: number
    sql: ${TABLE}."QT_MEMBROS_QUE_POSTAM_MENSAGENS_POR_DIA" ;;
  }

  dimension: qt_membros_que_postam_mensagens_semanalmente {
    type: number
    sql: ${TABLE}."QT_MEMBROS_QUE_POSTAM_MENSAGENS_SEMANALMENTE" ;;
  }

  dimension: qt_mensagens_canais_compartilhados {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_CANAIS_COMPARTILHADOS" ;;
  }

  dimension: qt_mensagens_canais_privados {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_CANAIS_PRIVADOS" ;;
  }

  dimension: qt_mensagens_canais_publicos {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_CANAIS_PUBLICOS" ;;
  }

  dimension: qt_mensagens_mds {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_MDS" ;;
  }

  dimension: qt_mensagens_postadas {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS" ;;
  }

  dimension: qt_mensagens_postadas_por_apps {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS_POR_APPS" ;;
  }

  dimension: qt_mensagens_postadas_por_membros {
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS_POR_MEMBROS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
