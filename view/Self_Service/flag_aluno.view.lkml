# The name of this view in Looker is "Flag Aluno"
view: flag_unico_aluno {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: (SELECT * FROM "KYC"."FLAG_ALUNO" WHERE ROLE = 'ALUNO')
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
    hidden:  yes
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cpf" in Explore.

  dimension: cpf {
    type: string
    sql: ${TABLE}."CPF" ;;
    hidden:  yes
  }

  dimension: flg_aluno {
    type: yesno
    sql: ${TABLE}."FLG_ALUNO" = 'TRUE' ;;
    group_label: "Dados - Biometria Facial"
    label: "Flag Biometria Facial - Aluno"
  }

  dimension: flg_garantidor {
    type: yesno
    sql: ${TABLE}."FLG_GARANTIDOR"= 'TRUE' ;;
    hidden: yes
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
    hidden:  yes
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: inserted {
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
    sql: ${TABLE}."INSERTED_AT" ;;
    hidden:  yes
  }

  dimension: provider {
    type: string
    sql: ${TABLE}."PROVIDER" ;;
    hidden:  yes
  }

  dimension: role {
    type: string
    sql: ${TABLE}."ROLE" ;;
    hidden:  yes
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
    group_label: "Dados - Biometria Facial"
    label: "Status - Aluno"
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
    hidden:  yes
  }

  measure: count {
    type: count
    drill_fields: [id]
    hidden:  yes
  }
}
