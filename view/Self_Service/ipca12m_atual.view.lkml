# última taxa IPCA disponibilizada pelo IBGE

view: ipca12m_atual {
  derived_table: {
    sql: SELECT
     TOP 1 ipca12m."VL_IPCA"/100 AS VL_IPCA
    FROM "VETERANO"."DIMENSAO"."DIM_IPCA"
           AS ipca12m
    ORDER BY ipca12m."CD_MES" desc;;
  }

  dimension: ipca12m_atual {
    group_label: "IPCA - IBGE"
    label: "IPCA 12M"
    description: "IPCA acumulado nos últimos 12 meses."
    type: number
    value_format_name: percent_2
    sql: ${TABLE}."VL_IPCA" ;;
    hidden: no
  }



}
