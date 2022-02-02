# The name of this view in Looker is "Metas"
view: metas {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "VETERANO"."CURTA"."METAS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cnpj" in Explore.

  dimension: cnpj {
    type: string
    hidden: yes
    sql: ${TABLE}."CNPJ" ;;
  }

  dimension: cpnj_limpo {
    type: string
    hidden: yes
    sql: ${TABLE}."CPNJ_LIMPO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_final {
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
    label: "Final"
    sql: ${TABLE}."DATA_FINAL" ;;
  }

  dimension_group: data_inicio {
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
    label: "Referência"
    sql: ${TABLE}."DATA_INICIO" ;;
  }

  dimension: dias_em_lancamentos {
    type: number
    hidden: yes
    sql: ${TABLE}."DIAS_EM_LANCAMENTOS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: escola {
    type: string
    sql: ${TABLE}."ESCOLA" ;;
  }

  dimension: mes {
    type: string
    sql: ${TABLE}."MES" ;;
  }

  dimension: semana {
    type: number
    sql: ${TABLE}."SEMANA" ;;
  }

  dimension: vagas {
    type: number
    label: "Vagas"
    description: "Indica a quantidade de vagas disponiveis por escola"
    sql: ${TABLE}."VAGAS" ;;
  }

  dimension: volumetria_diaria {
    type: number
    sql: ${TABLE}."VOLUMETRIA_DIARIA" ;;
  }

measure: sum_volumetria_diaria {
  type: sum
  group_label: "Volumetria - Meta"
  label: "Soma"
  sql: ${volumetria_diaria} ;;


}

  measure: avg_volumetria_diaria {
    type: average
    group_label: "Volumetria - Meta"
    label: "Média"
    sql: ${volumetria_diaria} ;;


  }

  measure: min_volumetria_diaria {
    type: average
    group_label: "Volumetria - Meta"
    label: "Mínimo"
    sql: ${volumetria_diaria} ;;


  }

  measure: max_volumetria_diaria {
    type: average
    group_label: "Volumetria - Meta"
    label: "Máximo"
    sql: ${volumetria_diaria} ;;


  }


  measure: count {
    type: count
    drill_fields: []
  }
}
