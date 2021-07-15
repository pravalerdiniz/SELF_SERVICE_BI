view: base_score {
  sql_table_name: "AD_HOC"."BASE_SCORE"
    ;;

  dimension: anomes_status {
    type: number
    label: "Ano mês"
    sql: ${TABLE}."ANOMES_STATUS" ;;
  }

  dimension: gh {
    type: string
    label: "GH"
    sql: ${TABLE}."GH" ;;
  }

  dimension: id_cpf {
    type: number
    label: "ID CPF"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_fia_cpf {
    type: number
    label: "ID CPF - Garantidor"
    sql: ${TABLE}."ID_FIA_CPF" ;;
  }

  dimension: id_proposta {
    type: string
    label: "ID PROPOSTA"
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: score_aluno {
    type: number
    label: "Score"
    sql: ${TABLE}."SCORE_ALUNO" ;;
  }

  dimension: score_fiador {
    type: number
    label: "Score -  Garantidor"
    sql: ${TABLE}."SCORE_FIADOR" ;;
  }

  dimension: score_final {
    type: number
    label: "Score -  Final"
    sql: ${TABLE}."SCORE_FINAL" ;;
  }

  dimension: score_interno {
    type: number
    label: "Score -  Interno"
    sql: ${TABLE}."SCORE_INTERNO" ;;
  }

  dimension: target {
    type: number
    label: "Target"
    sql: ${TABLE}."TARGET" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
