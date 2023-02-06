# The name of this view in Looker is "Memcalc Semanal"
view: receita_semanal_provas_pravaler {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."PROVAS_PRAVALER"."MEMCALC_SEMANAL"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cnpj" in Explore.

  dimension: cnpj {
    type: number
    sql: ${TABLE}."CNPJ" ;;
  }

  dimension: desc_faturamento {
    type: string
    sql: ${TABLE}."DESC_FATURAMENTO" ;;
  }

  dimension: desc_mensalidade {
    type: string
    sql: ${TABLE}."DESC_MENSALIDADE" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_realizacao_prova {
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
    sql: ${TABLE}."DT_PERIODO_AGENDADO" ;;
  }

  dimension: nome_fantasia {
    type: string
    sql: ${TABLE}."NOME_FANTASIA" ;;
  }

  measure: num_provas_iniciadas {
    type: sum
    sql: ${TABLE}."NUM_PROVAS_INICIADAS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: num_semana {
    type: number
    sql: ${TABLE}."NUM_SEMANA" ;;
  }

  dimension: razao_social {
    type: string
    sql: ${TABLE}."RAZAO_SOCIAL" ;;
  }

  dimension: tipo_contrato {
    type: string
    sql: ${TABLE}."TIPO_CONTRATO" ;;
  }

  dimension: tipo_processo {
    type: string
    sql: ${TABLE}."TIPO_PROCESSO" ;;
  }

  measure: vl_bruto {
    type: sum
    sql: ${TABLE}."VL_BRUTO" ;;
  }

  measure: vl_receita {
    type: sum
    sql: ${TABLE}."VL_RECEITA" ;;
  }

  measure: vl_venda {
    type: sum
    sql: ${TABLE}."VL_VENDA" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
