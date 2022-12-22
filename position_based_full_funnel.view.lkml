view: position_based_full_funnel {

  sql_table_name: "POS_GRADUADO"."MARKETING"."POSITION_BASED_FULL_FUNNEL"
    ;;

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: etapa {
    type: string
    sql: ${TABLE}."ETAPA" ;;
  }

  dimension: canal {
    type: string
    sql: ${TABLE}."CANAL" ;;
  }

  dimension_group: date_status {
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
    sql: ${TABLE}."DATE_STATUS" ;;
  }

  dimension_group: data_credito {
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
    sql: ${TABLE}."DATA_CREDITO" ;;
  }

  dimension: qtd_contatos {
    type: number
    group_label: "Contatos"
    sql: ${TABLE}."QTD_CONTATOS" ;;
  }

  dimension: qtd_contatos_unicos {
    type: number
    group_label: "Contatos"
    sql: ${TABLE}."QTD_CONTATOS_UNICOS" ;;
  }

  dimension: touchpoint {
    type: number
    group_label: "Contatos"
    sql: ${TABLE}."TOUCHPOINT" ;;
  }

  dimension: flg_first {
    type: yesno
    group_label: "Contatos"
    label: "a. Flag First"
    sql: ${TABLE}."FLG_FIRST" ;;
  }

  dimension: flg_middle {
    type: yesno
    label: "b. Flag Middle"
    group_label: "Contatos"
    sql: ${TABLE}."FLG_MIDDLE" ;;
  }

  dimension: flg_last {
    type: yesno
    group_label: "Contatos"
    label: "c. Flag Last"
    sql: ${TABLE}."FLG_LAST" ;;
  }

  measure: credito {
    type: sum
    value_format: "0"
    sql: ${TABLE}."CREDITO" ;;
  }
}
