# The name of this view in Looker is "Vw Elegibilidade Comercial"
view: vw_elegibilidade_comercial {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "RISCO"."VW_ELEGIBILIDADE_COMERCIAL"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Apr Bhv" in Explore.

  dimension: apr_bhv {
    type: number
    label: "Aprovado Behavior?"
    sql: ${TABLE}."APR_BHV" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_apr_bhv {
    type: sum
    label: "Total - Aprovado Behavior"
    sql: ${apr_bhv} ;;
  }

  measure: total_formalizado {
    type: sum
    label: "Total - Formalizado"
    sql: ${formalizado} ;;
  }

  dimension: cd_cpf {
    type: number
    label: "CPF"
    primary_key: yes
    sql: ${TABLE}."CD_CPF" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_apr_bhv {
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
    label: "Aprovado Behavior"
    sql: ${TABLE}."DATA_APR_BHV" ;;
  }

  dimension_group: data_elegivel {
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
    label: "Elegibilidade"
    sql: ${TABLE}."DATA_ELEGIVEL" ;;
  }

  dimension_group: data_formalizado {
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
    label: "Formalizado"
    sql: ${TABLE}."DATA_FORMALIZADO" ;;
  }

  dimension: formalizado {
    type: number
    label: "Formalizado?"
    sql: ${TABLE}."FORMALIZADO" ;;
  }

  dimension: safra_apr_bhv {
    type: number
    hidden: yes
    sql: ${TABLE}."SAFRA_APR_BHV" ;;
  }

  dimension: safra_eleg {
    type: number
    hidden: yes
    sql: ${TABLE}."SAFRA_ELEG" ;;
  }

  dimension: safra_formalizado {
    type: number
    hidden: yes
    sql: ${TABLE}."SAFRA_FORMALIZADO" ;;
  }

  dimension: status_alu_novo {
    type: string
    hidden: yes
    sql: ${TABLE}."STATUS_ALU_NOVO" ;;
  }






  dimension: status_renov {
    type: string
    sql: ${TABLE}."STATUS_RENOV" ;;
  }



  measure: count {
    type: count
    drill_fields: []
  }
}
