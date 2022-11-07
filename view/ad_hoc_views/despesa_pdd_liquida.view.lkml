# The name of this view in Looker is "Despesa Pdd Liquida"
view: despesa_pdd_liquida {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."FINANCEIRO"."DESPESA_PDD_LIQUIDA"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  dimension: desp_pdd {
    description: "Valor de despesa PDD."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."DESP_PDD" ;;
    hidden: yes
  }

  dimension: desp_pdd_liquida {
    description: "Valor de despesa PDD líquida na safra (Despesa_PDD - Recuperado_WO)."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."DESP_PDD_LIQUIDA" ;;
    hidden: yes
  }

  dimension: estoque_pdd {
    description: "Valor de estoque PDD na safra."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."ESTOQUE_PDD" ;;
    hidden: yes
  }

  dimension: pagamentos {
    description: "Valor de pagamentos recebidos na safra."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."PAGAMENTOS" ;;
    hidden: yes
  }

  dimension: pdd_carteira {
    description: "Valor de PDD da carteira."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."PDD_CARTEIRA" ;;
    hidden: yes
  }

  dimension: recwo {
    description: "Valor de WO recuperado."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."RECWO" ;;
    hidden: yes
  }

  dimension_group: safra {
    description: "Safra referência de cessão do CPF."
    type: time
    datatype: date
    timeframes: [
      month,
      year
    ]
    convert_tz: no
    sql: date_from_parts(SUBSTR(TO_VARCHAR(${TABLE}."SAFRA"),1,4), SUBSTR(TO_VARCHAR(${TABLE}."SAFRA"),5,6), 1) ;;
  }

  dimension_group: tdt_ano_mes {
    description: "Data de referência dos valores."
    type: time
    datatype: date
    timeframes: [
      month,
      year
    ]
    convert_tz: no
    sql: date_from_parts(SUBSTR(TO_VARCHAR(${TABLE}."TDT_ANO_MES"),1,4), SUBSTR(TO_VARCHAR(${TABLE}."TDT_ANO_MES"),5,6), 1);;
  }

  dimension: var_estoque_pdd {
    description: "Valor de estoque PDD."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."VAR_ESTOQUE_PDD" ;;
    hidden: yes
  }

  dimension: vp_carteira {
    description: "Valor presente da carteira."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."VP_CARTEIRA" ;;
    hidden: yes
  }

  dimension: vp_wo {
    description: "Valor presente em WriteOff."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."VP_WO" ;;
    hidden: yes
  }

  measure: total_desp_pdd_liquida {
    type: sum
    sql: ${desp_pdd_liquida} ;;
    value_format: "$ #,###.00"
    group_label: "PDD"
    group_item_label: "PDD Líquida."
    description: "Soma do valor de PDD Líquida (PDD - Recuperado_WO)"
  }

  measure: total_desp_pdd {
    type: sum
    sql: ${desp_pdd} ;;
    value_format: "$ #,###.00"
    group_label: "PDD"
    group_item_label: "Valor de PDD."
    description: "Soma do valor de PDD."
  }

  measure: total_estoque_pdd{
    type: sum
    sql: ${estoque_pdd} ;;
    value_format: "$ #,###.00"
    group_label: "PDD"
    group_item_label: "Valor de estoque."
    description: "Soma do valor de estoque PDD."
  }

  measure: total_pagamentos {
    value_format: "$ #,###.00"
    group_label: "Pagos"
    group_item_label: "Total Pago"
    description: "Soma do valor total recebido."
    type: sum
    sql: ${pagamentos} ;;
  }

  measure: total_pdd_carteira {
    type: sum
    sql: ${pdd_carteira} ;;
    value_format: "$ #,###.00"
    group_label: "PDD"
    group_item_label: "PDD da carteira."
    description: "Soma do PDD da carteira."
  }

  measure: total_rec_wo {
    type: sum
    sql: ${recwo} ;;
    value_format: "$ #,###.00"
    group_label: "Pagos"
    group_item_label: "WO Recuperado."
    description: "Soma do valor de WO recuperado."
  }

  measure: total_var_estoque_pdd {
    type: sum
    sql: ${var_estoque_pdd} ;;
    value_format: "$ #,###.00"
    group_label: "PDD"
    group_item_label: "Soma do Delta do estoque."
    description: "Soma da variação do estoque PDD."
  }

  measure: total_vp_carteira {
    type: sum
    sql: ${vp_carteira} ;;
    value_format: "$ #,###.00"
    group_label: "Valor presente"
    group_item_label: "Valor presente"
    description: "Soma do valor presente da carteira."
  }

  measure: total_vp_wo {
    type: sum
    sql: ${vp_wo} ;;
    value_format: "$ #,###.00"
    group_label: "Valor presente"
    group_item_label: "WO"
    description: "Soma do valor presente em WO."
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
