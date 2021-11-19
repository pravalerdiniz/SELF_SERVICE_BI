# The name of this view in Looker is "Volumetria Lancamento"
view: volumetria_lancamento {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "CURTA"."VOLUMETRIA_LANCAMENTO"
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

  dimension: cnpj_data_inicio_data_fim_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${cnpj},${data_inicio_raw},${data_final_raw});;


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
    description: "Indica a data final do lançamento das vagas"
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
    label: "Inicio"
    description: "Indica a data de inicio do lançamento das vagas"
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

  measure: total_dias_em_lancamentos {
    type: sum
    group_label: "Dias em lançamento"
    label: "Soma"
    sql: ${dias_em_lancamentos} ;;
  }

  measure: average_dias_em_lancamentos {
    type: average
    group_label: "Dias em lançamento"
    label: "Média"
    sql: ${dias_em_lancamentos} ;;
  }

  dimension: escola {
    type: string
    label: "Escola"
    description: "Indica o nome da instituição de ensino."
    sql: ${TABLE}."ESCOLA" ;;
  }

  dimension: mes {
    type: string
    label: "Mês"
    description: "Indica o mês de lançamento do curso"
    sql: ${TABLE}."MES" ;;
  }

  dimension: semana {
    type: number
    label: "Semana"
    description: "Indica o número de semanas em relação ao lançamento das vagas da escola."
    sql: ${TABLE}."SEMANA" ;;
  }

  dimension: vagas {
    type: number
    label: "Vagas"
    description: "Indica a soma de vagas em relação ao lançamento do curso da escola"
    sql: ${TABLE}."VAGAS" ;;
  }

  measure: sum_vagas {
    type: sum
    group_label: "Vagas"
    label: "Soma"
    description: "Indica a soma de vagas em relação ao lançamento do curso da escola"
    sql: ${vagas};;
  }

  measure: avg_vagas {
    type: average
    group_label: "Vagas"
    label: "Média"
    description: "Indica a média de vagas em relação ao lançamento do curso da escola"
    sql: ${vagas} ;;
  }

  measure: med_vagas {
    type: average
    group_label: "Vagas"
    label: "Mediana"
    description: "Indica a mediana de vagas em relação ao lançamento do curso da escola"
    sql: ${vagas} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
