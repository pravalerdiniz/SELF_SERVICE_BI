# The name of this view in Looker is "Fato Mongo Lead"
view: fato_mongo_lead {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FATO"."FATO_MONGO_LEAD"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_acesso {
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
    sql: ${TABLE}."DATA_ACESSO" ;;
    description: "Data em que o aluno realizou etapa correspondente do cadastro"
    label: "Data de Acesso"
  }

  dimension_group: data_carga {
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
    sql: ${TABLE}."DATA_CARGA" ;;
    hidden: yes
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ds Status Proposta" in Explore.

  dimension: ds_status_proposta {
    type: string
    sql: ${TABLE}."DS_STATUS_PROPOSTA" ;;
    label: "Etapa - Cadastro"
    description: "Etapa em que o aluno está de acordo com o fluxo de cadastro"
  }

  dimension: ds_url {
    type: string
    sql: ${TABLE}."DS_URL" ;;
    hidden: yes
  }

  dimension: flg_url_origem {
    type: yesno
    sql: ${TABLE}."FLG_URL_ORIGEM" ;;
    hidden:  yes
  }

  dimension: id_cpf {
    type: string
    sql: ${TABLE}."ID_CPF" ;;
    hidden:  yes
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.



  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
    hidden: yes
  }

  dimension: mongo_fieldgroup {
    type: string
    sql: ${TABLE}."MONGO_FIELDGROUP" ;;
    hidden: yes
  }

  measure: count_distinct_cpf {
    type: count_distinct
    sql: ${TABLE}."ID_CPF" ;;
    label: "Quantidade de Alunos"

  }

  measure: count_distinct_proposta {
    type: count_distinct
    sql: ${TABLE}."ID_PROPOSTA" ;;
    label: "Quantidade de Propostas"

  }
}
