view: semestre_financiado {
  sql_table_name: "VETERANO"."PUBLIC"."SEMESTRE_FINANCIADO_PROPOSTA"
      ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension_group: data_preenchimento {
    type: time
    sql: ${TABLE}."DATA_PREENCHIMENTO" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: ds_instituicao {
    type: string
    sql: ${TABLE}."DS_INSTITUICAO" ;;
  }

  dimension: grupo_instituicao {
    type: string
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
  }

  dimension: id_produto {
    type: string
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: nm_produto {
    type: string
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: semestre_financiado_1 {
    type: string
    sql: ${TABLE}."SEMESTRE_FINANCIADO_1" ;;
  }

  dimension: semestre_financiado_2 {
    type: string
    sql: ${TABLE}."SEMESTRE_FINANCIADO_2" ;;
  }

  dimension: semestre_financiado_3 {
    type: string
    sql: ${TABLE}."SEMESTRE_FINANCIADO_3" ;;
  }

  dimension: semestre_financiado {
    type: string
    sql: ${TABLE}."SEMESTRE_FINANCIADO" ;;
  }

  dimension: cpf_aluno {
    type: number
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  dimension: cpf_garantidor {
    type: number
    sql: ${TABLE}."CPF_GARANTIDOR" ;;
  }

  set: detail {
    fields: [
      id_proposta,
      data_preenchimento_time,
      id_cpf,
      id_instituicao,
      ds_instituicao,
      grupo_instituicao,
      id_produto,
      nm_produto,
      semestre_financiado_1,
      semestre_financiado_2,
      semestre_financiado_3,
      semestre_financiado,
      cpf_aluno,
      cpf_garantidor
    ]
  }
}
