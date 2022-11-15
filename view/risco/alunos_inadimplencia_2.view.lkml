view: alunos_inadimplencia_2 {
  derived_table: {
    sql: select * from GRADUADO.RISCO.VW_INADIMPLENCIA ina
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: safra_cpf_primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${safra_cessao_cpf},${cpf}) ;;
  }

  dimension: safra_cessao_cpf {
    type: number
    label: "Safra Cessão - CPF"
    description: "Indica a safra (ano e mês) que o aluno foi cedido"
    value_format: "0"
    sql: ${TABLE}."SAFRA_CESSAO_CPF"::int;;
  }

  dimension: cpf {
    type: number
    label: "CPF"
    description: "Indica a safra (ano e mês) que o aluno foi cedido"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: ies_grupo {
    type: string
    label: "Grupo - IES"
    hidden: yes
    description: "Indica o grupo da IES que aluno está"
    sql: ${TABLE}."IES_GRUPO" ;;
  }



  dimension: modalidade {
    type: string
    label: "Modalidade"
    description: "Indica se o aluno é da modalidade de Antecipação ou Gestão"
    sql: ${TABLE}."MODALIDADE" ;;
  }

  dimension: projeto {
    type: string
    label: "Projeto"
    description: "Indica o projeto que aluno foi cedido. Ex: SEM FIADOR"
    sql: ${TABLE}."PROJETO" ;;
  }

  dimension: gh {
    type: string
    label: "GH"
    description: "Indica o GH atual do aluno."
    sql: ${TABLE}."GH" ;;
  }

  dimension: flg_carencia {
    type: yesno
    label: "Carência?"
    description: "Indica se o aluno possui carência no contrato"
    sql: ${TABLE}."FLG_CARENCIA" ;;
  }

  dimension: flg_politica_over_30 {
    type: number
    label: "Over 30 - Boleto Cancelado?"
    description: "Indica se o aluno possui boleto cancelado. 0 = Não | 1 = Sim"
    sql: ${TABLE}."FILTRO_POLITICA_OVER30" ;;
  }

  dimension: flg_politica_over_60 {
    type: number
    label: "Over 60 - Boleto Cancelado?"
    description: "Indica se o aluno possui boleto cancelado. 0 = Não | 1 = Sim"
    sql: ${TABLE}."FILTRO_POLITICA_OVER60" ;;
  }


  dimension: credit_score {
    type: number
    label: "Score"
    description: "Indica o score"
    sql: ${TABLE}."CREDIT_SCORE" ;;
  }

  dimension: fpd15 {
    type: number
    label: "FPD - 15"
    description: "Indica se o aluno realizou o pagamento do primeiro boleto dentro de 15 dias após ser cedido."
    hidden: yes
    sql: ${TABLE}."FPD15" ;;
  }

  dimension: over15 {
    type: number
    hidden: yes
    label: "OVER 15"
    description: "Indica se o aluno ficou acima de 15 dias de atraso. Pode ser usado para avaliações de safra e de carteira. Quando usamos na carteira, o Over15 mostra o percentual de alunos que está acima de 15 dias de atraso dentro de toda a carteira ativa, sem separa-la por safra de contratação."
    sql: ${TABLE}."OVER15" ;;
  }

  dimension: over30 {
    type: number
    hidden: yes
    label: "OVER 30"
    description: "Indica se o aluno ficou acima de 15 dias de atraso. Pode ser usado para avaliações de safra e de carteira. Quando usamos na carteira, o Over30 mostra o percentual de alunos que está acima de 30 dias de atraso dentro de toda a carteira ativa, sem separa-la por safra de contratação."
    sql: ${TABLE}."OVER30" ;;
  }

  dimension: NEVER_PAID1 {
    type: yesno
    label: "Never Paid 1"
    description: "Flag com Verdadeiro para se o aluno foi cedido e não pagou o primeiro boleto"
    sql: ${TABLE}."FLG_NEVER_PAID1" ;;
  }

  dimension: NEVER_PAID2 {
    type: yesno
    label: "Never Paid 2"
    description: "Flag com Verdadeiro para se o aluno foi cedido e pagou APENAS o primeiro boleto"
    sql: ${TABLE}."FLG_NEVER_PAID2" ;;
  }


  dimension: over60 {
    type: number
    hidden: yes
    label: "OVER 30"
    description: "Indica se o aluno ficou acima de 15 dias de atraso. Pode ser usado para avaliações de safra e de carteira. Quando usamos na carteira, o Over60 mostra o percentual de alunos que está acima de 60 dias de atraso dentro de toda a carteira ativa, sem separa-la por safra de contratação."
    sql: ${TABLE}."OVER60" ;;
  }

  dimension: qtd {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD" ;;
  }

  dimension: fundo {
    type: number
    sql: ${TABLE}."FUNDO" ;;
  }

  set: detail {
    fields: [
      safra_cessao_cpf,
      cpf,
      ies_grupo,
      modalidade,
      projeto,
      gh,
      flg_carencia,
      flg_politica_over_30,
      flg_politica_over_60,
      credit_score,
      fpd15,
      over15,
      over30,
      over60,
      qtd,
      fundo
    ]
  }
}
