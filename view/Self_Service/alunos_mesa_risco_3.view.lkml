view: alunos_mesa_risco_3 {
  derived_table: {
    sql: select * from stage.public.mesa3
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: proposta_cpf_data {
    sql: CONCAT(${proposta},${cpf_aluno},${data}) ;;
    primary_key: yes
    hidden: yes

  }

  dimension: proposta {
    type: number
    label: "ID Proposta"
    sql: ${TABLE}."PROPOSTA" ;;
  }

  dimension: cpf_aluno {
    type: number
    hidden: yes
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  dimension: cpf_garantidor {
    type: number
    label: "CPF - Garantidor"
    sql: ${TABLE}."CPF_GARANTIDOR" ;;
  }

  measure: renda_somada {
    type: sum
    group_label: "Renda"
    label: "Soma"
    sql: ${TABLE}."RENDA_SOMADA" ;;
  }

  measure: valor_mensal {
    type: sum
    group_label: "Valor"
    label: "Mensal"
    sql: ${TABLE}."VALOR_MENSAL" ;;
  }

   measure: valor_mensalidade {
    type: sum
    group_label: "Valor"
    label: "Mensalidade"
    sql: ${TABLE}."VALOR_MENSALIDADE" ;;
  }

  measure: valor_comprovar {
    type: sum
    group_label: "Valor"
    label: "Valor a comprovar"
    sql: ${TABLE}."VALOR_COMPROVAR" ;;
  }

  dimension: fia_renda {
    type: number
    group_label: "Renda"
    label: "Fiador"
    sql: ${TABLE}."FIA_RENDA" ;;
  }

  dimension: renda_chk {
    type: string
    group_label: "Renda"
    label: "Check - Status"
    sql: ${TABLE}."RENDA_CHK" ;;
  }

  dimension: proposta_bvs {
    type: number
    label: "Boa Vista - Proposta"
    sql: ${TABLE}."PROPOSTA_BVS" ;;
  }

  dimension: cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: data {
    type: date
    sql: ${TABLE}."DATA" ;;
    hidden: yes
  }

  dimension_group: data_renda {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Mesa 3"
    sql: ${data};;
  }


  dimension: boa_vista {
    type: string
    group_label: "Renda"
    label: "Check - Status (Boa Vista)"
    sql: ${TABLE}."BOA_VISTA" ;;
  }

  dimension: resultado {
    type: string
    label: "Resultado"
    sql: ${TABLE}."RESULTADO" ;;
  }

  set: detail {
    fields: [
      proposta,
      cpf_aluno,
      cpf_garantidor,
      renda_somada,
      valor_mensal,
      valor_mensalidade,
      valor_comprovar,
      fia_renda,
      renda_chk,
      proposta_bvs,
      cpf,
      data,
      boa_vista,
      resultado
    ]
  }
}
