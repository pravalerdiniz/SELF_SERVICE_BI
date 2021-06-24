view: status_curta {
  sql_table_name: "CURTA"."STATUS"
    ;;

  dimension_group: data_evento {
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
    sql: ${TABLE}."DATA_EVENTO" ;;
    description: "DATA DE ACONTECIMENTO DO EVENTO"
  }

  dimension: flg_ultimo_status {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_STATUS" ;;
    description: "INFORMA SE É O ULTIMO STATUS DO ALUNO"
  }

  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;
    description: "IDENTIFICADOR DO ALUNO"
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
    description: "IDENTIFICADOR ÚNICO DO CURSO"
  }

  dimension: id_evento {
    type: string
    sql: ${TABLE}."ID_EVENTO" ;;
    description: "IDENTIFICADOR ÚNICO DO EVENTO"
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    description: "IDENTIFICAR DA INSTITUICAO"
  }

  dimension: id_status {
    type: string
    sql: ${TABLE}."ID_STATUS" ;;
    description: "IDENTIFICADOR DO REGISTRO NA TABELA DE STAUTS"
  }

  dimension: num_contrato {
    type: string
    sql: ${TABLE}."NUM_CONTRATO" ;;
    description: "NUMERO DO CONTRATO"
  }

  dimension: objeto {
    type: string
    sql: ${TABLE}."OBJETO" ;;
    description: "COMPILADO DE INFOMRAÇÕES INERENTES A CADA EVENTO"
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}."TIPO_EVENTO" ;;
    description: "DESCRIÇÃO DO EVENTO"
  }

  dimension_group: ultima_atualizacao {
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
    sql: ${TABLE}."ULTIMA_ATUALIZACAO" ;;
    description: "DATA DA ULTIMA ATUALIZAÇÃO DO REGISTRO"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
