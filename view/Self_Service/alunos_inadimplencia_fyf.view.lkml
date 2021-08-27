view: alunos_inadimplencia_fyf {
  derived_table: {
    sql: select * from stage.public.fyf_wo FYF
      ;;
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

  dimension: referencia {
    type: number
    label: "Ano e Mês"
    sql: ${TABLE}."REFERENCIA" ;;
  }

  dimension: fundo {
    type: number
    hidden: yes
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: fx_atraso {
    type: number
    label: "Faixa de Atraso"
    sql: ${TABLE}."FX_ATRASO" ;;
  }

  dimension: valor_presente {
    type: number
    hidden: yes
    sql: ${TABLE}."VALOR_PRESENTE" ;;
  }

  dimension: valor_futuro {
    type: number
    hidden: yes
    sql: ${TABLE}."VALOR_FUTURO" ;;
  }

  dimension: recup {
    type: number
    hidden: yes
    sql: ${TABLE}."RECUP" ;;
  }

  dimension: recup_2 {
    type: number
    hidden: yes
    sql: ${TABLE}."RECUP_2" ;;
  }

  dimension: qtd {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD" ;;
  }

  dimension: qtd_rec {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD_REC" ;;
  }

  measure: sum_vl_presente {
    type: sum
    label: "Valor Presente"
    sql: ${valor_presente} ;;


  }

  measure: sum_vl_futuro {
    type: sum
    label: "Valor Futuro"
    sql: ${valor_futuro} ;;

  }

  measure: sum_vl_recuperado {
    type: sum
    label: "Valor Recuperado"
    sql: ${recup} ;;

  }

  measure: sum_vl_recuperado2 {
    type: sum
    label: "Valor Recuperado 2"
    sql: ${recup_2} ;;

  }

  set: detail {
    fields: [
      cpf,
      referencia,
      fundo,
      fx_atraso,
      valor_presente,
      valor_futuro,
      recup,
      recup_2,
      qtd,
      qtd_rec
    ]
  }
}
