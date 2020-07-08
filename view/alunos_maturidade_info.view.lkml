view: alunos_maturidade_info {
  derived_table: {
    sql: select
            id_cpf,
            f.key as ano_mes,
            f.value:MOB::int as mob,
            f.value:dias_atraso_cpf::int as dias_atraso_cpf,
            f.value:maturidade::int as maturidade,
            f.value:over15::boolean as over15,
            f.value:over30::boolean as over30,
            f.value:over60::boolean as over60
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
            lateral flatten (input => maturidade_info) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    description: "Indica o ID do CPF do Aluno"
  }

  dimension: ano_mes {
    type: string
    sql: ${TABLE}."ANO_MES" ;;
    description: "Mês de observação"
  }

  dimension: mob {
    type: number
    sql: ${TABLE}."MOB" ;;
    description: "Mês de observação relativo à data de cessão"
  }

  dimension: dias_atraso_cpf {
    type: number
    sql: ${TABLE}."DIAS_ATRASO_CPF" ;;
    description: "Maior tempo de atraso no pagamento no mês de observação"
  }

  dimension: maturidade {
    type: number
    sql: ${TABLE}."MATURIDADE" ;;
    description: "Tempo que o aluno está ativo na carteira"
  }

  dimension: over15 {
    type: string
    sql: ${TABLE}."OVER15" ;;
  }

  dimension: over30 {
    type: string
    sql: ${TABLE}."OVER30" ;;
  }

  dimension: over60 {
    type: string
    sql: ${TABLE}."OVER60" ;;
  }

  set: detail {
    fields: [
      id_cpf,
      ano_mes,
      mob,
      dias_atraso_cpf,
      maturidade,
      over15,
      over30,
      over60
    ]
  }
}
