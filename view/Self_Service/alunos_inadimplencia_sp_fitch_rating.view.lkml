view: alunos_inadimplencia_sp_fitch_rating {
  derived_table: {
    sql: select * from stage.public.SP_fitch_Ratings
      ;;
  }

  dimension: cpf_fundo_data {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${cpf},${id_fundo_investimento},${menor_vencto_raw}) ;;


  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    label: "ID Fundo de Investimento"
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: qde_boletos {
    type: number
    label: "Quantidade de Boletos"
    sql: ${TABLE}."QDE_BOLETOS" ;;
  }

  dimension: soma_vp {
    type: number
    hidden: yes
    sql: ${TABLE}."SOMA_VP" ;;
  }

  dimension: soma_vf {
    type: number
    hidden: yes
    sql: ${TABLE}."SOMA_VF" ;;
  }

  dimension_group: menor_vencto {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    label: "Menor Vencimento"
    description: "Indica a data do menor vencimento em aberto do aluno"
    sql: ${TABLE}."MENOR_VENCTO" ;;
  }


  measure: sum_vp {
    label: "Valor Presente"
    sql: ${soma_vp} ;;
    description: "Indica a soma do Valor Presente do Aluno"

  }

  measure: sum_vf {
    label: "Boleto"
    sql: ${soma_vp} ;;
    description: "Indica a soma do valor dos boletos não pagos do aluno"

  }

  set: detail {
    fields: [
      cpf,
      id_fundo_investimento,
      qde_boletos,
      soma_vp,
      soma_vf,
      menor_vencto_date
    ]
  }
}
