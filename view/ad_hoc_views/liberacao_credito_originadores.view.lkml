view: liberacao_credito_originadores {

  sql_table_name: "FINANCEIRO"."LIBERACAO_CREDITO_ORIGINADORES"
    ;;
  drill_fields: [id]

  ## DIMENSIONS ##

  # ID
  dimension: id {
    primary_key: yes
    type: string
    label: "ID"
    group_label: ""
    description: "Identificado único da entidade"
    sql: ${TABLE}."ID" ;;
  }

  #NAME
  dimension: nome {
    type: string
    label: "Nome do Originador"
    group_label: ""
    description: "Nome do originador"
    sql: ${TABLE}."NOME" ;;
  }


  ## DATAS ##

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
    drill_fields: [id]
    hidden: yes
  }
}
