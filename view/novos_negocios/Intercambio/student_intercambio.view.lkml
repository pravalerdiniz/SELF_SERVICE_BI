# The name of this view in Looker is "Student"
view: student_intercambio {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."INTERCAMBIO"."STUDENT"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Bairro" in Explore.

  dimension: bairro {
    type: string
    sql: ${TABLE}."BAIRRO" ;;
  }

  dimension: cep {
    type: string
    sql: ${TABLE}."CEP" ;;
  }

  dimension: cidade {
    type: string
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: complemento_endereco {
    type: string
    sql: ${TABLE}."COMPLEMENTO_ENDERECO" ;;
  }

  dimension: cursos {
    type: string
    sql: ${TABLE}."CURSOS" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_aceite {
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
    sql: ${TABLE}."DATA_ACEITE" ;;
  }

  dimension_group: data_atualizacao_endereco {
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
    sql: ${TABLE}."DATA_ATUALIZACAO_ENDERECO" ;;
  }

  dimension_group: data_atualizacao_garantidor {
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
    sql: ${TABLE}."DATA_ATUALIZACAO_GARANTIDOR" ;;
  }

  dimension_group: data_nascimento_garantidor {
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
    sql: ${TABLE}."DATA_NASCIMENTO_GARANTIDOR" ;;
  }

  dimension: email_garantidor {
    type: string
    sql: ${TABLE}."EMAIL_GARANTIDOR" ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: flg_aluno_resp_fin {
    type: yesno
    sql: ${TABLE}."FLG_ALUNO_RESP_FIN" ;;
  }

  dimension: flg_intercambio {
    type: yesno
    sql: ${TABLE}."FLG_INTERCAMBIO" ;;
  }

  dimension: id_aluno {
    label: "id_garantidor"
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;
  }

  dimension: id_cpf_aluno {
    type: number
    sql: ${TABLE}."ID_CPF_ALUNO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_id_cpf_aluno {
    type: sum
    sql: ${id_cpf_aluno} ;;
  }

  measure: average_id_cpf_aluno {
    type: average
    sql: ${id_cpf_aluno} ;;
  }

  dimension: id_cpf_resp_fin {
    type: number
    sql: ${TABLE}."ID_CPF_GARANTIDOR" ;;
  }

  dimension: nome_aluno {
    type: string
    sql: ${TABLE}."NOME_ALUNO" ;;
  }

  dimension: nome_garantidor {
    type: string
    sql: ${TABLE}."NOME_GARANTIDOR" ;;
  }

  dimension: numero_endereco {
    type: string
    sql: ${TABLE}."NUMERO_ENDERECO" ;;
  }

  dimension: renda_garantidor {
    type: number
    sql: ${TABLE}."RENDA_GARANTIDOR" ;;
  }

  dimension: rua {
    type: string
    sql: ${TABLE}."RUA" ;;
  }

  dimension: status_checkout {
    type: string
    sql: ${TABLE}."STATUS_CHECKOUT" ;;
  }

  dimension: telefone_garantidor_1 {
    type: string
    sql: ${TABLE}."TELEFONE_GARANTIDOR_1" ;;
  }

  dimension: telefone_garantidor_2 {
    type: string
    sql: ${TABLE}."TELEFONE_GARANTIDOR_2" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
