view: cpf {
  sql_table_name: veterano."DIMENSAO"."DIM_CPF"
    ;;

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: celular {
    type: string
    sql: ${TABLE}."CELULAR" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
    required_access_grants: [grupo_cpf]
  }

}
