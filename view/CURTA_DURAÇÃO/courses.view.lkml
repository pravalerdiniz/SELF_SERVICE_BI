view: courses {
  derived_table: {
    sql: SELECT
      ID_INSTITUICAO,
      ID_CURSO,
      NOME_CURSO,
      DS_CURSO,
      VL_CURSO,
      FLG_CURSO_GESTAO,
      FLG_CURSO_ANTECIPACAO,
      CURSO_DATA_ATUALIZACAO
      FROM "VETERANO"."CURTA"."INSTITUTION"
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_instituicao {
    type: string
    hidden: yes
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_curso {
    type: string
    label: "ID Curso"
    primary_key: yes
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: nome_curso {
    type: string
    label: "Nome do Curso"
    sql: ${TABLE}."NOME_CURSO" ;;
  }

  dimension: ds_curso {
    type: string
    label: "Descrição do Curso"
    sql: ${TABLE}."DS_CURSO" ;;
  }

  dimension: vl_curso {
    type: number
    hidden: yes
    sql: ${TABLE}."VL_CURSO" ;;
  }

  dimension: flg_curso_gestao {
    type: string
    label: "Gestão?"
    sql: ${TABLE}."FLG_CURSO_GESTAO" ;;
  }

  dimension: flg_curso_antecipacao {
    type: string
    label: "Antecipação?"
    sql: ${TABLE}."FLG_CURSO_ANTECIPACAO" ;;
  }

  dimension_group: curso_data_atualizacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."CURSO_DATA_ATUALIZACAO";;
    description:"DATA DA ULTIMA ATUALIZAÇÃO DO CURSO"
    label: "Curso Atualização"

  }
  set: detail {
    fields: [
      id_instituicao,
      id_curso,
      nome_curso,
      ds_curso,
      vl_curso,
      flg_curso_gestao,
      flg_curso_antecipacao,
      curso_data_atualizacao_time
    ]
  }

  measure: sum_vl_curso {
    type: sum
    group_label: "Valor do Curso"
    group_item_label: "Soma"
    sql: ${vl_curso} ;;


  }

  measure: count_cursos {
    type: count_distinct
    drill_fields: []
    group_item_label: "Total de Curso"
  }


  measure: avg_vl_curso {
    type: average
    group_label: "Valor do Curso"
    group_item_label: "Média"
    sql: ${vl_curso} ;;


  }

  measure: min_vl_curso {
    type: min
    group_label: "Valor do Curso"
    group_item_label: "Mínimo"
    sql: ${vl_curso} ;;


  }

  measure: max_vl_curso {
    type: max
    group_label: "Valor do Curso"
    group_item_label: "Máximo"
    sql: ${vl_curso} ;;
  }

}
