# The name of this view in Looker is "Cruzeiro Inadimplentes"
view: cruzeiro_inadimplentes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."CRUZEIRO_INADIMPLENTES"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Classificacao" in Explore.

  dimension: classificacao {
    type: string
    sql: ${TABLE}."CLASSIFICACAO" ;;
  }

  dimension: cpf {
    type: string
    sql: ${TABLE}."CPF" ;;
  }

  dimension: data_status {
    type: string
    sql: ${TABLE}."DATA_STATUS" ;;
  }

  dimension: ies {
    type: string
    sql: ${TABLE}."IES" ;;
  }

  dimension: ies_grupo {
    type: string
    sql: ${TABLE}."IES_GRUPO" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: status_desc {
    type: string
    sql: ${TABLE}."STATUS_DESC" ;;
  }

  dimension: status_detalhe {
    type: string
    sql: ${TABLE}."STATUS_DETALHE" ;;
  }

  dimension: status_detalhe_desc {
    type: string
    sql: ${TABLE}."STATUS_DETALHE_DESC" ;;
  }

  dimension: titulos_vencidos {
    type: string
    sql: ${TABLE}."TITULOS_VENCIDOS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }
}

# These sum and average measures are hidden by default.
# If you want them to show up in your explore, remove hidden: yes.
