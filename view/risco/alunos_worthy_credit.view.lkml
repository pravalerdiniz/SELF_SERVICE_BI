view: alunos_worthy_credit {
  derived_table: {
    sql: select
            id_cpf,
            f.key as ID_WORTHY_CREDIT,
            f.value:DT_SCORE::timestamp as DT_SCORE,
            f.value:FLG_APROVADO::boolean as FLG_APROVADO,
            f.value:VL_SCORE::float as VL_SCORE
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
            lateral flatten (input => OBJ_WORTHY_SCORE) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_worthy_credit {
    type: string
    label: "ID Worthy Credit"
    description: "Indica o ID Worthy Credit gerado para o aluno"
    sql: ${TABLE}."ID_WORTHY_CREDIT" ;;
  }

  dimension_group: dt_score {
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
    label: "Score"
    description: "Indica a data em que o aluno teve seu score calculado dentro do modelo Worthy Credit"
    sql: ${TABLE}."DT_SCORE" ;;
  }

  dimension: flg_aprovado {
    type: yesno
    label: "Aprovado?"
    description: "Indica se o aluno foi aprovado ou não pelo modelo Worthy Credit"
    sql: ${TABLE}."FLG_APROVADO" ;;
  }

  dimension: vl_score {
    type: number
    label: "Worthy Credit - Score"
    description: "Indica o score do aluno dentro do modelo Worthy Credit"
    sql: ${TABLE}."VL_SCORE" ;;
  }

  set: detail {
    fields: [id_cpf, id_worthy_credit, dt_score_time, flg_aprovado, vl_score]
  }
}
