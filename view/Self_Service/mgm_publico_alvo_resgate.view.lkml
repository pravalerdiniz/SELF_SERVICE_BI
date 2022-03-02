view: mgm_publico_alvo_resgate {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.PUBLICO_ALVO_RESGATE
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: nome_player {
    type: string
    group_label: "Dados Player"
    label: "Nome Player"
    description: "Indica o nome do atendente (player)"
    sql: ${TABLE}."NOME_PLAYER" ;;
  }

  dimension: cpf_player {
    type: number
    primary_key: yes
    group_label: "Dados Player"
    label: "CPF Player"
    description: "Indica o CPF do atendente (player)"
    sql: ${TABLE}."CPF_PLAYER" ;;
  }

  dimension: data_nascimento {
    type: date
    group_label: "Dados Player"
    label: "Data Nascimento Player"
    description: "Indica a data de nascimento do atendente (player)"
    sql: ${TABLE}."DATA_NASCIMENTO" ;;
  }

  dimension: email {
    type: string
    group_label: "Dados Player"
    label: "Email Player"
    description: "Indica o email do atendente (player)"
    sql: ${TABLE}."EMAIL" ;;
  }

  measure: pontos_resgatados {
    type: sum
    group_label: "Pontos Resgatados"
    label: "Quantidade de pontos"
    sql: ${TABLE}."PONTOS_RESGATADOS" ;;
  }

  measure: valor_resgatado {
    type: sum
    group_label: "Pontos Resgatados"
    label: "Valor dos pontos resgatados"
    sql: ${TABLE}."VALOR_RESGATADO" ;;
  }

  dimension_group: data_resgate {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    group_label: "Data Resgate"
    label: "Data Resgate"
    description: "Indica a data que foi realizado o resgate"
    sql: ${TABLE}."DATA_RESGATE" ;;
  }

  dimension_group: dt_carga {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    group_label: "Data Carga"
    label: "Data da Carga"
    description: "Indica a data que foi realizado a carga dos dados"
    sql: ${TABLE}."DT_CARGA" ;;
  }

  set: detail {
    fields: [
      nome_player,
      cpf_player,
      data_nascimento,
      email,
      pontos_resgatados,
      valor_resgatado,
      data_resgate_time,
      dt_carga_time
    ]
  }
}
