view: unpivot_dre {
  derived_table: {
    sql: with unpivot_dre_tbl as (
      select tipo, data, metrica, valor from "VETERANO"."FATO"."FATO_DRE"
            unpivot(valor for metrica in (
            RECEITA_JUROS_LIQUIDA ,
            RECEITA_JUROS_LIQUIDA  ,
            PDD  ,
            CUSTO_CAPTACAO  ,
            LUCRO_FINANCEIRO_BRUTO  ,
            MARGEM_FINANCEIRA_BRUTA  ,
            RECEITA_SERVICOS_LIQUIDA  ,
            CUSTO_COM_PESSOAL  ,
            CUSTO_SERVICOS_PRESTADOS  ,
            LUCROS_SERVICOS_BRUTOS  ,
            MARGEM_SERVICOS_BRUTAS  ,
            LUCRO_BRUTO_TOTAL  ,
            MARGEM_BRUTA_TOTAL  ,
            DESPESA_COM_PESSOAL  ,
            G_A  ,
            RESULTADO_OPERACIONAL  ,
            MARGEM_OPERACIONAL  ,
            RESULTADO_FINANCEIRO  ,
            DEPRECIACAO_AMORTIZACAO  ,
            PLANO_INCENTIVOS_LONGO_PRAZO  ,
            EBT  ,
            IRPJ_CSLL  ,
            LUCRO_LIQUIDO_AJUSTADO
             ))
          order by data
      )

      , unpivot_dre_rolling as (
        select tipo, data, metrica, valor from "VETERANO"."FATO"."FATO_DRE"
            unpivot(valor for metrica in (
            ROLLING_RECEITA_JUROS_LIQUIDA ,
            ROLLING_RECEITA_JUROS_LIQUIDA  ,
            ROLLING_PDD  ,
            ROLLING_CUSTO_CAPTACAO  ,
            ROLLING_LUCRO_FINANCEIRO_BRUTO  ,
            ROLLING_MARGEM_FINANCEIRA_BRUTA  ,
            ROLLING_RECEITA_SERVICOS_LIQUIDA  ,
            ROLLING_CUSTO_COM_PESSOAL  ,
            ROLLING_CUSTO_SERVICOS_PRESTADOS  ,
            ROLLING_LUCROS_SERVICOS_BRUTOS  ,
            ROLLING_MARGEM_SERVICOS_BRUTA  ,
            ROLLING_LUCRO_BRUTO_TOTAL  ,
            ROLLING_MARGEM_BRUTA_TOTAL  ,
            ROLLING_DESPESA_COM_PESSOAL  ,
            ROLLING_G_A  ,
            ROLLING_RESULTADO_OPERACIONAL  ,
            ROLLING_MARGEM_OPERACIONAL  ,
            ROLLING_RESULTADO_FINANCEIRO  ,
            ROLLING_DEPRECIACAO_AMORTIZACAO  ,
            ROLLING_PLANO_INCENTIVOS_LONGO_PRAZO  ,
            ROLLING_EBT  ,
            ROLLING_IRPJ_CSLL  ,
            ROLLING_LUCRO_LIQUIDO_AJUSTADO
             ))
          order by data
      )

      select
      a.*,
      b.valor as valor_rolling
      from unpivot_dre_tbl a
      inner join unpivot_dre_rolling b on a.data = b.data and a.tipo = b.tipo and a.metrica = replace(b.metrica, 'ROLLING_', '')
       ;;
  }

  measure: count {
    type: count
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      month,
      month_name,
      month_num,
      year
    ]
    sql: ${TABLE}."DATA" ;;
  }

  dimension: metrica {
    type: string
    sql: ${TABLE}."METRICA" ;;
  }

  dimension: valor {
    type: number
    sql: ${TABLE}."VALOR" ;;
  }

  dimension: valor_rolling {
    type: number
    sql: ${TABLE}."VALOR_ROLLING" ;;
  }

  measure: sum_valor {
    type: sum
    sql: ${valor} ;;
    value_format:"[>=10000]$0.00,,\"M\";[>=0]0.00%;-$0.00,,\"M\""
  }

  measure: sum_valor_rolling {
    type: sum
    sql: ${valor_rolling} ;;
    value_format:"[>=10000]$0.00,,\"M\";[>=0]0.00%;-$0.00,,\"M\""
  }

  measure: sum_variavel {
    type: sum
    sql: ${TABLE}.{% parameter tipo_analise %} ;;
    value_format:"[>=10000]$0.00,,\"M\";[>=0]0.00%;-$0.00,,\"M\""
  }

  parameter: tipo_analise {
    type: unquoted
    allowed_value: {
      label: "YTD"
      value: "VALOR_ROLLING"
    }
    allowed_value: {
      label: "Mês"
      value: "VALOR"
    }
  }
}
