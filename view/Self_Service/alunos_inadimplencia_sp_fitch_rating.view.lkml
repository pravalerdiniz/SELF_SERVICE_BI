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

  dimension: over05 {
    type: yesno
    group_label: "Overs"
    label: "Over 05?"
    description: "Indica se o aluno possui mais de 05 dias de atraso em relação a seu vencimento mais antigo"
    sql: ${TABLE}."OVER05" ;;
  }

  dimension: over15 {
    type: yesno
    group_label: "Overs"
    label: "Over 15?"
    description: "Indica se o aluno possui mais de 15 dias de atraso em relação a seu vencimento mais antigo"
    sql: ${TABLE}."OVER15" ;;
  }


  dimension: over30 {
    type: yesno
    group_label: "Overs"
    label: "Over 30?"
    description: "Indica se o aluno possui mais de 30 dias de atraso em relação a seu vencimento mais antigo"
    sql: ${TABLE}."OVER30" ;;
  }

  dimension: over60 {
    type: yesno
    group_label: "Overs"
    label: "Over 60?"
    description: "Indica se o aluno possui mais de 60 dias de atraso em relação a seu vencimento mais antigo"
    sql: ${TABLE}."OVER60" ;;
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

  dimension_group: dt_titulo_calcular {
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
    label: "Titulo Calcular"
    description: "Indica a data base para calculo de divida do aluno"
    sql: ${TABLE}."DT_TITULO_CALCULAR" ;;
  }







  dimension: qtd_dias_atraso {
   type: number
  label: "Dias de Atraso"
  description: "Indica os dias de atraso referente ao último vencimento aberto do aluno."
   sql:  ${TABLE}."QT_DIAS_ATRASO";;

  }


measure: sum_over05 {
  type: count
  group_label: "Overs - Quantidade"
  label: "Over 05"
  filters: [over05: "yes"]





}


  measure: sum_over15 {
    type: count
    group_label: "Overs - Quantidade"
    label: "Over 15"
    filters: [over15: "yes"]





  }

  measure: sum_over30 {
    type: count
    group_label: "Overs - Quantidade"
    label: "Over 30"
    filters: [over30: "yes"]





  }

  measure: sum_over60 {
    type: count
    group_label: "Overs - Quantidade"
    label: "Over 60"
    filters: [over60: "yes"]





  }


  measure: sum_vp {
    type: sum
    label: "Valor Presente"
    sql: ${soma_vp} ;;
    description: "Indica a soma do Valor Presente do Aluno"

  }

  measure: sum_vf {
    type: sum
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
