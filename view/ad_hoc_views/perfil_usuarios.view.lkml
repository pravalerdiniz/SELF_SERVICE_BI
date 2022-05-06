# The name of this view in Looker is "Perfil Usuarios"
view: perfil_usuarios {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."PERFIL_USUARIOS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Departamento" in Explore.

  dimension: departamento {
    type: string
    sql: ${TABLE}."DEPARTAMENTO" ;;
  }

  dimension: descricao_modulo {
    type: string
    sql: ${TABLE}."DESCRICAO_MODULO" ;;
  }

  dimension: id_usuario {
    type: number
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension: email_usuario {
    type: string
    sql: ${TABLE}."EMAIL_USUARIO" ;;
  }

  dimension: login_ad {
    type: string
    sql: ${TABLE}."LOGIN_AD" ;;
  }

  dimension: login_usuario {
    type: string
    sql: ${TABLE}."LOGIN_USUARIO" ;;
  }

  dimension: nome_modulo {
    type: string
    sql: ${TABLE}."NOME_MODULO" ;;
  }

  dimension: FLG_BLOQUEADO {
    type: yesno
    sql: ${TABLE}."FLG_BLOQUEADO" ;;
  }

  dimension: nome_usuario {
    type: string
    sql: ${TABLE}."NOME_USUARIO" ;;
  }

  dimension: perfil {
    type: string
    sql: ${TABLE}."PERFIL" ;;
  }

  dimension: tipo_usuario {
    type: string
    sql: ${TABLE}."TIPO_USUARIO" ;;
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
