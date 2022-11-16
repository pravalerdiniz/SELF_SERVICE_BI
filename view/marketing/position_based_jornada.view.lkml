
view: position_based_jornada {

  sql_table_name: "POS_GRADUADO"."MARKETING"."POSITION_BASED_JORNADA"
    ;;


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

  measure: qtd_alunos {
    type: sum
    sql: ${TABLE}."QTD_ALUNOS" ;;
  }


  dimension_group: safra {
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
    sql: ${TABLE}."SAFRA" ;;
  }

}
