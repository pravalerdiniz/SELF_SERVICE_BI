view: historico_datas_trade {

  dimension: campus {
    type: string
    sql: ${TABLE}."CAMPUS" ;;
    group_label: "Dados da IES"
    label: "Campus"
  }

  dimension_group: data_positivacao {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_POSITIVACAO" ;;
    group_item_label: "Data da Positivação"
  }

  dimension: gerente {
    type: string
    sql: ${TABLE}."GERENTE" ;;
    group_label: "Dados da IES"
    label: "Gerente"
  }

  dimension: ies {
    type: string
    sql: ${TABLE}."IES" ;;
    group_label: "Dados da IES"
    label: "Nome da IES"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
