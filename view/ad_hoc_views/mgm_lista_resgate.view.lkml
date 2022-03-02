view: mgm_lista_resgate {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.LISTA_RESGATE
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
    sql: ${TABLE}."NOME_PLAYER";;
  }

  dimension: cpf_player {
    type: number
    primary_key: yes
    group_label: "Dados Player"
    label: "CPF Player"
    description: "Indica o CPF do atendente (player)"
    sql: ${TABLE}."CPF_PLAYER" ;;
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

  measure: pontos_resgatados {
    type: sum
    group_label: "Pontos Resgatados"
    label: "Quantidade de pontos"
    sql: ${TABLE}."PONTOS_RESGATADOS" ;;
  }

  measure: valor_resgatado {
    type: sum
    group_label: "Pontos Resgatados"
    label: "Valor dos pontos"
    sql: ${TABLE}."VALOR_RESGATADO" ;;
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
    label: "Data Carga"
    description: "Indica a data que foi realizado a carga dos dados"
    sql: ${TABLE}."DT_CARGA" ;;
  }

  set: detail {
    fields: [
      nome_player,
      cpf_player,
      pontos_resgatados,
      valor_resgatado,
      dt_carga_time
    ]
  }
}
