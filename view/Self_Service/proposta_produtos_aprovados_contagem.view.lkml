view: proposta_produtos_aprovados_contagem {
  derived_table: {
    sql: WITH proposta_produtos_aprovados AS (select
      id_proposta,
      f.key as ID_ALUNO_SCORE_FINAL,
      f.value:DATA_USUARIO_INS::timestamp as DATA_CRIACAO,
      f.value:FLG_APROVADO::boolean as FLG_APROVADO,
      f.value:ID_PRODUTO::varchar as ID_PRODUTO,
      f.value:NM_PRODUTO::varchar as NM_PRODUTO,
      f.value:VL_NOTA_CORTE::float as VL_NOTA_CORTE
      from GRADUADO.SELF_SERVICE_BI.PROPOSTA a,
      lateral flatten (input => PRODUTOS_APROVADOS) f
 )
SELECT
    proposta."ID_PROPOSTA"  AS "proposta.id_proposta",
    COUNT(DISTINCT ( proposta_produtos_aprovados."ID_PRODUTO" )) AS contagem_de_produtos
FROM "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA"
     AS proposta
LEFT JOIN proposta_produtos_aprovados ON (proposta."ID_PROPOSTA") = (proposta_produtos_aprovados."ID_PROPOSTA")
LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."JORNADA"
     AS jornada ON (proposta."ID_PROPOSTA") = (jornada."ID_PROPOSTA")
WHERE ((( jornada."DT_STATUS"  ) >= ((DATEADD('year', -2, DATE_TRUNC('year', CURRENT_DATE())))) AND ( jornada."DT_STATUS"  ) < ((DATEADD('year', 3, DATEADD('year', -2, DATE_TRUNC('year', CURRENT_DATE()))))))) AND (jornada."ETAPA" ) = 'Aprovado Risco' AND (jornada."STATUS_ETAPA" ) = 1
GROUP BY
    1
ORDER BY
    2
 ;;
  }


  dimension: proposta_id_proposta {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}."PROPOSTA.ID_PROPOSTA" ;;
  }

  dimension: contagem_de_produtos {
    type: number
    sql: ${TABLE}."CONTAGEM_DE_PRODUTOS" ;;
    label: "Contagem de Produtos"
  }

  measure: contagem_de_produtos_sum {
    type: sum
    sql: ${contagem_de_produtos} ;;
    label: "Contagem de Produtos"
  }

  dimension: id_produto {
    type: string
    sql: ${TABLE}."ID_PRODUTO" ;;
    hidden: yes
  }
}
