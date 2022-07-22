view: depara_grupo_gerente {
  derived_table: {
    persist_for: "24 hours"
    sql: SELECT
    "GRUPO",
    "GERENTE"
FROM VETERANO.DIMENSAO.DIM_META_GC
WHERE ((("DATA") >= ((TO_DATE(DATE_TRUNC('month', CURRENT_DATE())))) AND ("DATA" ) < ((TO_DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE())))))))
GROUP BY 1, 2
ORDER BY 1
 ;;
  }

  dimension: grupo_instituicao {
    type: string
    label: "Grupo da Instituição"
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: gerente{
    type: string
    label: "Gerente Atual"
    sql: ${TABLE}."GERENTE" ;;
  }

}
