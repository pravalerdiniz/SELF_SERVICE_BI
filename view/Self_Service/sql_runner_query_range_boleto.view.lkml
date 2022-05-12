view: sql_runner_query_range_boleto {
  derived_table: {
    sql: SELECT
          financeiro."ID_CPF"  AS "financeiro.id_cpf",
          financeiro."ID_CONTRATO"  AS "financeiro.id_contrato",
          COUNT(*) AS "financeiro.count_titulo"
      FROM "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO"
           AS financeiro
      LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA"
           AS proposta ON (proposta."ID_PROPOSTA")=(financeiro."ID_CONTRATO")
      WHERE (((((( financeiro."DATA_VENCIMENTO"  ))) >= (TO_DATE(TO_TIMESTAMP('2021-01-01'))) AND ((( financeiro."DATA_VENCIMENTO"  ))) < (TO_DATE(TO_TIMESTAMP('2024-12-31')))))) AND ((( proposta."DATA_CONCESSAO"  ) >= ((TO_DATE(TO_TIMESTAMP('2021-01-01')))) AND ( proposta."DATA_CONCESSAO"  ) < ((TO_DATE(DATEADD('year', 1, TO_TIMESTAMP('2021-01-01'))))))) AND (proposta."TIPO_PROPOSTA" ) = 'NOVO'
      GROUP BY
          1,
          2
      ORDER BY
          3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: financeiro_id_cpf {
    type: number
    sql: ${TABLE}."FINANCEIRO.ID_CPF" ;;
    primary_key: yes
    hidden: yes

  }

  dimension: financeiro_id_contrato {
    type: string
    sql: ${TABLE}."FINANCEIRO.ID_CONTRATO" ;;
    hidden: yes
  }

  dimension: financeiro_count_titulo {
    type: number
    group_label: "Dados do Título"
    label: "Contagem de Títulos"
    description: "Indica a contagem de Títulos por Aluno e por contrato"
    sql: ${TABLE}."FINANCEIRO.COUNT_TITULO" ;;
    value_format: "#"
  }

  set: detail {
    fields: [financeiro_id_cpf, financeiro_id_contrato, financeiro_count_titulo]
  }
}
