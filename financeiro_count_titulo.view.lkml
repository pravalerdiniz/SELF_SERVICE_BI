view: financeiro_count_titulo {
  derived_table: {
    sql: SELECT
          proposta."ID_CONTRATO"  AS "proposta.id_contrato",
          COUNT(*) AS "financeiro.count_titulo"
      FROM "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO"
           AS financeiro
      LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA"
           AS proposta ON (proposta."ID_PROPOSTA")=(financeiro."ID_CONTRATO")
      WHERE (financeiro."DS_TITULO_STATUS" ) = 'ATIVO' AND ((proposta."ALUNO_CAL_VET" ) = 'CALOURO' AND ((( proposta."DATA_FECHAMENTO_PROPOSTA"  ) >= ((DATE_TRUNC('year', CURRENT_DATE()))) AND ( proposta."DATA_FECHAMENTO_PROPOSTA"  ) < ((DATEADD('year', 1, DATE_TRUNC('year', CURRENT_DATE()))))))) AND ((proposta."FLG_CONTRATO_ATIVO" ) AND ((proposta."FLG_CONTRATO_CEDIDO" ) AND (proposta."GRUPO_INSTITUICAO" ) = 'ANIMA'))
      GROUP BY
          1
      ORDER BY
          2 DESC
      FETCH NEXT 500 ROWS ONLY
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
