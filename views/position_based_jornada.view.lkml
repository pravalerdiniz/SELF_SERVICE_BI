# The name of this view in Looker is "Position Based Jornada"
view: position_based_jornada {

  sql_table_name: "POS_GRADUADO"."MARKETING"."POSITION_BASED_JORNADA"
    ;;

  dimension_group: data_credito_safra {
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
    sql: ${TABLE}."DATA_CREDITO_SAFRA" ;;
  }

  dimension: etapa {
    type: string
    sql: ${TABLE}."ETAPA" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  measure: quantidade_de_alunos {
    type: count_distinct
    sql: ${id_cpf} ;;
  }

  dimension: pc1 {
    type: string
    sql: ${TABLE}."PC1" ;;
  }

  dimension: pc10 {
    type: string
    sql: ${TABLE}."PC10" ;;
  }

  dimension: pc2 {
    type: string
    sql: ${TABLE}."PC2" ;;
  }

  dimension: pc3 {
    type: string
    sql: ${TABLE}."PC3" ;;
  }

  dimension: pc4 {
    type: string
    sql: ${TABLE}."PC4" ;;
  }

  dimension: pc5 {
    type: string
    sql: ${TABLE}."PC5" ;;
  }

  dimension: pc6 {
    type: string
    sql: ${TABLE}."PC6" ;;
  }

  dimension: pc7 {
    type: string
    sql: ${TABLE}."PC7" ;;
  }

  dimension: pc8 {
    type: string
    sql: ${TABLE}."PC8" ;;
  }

  dimension: pc9 {
    type: string
    sql: ${TABLE}."PC9" ;;
  }

}
