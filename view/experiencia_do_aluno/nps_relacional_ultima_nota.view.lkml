view: nps_relacional_ultima_nota {
  sql_table_name: "SELF_SERVICE_BI"."NPS_RELACIONAL_ULTIMA_NOTA"
    ;;


  dimension: comentario_nps {
    type: string
    group_item_label: "Comentário"
    description: "Comentário que o aluno deixou na pesquisa de NPS"
    sql: ${TABLE}."COMENTARIO_NPS" ;;
  }

  dimension: cpf_aluno {
    type: number
    group_item_label: "CPF do Aluno"
    description: "Indica o CPF do Aluno respondente"
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  dimension_group: data_envio_nps {
    type: time
    label: "NPS Disparo"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_ENVIO_NPS" ;;
  }

  dimension_group: data_resposta_nps {
    type: time
    label: "NPS Resposta"
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_RESPOSTA_NPS" ;;
  }

  dimension: email_aluno {
    type: string
    group_item_label: "E-mail do Aluno"
    description: "Indica o e-mail do Aluno respondente"
    sql: ${TABLE}."EMAIL_ALUNO" ;;
  }

  dimension: grupo_nps {
    type: string
    group_item_label: "Grupo"
    description: "Indica qual o tipo de pesquisa que o aluno respondeu (RELACIONAL, ALUNOS RENOVAÇÃO, ALUNOS NOVOS, ALUNOS RENOVAÇÃO - RELACIONAL etc.)"
    sql: ${TABLE}."GRUPO_NPS" ;;
  }

  dimension: grupo_relacional_nps {
    type: string
    group_item_label: "Grupo Relacional"
    description: "Indica se a pesquisa é de NPS Relacional ou outro tipo"
    sql: ${TABLE}."GRUPO_RELACIONAL_NPS" ;;
  }

  dimension: nome_aluno {
    type: string
    group_item_label: "Nome do Aluno"
    description: "Indica o nome do Aluno respondente"
    sql: ${TABLE}."NOME_ALUNO" ;;
  }

  measure: nota_nps {
    type: sum
    group_item_label: "Nota NPS"
    description: "Indica a nota que o aluno recomenda o Pravaler entre 0 e 10."
    sql: ${TABLE}."NOTA_NPS" ;;
  }

  dimension: promotor_detrator_nps {
    type: string
    group_item_label: "Promotor Detrator"
    description: "Indica a categoria do aluno em determinada pesquisa (PROMOTOR, NEUTRO ou DETRATOR)."
    sql: ${TABLE}."PROMOTOR_DETRATOR_NPS" ;;
  }

  dimension: telefone_aluno {
    type: string
    group_item_label: "Celular do Aluno"
    description: "Indica o celular do Aluno respondente"
    sql: ${TABLE}."TELEFONE_ALUNO" ;;
  }

  measure: count {
    type: count
    group_item_label: "Quantidade de Registros"
    description: "Contagem de todos os registros na base"
    drill_fields: []
  }
}
