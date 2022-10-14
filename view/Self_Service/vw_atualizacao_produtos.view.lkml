# The name of this view in Looker is "Vw Atualizacao Produtos"
view: vw_atualizacao_produtos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."ONBOARDING"."VW_ATUALIZACAO_PRODUTOS"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Acao" in Explore.

  dimension: acao {
    type: string
    sql: ${TABLE}."ACAO" ;;
  }

  dimension: campus_id {
    type: number
    sql: ${TABLE}."CAMPUS_ID" ;;
  }

  dimension: campus_nome {
    type: string
    sql: ${TABLE}."CAMPUS_NOME" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: ies_id {
    type: number
    sql: ${TABLE}."IES_ID" ;;
  }

  dimension: ies_nome {
    type: string
    sql: ${TABLE}."IES_NOME" ;;
  }

  dimension: login_usuario {
    type: string
    sql: ${TABLE}."LOGIN_USUARIO" ;;
  }

  dimension: produto_id {
    type: number
    sql: ${TABLE}."PRODUTO_ID" ;;
  }

  dimension: produto_nome {
    type: string
    sql: ${TABLE}."PRODUTO_NOME" ;;
  }

  dimension: tela {
    type: string
    sql: ${TABLE}."TELA" ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."UPDATED_AT" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
