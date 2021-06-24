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
    group_item_label: "Data do Evento"
  }

  dimension: flg_ultimo_status {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_STATUS" ;;
    description: "INFORMA SE É O ULTIMO STATUS DO ALUNO"
    group_item_label: "É o Ultimo Status?"
  }

  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;
    description: "IDENTIFICADOR DO ALUNO"
    group_item_label: "Id do Aluno"
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
    description: "IDENTIFICADOR ÚNICO DO CURSO"
    group_item_label: "Id do Curso"
  }

  dimension: id_evento {
    type: string
    sql: ${TABLE}."ID_EVENTO" ;;
    description: "IDENTIFICADOR ÚNICO DO EVENTO"
    group_item_label: "Id do Evento"
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    description: "IDENTIFICAR DA INSTITUICAO"
    group_item_label: "Id da Instituição"
  }

  dimension: id_status {
    type: string
    sql: ${TABLE}."ID_STATUS" ;;
    description: "IDENTIFICADOR DO REGISTRO NA TABELA DE STAUTS"
    group_item_label: "Id do Status"
  }

  dimension: num_contrato {
    type: string
    sql: ${TABLE}."NUM_CONTRATO" ;;
    description: "NUMERO DO CONTRATO"
    group_item_label: "Numero do Contrato"
  }

  dimension: objeto {
    type: string
    sql: ${TABLE}."OBJETO" ;;
    description: "COMPILADO DE INFOMRAÇÕES INERENTES A CADA EVENTO"
    group_item_label: "Objeto com Informações Diversas"
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}."TIPO_EVENTO" ;;
    description: "DESCRIÇÃO DO EVENTO"
    group_item_label: "Tipo de Evento"
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
    group_item_label: "Data da Ultima Atualização"
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  measure: total_alunos {
    type: count_distinct
    sql: ${id_aluno} ;;
    group_item_label: "Total de Alunos"
  }

  measure: total_contratos {
    type: count_distinct
    sql: ${num_contrato} ;;
    group_item_label: "Total de Contratos"
  }
}
