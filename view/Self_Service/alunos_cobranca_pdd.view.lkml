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

  dimension_group: data_aluno_calcular_group {
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
    sql: ${TABLE}."DT_ALUNO_CALCULAR" ;;
  }


  dimension: id_fundo_investimento {
    type: number
    label: "ID Fundo Investimento"
    description: "Indica o ID Fundo Investimento"
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
  description: "Valor da despesagem - valor que o aluno despesa da faixa de atraso que ele se encontra"
    sql: ${TABLE}."DESPESAGEM_2" ;;
  }

  dimension: reversao_2 {
    type: number
   hidden: yes
  description: "Valor recuperado da despesagem"
    sql: ${TABLE}."REVERSAO_2" ;;
  }

  dimension: despesa_total_2 {
    type: number
    hidden: yes
    description: "Indica o valor que está provisionado na PDD"
    sql: ${TABLE}."DESPESA_TOTAL_2" ;;
  }

  dimension: despesagem {
    type: number
    hidden: yes
    description: "Valor da despesagem - valor que o aluno despesa da faixa de atraso que ele se encontra"
    sql: ${TABLE}."DESPESAGEM" ;;
  }

  dimension: reversao {
    type: number
    hidden: yes
    description: "Valor recuperado da despesagem"
    sql: ${TABLE}."REVERSAO" ;;
  }

  dimension: despesa_total {
    type: number
    label: "Despesa Total"
    description: "Indica o valor que está provisionado na PDD"
    sql: ${TABLE}."DESPESA_TOTAL" ;;
  }

  dimension: dia_util {
    type: number
    label: "Dia Útil"
    description: "Indica qual dia útil do mês a data representa"
    sql: ${TABLE}."DIA_UTIL" ;;
  }


  measure: despesatotal {
    type: sum
    label: "Despesa Total"
    description: "Indica o valor que está provisionado na PDD"
    sql: ${TABLE}."DESPESA_TOTAL" ;;
  }

measure: sum_despesagem {
  type: sum
  group_label: "Despesagem"
  label: "Soma 1"
  description: "Soma do valor da despesagem - valor que o aluno despesa da faixa de atraso que ele se encontra"
  sql: ${despesagem} ;;
}

  measure: sum_despesagem_2 {
    type: sum
    group_label: "Despesagem"
    label: "Soma 2"
    hidden: yes
    description: "Soma do valor da despesagem - valor que o aluno despesa da faixa de atraso que ele se encontra"
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
    hidden: yes
    sql: ${despesa_total_2} ;;
  }

  measure: sum_reversao {
    type: sum
    group_label: "Reversão"
    label: "Soma 1"
    description: "Valor recuperado da despesagem"
    sql: ${reversao} ;;
  }

  measure: sum_reversao2 {
    type: sum
    group_label: "Reversão"
    label: "Soma 2"
    hidden: yes
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
      despesa_total,
      dia_util
    ]
  }
}
