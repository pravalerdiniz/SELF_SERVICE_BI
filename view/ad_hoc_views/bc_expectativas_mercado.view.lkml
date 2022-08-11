view: bc_expectativas_mercado {
  sql_table_name: "AD_HOC"."BC_EXPECTATIVAS_MERCADO"  ;;

  dimension: basecalculo {
    type: number
    label: "Base de Cálculo"
    sql: ${TABLE}."BASECALCULO" ;;
    description: "Base de cálculo para as estatísticas baseada no prazo de validade das expectativas informadas pelas instituições informantes: - 0: uso das expectativas mais recentes informadas pelas instituições participantes a partir do 30º dia anterior à data de cálculo das estatísticas - 1: uso das expectativas mais recentes informadas pelas instituições participantes a partir do 4º dia útil anterior à data de cálculo das estatísticas"
  }

  dimension_group: data {
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
    sql: ${TABLE}."DATA" ;;
    label: "Cálculo Estatistica"
    description: "Data do cálculo da estatística"
  }

  dimension: datareferencia {
    type: string
    label: "Data Referência"
    description: "Data de referência para qual a estatística é esperada"
    sql: ${TABLE}."DATAREFERENCIA" ;;
  }

  dimension: desviopadrao {
    type: number
    label: "Desvio Padrão"
    description: "Desvio padrão das expectativas fornecidas pelas instituições credenciadas"
    sql: ${TABLE}."DESVIOPADRAO" ;;
  }

  dimension: indicador {
    type: string
    label: "Indicardor"
    description: "Indicador da taxa"
    sql: ${TABLE}."INDICADOR" ;;
  }

  dimension: maximo {
    type: number
    label: "Máximo"
    description: "Máximo das expectativas fornecidas pelas instituições credenciadas"
    sql: ${TABLE}."MAXIMO" ;;
  }

  dimension: media {
    type: number
    label: "Mádia"
    description: "Média das expectativas fornecidas pelas instituições credenciadas"
    sql: ${TABLE}."MEDIA" ;;
  }

  dimension: mediana {
    type: number
    label: "Mediana"
    description: "Mediana das expectativas fornecidas pelas instituições credenciadas"
    sql: ${TABLE}."MEDIANA" ;;
  }

  dimension: minimo {
    type: number
    label: "Mínimo"
    description: "Mínimo das expectativas fornecidas pelas instituições credenciadas"
    sql: ${TABLE}."MINIMO" ;;
  }

  dimension: numerorespondentes {
    type: number
    label: "Número de Respondentes"
    description: "Número de instituições credenciadas que forneceram suas expectativas"
    sql: ${TABLE}."NUMERORESPONDENTES" ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
  }
}
