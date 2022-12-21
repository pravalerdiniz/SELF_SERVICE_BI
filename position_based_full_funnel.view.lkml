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

  dimension: flg_lead {
    type: yesno
    group_label: "Funil"
    label: "1. Flag Lead"
    sql: ${TABLE}."FLG_LEAD" ;;
  }

  dimension: flg_simulado {
    type: yesno
    group_label: "Funil"
    label: "2. Flag Simulado"
    sql: ${TABLE}."FLG_SIMULADO" ;;
  }

  dimension: flg_iniciado {
    type: yesno
    group_label: "Funil"
    label: "3. Flag Iniciado"
    sql: ${TABLE}."FLG_INICIADO" ;;
  }

  dimension: flg_finalizado {
    type: yesno
    group_label: "Funil"
    label: "4. Flag Finalizado"
    sql: ${TABLE}."FLG_FINALIZADO" ;;
  }

  dimension: flg_apr_risco {
    type: yesno
    group_label: "Funil"
    label: "5. Flag Aprovado Risco"
    sql: ${TABLE}."FLG_APR_RISCO" ;;
  }

  dimension: flg_apr_ies {
    type: yesno
    group_label: "Funil"
    label: "6. Flag Aprovado IES"
    sql: ${TABLE}."FLG_APR_IES" ;;
  }


  dimension: flg_aguard_doc {
    type: yesno
    group_label: "Funil"
    label: "7. Flag Aguardando Documento"
    sql: ${TABLE}."FLG_AGUARD_DOC" ;;
  }

  dimension: flg_aguard_ass {
    type: yesno
    group_label: "Funil"
    label: "8. Flag Aguardando Assinatura"
    sql: ${TABLE}."FLG_AGUARD_ASS" ;;
  }

  dimension: flg_formalizado {
    type: yesno
    group_label: "Funil"
    label: "9. Flag Formalizado"
    sql: ${TABLE}."FLG_FORMALIZADO" ;;
  }

  measure: credito {
    type: sum
    value_format: "0"
    sql: ${TABLE}."CREDITO" ;;
  }
}
