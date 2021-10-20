view: alunos_cobranca_pdd {
  derived_table: {
    sql: select * from stage.public.cobranca_pdd
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dt_aluno_calcular {
    type: date
    hidden: yes
    sql: ${TABLE}."DT_ALUNO_CALCULAR" ;;
  }

  dimension_group: data_aluno_calcular_group{
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      month_name,
      year,
      time,

    ]
    convert_tz: no
    label: "Aluno - Calcular"
    description: "Indica a data de baixa realizada"
    datatype: date
    sql: ${dt_aluno_calcular} ;;
  }


  dimension: id_fundo_investimento {
    type: number
    label: "ID Fundo Investimento"
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: cpf {
    type: number
    label: "CPF"
    primary_key: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: fx_atraso {
    type: string
    label: "Faixa de Atraso"
    sql: ${TABLE}."FX_ATRASO" ;;
  }

  dimension: qtd_cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD_CPF" ;;
  }

  dimension: despesagem_2 {
    type: number
   hidden: yes
    sql: ${TABLE}."DESPESAGEM_2" ;;
  }

  dimension: reversao_2 {
    type: number
   hidden: yes
    sql: ${TABLE}."REVERSAO_2" ;;
  }

  dimension: despesa_total_2 {
    type: number
    hidden: yes
    sql: ${TABLE}."DESPESA_TOTAL_2" ;;
  }

  dimension: despesagem {
    type: number
    hidden: yes
    sql: ${TABLE}."DESPESAGEM" ;;
  }

  dimension: reversao {
    type: number
    hidden: yes
    sql: ${TABLE}."REVERSAO" ;;
  }

  dimension: despesa_total {
    type: number
    sql: ${TABLE}."DESPESA_TOTAL" ;;
  }

  measure: despesatotal {
    type: sum
    label: "Despesa Total"
    sql: ${TABLE}."DESPESA_TOTAL" ;;
  }

measure: sum_despesagem {
  type: sum
  group_label: "Despesagem"
  label: "Soma 1"
  sql: ${despesagem} ;;


}

  measure: sum_despesagem_2 {
    type: sum
    group_label: "Despesagem"
    label: "Soma 2"
    sql: ${despesagem_2} ;;

  }


  measure: sum_despesagem_total {
    type: sum
    group_label: "Despesagem"
    label: "Total 1"
    sql: ${despesa_total} ;;

  }

  measure: sum_despesagem_total_2 {
    type: sum
    group_label: "Despesagem"
    label: "Total 2"
    sql: ${despesa_total_2} ;;

  }

  measure: sum_reversao {
    type: sum
    group_label: "Reversão"
    label: "Soma 1"
    sql: ${reversao} ;;

  }

  measure: sum_reversao2 {
    type: sum
    group_label: "Reversão"
    label: "Soma 2"
    sql: ${reversao_2} ;;

  }

  set: detail {
    fields: [
      dt_aluno_calcular,
      id_fundo_investimento,
      cpf,
      fx_atraso,
      qtd_cpf,
      despesagem_2,
      reversao_2,
      despesa_total_2,
      despesagem,
      reversao,
      despesa_total
    ]
  }
}
