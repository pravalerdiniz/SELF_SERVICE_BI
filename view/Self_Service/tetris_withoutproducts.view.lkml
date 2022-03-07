# The name of this view in Looker is "Tetris Withoutproducts"
view: tetris_withoutproducts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "TECH"."TETRIS_WITHOUTPRODUCTS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Created At" in Explore.

  dimension_group: _created_at {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."_CREATED_AT" ;;
    label: " Data de Registro"
  }

  dimension: _id {
    type: string
    sql: ${TABLE}."_ID" ;;
    label: "ID"
  }

  dimension_group: _updated_at {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."_UPDATED_AT" ;;
    label: "Data de Atualização"
  }

  dimension: campus {
    type: string
    sql: ${TABLE}."CAMPUS" ;;
    label: "ID Campus"
  }

  dimension: campus_descricao {
    type: string
    sql: ${TABLE}."CAMPUS_DESCRICAO" ;;
    label: "Nome de Campus"
  }

  dimension: course_id {
    type: string
    sql: ${TABLE}."COURSE_ID" ;;
    label: "ID do Curso"
  }

  dimension: course_institution {
    type: string
    sql: concat("BOF-",${TABLE}."COURSE_INSTITUTION") ;;
    label: "ID da IES"
  }

  dimension: course_level {
    type: string
    sql: ${TABLE}."COURSE_LEVEL" ;;
    hidden: yes
  }

  dimension: course_name {
    type: string
    sql: ${TABLE}."COURSE_NAME" ;;
    label: "Nome do Curso"
  }

  dimension: course_semesters {
    type: string
    sql: ${TABLE}."COURSE_SEMESTERS" ;;
    hidden: yes
  }

  dimension: institution_apelido {
    type: string
    sql: ${TABLE}."INSTITUTION_APELIDO" ;;
    label: "Nome da IES"
  }

  dimension: mensagem {
    type: string
    sql: ${TABLE}."MENSAGE" ;;
    label: "Mensagem de Erro"
  }

  measure: count {
    type: count
    drill_fields: [course_name]
    hidden: yes
  }
}
