view: alunos_inadimplencia {
  derived_table: {
    sql: select * from STAGE.PUBLIC.INADIMPLENCIA ina
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: safra_cessao_cpf {
    type: string
    label: "Safra da Cessão - CPF"
    description: "Indica a safra (ano e mês) que o aluno foi cedido"
    sql: ${TABLE}."SAFRA_CESSAO_CPF" ;;
  }

  dimension: cpf {
    type: number
    label: "Safra da Cessão - CPF"
    description: "Indica a safra (ano e mês) que o aluno foi cedido"
    hidden: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: ies_grupo {
    type: string
    label: "Grupo - IES"
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
    type: number
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

  dimension: flg_politica {
    type: yesno
    label: "Boleto Cancelado?"
    description: "Indica se o aluno possui boleto cancelado"
    sql: ${TABLE}."FLG_POLITICA" ;;
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
    hidden: yes
    description: "Indica se o aluno realizou o pagamento do primeiro boleto dentro de 15 dias após ser cedido."
    sql: ${TABLE}."FPD15" ;;
  }

  dimension: over15 {
    type: number
    label: "OVER 15"
    hidden: yes
    description: "Indica se o aluno ficou acima de 15 dias de atraso. Pode ser usado para avaliações de safra e de carteira. Quando usamos na carteira, o Over15 mostra o percentual de alunos que está acima de 15 dias de atraso dentro de toda a carteira ativa, sem separa-la por safra de contratação."
    sql: ${TABLE}."OVER15" ;;
  }

  dimension: over30 {
    type: number
    label: "OVER 30"
    hidden: yes
    description: "Indica se o aluno ficou acima de 15 dias de atraso. Pode ser usado para avaliações de safra e de carteira. Quando usamos na carteira, o Over15 mostra o percentual de alunos que está acima de 15 dias de atraso dentro de toda a carteira ativa, sem separa-la por safra de contratação."
    sql: ${TABLE}."OVER30" ;;
  }

  dimension: over60 {
    type: number
    hidden: yes
    sql: ${TABLE}."OVER60" ;;
  }

  dimension: qtd {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD" ;;
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
      flg_politica,
      credit_score,
      fpd15,
      over15,
      over30,
      over60,
      qtd
    ]
  }
}
