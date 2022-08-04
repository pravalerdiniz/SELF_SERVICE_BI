# The name of this view in Looker is "Dim Regional"
view: dim_regional {

  sql_table_name: "VETERANO"."DIMENSAO"."DIM_REGIONAL"
    ;;

  dimension: gerente {
    type: string
    hidden: yes
    label: "Nome Gerente Atual"
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: id_campus_bo {
    type: string
    hidden: yes
    label: "ID Campus"
    sql: ${TABLE}."ID_CAMPUS_BO" ;;
  }

  dimension: id_ies {
    type: number
    hidden: yes
    sql: ${TABLE}."ID_IES" ;;
  }

  dimension: id_ies_bo {
    type: string
    hidden: yes
    sql: ${TABLE}."ID_IES_BO" ;;
  }

  dimension: ies_grupo {
    type: string
    hidden: yes
    sql: ${TABLE}."IES_GRUPO" ;;
  }

  dimension: rve {
    type: string
    primary_key: yes
    label: " Nome RVE Atual"
    sql: ${TABLE}."RVE" ;;
  }


}
