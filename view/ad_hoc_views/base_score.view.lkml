view: base_score {
  sql_table_name: "AD_HOC"."BASE_SCORE"
    ;;

  dimension: anomes_status {
    type: number
    label: "Ano mês"
    value_format: "0"
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


  dimension: gh_aluno {
    type: string
    case: {
      when: {
        sql: ${score_aluno} <= 1938 ;;
        label: "E"
      }
      when: {
        sql:${score_aluno} <= 5929 ;;
        label: "D"
      }
      when: {
        sql: ${score_aluno} <= 8762  ;;
        label: "C"
      }
      when: {
        sql: ${score_aluno} <= 9192 ;;
        label: "B"
      }
      else: "A"
    }
    group_item_label: "GH - Aluno"
  }

  dimension: score_fiador {
    type: number
    label: "Score -  Garantidor"
    sql: ${TABLE}."SCORE_FIADOR" ;;
  }

  dimension: gh_fiador {
    type: string
    case: {
      when: {
        sql: ${score_fiador} <= 1685 ;;
        label: "E"
      }
      when: {
        sql:${score_fiador} <= 6351 ;;
        label: "D"
      }
      when: {
        sql: ${score_fiador} <= 8590  ;;
        label: "C"
      }
      when: {
        sql: ${score_fiador} <= 9428 ;;
        label: "B"
      }
      else: "A"
    }
    group_item_label: "GH - Fiador"
  }

  dimension: score_final {
    type: number
    label: "Score -  Final"
    sql: ${TABLE}."SCORE_FINAL" ;;
  }

  dimension: score_interno {
    type: number
    label: "Score -  Interno"
    sql: ${TABLE}."SCORE_INTERNOS";;
  }

  dimension: gh_proposta {
    type: string
    case: {
      when: {
        sql: ${score_interno} <= 0.349 ;;
        label: "< 0.349"
      }
      when: {
        sql:${score_interno} <= 0.431 ;;
        label: "0.349 - 0.431"
      }
      when: {
        sql: ${score_interno} <= 0.521  ;;
        label: "0.431 - 0.521"
      }
      when: {
        sql: ${score_interno} > 0.521  ;;
        label: "> 0.5211"
      }
      else: "0"
    }
    group_item_label: "GH - Proposta"
  }


  dimension: target {
    type: number
    label: "Target"
    sql: ${TABLE}."TARGET" ;;
  }

  dimension: gp_estado {
    type: string
    label: "GP Estado"
    sql: ${TABLE}."GP_ESTADO" ;;
  }

  dimension: gp_garantidor_parentesco {
    type: string
    label: "GP Parentesco Garantidor"
    sql: ${TABLE}."GP_FIA_PARENTESCO" ;;
  }

  dimension: gp_garantidor_estado_civil {
    type: string
    label: "GP Estado Civil Garantidor"
    sql: ${TABLE}."GP_FIA_ESTADO_CIVIL" ;;
  }

  dimension: gp_garantidor_natureza_ocup {
    type: string
    label: "GP Ocupação Garantidor"
    sql: ${TABLE}."GP_FIA_NATUREZA_OCUP" ;;
  }

  dimension: gp_idade {
    type: string
    label: "GP Idade"
    sql: ${TABLE}."GP_IDADE" ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_id_cpf {
    type: count_distinct
    sql: ${id_cpf} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Valor"
    description: "Contagem de ID CPFs únicos"
   drill_fields: []

}

  measure: percent_id_cpf {
    type: percent_of_total
    sql: ${count_id_cpf} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Valor"
    description: "Contagem de ID CPFs únicos"
    drill_fields: []

  }

}
