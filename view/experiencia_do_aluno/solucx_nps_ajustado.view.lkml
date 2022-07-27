view: solucx_nps_ajustado {
  derived_table: {
    sql:

    WITH solucx AS
      (select
        solucx."ID" as id,
        solucx."JOURNEY" as jornada,
        solucx."TIMESTAMP" as data_envio_pesquisa,
        solucx."STORE_NAME" as grupo_pesquisa,
        solucx."CUSTOMER_CPF" as cpf_aluno,
        solucx."CUSTOMER_EMAIL" as email_aluno,
        solucx."CUSTOMER_NAME" as nome_aluno,
        solucx."CUSTOMER_PHONE" as telefone_aluno,
        solucx."RATING_COMMENT" as comentario_pesquisa,
        solucx."RATING_ATENDIMENTO_ALUNOS" as motivo_atendimento_alunos,
        solucx."RATING_PRODUTOS" as motivo_produtos,
        solucx."RATING_PROCESSO_APROVACAO" as motivo_processo_aprovacao,
        solucx."RATING_CADASTRO" as motivo_cadastro,
        solucx."RATING_RESOLUTIVIDADE" as motivo_resolutividade,
        solucx."RATING_ACESSIBILIDADE" as motivo_acessibilidade,
        solucx."RATING_COMUNICACAO" as motivo_comunicacao,
        solucx."RATING_PAGAMENTO" as motivo_pagamento,
        solucx."RATING_CLAREZA" as motivo_clareza,
        solucx."RATING_CANAIS" as motivo_canais,
        solucx."RATING_CONTRATACAO" as motivo_contratacao,
        solucx."RATING_ATENDIMENTO" as motivo_atendimento,
        solucx."RATING_SOURCE" as canal_pesquisa,
        solucx."RATING_TIMESTAMP" as data_resposta_pesquisa,
        solucx."RATING_VALUE" as nota_pesquisa,
        solucx."CLASS_NOTA" as promotor_detrator
      from veterano."FATO"."SOLUCX_TRANSACTION" as solucx
      )
SELECT
  ANO_PESQUISA,
  MES_NUM,
  MES,
  QTD_AVALIACOES,
  CASE WHEN ANO_PESQUISA = 2022 THEN 48.1 ELSE ROUND((((QTD_PROMOTORES/QTD_AVALIACOES)-(QTD_DETRATORES/QTD_AVALIACOES)) * 100),1) END AS "NPS"
FROM
  ( SELECT
      (EXTRACT(YEAR FROM solucx."DATA_ENVIO_PESQUISA" )::integer) AS "ANO_PESQUISA",
      CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 1 THEN 1 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 2 THEN 2 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 3 THEN 4 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 4 THEN 4 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 5 THEN 5 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 6 THEN 7 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 7 THEN 7 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 8 THEN 8 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 9 THEN 9 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 10 THEN 10 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 11 THEN 11 ELSE 12 END
      END END END END END END END END END END AS "MES_NUM",
      CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 1 THEN 'Jan' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 2 THEN 'Fev' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 3 THEN 'Abr' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 4 THEN 'Abr' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 5 THEN 'Mai' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 6 THEN 'Jul' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 7 THEN 'Jul' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 8 THEN 'Ago' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 9 THEN 'Set' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 10 THEN 'Out' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 11 THEN 'Nov' ELSE 'Dez' END
      END END END END END END END END END END AS "MES",
      COUNT(DISTINCT ( solucx."ID" )) AS "QTD_AVALIACOES",
      COUNT(DISTINCT CASE WHEN ((( solucx."PROMOTOR_DETRATOR"  )) = 'DETRATOR') THEN ( solucx."ID" ) ELSE NULL END) AS "QTD_DETRATORES",
      COUNT(DISTINCT CASE WHEN ((( solucx."PROMOTOR_DETRATOR"  )) = 'PROMOTOR') THEN ( solucx."ID" ) ELSE NULL END) AS "QTD_PROMOTORES"
    FROM solucx
    WHERE (solucx."GRUPO_PESQUISA" ) = 'Relacional' AND (solucx."DATA_ENVIO_PESQUISA" ) >= (TO_TIMESTAMP('2021-01-01')) AND ((EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) <> 2 OR (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) IS NULL) AND (((( solucx."DATA_RESPOSTA_PESQUISA"  )) IS NOT NULL))
    GROUP BY 1, 2, 3
  )


UNION ALL


 SELECT * FROM
   (SELECT
      ANO_PESQUISA,
      MES_NUM,
      MES,
      SUM(QTD_AVALIACOES) OVER (PARTITION BY MES_NUM) AS QTD_AVALIACOES,
      ROUND((SUM(NPS_AJUSTADO) OVER (PARTITION BY MES_NUM)),1) AS NPS
   FROM
    (SELECT
      ANO_PESQUISA,
      MES_NUM,
      MES,
      GRUPO,
      QTD_AVALIACOES,
      NPS_JORNADA * SHARE_MEDIO_2021 AS "NPS_AJUSTADO"
    FROM
      (SELECT
        ANO_PESQUISA,
        MES_NUM,
        MES,
        GRUPO,
        QTD_AVALIACOES,
        ROUND((((QTD_PROMOTORES/QTD_AVALIACOES)-(QTD_DETRATORES/QTD_AVALIACOES)) * 100),1) AS "NPS_JORNADA",
        CASE  WHEN (GRUPO LIKE ('ALUNOS RENOVAÇÃO - RELACIONAL')) THEN 0.576
              WHEN (GRUPO LIKE ('ALUNOS NOVOS - RELACIONAL')) THEN 0.13 ELSE 0.294
        END AS "SHARE_MEDIO_2021"
      FROM
        (SELECT
          (EXTRACT(YEAR FROM solucx."DATA_ENVIO_PESQUISA" )::integer) AS "ANO_PESQUISA",
          CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 1 THEN 1 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 2 THEN 2 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 3 THEN 4 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 4 THEN 4 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 5 THEN 5 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 6 THEN 7 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 7 THEN 7 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 8 THEN 8 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 9 THEN 9 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 10 THEN 10 ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 11 THEN 11 ELSE 12 END
          END END END END END END END END END END AS "MES_NUM",
          CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 1 THEN 'Jan' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 2 THEN 'Fev' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 3 THEN 'Abr' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 4 THEN 'Abr' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 5 THEN 'Mai' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 6 THEN 'Jul' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 7 THEN 'Jul' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 8 THEN 'Ago' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 9 THEN 'Set' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 10 THEN 'Out' ELSE CASE WHEN (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) = 11 THEN 'Nov' ELSE 'Dez' END
          END END END END END END END END END END AS "MES",
          solucx."GRUPO_PESQUISA"  AS "GRUPO",
          COUNT(DISTINCT ( solucx."ID" )) AS "QTD_AVALIACOES",
          COUNT(DISTINCT CASE WHEN ((( solucx."PROMOTOR_DETRATOR"  )) = 'PROMOTOR') THEN ( solucx."ID" ) ELSE NULL END) AS "QTD_PROMOTORES",
          COUNT(DISTINCT CASE WHEN ((( solucx."PROMOTOR_DETRATOR"  )) = 'DETRATOR') THEN ( solucx."ID" ) ELSE NULL END) AS "QTD_DETRATORES"
      FROM solucx
      WHERE (solucx."GRUPO_PESQUISA" ) IN ('ALUNOS FORMADOS - RELACIONAL', 'ALUNOS NOVOS - RELACIONAL', 'ALUNOS RENOVAÇÃO - RELACIONAL', 'Relacional') AND (solucx."DATA_ENVIO_PESQUISA" ) >= (TO_TIMESTAMP('2022-04-01')) AND ((EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) <> 2 OR (EXTRACT(MONTH FROM solucx."DATA_ENVIO_PESQUISA" )::integer) IS NULL) AND (((( solucx."DATA_RESPOSTA_PESQUISA"  )) IS NOT NULL))
      GROUP BY 1, 2, 3, 4
      )))) GROUP BY 1, 2, 3, 4, 5

    ;;
  }


    dimension: ano_pesquisa {
      type: number
      group_item_label: "Ano Pesquisa"
      description: "Ano que a pesquisa foi disparada"
      value_format: "0"
      sql: ${TABLE}."ANO_PESQUISA" ;;
    }

  dimension: mes_num {
    type: number
    group_item_label: "Mês Num"
    description: "Mês de disparo da pesquisa em formato numérico"
    sql: ${TABLE}."MES_NUM" ;;
  }

  dimension: mes {
    type: string
    group_item_label: "Mês"
    description: "Mês de disparo da pesquisa"
    sql: ${TABLE}."MES" ;;
  }

  measure: qtd_avaliacoes {
    type: sum
    group_item_label: "Quantidade de Avaliações"
    description: "Quantidade de Avaliações Respondidas referente ao mês de disparo"
    sql: ${TABLE}."QTD_AVALIACOES" ;;
  }

  measure: nps {
    type: sum
    group_item_label: "NPS"
    description: "(% de promotores) - (% de detratores)"
    sql: ${TABLE}."NPS" ;;
  }

  }
