# The name of this view in Looker is "Dim Ipca"
view: dim_ipca {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "VETERANO"."DIMENSAO"."DIM_IPCA"
    ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cd Mes" in Explore.

  dimension: cd_mes {
    type: date_month
    datatype: date
    sql: date_from_parts(substr(${TABLE}."CD_MES", 0, 4), substr(${TABLE}."CD_MES", 5, 6), 1) ;;
    hidden: yes
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: cd_nivel_territorial {
    type: string
    sql: ${TABLE}."CD_NIVEL_TERRITORIAL" ;;
    hidden: yes
  }

  dimension: cd_unidade_medida {
    type: string
    sql: ${TABLE}."CD_UNIDADE_MEDIDA" ;;
    hidden: yes
  }

  dimension: cd_variavel {
    type: string
    sql: ${TABLE}."CD_VARIAVEL" ;;
    hidden: yes
  }

  dimension: ds_mes {
    type: string
    sql: ${TABLE}."DS_MES" ;;
    description: "Mês e ano referência da taxa IPCA acumulada nos últimos 12 meses."
    hidden: yes
  }

  dimension: ds_nivel_territorial {
    type: string
    sql: ${TABLE}."DS_NIVEL_TERRITORIAL" ;;
    hidden: yes
  }

  dimension: ds_unidade_medida {
    type: string
    sql: ${TABLE}."DS_UNIDADE_MEDIDA" ;;
    hidden: yes
  }

  dimension: ds_variavel {
    type: string
    sql: ${TABLE}."DS_VARIAVEL" ;;
    hidden: yes
  }

  dimension: vl_ipca {
    type: number
    description: "Taxa IPCA acumulada nos últimos 12 meses em %."
    value_format_name: percent_2
    sql: ${TABLE}."VL_IPCA"/100 ;;
    hidden: no
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
