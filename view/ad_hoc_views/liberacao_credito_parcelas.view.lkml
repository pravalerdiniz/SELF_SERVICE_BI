view: liberacao_credito_parcelas {
  sql_table_name: "POS_GRADUADO"."FINANCEIRO"."LIBERACAO_CREDITO_PARCELAS"
    ;;
  drill_fields: [id]

  ## DIMENSIONS  ##

  #ID
  dimension: id {
    primary_key: yes
    type: string
    label: "ID"
    group_label: ""
    description: "Identificado único da entidade"
    sql: ${TABLE}."ID" ;;
  }

  #VALUE
  dimension: valor {
    type: number
    value_format: "$#,##0.00"
    label: "Valor da Parcela"
    group_label: ""
    description: "Valor da parcela"
    sql: ${TABLE}."VALOR" ;;
  }

  #DEBT_ID
  dimension: id_debito {
    type: string
    label: "ID Débito"
    group_label: ""
    description: "Identificado do debito a qual uma parcela pertence"
    sql: ${TABLE}."ID_DEBITO" ;;
  }

  ## DATA ##

  # DUE_DATE
  dimension_group: data_vencimento {
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
    label: "Data Vencimento"
    description: "data de vencimento da parcela"
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  dimension_group: data_criacao {
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
    label: "Data Criação"
    description: "Data e hora da criação do registro"
    sql: ${TABLE}."DATA_CRIACAO" ;;
  }

  dimension_group: data_atualizacao {
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
    label: "Data Atualização"
    description: "Data e hora da ultima atualização do registro"
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension_group: data_exclusao {
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
    label: "Data Exclusão"
    description: "Data e hora que o registro foi excluído, apenas preenchido caso o registro tenha sido excluído"
    sql: ${TABLE}."DATA_EXCLUSAO" ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [id]
  }
}
