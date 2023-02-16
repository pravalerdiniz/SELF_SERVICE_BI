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

  dimension: ano_referencia {
    label: "Ano de referência"
    description: "Ano de referência da coleta dos dados"
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."ANO_REFERENCIA" ;;
  }

  dimension: mes_referencia {
    label: "Mês de referência"
    description: "Mês de referência da coleta dos dados"
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}."MES_REFERENCIA" ;;
  }

  dimension: ano_mes_referencia {
    label: "Ano/Mês de referência"
    description: "Ano/Mês de referência da coleta dos dados"
    primary_key: yes
    type: string
    sql: concat(${ano_referencia}, '-', lpad(${mes_referencia}, 2, 0)) ;;
  }

  dimension_group: data_criacao {
    label: "Data da criação"
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

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Descricao" in Explore.

  dimension: descricao {
    label: "Descrição"
    type: string
    sql: ${TABLE}."DESCRICAO" ;;
  }

  dimension: nome {
    label: "Nome"
    primary_key: yes
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: organizacoes_externas {
    label: "Organizações externas"
    type: string
    sql: ${TABLE}."ORGANIZACOES_EXTERNAS" ;;
  }

  dimension: qt_alteracao_nos_membros_que_postaram {
    label: "Quantidade de alterações nos membros que postaram"
    type: number
    sql: ${TABLE}."QT_ALTERACAO_NOS_MEMBROS_QUE_POSTARAM" ;;
  }

  dimension: qt_convidados {
    label: "Quantidade de convidados"
    type: number
    sql: ${TABLE}."QT_CONVIDADOS" ;;
  }

  dimension: qt_membros {
    label: "Quantidade de membros"
    type: number
    sql: ${TABLE}."QT_MEMBROS" ;;
  }

  dimension: qt_membros_ativos {
    label: "Quantidade de membros ativos"
    type: number
    sql: ${TABLE}."QT_MEMBROS_ATIVOS" ;;
  }

  dimension: qt_membros_que_postaram {
    label: "Quantidade de membros que postaram"
    type: number
    sql: ${TABLE}."QT_MEMBROS_QUE_POSTARAM" ;;
  }

  dimension: qt_membros_que_reagiram {
    label: "Quantidade de membros que reagiram"
    type: number
    sql: ${TABLE}."QT_MEMBROS_QUE_REAGIRAM" ;;
  }

  dimension: qt_membros_que_viram {
    label: "Quantidade de membros que viram"
    type: number
    sql: ${TABLE}."QT_MEMBROS_QUE_VIRAM" ;;
  }

  dimension: qt_mensagens_postadas {
    label: "Quantidade de mensagens postadas"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS" ;;
  }

  dimension: qt_mensagens_postadas_por_membros {
    label: "Quantidade de mensagens postadas por membros"
    type: number
    sql: ${TABLE}."QT_MENSAGENS_POSTADAS_POR_MEMBROS" ;;
  }

  dimension: qt_reacoes_adicionadas {
    label: "Quantidade de reações adicionadas"
    type: number
    sql: ${TABLE}."QT_REACOES_ADICIONADAS" ;;
  }

  dimension: headcount_pravaler {
    label: "Total de funcionários na data"
    description: "Quadro de funcionários na data de referência"
    type: number
    sql: ${TABLE}."HEADCOUNT_PRAVALER" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
