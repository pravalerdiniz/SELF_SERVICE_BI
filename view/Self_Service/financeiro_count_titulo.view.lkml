view: financeiro_count_titulo {
  derived_table: {
    sql: SELECT
          proposta."ID_CONTRATO"  AS "proposta.id_contrato",
          COUNT(*) AS "financeiro.count_titulo"
      FROM "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO"
           AS financeiro
      LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA"
           AS proposta ON (proposta."ID_PROPOSTA")=(financeiro."ID_CONTRATO")
      WHERE (financeiro."DS_TITULO_STATUS" ) = 'ATIVO'
      GROUP BY
          1
      ORDER BY
          2 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: proposta_id_contrato {
    type: string
    sql: ${TABLE}."PROPOSTA.ID_CONTRATO" ;;
  }

  dimension: financeiro_count_titulo {
    type: number
    sql: ${TABLE}."FINANCEIRO.COUNT_TITULO" ;;
    label: "Quantidade de Títulos"
  }

  set: detail {
    fields: [proposta_id_contrato, financeiro_count_titulo]
  }
}
