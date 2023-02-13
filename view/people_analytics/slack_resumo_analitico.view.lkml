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
    label: "Data de referência"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      time
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_REFERENCIA" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Nome" in Explore.

  dimension: nome {
    view_label: "Nome"
    type: string
    hidden: yes
    sql: ${TABLE}."NOME" ;;
  }

  dimension: perc_mensagens_canais_privados {
    label: "% de mensagens em canais privados"
    type: number
    sql: ${TABLE}."PERC_MENSAGENS_CANAIS_PRIVADOS" ;;
  }

  dimension: perc_mensagens_canais_publicos {
    label: "% de mensagens em canais públicos"
    type: number
    sql: ${TABLE}."PERC_MENSAGENS_CANAIS_PUBLICOS" ;;
  }

  dimension: perc_mensagens_mds {
    label: "% de mensagens MDS"
    description: "Mensagens diretas entre usuários"
    type: number
    sql: ${TABLE}."PERC_MENSAGENS_MDS" ;;
  }

  dimension: perc_visualizacoes_canais_privados {
    label: "% de visualizações em canais privados"
    type: number
    sql: ${TABLE}."PERC_VISUALIZACOES_CANAIS_PRIVADOS" ;;
  }

  dimension: perc_visualizacoes_canais_publicos {
    label: "% de visualizações em canais públicos"
    type: number
    sql: ${TABLE}."PERC_VISUALIZACOES_CANAIS_PUBLICOS" ;;
  }

  dimension: perc_visualizacoes_mds {
    label: "% de visualizações em MDS"
    type: number
    sql: ${TABLE}."PERC_VISUALIZACOES_MDS" ;;
  }

  dimension: qt_arquivos_enviados {
    label: "Quantidade de arquivos enviados"
    type: number
    sql: ${TABLE}."QT_ARQUIVOS_ENVIADOS" ;;
  }

  dimension: qt_canais_publicos {
    label: "Quantidade de canais públicos"
    type: number
    sql: ${TABLE}."QT_CANAIS_PUBLICOS" ;;
  }

  dimension: qt_convidados {
    label: "Quantidade de convidados"
    type: number
    sql: ${TABLE}."QT_CONVIDADOS" ;;
  }

  dimension: qt_convidados_declarados {
    label: "Quantidade de convidados declarados"
    type: number
    sql: ${TABLE}."QT_CONVIDADOS_DECLARADOS" ;;
  }

  dimension: qt_convidados_habilitados {
    label: "Quantidade de novos convidados habilitados"
    type: number
    sql: ${TABLE}."QT_CONVIDADOS_HABILITADOS" ;;
  }

  dimension: qt_inscricoes_habilitadas {
    label: "Quantidade de novas inscrições habilitadas"
    type: number
    sql: ${TABLE}."QT_INSCRICOES_HABILITADAS" ;;
  }

  dimension: qt_membros {
    label: "Quantidade de membros"
    type: number
    sql: ${TABLE}."QT_MEMBROS" ;;
  }

  dimension: qt_membros_ativos_por_dia {
    label: "Quantidade de membros ativos"
    type: number
    sql: ${TABLE}."QT_MEMBROS_ATIVOS_POR_DIA" ;;
  }

  dimension: qt_membros_ativos_por_semana {
    label: "Quantidade de membros ativos na semana"
    type: number
    sql: ${TABLE}."QT_MEMBROS_ATIVOS_POR_SEMANA" ;;
  }

  dimension: qt_membros_declarados {
    label: "Quantidade de membros declarados"
    type: number
    sql: ${TABLE}."QT_MEMBROS_DECLARADOS" ;;
  }

  dimension: qt_membros_habilitados {
    label: "Quantidade de novos membros habilitados"
    type: number
    sql: ${TABLE}."QT_MEMBROS_HABILITADOS" ;;
  }

  dimension: qt_membros_internos {
    label: "Quantidade de membros internos"
    type: number
    sql: ${TABLE}."QT_MEMBROS_INTERNOS" ;;
  }

  dimension: qt_membros_internos_declarados {
    label: "Quantidade de membros internos declarados"
    type: number
    sql: ${TABLE}."QT_MEMBROS_INTERNOS_DECLARADOS" ;;
  }

  dimension: qt_membros_que_postam_mensagens_por_dia {
    label: "Quantidade de membros que postaram"
    type: number
    sql: ${TABLE}."QT_MEMBROS_QUE_POSTAM_MENSAGENS_POR_DIA" ;;
  }

  dimension: qt_membros_que_postam_mensagens_semanalmente {
    label: "Quantidade de membros que postaram (semana)"
    type: number
    sql: ${TABLE}."QT_MEMBROS_QUE_POSTAM_MENSAGENS_SEMANALMENTE" ;;
  }

  dimension: qt_mensagens_canais_compartilhados {
    label: "Quantidade de canais compartilhados"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_CANAIS_COMPARTILHADOS" ;;
  }

  dimension: qt_mensagens_canais_privados {
    label: "Quantidade de mensagens em canais privados"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_CANAIS_PRIVADOS" ;;
  }

  dimension: qt_mensagens_canais_publicos {
    label: "Quantidade de mensagens em canais públicos"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_CANAIS_PUBLICOS" ;;
  }

  dimension: qt_mensagens_mds {
    label: "Quantidade de mensagens MDS"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_MDS" ;;
  }

  dimension: qt_mensagens_postadas {
    label: "Quantidade de mensagens postadas"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS" ;;
  }

  dimension: qt_mensagens_postadas_por_apps {
    label: "Quantidade de mensagens postadas por aplicações"
    description: "Indica a quantidade de mensagens públicadas por aplicações integrados ao Slack"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS_POR_APPS" ;;
  }

  dimension: qt_mensagens_postadas_por_membros {
    label: "Quantidade de mensagens postadas por membros"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS_POR_MEMBROS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
