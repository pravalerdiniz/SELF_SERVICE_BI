# The name of this view in Looker is "Vw Contratos Inadimplencia"
view: vw_contratos_inadimplencia {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GRADUADO"."RISCO"."VW_CONTRATOS_INADIMPLENCIA"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Alu Contrato" in Explore.

  dimension: alu_contrato {
    type: number
    sql: ${TABLE}."ALU_CONTRATO" ;;
  }


  dimension: pk_cpf_alu_contrato {
    type: string
    primary_key: yes
    hidden:  yes
    sql: CONCAT(${cpf},${alu_contrato}) ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_alu_contrato {
    type: sum
    sql: ${alu_contrato} ;;
  }

  measure: average_alu_contrato {
    type: average
    sql: ${alu_contrato} ;;
  }

  dimension: atraso_mob0 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB0" ;;
  }

  dimension: atraso_mob1 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB1" ;;
  }

  dimension: atraso_mob10 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB10" ;;
  }

  dimension: atraso_mob11 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB11" ;;
  }

  dimension: atraso_mob12 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB12" ;;
  }

  dimension: atraso_mob2 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB2" ;;
  }

  dimension: atraso_mob3 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB3" ;;
  }

  dimension: atraso_mob4 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB4" ;;
  }

  dimension: atraso_mob5 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB5" ;;
  }

  dimension: atraso_mob6 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB6" ;;
  }

  dimension: atraso_mob7 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB7" ;;
  }

  dimension: atraso_mob8 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB8" ;;
  }

  dimension: atraso_mob9 {
    type: number
    group_label: "Dados Atraso MOB"
    sql: ${TABLE}."ATRASO_MOB9" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
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

  dimension_group: data_mob0 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB0" ;;
  }

  dimension_group: data_mob1 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB1" ;;
  }

  dimension_group: data_mob10 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB10" ;;
  }

  dimension_group: data_mob11 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB11" ;;
  }

  dimension_group: data_mob12 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB12" ;;
  }

  dimension_group: data_mob2 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB2" ;;
  }

  dimension_group: data_mob3 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB3" ;;
  }

  dimension_group: data_mob4 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB4" ;;
  }

  dimension_group: data_mob5 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB5" ;;
  }

  dimension_group: data_mob6 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB6" ;;
  }

  dimension_group: data_mob7 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB7" ;;
  }

  dimension_group: data_mob8 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB8" ;;
  }

  dimension_group: data_mob9 {
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
    group_label: "Data MOB"
    sql: ${TABLE}."DATA_MOB9" ;;
  }

  dimension: eleg_fpd {
    type: number
    sql: ${TABLE}."ELEG_FPD" ;;
  }

  dimension: fpd15 {
    type: number
    sql: ${TABLE}."FPD15" ;;
  }

  dimension: modalidade {
    type: string
    sql: ${TABLE}."MODALIDADE" ;;
  }

  dimension: over30_0 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_0" ;;
  }

  dimension: over30_1 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_1" ;;
  }

  dimension: over30_10 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_10" ;;
  }

  dimension: over30_11 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_11" ;;
  }

  dimension: over30_12 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_12" ;;
  }

  dimension: over30_2 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_2" ;;
  }

  dimension: over30_3 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_3" ;;
  }

  dimension: over30_4 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_4" ;;
  }

  dimension: over30_5 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_5" ;;
  }

  dimension: over30_6 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_6" ;;
  }

  dimension: over30_7 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_7" ;;
  }

  dimension: over30_8 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_8" ;;
  }

  dimension: over30_9 {
    type: number
    group_label: "Dados Over 30"
    sql: ${TABLE}."OVER30_9" ;;
  }

  dimension: over60_0 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_0" ;;
  }

  dimension: over60_1 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_1" ;;
  }

  dimension: over60_10 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_10" ;;
  }

  dimension: over60_11 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_11" ;;
  }

  dimension: over60_12 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_12" ;;
  }

  dimension: over60_2 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_2" ;;
  }

  dimension: over60_3 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_3" ;;
  }

  dimension: over60_4 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_4" ;;
  }

  dimension: over60_5 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_5" ;;
  }

  dimension: over60_6 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_6" ;;
  }

  dimension: over60_7 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_7" ;;
  }

  dimension: over60_8 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_8" ;;
  }

  dimension: over60_9 {
    type: number
    group_label: "Dados Over 60"
    sql: ${TABLE}."OVER60_9" ;;
  }

  dimension: pro_nome {
    type: string
    sql: ${TABLE}."PRO_NOME" ;;
  }

  dimension: safra {
    type: string
    sql: ${TABLE}."SAFRA" ;;
  }

  dimension: safra_mob0 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB0" ;;
  }

  dimension: safra_mob1 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB1" ;;
  }

  dimension: safra_mob10 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB10" ;;
  }

  dimension: safra_mob11 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB11" ;;
  }

  dimension: safra_mob12 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB12" ;;
  }

  dimension: safra_mob2 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB2" ;;
  }

  dimension: safra_mob3 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB3" ;;
  }

  dimension: safra_mob4 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB4" ;;
  }

  dimension: safra_mob5 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB5" ;;
  }

  dimension: safra_mob6 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB6" ;;
  }

  dimension: safra_mob7 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB7" ;;
  }

  dimension: safra_mob8 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB8" ;;
  }

  dimension: safra_mob9 {
    type: string
    group_label: "Dados Safra MOB"
    sql: ${TABLE}."SAFRA_MOB9" ;;
  }

  dimension: status_cancelamento {
    type: string
    sql: ${TABLE}."STATUS_CANCELAMENTO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
