view: liberacao_credito_bancos {
  sql_table_name: "POS_GRADUADO"."FINANCEIRO"."LIBERACAO_CREDITO_BANCOS"
    ;;
  drill_fields: [id]


  dimension: id {
    primary_key: yes
    type: string
    label: "ID"
    description: "Identificado único da entidade"
    sql: ${TABLE}."ID" ;;
  }

  dimension: nome {
    type: string
    label: "Banco Nome"
    description: "Identifica o Nome do banco"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: codigo {
    type: number
    label: "Banco Código"
    description: "Código identificado do banco"
    sql: ${TABLE}."CODIGO" ;;
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
    label: ""
    description: ""
    sql: ${TABLE}."DATA_EXCLUSAO" ;;
  }


}
