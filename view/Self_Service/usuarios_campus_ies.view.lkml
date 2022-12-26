# The name of this view in Looker is "Usuarios Campus Ies"
view: usuarios_campus_ies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "PRO_GRADUADO"."ONBOARDING"."USUARIOS_CAMPUS_IES"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Campus" in Explore.

  dimension: id_usuario {
    type: number
    primary_key: yes
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension: campus {
    type: string
    sql: ${TABLE}."CAMPUS" ;;
  }

  dimension: flg_campus_ativo {
    type: yesno
    sql: ${TABLE}."FLG_CAMPUS_ATIVO" ;;
  }

  dimension: flg_ie_ativa {
    type: yesno
    sql: ${TABLE}."FLG_IE_ATIVA" ;;
  }

  dimension: grupo {
    type: string
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: id_campus {
    type: string
    sql: ${TABLE}."ID_CAMPUS" ;;
  }

  dimension: id_ies {
    type: string
    sql: ${TABLE}."ID_IES" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }
}
