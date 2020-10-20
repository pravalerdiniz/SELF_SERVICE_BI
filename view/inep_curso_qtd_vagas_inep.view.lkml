view: inep_curso_qtd_vagas_inep {
  derived_table: {
    sql: SELECT
        ANO_CENSO,
        ID_CURSO,
       DS_CURSO,
       AVG(QTD_VAGA_TOTAL) AS MED_VAGA_TOTAL,
       AVG(QTD_VAGAS_ANUAL_EAD) AS MED_VAGA_ANUAL_EAD,
       AVG(QTD_VAGAS_ANUAL_INTEGRAL) AS MED_VAGA_ANUAL_INTEGRAL,
       AVG(QTD_VAGAS_ANUAL_NOTURNO) AS MED_VAGA_ANUAL_NOTURNO,
       AVG(QTD_VAGAS_ANUAL_VESPERTINO) AS MED_VAGA_ANUAL_VESPERTINO





       FROM "SELF_SERVICE_BI"."INEP" group by 1,2
 ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: id_curso {
    type: number
    hidden: yes
    sql: ${TABLE}."ID_CURSO" ;;
  }


  dimension: ano_censo {
    type: number
    hidden: yes
    sql: ${TABLE}."ANO_CENSO" ;;
  }

  dimension: ds_curso {
    type: string
    hidden: yes
    sql: ${TABLE}."DS_CURSO" ;;
  }

  dimension: med_vaga_total {
    type: number
    hidden: yes
    sql: ${TABLE}."MED_VAGA_TOTAL" ;;
  }

  dimension: med_vaga_anual_ead {
    type: number
    hidden: yes
    sql: ${TABLE}."MED_VAGA_ANUAL_EAD" ;;
  }

  dimension: med_vaga_anual_integral {
    type: number
    hidden: yes
    sql: ${TABLE}."MED_VAGA_ANUAL_INTEGRAL" ;;
  }

  dimension: med_vaga_anual_noturno {
    type: number
    hidden: yes
    sql: ${TABLE}."MED_VAGA_ANUAL_NOTURNO" ;;
  }

  dimension: med_vaga_anual_vespertino {
    type: number
    hidden: yes
    sql: ${TABLE}."MED_VAGA_ANUAL_VESPERTINO" ;;
  }

  set: detail {
    fields: [
      id_curso,
      ds_curso,
      med_vaga_total,
      med_vaga_anual_ead,
      med_vaga_anual_integral,
      med_vaga_anual_noturno,
      med_vaga_anual_vespertino
    ]
  }
}
