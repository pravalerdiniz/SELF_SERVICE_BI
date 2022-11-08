view: proposta_testeab {

  sql_table_name: "SIMULACAO_PROPOSTA"."PROPOSTA_TESTEAB"
    ;;

  dimension: cpf {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}."CPF" ;;
  }


  dimension_group: data_atualizacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
    hidden:  yes
  }

  dimension_group: data_criacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_CRIACAO" ;;
    hidden:  yes
  }

  dimension: descricao_teste {
    type: string
    sql: ${TABLE}."DESCRICAO_TESTE" ;;
    group_label: "Dados Teste AB"
    group_item_label: "Nome do Teste"
  }

  dimension: flg_elegivel {
    type: yesno
    sql: ${TABLE}."FLG_ELEGIVEL" ;;
    group_label: "Dados Teste AB"
    group_item_label: "Elegível?"
  }

  dimension: flg_eleito {
    type: yesno
    sql: ${TABLE}."FLG_ELEITO" ;;
    group_label: "Dados Teste AB"
    group_item_label: "Eleito"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    hidden:  yes
  }

  dimension: id_estudante {
    type: string
    sql: ${TABLE}."ID_ESTUDANTE" ;;
    hidden:  yes
  }

  dimension: id_proposal {
    type: string
    sql: ${TABLE}."ID_PROPOSAL" ;;
    hidden:  yes
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
    hidden:  yes
  }

}
