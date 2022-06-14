view: orcamento_ltm {
    view_label: "Orçamento LTM"
    derived_table: {
      sql: SELECT
    DATA,
    TIPO_ORCAMENTO,
    CASE
      WHEN (DESCRICAO_CC) in ('Trade Marketing','Comercial - B2B')  THEN 'Faculdade'
      WHEN (DESCRICAO_CC) in ('Central CX', 'Estratégia de Crédito','Estratégia de crédito','Formalização','Planejamento e Conversão','Operações Financeiras')   THEN 'Jornada'
      WHEN (DESCRICAO_CC) in ('Marca') THEN 'Organico'
      WHEN (DESCRICAO_CC) in ('Social','Online','Aquisição') THEN 'Pago'
      WHEN (DESCRICAO_CC) in ('Online RV','Aquisição RV') THEN 'RV'
      WHEN (DESCRICAO_CC) in ('Investimentos Marketing') THEN 'TV'
    ELSE 'Outros'
    END AS GRUPO_CANAIS,
    DESCRICAO_CC,
    COALESCE(SUM((MONTANTE) ), 0) AS SUM_MONTANTE,
    AVG(( OPERACIONAL_AQUISICAO ) ) AS perc_aquisicao,
    AVG(( OPERACIONAL_AQUISICAO ) ) * COALESCE(SUM(( MONTANTE ) ), 0) AS sum_perc_aquisicao,
    AVG(( OPERACIONAL_RENOVACAO ) ) AS perc_renovacao,
    AVG(( OPERACIONAL_RENOVACAO ) ) * COALESCE(SUM(( MONTANTE ) ), 0) AS sum_perc_renovacao
      FROM AD_HOC.ORCAMETO_CC AS orcameto_cac
      WHERE ((( DATA  ) >= (TO_DATE(TO_TIMESTAMP('2020-01-01'))) AND ( DATA ) < (TO_DATE(TO_TIMESTAMP('2040-12-31')))))
      AND (TIPO_ORCAMENTO) IN ('Folha', 'Operacional')
      AND (VISAO) = 'Realizado'
      GROUP BY
          1,
          2,
          3,
          4
      ORDER BY
          1 DESC ;;
    }

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Orçamento"
    sql: ${TABLE}."DATA" ;;
  }

  dimension: tipo_orcamento {
    type: string
    label: "Tipo de Orçamento"
    description: "Indica o tipo de orçamento. Ex: Folha ou Operacional"
    sql: ${TABLE}."TIPO_ORCAMENTO" ;;
  }

  dimension: grupo_canais {
    type: string
    label: "Grupo de Canais"
    sql:${TABLE}."GRUPO_CANAIS"  ;;
  }

  dimension: descricao_cc {
    type: string
    label: "Descrição do Centro de Custo"
    description: "Indica a descrição do centro de custo no orçamento."
    sql: ${TABLE}."DESCRICAO_CC" ;;
  }

      ## VALORES

  dimension: sum_montante {
    type: number
    label: "Soma de Montante"
    value_format: "#,##0"
    description: "Indica o montante disponivel dentro do orçamento."
    sql: ${TABLE}."SUM_MONTANTE" ;;
  }

  measure: sum_valor_montante {
    type: sum
    label: "Soma do Valor"
    value_format: "#,##0"
    sql: ${sum_montante} ;;
  }

  dimension: perc_aquisicao {
    type: number
    label: "Percentual de Aquisição"
    value_format: "0.00%"
    description: "Indica o montante disponivel dentro do orçamento."
    sql: ${TABLE}."PERC_AQUISICAO" ;;
  }

  dimension: sum_perc_aquisicao {
    type: number
    label: "Soma com Perc de Aquisição"
    value_format: "#,##0"
    description: "Indica o montante disponivel dentro do orçamento."
    sql: ${TABLE}."SUM_PERC_AQUISICAO" ;;
  }

  measure: sum_valor_perc_aquisicao {
    type: sum
    label: "Soma do Valor Percentual Aquisição"
    value_format: "#,##0"
    sql: ${sum_perc_aquisicao} ;;
  }

  dimension: perc_renovacao {
    type: number
    label: "Percentual de Renovação"
    value_format: "0.00%"
    description: "Indica o montante disponivel dentro do orçamento."
    sql: ${TABLE}."PERC_RENOVACAO" ;;
  }

  dimension: sum_perc_renovacao {
    type: number
    label: "Soma com Perc de Renovação"
    value_format: "#,##0"
    description: "Indica o montante disponivel dentro do orçamento."
    sql: ${TABLE}."SUM_PERC_RENOVACAO" ;;
  }

  measure: sum_valor_perc_renovacao {
    type: sum
    label: "Soma do Valor Percentual Renovação"
    value_format: "#,##0"
    sql: ${sum_perc_renovacao} ;;
  }



  }
