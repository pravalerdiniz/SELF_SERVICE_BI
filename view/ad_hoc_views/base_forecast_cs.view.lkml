# The name of this view in Looker is "Base Forecast Cs"
view: base_forecast_cs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."BASE_FORECAST_CS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  dimension_group: data {
    type: time
    label: "Forecast"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    description: "Data do Forecast"
    sql: ${TABLE}."DATA" ;;
  }

  measure: contatos {
    type: sum
    group_item_label: "Forecast Contatos"
    description: "Previsão de contatos dos contatos"
    sql: ${TABLE}."CONTATOS" ;;
  }



  measure: chat {
    type: sum
    group_item_label: "Forecast Chat"
    description: "Previsão de contatos do chat"
    sql: ${TABLE}."CHAT" ;;
  }

  measure: ligacao {
    type: sum
    group_item_label: "Forecast Ligação"
    description: "Previsão de contatos de voz"
    sql: ${TABLE}."LIGACAO" ;;
  }

    measure: whatsapp {
      type: sum
      group_item_label: "Forecast WhatsApp"
      description: "Previsão de contatos de whatsApp"
      sql: ${TABLE}."WHATSAPP" ;;
    }

  measure: tma_segundos_chat {
    type: average
    group_item_label: "TMA Chat"
    description: "Tempo médio de Atendimento do Chat em segundos"
    sql: ${TABLE}."TMA_SEGUNDOS_CHAT" ;;
    value_format: "hh:mm:[ss]"
  }

  measure: tma_segundos_ligacao {
    type: average
    group_item_label: "TMA Ligação"
    description: "Tempo médio de Atendimento do Chat em segundos"
    sql: ${TABLE}."TMA_SEGUNDOS_LIGACAO" ;;
    value_format: "hh:mm:[ss]"
  }

}
