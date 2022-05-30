# The name of this view in Looker is "Ipca Bv Cpf"
view: ipca_bv_cpf {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SELF_SERVICE_BI"."IPCA_BV_CPF"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cpf Aluno" in Explore.

  dimension: cpf_aluno {
    primary_key: yes
    type: number
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_menor_vencimento {
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
    sql: ${TABLE}."DATA_MENOR_VENCIMENTO" ;;
  }

  dimension: faixa_atraso {
    type: string
    sql: ${TABLE}."FAIXA_ATRASO" ;;
  }

  dimension: flg_writeoff {
    type: yesno
    sql: ${TABLE}."FLG_WRITEOFF" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: st_geral {
    type: string
    sql: ${TABLE}."ST_GERAL" ;;
  }

  dimension: status_atraso {
    type: string
    sql: ${TABLE}."STATUS_ATRASO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: quantidade_cpf {
    label: "Quantidade de CPFs"
    type: count_distinct
    sql: ${cpf_aluno} ;;

  }


}
