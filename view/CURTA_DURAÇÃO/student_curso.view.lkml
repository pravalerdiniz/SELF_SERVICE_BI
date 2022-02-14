view: student_curso {
  derived_table: {
    sql: select    py.id_aluno,
           f.key as ID_ALUNO_CURSO,
           F.VALUE:COURSE_ID::VARCHAR ID_CURSO,
          F.VALUE:SCHOOL_ID::VARCHAR ID_INSTITUICAO,
          F.VALUE:DISCOUNT_PERCENTAGE::FLOAT AS PORC_DESC,
          F.VALUE:DOWN_PAYMENT::FLOAT AS PAGAMENTO_INICIAL,
          F.VALUE:INSTALLMENTS::INT AS PARCELAS,
          F.VALUE:VALUE::NUMERIC(10,2) AS VL_CURSO
             from "VETERANO"."CURTA"."STUDENT" py,
      lateral flatten (input=>CURSOS) f
       ;;
  }

  measure: count {
    type: count
    group_item_label: "Total de Curso"
    drill_fields: [detail*]
    description: "INDICA O NUMERO TOTAL DE CURSOS POR ALUNO"
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    hidden: yes
  }

  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;

  }

  dimension: id_aluno_curso {
    type: string
    sql: ${TABLE}."ID_ALUNO_CURSO" ;;
    hidden: yes
    primary_key: yes
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;

  }

  dimension: porc_desc {
    type: number
    sql: ${TABLE}."PORC_DESC" ;;
    group_item_label: "Porcentagem de Desconto Cedida"
    description: "PORCENTAGEM DE DESCONTO CEDIDA NO CURSO"
  }

  measure: pagamento_inicial {
    type: sum
    sql: ${TABLE}."PAGAMENTO_INICIAL" ;;
    group_item_label: "Valor do Pagamento Inicial"
    description: "INDICA O VALOR DO PAGAMENTO DA ENTRADA"
  }

  dimension: parcelas {
    type: number
    sql: ${TABLE}."PARCELAS" ;;
    group_item_label: "Quantidade de Parcelas"
    description: "INDICA A QUANTIDADE TOTAL DE PARCELAS QUE O CURSO PODE TER"
  }

  measure: vl_curso {
    type: sum
    sql: ${TABLE}."VL_CURSO" ;;
    group_item_label: "Valor do Curso"
    description: "VALOR TOTAL DO CURSO"
  }

  measure: count_curso {
    type: count_distinct
    sql: ${id_curso}  ;;
    label: "Quantidade de Cursos"



  }

  set: detail {
    fields: [
      id_aluno,
      id_instituicao,
      id_curso,
      porc_desc,
      pagamento_inicial,
      parcelas,
      vl_curso
    ]
  }
}
