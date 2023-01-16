view: metas_realizado_marketplace {
  derived_table: {
    sql:  SELECT
    metas_mktplace."DATA" AS "DATA_REF",
    'METAS' as REFERENCIA,
    '0' AS AVP,
    COALESCE(SUM(( metas_mktplace."META_VOLUME"  ) ), 0) AS "TOTAL",
    COALESCE(SUM(( metas_mktplace."META_VOLUME_BIG5"  ) ), 0) AS "BIG5",
    COALESCE(SUM(( metas_mktplace."META_VOLUME"  )-( metas_mktplace."META_VOLUME_BIG5"  ) ), 0) AS "DEMAIS"
FROM "GRADUADO"."AD_HOC"."METAS_MKTPLACE"
     AS metas_mktplace
WHERE ((( metas_mktplace."DATA"  ) >= ((TO_DATE(DATE_TRUNC('month', CURRENT_DATE())))) AND ( metas_mktplace."DATA"  ) < ((TO_DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE())))))))
GROUP BY
    metas_mktplace."DATA"

UNION ALL

SELECT
    vendas."DATA_PAGAMENTO" AS "DATA_REF",
    'REALIZADO' AS REFERENCIA,
    COUNT(DISTINCT CASE WHEN (((( vendas."DATA_PAGAMENTO"  )) >= ((TO_DATE(TO_TIMESTAMP('2023-01-01')))) AND (( vendas."DATA_PAGAMENTO"  )) < ((TO_DATE(DATEADD('year', 1, TO_TIMESTAMP('2023-01-01'))))))) THEN ( concat((vendas."CODIGO_ALUNO"),(vendas."CODIGO_OFERTA"))  )  ELSE NULL END) AS "TOTAL",
    COUNT(DISTINCT CASE WHEN ((( vendas."GRUPO_INSTITUICAO"  )) = 'AQUI VOCÊ PODE') THEN ( concat((vendas."CODIGO_ALUNO"),(vendas."CODIGO_OFERTA"))  )  ELSE NULL END) AS AVP,
    COUNT(DISTINCT CASE WHEN (( vendas."GRUPO_INSTITUICAO"  ) IN ('ESTÁCIO', 'KROTON', 'GRUPO ÂNIMA', 'GRUPO CRUZEIRO DO SUL', 'GRUPO SER')) THEN ( concat((vendas."CODIGO_ALUNO"),(vendas."CODIGO_OFERTA"))  )  ELSE NULL END) AS BIG5,
    COUNT(DISTINCT CASE WHEN (( vendas."GRUPO_INSTITUICAO"  ) NOT IN ('AQUI VOCÊ PODE', 'ESTÁCIO', 'KROTON', 'GRUPO ÂNIMA', 'GRUPO CRUZEIRO DO SUL', 'GRUPO SER') OR (( vendas."GRUPO_INSTITUICAO"  )) IS NULL) THEN ( concat((vendas."CODIGO_ALUNO"),(vendas."CODIGO_OFERTA"))  )  ELSE NULL END) AS DEMAIS
FROM "GRADUADO"."AMIGOEDU"."VENDAS"
     AS vendas
WHERE ((( vendas."DATA_PAGAMENTO"  ) >= ((TO_DATE(DATE_TRUNC('month', CURRENT_DATE())))) AND ( vendas."DATA_PAGAMENTO"  ) < ((TO_DATE(DATEADD('month', 1, DATE_TRUNC('month', CURRENT_DATE()))))))) AND (vendas."STATUS" ) IN ('PAID', 'PENDING_REFUND', 'REFUNDED') AND (vendas."TENANT_ALUNO" ) = 'AMIGOEDU'
GROUP BY
    vendas."DATA_PAGAMENTO"
ORDER BY
    1 ASC
      ;;
  }

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Data Referência"
    sql: ${TABLE}."DATA_REF" ;;
  }

  dimension: referencia {
    sql: ${TABLE}."REFERENCIA" ;;
    label: "Referência"
  }

  measure: total {
    sql: ${TABLE}."TOTAL" ;;
    type: sum
    label: "Soma Total"
  }

  measure: avp {
    sql: ${TABLE}."AVP" ;;
    type: sum
    label: "Soma AVP"
  }

  measure: big5 {
    sql: ${TABLE}."BIG5" ;;
    type: sum
    label: "Soma BIG5"
  }

  measure: demais {
    sql: ${TABLE}."DEMAIS" ;;
    type: sum
    label: "Soma DEMAIS"
  }

}
