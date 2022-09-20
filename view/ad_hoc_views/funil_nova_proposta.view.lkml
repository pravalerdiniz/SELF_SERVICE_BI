
view: funil_nova_proposta {

  sql_table_name: "AD_HOC"."FUNIL_NOVA_PROPOSTA"
    ;;


  dimension: como_soube {
    type: string
    sql: ${TABLE}."COMO_SOUBE" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_status {
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
    sql: ${TABLE}."DT_STATUS" ;;
  }

  dimension: etapa {
    type: string
    sql: ${TABLE}."ETAPA" ;;
  }

  dimension: qtd {
    type: number
    sql: ${TABLE}."QTD" ;;
  }


  measure: total_qtd {
    type: sum
    sql: ${qtd} ;;
  }

}
