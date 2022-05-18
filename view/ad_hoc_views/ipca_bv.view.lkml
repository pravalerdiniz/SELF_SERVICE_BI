# The name of this view in Looker is "Ipca Bv"
view: ipca_bv {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: GRADUADO."SELF_SERVICE_BI"."IPCA_BV"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ano Concessao" in Explore.

  dimension: ano_concessao {
    type: number
    sql: ${TABLE}."ANO_CONCESSAO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ano_concessao {
    type: sum
    sql: ${ano_concessao} ;;
  }

  measure: average_ano_concessao {
    type: average
    sql: ${ano_concessao} ;;
  }

  dimension: ano_vencimento {
    type: number
    sql: ${TABLE}."ANO_VENCIMENTO" ;;
  }

  dimension: cpf_aluno {
    type: number
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_concessao {
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
    sql: ${TABLE}."DATA_CONCESSAO" ;;
  }

  dimension_group: data_vencimento_boleto {
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
    sql: ${TABLE}."DATA_VENCIMENTO_BOLETO" ;;
  }

  dimension_group: fim_mes_boleto {
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
    sql: ${TABLE}."FIM_MES_BOLETO" ;;
  }

  dimension_group: fim_mes_concessao {
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
    sql: ${TABLE}."FIM_MES_CONCESSAO" ;;
  }

  dimension: id_contrato {
    type: string
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: taxa_ipca_aplicada {
    type: number
    sql: ${TABLE}."TAXA_IPCA_APLICADA" ;;
  }

  dimension: vl_boleto {
    type: number
    sql: ${TABLE}."VL_BOLETO" ;;
  }

  dimension: vl_boleto_cenario_a {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_A" ;;
  }

  dimension: vl_boleto_cenario_b {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_B" ;;
  }

  dimension: vl_boleto_cenario_c_10_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_C_10_PRC" ;;
  }

  dimension: vl_boleto_cenario_c_15_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_C_15_PRC" ;;
  }

  dimension: vl_boleto_cenario_c_5_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_C_5_PRC" ;;
  }

  dimension: vl_boleto_cenario_d {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_D" ;;
  }

  dimension: vl_boleto_cenario_d_10_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_D_10_PRC" ;;
  }

  dimension: vl_boleto_cenario_d_15_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_D_15_PRC" ;;
  }

  dimension: vl_boleto_cenario_d_5_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_D_5_PRC" ;;
  }

  dimension: perc_provisao {
    type: number
    sql: ${TABLE}."PERC_PROVISAO" ;;
  }

  measure: perc_provisao_medida {
    type: average
    sql: ${perc_provisao} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
