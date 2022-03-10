view: taxa_de_contato {
  derived_table: {
    sql: SELECT
        A.DATA,
        A.QTD_ALUNO_ATIVO,
        C.QTD_ALUNO_CEDIDO,
        T.QTD_ALUNO_CONTATO AS "QTD_ALUNO_ATIVO_EMCONTATO",
        C.QTD_ALUNO_CONTATO AS "QTD_ALUNO_CEDIDO_EMCONTATO",
        T.QTD_TICKET AS "QTD_TICKET_ALUNO_ATIVO",
        C.QTD_TICKET AS "QTD_TICKET_ALUNO_CEDIDO"

      FROM

        (
        SELECT
          DATA,
          COUNT(DISTINCT CPF) AS QTD_ALUNO_ATIVO
        FROM

          (
          SELECT
            ALUNOS_ATIVOS.DATA,
            ALUNOS_ATIVOS.CPF,
            TICKETS.CPF_TICKET,
            TICKETS.QTD_TICKET
          FROM

            (
            SELECT
                (TO_CHAR(DATE_TRUNC('month', TO_DATE(((TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD'))))), 'YYYY-MM')) AS "DATA",
                alunos."CPF"  AS "CPF"
            FROM "GRADUADO"."SELF_SERVICE_BI"."ALUNOS" AS alunos
            LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA" AS proposta ON (alunos."ID_CPF") = (proposta."ID_CPF")
            LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO" AS financeiro ON (alunos."ID_CPF") = (financeiro."ID_CPF") and (financeiro."ID_CONTRATO") = (proposta."ID_PROPOSTA")
            LEFT JOIN (select
                        id_cpf,
                        LEFT(f.value,4)||'-'||RIGHT(f.value,2)||'-'||'01'::varchar as ano_mes
                        from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
                        lateral flatten (input => ATIVO_ANOMES) f
                      ) AS ano_mes_carteira_ativa ON (ano_mes_carteira_ativa."ID_CPF") = (alunos."ID_CPF")
                      AND (TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD')) = (TO_CHAR(TO_DATE(date_trunc('MONTH', DATA_VENCIMENTO )), 'YYYY-MM-DD'))
            WHERE
              (alunos."FLG_ALUNO_ATIVO" ) AND ((DATE_TRUNC('month', TO_DATE(((TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD'))))))) >= (TO_TIMESTAMP('2021-01-01'))
            GROUP BY
                1,
                2
            ) AS ALUNOS_ATIVOS
          LEFT JOIN
            (
            SELECT
              (TO_CHAR(DATE_TRUNC('month', interacoes."DATA_CRIACAO" ), 'YYYY-MM')) AS "DATA_TICKET",
              interacoes."CPF_REQUESTER"  AS "CPF_TICKET",
              COUNT(*) AS "QTD_TICKET"
            FROM "SELF_SERVICE_BI"."INTERACOES"
              AS interacoes
            WHERE
              ((DATE_TRUNC('month', interacoes."DATA_CRIACAO" ))) >= (TO_TIMESTAMP('2021-01-01'))
            GROUP BY
                1,
                2
            ) AS TICKETS ON ALUNOS_ATIVOS.DATA = TICKETS.DATA_TICKET
            AND ALUNOS_ATIVOS.CPF = TICKETS.CPF_TICKET
          )
        GROUP BY
          1
        ) AS A
      LEFT JOIN
        (
        SELECT
        DATA,
        COUNT(CPF_TICKET) AS QTD_ALUNO_CONTATO,
        SUM(QTD_TICKET) AS QTD_TICKET
        FROM

          (
          SELECT
            ALUNOS_ATIVOS.DATA,
            ALUNOS_ATIVOS.CPF,
            TICKETS.CPF_TICKET,
            TICKETS.QTD_TICKET
          FROM

            (
            SELECT
                (TO_CHAR(DATE_TRUNC('month', TO_DATE(((TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD'))))), 'YYYY-MM')) AS "DATA",
                alunos."CPF"  AS "CPF"
            FROM "GRADUADO"."SELF_SERVICE_BI"."ALUNOS" AS alunos
            LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA" AS proposta ON (alunos."ID_CPF") = (proposta."ID_CPF")
            LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO" AS financeiro ON (alunos."ID_CPF") = (financeiro."ID_CPF") and (financeiro."ID_CONTRATO") = (proposta."ID_PROPOSTA")
            LEFT JOIN (select
                        id_cpf,
                        LEFT(f.value,4)||'-'||RIGHT(f.value,2)||'-'||'01'::varchar as ano_mes
                        from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
                        lateral flatten (input => ATIVO_ANOMES) f
                      ) AS ano_mes_carteira_ativa ON (ano_mes_carteira_ativa."ID_CPF") = (alunos."ID_CPF")
                      AND (TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD')) = (TO_CHAR(TO_DATE(date_trunc('MONTH', DATA_VENCIMENTO )), 'YYYY-MM-DD'))
            WHERE
              (alunos."FLG_ALUNO_ATIVO" ) AND ((DATE_TRUNC('month', TO_DATE(((TO_CHAR(TO_DATE(TO_DATE(ano_mes_carteira_ativa."ANO_MES") ), 'YYYY-MM-DD'))))))) >= (TO_TIMESTAMP('2021-01-01'))
            GROUP BY
                1,
                2
            ) AS ALUNOS_ATIVOS
          LEFT JOIN
            (
            SELECT
              (TO_CHAR(DATE_TRUNC('month', interacoes."DATA_CRIACAO" ), 'YYYY-MM')) AS "DATA_TICKET",
              interacoes."CPF_REQUESTER"  AS "CPF_TICKET",
              COUNT(*) AS "QTD_TICKET"
            FROM "SELF_SERVICE_BI"."INTERACOES"
              AS interacoes
            WHERE
              ((DATE_TRUNC('month', interacoes."DATA_CRIACAO" ))) >= (TO_TIMESTAMP('2021-01-01'))
            GROUP BY
                1,
                2
            ) AS TICKETS ON ALUNOS_ATIVOS.DATA = TICKETS.DATA_TICKET
            AND ALUNOS_ATIVOS.CPF = TICKETS.CPF_TICKET
          )
        GROUP BY
          1
        ) AS T ON A.DATA = T.DATA
      LEFT JOIN
        (
        SELECT
        A.DATA,
        A.QTD_ALUNO_CEDIDO,
        T.QTD_ALUNO_CONTATO,
        T.QTD_TICKET

      FROM

        (
        SELECT
        DATA,
        COUNT(DISTINCT CPF) AS QTD_ALUNO_CEDIDO
      FROM

        (
        SELECT
          ALUNOS_CEDIDOS.DATA,
          ALUNOS_CEDIDOS.CPF,
          TICKETS.CPF_TICKET,
          TICKETS.QTD_TICKET
        FROM

          (
          SELECT
            (TO_CHAR(DATE_TRUNC('month', jornada."DT_STATUS" ), 'YYYY-MM')) AS "DATA",
            (dim_cpf."CPF")  AS "CPF"
          FROM "GRADUADO"."SELF_SERVICE_BI"."JORNADA"
               AS jornada
          LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA"
               AS proposta ON (proposta."ID_PROPOSTA") = (jornada."ID_PROPOSTA")
          LEFT JOIN veterano."DIMENSAO"."DIM_CPF"
               AS dim_cpf ON (jornada."ID_CPF") = (dim_cpf."ID_CPF")
          WHERE (jornada."DT_STATUS" ) >= (TO_TIMESTAMP('2021-01-01')) AND (jornada."ETAPA" ) = 'Cedido' AND (jornada."TIPO_PROPOSTA" ) = 'NOVO'
          GROUP BY
              1,
              2
            ) AS ALUNOS_CEDIDOS
        LEFT JOIN
          (
          SELECT
            (TO_CHAR(DATE_TRUNC('month', interacoes."DATA_CRIACAO" ), 'YYYY-MM')) AS "DATA_TICKET",
            interacoes."CPF_REQUESTER"  AS "CPF_TICKET",
            COUNT(*) AS "QTD_TICKET"
          FROM "SELF_SERVICE_BI"."INTERACOES"
            AS interacoes
          WHERE
            ((DATE_TRUNC('month', interacoes."DATA_CRIACAO" ))) >= (TO_TIMESTAMP('2021-01-01'))
          GROUP BY
              1,
              2
          ) AS TICKETS ON ALUNOS_CEDIDOS.DATA = TICKETS.DATA_TICKET
          AND ALUNOS_CEDIDOS.CPF = TICKETS.CPF_TICKET
        )
        GROUP BY
          1
        ) AS A
      LEFT JOIN
        (
        SELECT
        DATA,
        COUNT(CPF_TICKET) AS QTD_ALUNO_CONTATO,
        SUM(QTD_TICKET) AS QTD_TICKET
      FROM

        (
        SELECT
          ALUNOS_CEDIDOS.DATA,
          ALUNOS_CEDIDOS.CPF,
          TICKETS.CPF_TICKET,
          TICKETS.QTD_TICKET
        FROM

          (
          SELECT
            (TO_CHAR(DATE_TRUNC('month', jornada."DT_STATUS" ), 'YYYY-MM')) AS "DATA",
            (dim_cpf."CPF")  AS "CPF"
          FROM "GRADUADO"."SELF_SERVICE_BI"."JORNADA"
               AS jornada
          LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA"
               AS proposta ON (proposta."ID_PROPOSTA") = (jornada."ID_PROPOSTA")
          LEFT JOIN veterano."DIMENSAO"."DIM_CPF"
               AS dim_cpf ON (jornada."ID_CPF") = (dim_cpf."ID_CPF")
          WHERE (jornada."DT_STATUS" ) >= (TO_TIMESTAMP('2021-01-01')) AND (jornada."ETAPA" ) = 'Cedido' AND (jornada."TIPO_PROPOSTA" ) = 'NOVO'
          GROUP BY
              1,
              2
            ) AS ALUNOS_CEDIDOS
        LEFT JOIN
          (
          SELECT
            (TO_CHAR(DATE_TRUNC('month', interacoes."DATA_CRIACAO" ), 'YYYY-MM')) AS "DATA_TICKET",
            interacoes."CPF_REQUESTER"  AS "CPF_TICKET",
            COUNT(*) AS "QTD_TICKET"
          FROM "SELF_SERVICE_BI"."INTERACOES"
            AS interacoes
          WHERE
            ((DATE_TRUNC('month', interacoes."DATA_CRIACAO" ))) >= (TO_TIMESTAMP('2021-01-01'))
          GROUP BY
              1,
              2
          ) AS TICKETS ON ALUNOS_CEDIDOS.DATA = TICKETS.DATA_TICKET
          AND ALUNOS_CEDIDOS.CPF = TICKETS.CPF_TICKET
        )

        GROUP BY
          1
        ) AS T ON A.DATA = T.DATA) AS C ON A.DATA = C.DATA
      ORDER BY
        1 ASC
       ;;
  }

  dimension: data {
    type: string
    group_item_label: "Data"
    description: "Mês referente à taxa de contato"
    sql: ${TABLE}."DATA" ;;
  }

  measure: qtd_aluno_ativo {
    type: number
    group_item_label: "QTD Alunos Ativos"
    sql: ${TABLE}."QTD_ALUNO_ATIVO" ;;
  }

  measure: qtd_aluno_cedido {
    type: number
    group_item_label: "QTD Alunos Cedidos Novos"
    sql: ${TABLE}."QTD_ALUNO_CEDIDO" ;;
  }

  measure: qtd_aluno_ativo_emcontato {
    type: number
    group_item_label: "QTD Alunos Ativos em Contato"
    sql: ${TABLE}."QTD_ALUNO_ATIVO_EMCONTATO" ;;
  }

  measure: qtd_aluno_cedido_emcontato {
    type: number
    group_item_label: "QTD Alunos Cedidos em Contato"
    sql: ${TABLE}."QTD_ALUNO_CEDIDO_EMCONTATO" ;;
  }

  measure: qtd_ticket_aluno_ativo {
    type: number
    group_item_label: "QTD Tickets de Alunos Ativos"
    sql: ${TABLE}."QTD_TICKET_ALUNO_ATIVO" ;;
  }

  measure: qtd_ticket_aluno_cedido {
    type: number
    group_item_label: "QTD Tickets de Alunos Cedidos"
    sql: ${TABLE}."QTD_TICKET_ALUNO_CEDIDO" ;;
  }

  set: detail {
    fields: [
      data,
      qtd_aluno_ativo,
      qtd_aluno_cedido,
      qtd_aluno_ativo_emcontato,
      qtd_aluno_cedido_emcontato,
      qtd_ticket_aluno_ativo,
      qtd_ticket_aluno_cedido
    ]
  }
}
