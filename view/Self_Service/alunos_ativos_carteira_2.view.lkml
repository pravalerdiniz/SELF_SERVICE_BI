view: alunos_ativos_carteira_2 {
  derived_table: {
    sql: select * from stage.public.aluno_ativo_risco AAR
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

  dimension: tdt_ano_mes {
    type: number
    label: "Ano - Mês"
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: fundo {
    type: number
    hidden: yes
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: ies_grupo {
    type: string
    hidden: yes
    sql: ${TABLE}."IES_GRUPO" ;;
  }

  dimension: modalidade {
    type: string
    label: "Modalidade"
    sql: ${TABLE}."MODALIDADE" ;;
  }

  dimension: faixa_atraso {
    type: number
    label: "Faixa de Atraso"
    group_label: "Indica a faixa de do aluno dentro da carteira ativa do pravaler"
    sql: ${TABLE}."FAIXA_ATRASO" ;;
  }

  dimension: dias_atraso_fundo {
    type: number
    label: "Dias de atraso no fundo"
    sql: ${TABLE}."DIAS_ATRASO_FUNDO" ;;
  }

  dimension: saldo {
    type: number
    hidden: yes
    sql: ${TABLE}."SALDO" ;;
  }

  dimension: saldo30 {
    type: number
    hidden: yes
    sql: ${TABLE}."SALDO30" ;;
  }

  dimension: saldo60 {
    type: number
    hidden: yes
    sql: ${TABLE}."SALDO60" ;;
  }

  dimension: saldo90 {
    type: number
    hidden: yes
    sql: ${TABLE}."SALDO90" ;;
  }

  dimension: saldo180 {
    type: number
    hidden: yes
    sql: ${TABLE}."SALDO180" ;;
  }

  dimension: qtd {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD" ;;
  }

  measure: sum_saldo  {
   type: sum
  group_item_label: "Saldo"
   label: "Soma"
    sql: ${saldo} ;;
  }

  measure: sum_saldo60  {
    type: sum
    group_item_label: "Saldo"
    label: "60 dias"
    sql: ${saldo60} ;;
  }

  measure: sum_saldo90  {
    type: sum
    group_item_label: "Saldo"
    label: "90 dias"
    sql: ${saldo90} ;;
  }

  measure: sum_saldo30  {
    type: sum
    group_item_label: "Saldo"
    label: "30 dias"
    sql: ${saldo30} ;;
  }

  measure: sum_saldo180  {
    type: sum
    group_item_label: "Saldo"
    label: "180 dias"
    sql: ${saldo180} ;;
  }

  set: detail {
    fields: [
      tdt_cpf,
      tdt_ano_mes,
      fundo,
      ies_grupo,
      modalidade,
      faixa_atraso,
      dias_atraso_fundo,
      saldo,
      saldo30,
      saldo60,
      saldo90,
      saldo180,
      qtd
    ]
  }
}
