view: alunos_inadimplencia_sp_fitch_rating {
  derived_table: {
    sql: select * from stage.public.risco_sp_fitch
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
  label: "CPF"
  hidden: yes
  }

  dimension: cpf_ano_mes {
    type: string
    sql: CONCAT(${cpf},${ano_mes}) ;;
    primary_key: yes
    hidden: yes
    }

  dimension: ano_mes {
    type: number
    sql: ${TABLE}."TDT_ANO_MES" ;;
    label: "Ano Mês"
    description: "Indica qual o ano e mês"
  }

  dimension: fundo {
    type: number
    sql: ${TABLE}."FUNDO" ;;
    label: "Fundo"
    description: "Indica qual o fundo de investimento"
  }

  dimension: qtd_over_5 {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD_OVER_5" ;;
  }

  dimension: qtd_over_30 {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD_OVER_30" ;;
  }

  dimension: qtd_over_60 {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD_OVER_60" ;;
  }

  dimension: qtd {
    hidden: yes
    type: number
    sql: ${TABLE}."QTD" ;;
  }

  measure: valor_presente_over_5 {
    type: sum
    sql: ${TABLE}."VP_OVER_5" ;;
    label: "Valor Presente - Over 5"
    description: "Soma dos Valores Presentes - Over 5"
  }

  measure: valor_presente_over_30 {
    type: sum
    sql: ${TABLE}."VP_OVER_30" ;;
    label: "Valor Presente - Over 30"
    description: "Soma dos Valores Presentes - Over 30"
  }

  measure: valor_presente_over_60 {
    type: sum
    sql: ${TABLE}."VP_OVER_60" ;;
    label: "Valor Presente - Over 60"
    description: "Soma dos Valores Presentes - Over 60"
  }

 measure: valor_presente {
    type: sum
    sql: ${TABLE}."VP" ;;
    label: "Valor Presente"
    description: "Soma dos Valores Presentes"
  }

  set: detail {
    fields: [
      ano_mes,
      fundo,
      qtd_over_5,
      qtd_over_30,
      qtd_over_60,
      qtd,
    ]
  }
}
