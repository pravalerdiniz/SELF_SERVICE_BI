view: position_based_full_funnel {

  sql_table_name: "POS_GRADUADO"."MARKETING"."POSITION_BASED_FULL_FUNNEL"
    ;;

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: etapa {
    type: string
    sql: CASE
            WHEN ${TABLE}."ETAPA" = 'Lead' THEN '1. Lead'
            WHEN ${TABLE}."ETAPA" = 'Simulado' THEN '2. Simulado'
            WHEN ${TABLE}."ETAPA" = 'Iniciado' THEN '3. Iniciado'
            WHEN ${TABLE}."ETAPA" = 'Finalizado' THEN '4. Finalizado'
            WHEN ${TABLE}."ETAPA" = 'Aprovado Risco' THEN '5. Aprovado Risco'
            WHEN ${TABLE}."ETAPA" = 'Aprovado Instituicao' THEN '6. Aprovado Instituicao'
            WHEN ${TABLE}."ETAPA" = 'Aguardando Documento' THEN '7. Aguardando Documento'
            WHEN ${TABLE}."ETAPA" = 'Aguardando Assinatura' THEN '8. Aguardando Assinatura'
            WHEN ${TABLE}."ETAPA" = 'Formalizado' THEN '9. Formalizado'
        END;;
  }

  dimension: canal {
    type: string
    sql: CASE
            WHEN ${TABLE}."CANAL" = 'ITI' OR ${TABLE}."CANAL" = 'ITAU' THEN 'OUTROS'
            WHEN ${TABLE}."CANAL" = 'APP' OR ${TABLE}."CANAL" = 'SOCIAL' THEN 'ORGANICO'
         ELSE ${TABLE}."CANAL" END;;
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

  measure: count_id_cpf {
    type: count_distinct
    label: "Qtd Alunos"
    sql: ${TABLE}."ID_CPF" ;;
  }

}
