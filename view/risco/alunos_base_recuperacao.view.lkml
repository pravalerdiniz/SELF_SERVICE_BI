view: alunos_base_recuperacao {
  derived_table: {
    sql: select * from stage.public.base_recup_carteira
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: tdt_cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."TDT_CPF" ;;
  }

  dimension: ano_mes {
    type: string
    label: "Ano - Mês"
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: fundo {
    type: string
    label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: ano_mes_2 {
    type: string
    label: "Ano - Mês 2"
    sql: ${TABLE}."ANO_MES_2" ;;
  }

  dimension: faixa_atraso {
    type: string
    label: "Faixa de Atraso"
    sql: ${TABLE}."FAIXA_ATRASO" ;;
  }

  dimension: bkt {
    type: string
    label: "Bucket"
    sql: ${TABLE}."BKT" ;;
  }

  dimension: qtd {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD" ;;
  }

  measure: saldo {
    type: sum
    label: "Saldo"
    sql: ${TABLE}."SALDO" ;;
  }

  set: detail {
    fields: [
      tdt_cpf,
      ano_mes,
      fundo,
      ano_mes_2,
      faixa_atraso,
      bkt,
      qtd,
      saldo
    ]
  }
}
