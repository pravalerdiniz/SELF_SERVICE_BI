view: comunicacao_conversao {
  sql_table_name: "AD_HOC"."COMUNICACAO_CONVERSAO"
    ;;

  dimension: apr_ies_pos_contato {
    type: yesno
    sql: ${TABLE}."APR_IES_POS_CONTATO" ;;
    label: "Aprovado pela Instituição Após Contato?"
  }

  dimension: apr_risco_pos_contato {
    type: yesno
    sql: ${TABLE}."APR_RISCO_POS_CONTATO" ;;
    label: "Aprovado por Risco Após Contato?"
  }

  dimension: campanha {
    type: string
    sql: ${TABLE}."CAMPANHA" ;;
  }

  dimension: ced_pos_contato {
    type: yesno
    sql: ${TABLE}."CED_POS_CONTATO" ;;
    label: "Cedido Após Contato?"
  }

  dimension: cont_ger_pos_contato {
    type: yesno
    sql: ${TABLE}."CONT_GER_POS_CONTATO" ;;
    label: "Contrato Gerado Após Contato?"
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
    hidden: yes
    primary_key: yes
  }

  dimension_group: data_contato {
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
    sql: ${TABLE}."DATA_CONTATO" ;;
    label: "Contato"
  }

  dimension: finalizou_pos_contato {
    type: yesno
    sql: ${TABLE}."FINALIZOU_POS_CONTATO" ;;
    label: "Finalizou Após Contato?"
  }

  dimension: form_pos_contato {
    type: yesno
    sql: ${TABLE}."FORM_POS_CONTATO" ;;
    label: "Formalizou Após Contato?"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    label: "ID CPF"
  }

  dimension_group: pri_status_pos_contato {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."PRI_STATUS_POS_CONTATO_DATE" ;;
    label: "Retorno Pós Contato"
  }

  dimension: tempo_resposta {
    type: number
    sql: datediff('day',${pri_status_pos_contato_date},${data_contato_date}) ;;
  }

  dimension: score_original {
    type: string
    sql: ${TABLE}."SCORE_ORIGINAL" ;;
  }

  dimension: status_pos_contato {
    type: yesno
    sql: ${TABLE}."STATUS_POS_CONTATO" ;;
    group_label: "Teve Interação Pós Contato?"
  }

  dimension: status_pos_contato_info {
    type: string
    sql: ${TABLE}."STATUS_POS_CONTATO_INFO" ;;
  }

  dimension: ult_proposta_pos_contato {
    type: number
    sql: ${TABLE}."ULT_PROPOSTA_POS_CONTATO" ;;
    label: "ID Proposta Mais Recente Pós Contato"
  }

  dimension_group: ult_status_pre_contato {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ULT_STATUS_PRE_CONTATO_DATE" ;;
    label: "Última Interação Pré Contato"
  }

  measure: count {
    type: count
    drill_fields: []
    group_label: "1. Quantidade de Alunos"
    group_item_label: "Valor"
  }

  measure: perc_count {
    type: percent_of_total
    sql: ${count} ;;
    group_label: "1. Quantidade de Alunos"
    group_item_label: "Porcentagem"
  }

  measure: teve_interacao {
    type: number
    sql: SUM(CASE WHEN ${status_pos_contato} THEN 1 ELSE 0 END) ;;
    label: "2. Quantidade de Alunos que Interagiram Pós Contato"
  }

  measure: finalizou {
    type: number
    sql: SUM(CASE WHEN ${finalizou_pos_contato} THEN 1 ELSE 0 END) ;;
    label: "3. Quantidade de Alunos que Finalizaram Pós Contato"
  }

  measure: risco {
    type: number
    sql: SUM(CASE WHEN ${apr_risco_pos_contato} THEN 1 ELSE 0 END) ;;
    label: "4. Quantidade de Alunos Aprovados por Risco Pós Contato"
  }

  measure: ies {
    type: number
    sql: SUM(CASE WHEN ${apr_ies_pos_contato} THEN 1 ELSE 0 END) ;;
    label: "5. Quantidade de Alunos Aprovados pela Instituição Pós Contato"
  }

  measure: gerado {
    type: number
    sql: SUM(CASE WHEN ${cont_ger_pos_contato} THEN 1 ELSE 0 END) ;;
    label: "6. Quantidade de Alunos que Geraram Contrato Pós Contato"
  }

  measure: form {
    type: number
    sql: SUM(CASE WHEN ${form_pos_contato} THEN 1 ELSE 0 END) ;;
    label: "7. Quantidade de Alunos que Formalizaram Pós Contato"
  }

  measure: ced {
    type: number
    sql: SUM(CASE WHEN ${ced_pos_contato} THEN 1 ELSE 0 END) ;;
    label: "8. Quantidade de Alunos Cedidos Pós Contato"
  }

  measure: avg_tempo_resposta {
    type: average
    sql: ${tempo_resposta} ;;
    label: "Tempo de Resposta Médio"
  }
}
