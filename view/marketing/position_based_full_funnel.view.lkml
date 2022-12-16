
view: position_based_full_funnel {

  sql_table_name: "POS_GRADUADO"."MARKETING"."POSITION_BASED_FULL_FUNNEL"
    ;;

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: canal {
    type: string
    sql: ${TABLE}."CANAL" ;;
  }

  measure: credito {
    type: sum
    sql: ${TABLE}."CREDITO" ;;
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

  dimension_group: safra {
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
    sql: ${TABLE}."SAFRA" ;;
  }

  dimension: qtd_contatos {
    type: number
    sql: ${TABLE}."QTD_CONTATOS" ;;
  }

  dimension: qtd_contatos_unicos {
    type: number
    sql: ${TABLE}."QTD_CONTATOS_UNICOS" ;;
  }

  dimension: touchpoint {
    type: number
    sql: ${TABLE}."TOUCHPOINT" ;;
  }

  dimension: flg_first {
    type: yesno
    sql: ${TABLE}."FLG_FIRST" ;;
  }

  dimension: flg_middle {
    type: yesno
    sql: ${TABLE}."FLG_MIDDLE" ;;
  }

  dimension: flg_last {
    type: yesno
    sql: ${TABLE}."FLG_LAST" ;;
  }

  dimension: flg_lead {
    type: yesno
    sql: ${TABLE}."FLG_LEAD" ;;
  }

  dimension: flg_simulado {
    type: yesno
    sql: ${TABLE}."FLG_SIMULADO" ;;
  }

  dimension: flg_iniciado {
    type: yesno
    sql: ${TABLE}."FLG_INICIADO" ;;
  }

  dimension: flg_finalizado {
    type: yesno
    sql: ${TABLE}."FLG_FINALIZADO" ;;
  }

  dimension: flg_apr_risco {
    type: yesno
    sql: ${TABLE}."FLG_APR_RISCO" ;;
  }

  dimension: flg_apr_ies {
    type: yesno
    sql: ${TABLE}."FLG_APR_IES" ;;
  }


  dimension: flg_aguard_doc {
    type: yesno
    sql: ${TABLE}."FLG_AGUARD_DOC" ;;
  }

  dimension: flg_aguard_ass {
    type: yesno
    sql: ${TABLE}."FLG_AGUARD_ASS" ;;
  }

  dimension: flg_formalizado {
    type: yesno
    sql: ${TABLE}."FLG_FORMALIZADO" ;;
  }

}
