view: dim_cpf {
  sql_table_name: veterano."DIMENSAO"."DIM_CPF"
    ;;

  dimension: id_cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: email {
    type: string
    hidden: yes
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: nome {
    type: string
    hidden: yes
    sql: ${TABLE}."NOME" ;;
  }

  dimension: celular {
    type: string
    hidden: yes
    sql: ${TABLE}."CELULAR" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
    hidden: yes
    required_access_grants: [grupo_cpf]
  }

}
