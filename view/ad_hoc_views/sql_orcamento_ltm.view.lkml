view: sql_orcamento_ltm {
  derived_table: {
    sql: SELECT
          (TO_CHAR(TO_DATE(orcameto_cc."DATA" ), 'YYYY-MM-DD')) AS "orcameto_cc.data_lancamento_date",
          CASE
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Trade Marketing','Comercial - B2B')  THEN '0'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Central CX', 'Estratégia de Crédito','Estratégia de crédito','Formalização','Planejamento e Conversão','Operações Financeiras')   THEN '1'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Marca') THEN '2'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Social','Online','Aquisição') THEN '3'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Online RV','Aquisição RV') THEN '4'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Investimentos Marketing') THEN '5'
      ELSE '6'
      END AS "orcameto_cc.grupo_canais__sort_",
          CASE
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Trade Marketing','Comercial - B2B')  THEN 'Faculdade'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Central CX', 'Estratégia de Crédito','Estratégia de crédito','Formalização','Planejamento e Conversão','Operações Financeiras')   THEN 'Jornada'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Marca') THEN 'Organico'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Social','Online','Aquisição') THEN 'Pago'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Online RV','Aquisição RV') THEN 'RV'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Investimentos Marketing') THEN 'TV'
      ELSE 'Outros'
      END AS "orcameto_cc.grupo_canais",
          orcameto_cc."DESCRICAO_CC"  AS "orcameto_cc.descricao_cc",
          COALESCE(SUM(( orcameto_cc."MONTANTE"  ) ), 0) AS "orcameto_cc.sum_montante",
          AVG(( orcameto_cc."OPERACIONAL_AQUISICAO"  ) ) AS "orcameto_cc.measure_operacional_aquisicao",
              AVG(( orcameto_cc."OPERACIONAL_AQUISICAO"  ) ) * COALESCE(SUM(( orcameto_cc."MONTANTE"  ) ), 0) AS "orcameto_cc.calculo_porcentagem_operacional_aquisicao"
      FROM "AD_HOC"."ORCAMETO_CC"
           AS orcameto_cc
      WHERE ((( orcameto_cc."DATA"  ) >= (TO_DATE(TO_TIMESTAMP('2020-01-01'))) AND ( orcameto_cc."DATA"  ) < (TO_DATE(TO_TIMESTAMP('2040-12-31'))))) AND ((CASE
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Trade Marketing','Comercial - B2B')  THEN 'Faculdade'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Central CX', 'Estratégia de Crédito','Estratégia de crédito','Formalização','Planejamento e Conversão','Operações Financeiras')   THEN 'Jornada'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Marca') THEN 'Organico'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Social','Online','Aquisição') THEN 'Pago'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Online RV','Aquisição RV') THEN 'RV'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Investimentos Marketing') THEN 'TV'
      ELSE 'Outros'
      END) <> 'Outros' OR (CASE
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Trade Marketing','Comercial - B2B')  THEN 'Faculdade'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Central CX', 'Estratégia de Crédito','Estratégia de crédito','Formalização','Planejamento e Conversão','Operações Financeiras')   THEN 'Jornada'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Marca') THEN 'Organico'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Social','Online','Aquisição') THEN 'Pago'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Online RV','Aquisição RV') THEN 'RV'
      WHEN (orcameto_cc."DESCRICAO_CC") in ('Investimentos Marketing') THEN 'TV'
      ELSE 'Outros'
      END) IS NULL) AND (orcameto_cc."TIPO_ORCAMENTO" ) IN ('Folha', 'Operacional') AND (orcameto_cc."VISAO" ) = 'Realizado'
      GROUP BY
          (TO_DATE(orcameto_cc."DATA" )),
          2,
          3,
          4
      ORDER BY
          1 DESC
       ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension_group: orcameto_cc_data_lancamento_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Lançamento"
    group_label: "Data"
    description: "Indica a Data que a despesa foi lançada"
    sql: ${TABLE}."ORCAMETO_CC.DATA_LANCAMENTO_DATE" ;;
  }

  dimension: orcameto_cc_grupo_canais__sort_ {
    type: string
    label: "Grupo de Canais"
    hidden: yes
    sql: ${TABLE}."ORCAMETO_CC.GRUPO_CANAIS__SORT_" ;;
  }

  dimension: orcameto_cc_grupo_canais {
    type: string
    label: "Grupo de Canais"
    sql: ${TABLE}."ORCAMETO_CC.GRUPO_CANAIS" ;;
  }

  dimension: orcameto_cc_descricao_cc {
    type: string
    label: "Descrição Centro de Custo"
    sql: ${TABLE}."ORCAMETO_CC.DESCRICAO_CC" ;;
  }

  dimension: orcameto_cc_sum_montante {
    type: number
    label: "Soma do Valor"
    sql: ${TABLE}."ORCAMETO_CC.SUM_MONTANTE" ;;
  }

  dimension: orcameto_cc_measure_operacional_aquisicao {
    type: number
    label: "Porcentagem do Valor"
    value_format: "0.00%"
    sql: ${TABLE}."ORCAMETO_CC.MEASURE_OPERACIONAL_AQUISICAO" ;;
  }

  dimension: orcameto_cc_calculo_porcentagem_operacional_aquisicao {
    type: number
    label: "Soma do Valor Aplicado %"
    sql: ${TABLE}."ORCAMETO_CC.CALCULO_PORCENTAGEM_OPERACIONAL_AQUISICAO" ;;
  }

  set: detail {
    fields: [

      orcameto_cc_grupo_canais__sort_,
      orcameto_cc_grupo_canais,
      orcameto_cc_descricao_cc,
      orcameto_cc_sum_montante,
      orcameto_cc_measure_operacional_aquisicao,
      orcameto_cc_calculo_porcentagem_operacional_aquisicao
    ]
  }
}
