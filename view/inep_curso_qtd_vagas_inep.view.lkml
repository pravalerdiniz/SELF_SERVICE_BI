view: inep_curso_qtd_vagas_inep {
  derived_table: {
    persist_for: "48 hours"
    sql: SELECT
        ANO_CENSO,
        ID_IES,
        ID_CURSO,
       DS_CURSO,
       AVG(QTD_VAGA_TOTAL) AS MED_VAGA_TOTAL,
       AVG(QTD_VAGAS_ANUAL_EAD) AS MED_VAGA_ANUAL_EAD,
       AVG(QTD_VAGAS_ANUAL_INTEGRAL) AS MED_VAGA_ANUAL_INTEGRAL,
       AVG(QTD_VAGAS_ANUAL_NOTURNO) AS MED_VAGA_ANUAL_NOTURNO,
       AVG(QTD_VAGAS_ANUAL_VESPERTINO) AS MED_VAGA_ANUAL_VESPERTINO





       FROM "SELF_SERVICE_BI"."INEP" group by 1,2,3,4
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

  dimension: id_ies {
    type: number
    hidden: yes
    sql: ${TABLE}."ID_IES" ;;
  }


  dimension: ano_censo {
    type: number
    hidden: yes
    sql: ${TABLE}."ANO_CENSO" ;;
  }

  dimension: primary_key {
    type: string
    hidden: yes
    sql: CONCAT(${ano_censo},${id_ies},${id_curso},${ds_curso}) ;;
    primary_key: yes

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

measure: sum_vagas_total {
  type: sum
  sql: ${med_vaga_total} ;;
  label: "Total"
  group_label: "Vagas"
  value_format: "0"


}

  measure: sum_vagas_anual_ead {
    type: sum
    sql: ${med_vaga_anual_ead} ;;
    label: "EAD - Anual"
    group_label: "Vagas"
    value_format: "0"


  }

  measure: sum_vagas_anual_integral {
    type: sum
    sql: ${med_vaga_anual_integral} ;;
    label: "Integral - Anual"
    group_label: "Vagas"
    value_format: "0"


  }

  measure: sum_vagas_anual_noturno {
    type: sum
    sql: ${med_vaga_anual_noturno} ;;
    label: "Noturno - Anual"
    group_label: "Vagas"
    value_format: "0"


  }

  measure: sum_vagas_anual_vespertino {
    type: sum
    sql: ${med_vaga_anual_vespertino} ;;
    label: "Vespertino - Anual"
    group_label: "Vagas"
    value_format: "0"


  }


  set: detail {
    fields: [
      id_curso,
      ds_curso,
      id_ies,
      med_vaga_total,
      med_vaga_anual_ead,
      med_vaga_anual_integral,
      med_vaga_anual_noturno,
      med_vaga_anual_vespertino
    ]
  }

}
