view: taxa_de_contato_alunos_ativos {
  derived_table: {
    sql: SELECT
          ALUNO.ANO_MES,
          SUM(ALUNO.QTD_ALUNO) AS QTD_ALUNO_ATIVO,
          SUM(TICKETS.QTD_TICKET) AS QTD_TICKETS_ALUNOS_ATIVOS
      FROM
        (
            SELECT
                (TO_CHAR(DATE_TRUNC('month', TO_DATE(((TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD'))))), 'YYYY-MM')) AS "ANO_MES",
                alunos."CPF"  AS "CPF",
                COUNT(DISTINCT ( alunos."ID_CPF"  ) ) AS "QTD_ALUNO"
            FROM "GRADUADO"."SELF_SERVICE_BI"."ALUNOS" AS alunos
              LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA"
                AS proposta ON (alunos."ID_CPF") = (proposta."ID_CPF")
              LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO"
                AS financeiro ON (alunos."ID_CPF") = (financeiro."ID_CPF") and (financeiro."ID_CONTRATO") = (proposta."ID_PROPOSTA")
              LEFT JOIN (
                          select
                              id_cpf,
                              LEFT(f.value,4)||'-'||RIGHT(f.value,2)||'-'||'01'::varchar as ano_mes
                          from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
                              lateral flatten (input => ATIVO_ANOMES) f
                          )
                AS ano_mes_carteira_ativa ON (ano_mes_carteira_ativa."ID_CPF") = (alunos."ID_CPF") AND (TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD')) = (TO_CHAR(TO_DATE(date_trunc('MONTH', DATA_VENCIMENTO )), 'YYYY-MM-DD'))
            WHERE (TO_DATE(((TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD'))))) >= (TO_TIMESTAMP('2021-01-01'))
            GROUP BY
                (DATE_TRUNC('month', TO_DATE(((TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD')))))),
                2

      ) ALUNO LEFT JOIN (

      SELECT
      (TO_CHAR(DATE_TRUNC('month', interacoes."DATA_CRIACAO" ), 'YYYY-MM')) AS "ANO_MES",
      interacoes."CPF_REQUESTER"  AS "CPF",
      COUNT(*) AS "QTD_TICKET"
      FROM "SELF_SERVICE_BI"."INTERACOES"
      AS interacoes
      WHERE (interacoes."DATA_CRIACAO" ) >= (TO_TIMESTAMP('2021-01-01'))
      GROUP BY
      (DATE_TRUNC('month', interacoes."DATA_CRIACAO" )),
      2

      ) TICKETS
      ON (ALUNO."CPF") = (TICKETS."CPF") AND (ALUNO."ANO_MES" = TICKETS."ANO_MES")
      GROUP BY
      1
      ORDER BY
      1
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ano_mes {
    type: string
    group_item_label: "Data"
    description: "Mês referente à taxa de contato"
    sql: ${TABLE}."ANO_MES" ;;
  }

  measure: qtd_aluno_ativo {
    type: sum
    group_item_label: "QTD Alunos Ativos"
    sql: ${TABLE}."QTD_ALUNO_ATIVO" ;;
  }

  measure: qtd_tickets_alunos_ativos {
    type: sum
    group_item_label: "QTD Tickets de Alunos Ativos"
    sql: ${TABLE}."QTD_TICKETS_ALUNOS_ATIVOS" ;;
  }

  set: detail {
    fields: [ano_mes, qtd_aluno_ativo, qtd_tickets_alunos_ativos]
  }
}
