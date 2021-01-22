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
            ROLLING_MARGEM_SERVICOS_BRUTAS ,
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

  dimension: data_variavel {
    sql:
    {% if tipo_analise._parameter_value == "VALOR_ROLLING" %}
    ${data_month_name}
    {% elsif tipo_analise._parameter_value == "VALOR" %}
    ${data_month}
    {% else %}
    ${data_month}
    {% endif %};;
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
    sql:${TABLE}."METRICA" ;;
    hidden: yes
  }

  dimension: metrica2 {
    type: string
    label: "Metrica"
    sql:
    CASE WHEN ${metrica} = 'G_A' THEN 'G&A' ELSE  REPLACE(${metrica},'_',' ')
    END;;
    order_by_field: ordem_dre
    html:
    {% if value == "LUCRO FINANCEIRO BRUTO" %}
     <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% elsif value == "MARGEM FINANCEIRA BRUTA" %}
     <i><p style="color: black; background-color: #FAD8AD">{{ rendered_value }}</p></i>
    {% elsif value == "LUCROS SERVICOS BRUTOS" %}
     <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% elsif value == "MARGEM SERVICOS BRUTAS" %}
     <i><p style="color: black; background-color: #FAD8AD">{{ rendered_value }}</p></i>
    {% elsif value == "LUCRO BRUTO TOTAL" %}
     <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% elsif value == "MARGEM BRUTA TOTAL" %}
     <i><p style="color: black; background-color: #FAD8AD">{{ rendered_value }}</p></i>
    {% elsif value == "RESULTADO OPERACIONAL" %}
     <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% elsif value == "MARGEM OPERACIONAL" %}
     <i><p style="color: black; background-color: #FAD8AD">{{ rendered_value }}</p></i>
    {% elsif value == "EBT" %}
     <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% elsif value == "LUCRO LIQUIDO AJUSTADO" %}
     <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% else %}
     <p style="color: black; font-size:100%">{{ rendered_value }}</p>
    {% endif %};;
  }


  dimension: valor {
    type: number
    sql: ${TABLE}."VALOR" ;;
  }

  dimension: valor_rolling {
    type: number
    sql: ${TABLE}."VALOR_ROLLING" ;;
  }

  dimension: ordem_dre_tabela {
    type: string
    case: {
      when: {
        sql: ${metrica} = 'RECEITA_JUROS_LIQUIDA' ;;
        label: "1"
      }
      when: {
        sql: ${metrica} = 'PDD'  ;;
        label: "2"
      }
      when: {
        sql: ${metrica} = 'CUSTO_CAPTACAO'  ;;
        label: "3"
      }
      when: {
        sql: ${metrica} = 'LUCRO_FINANCEIRO_BRUTO' ;;
        label: "4"
      }
      when: {
        sql: ${metrica} = 'MARGEM_FINANCEIRA_BRUTA' ;;
        label: "5"
      }

      when: {
        sql: ${metrica} = 'RECEITA_SERVICOS_LIQUIDA' ;;
        label: "6"
      }
      when: {
        sql: ${metrica} = 'CUSTO_COM_PESSOAL' ;;
        label: "7"
      }
      when: {
        sql: ${metrica} = 'CUSTO_SERVICOS_PRESTADOS';;
        label: "8"
      }
      when: {
        sql: ${metrica} = 'LUCROS_SERVICOS_BRUTOS';;
        label: "9"
      }
      when: {
        sql: ${metrica} = 'MARGEM_SERVICOS_BRUTAS';;
        label: "10"
      }
      when: {
        sql: ${metrica} = 'LUCRO_BRUTO_TOTAL' ;;
        label: "11"
      }
      when: {
        sql: ${metrica} = 'MARGEM_BRUTA_TOTAL' ;;
        label: "12"
      }
      when: {
        sql: ${metrica} = 'DESPESA_COM_PESSOAL' ;;
        label: "13"
      }
      when: {
        sql: ${metrica} = 'G_A' ;;
        label: "14"
      }
      when: {
        sql: ${metrica} = 'RESULTADO_OPERACIONAL';;
        label: "15"
      }
      when: {
        sql: ${metrica} = 'MARGEM_OPERACIONAL' ;;
        label: "16"
      }
      when: {
        sql: ${metrica} = 'RESULTADO_FINANCEIRO';;
        label: "17"
      }
      when: {
        sql: ${metrica} = 'DEPRECIACAO_AMORTIZACAO' ;;
        label: "18"
      }
      when: {
        sql: ${metrica} = 'PLANO_INCENTIVOS_LONGO_PRAZO';;
        label: "19"
      }
      when: {
        sql: ${metrica} = 'EBT' ;;
        label: "20"
      }
      when: {
        sql: ${metrica} = 'IRPJ_CSLL';;
        label: "21"
      }
      when: {
        sql: ${metrica} = 'LUCRO_LIQUIDO_AJUSTADO' ;;
        label: "22"
      }
      else: "0"
    }
    hidden: yes
  }

dimension: ordem_dre {
  type: number
  label: "Ordem - DRE"
  sql: ${ordem_dre_tabela} ;;

}
  measure: sum_valor {
    type: sum
    sql: ${valor} ;;
    value_format:"[>=1000]$0.0,,\"M\";[>=0]0.00%;[<=0]-$0.0,,\"M\""
  }

  measure: sum_valor_rolling {
    type: sum
    sql: ${valor_rolling} ;;
    value_format:"[>=1000]$0.0,,\"M\";[>=0]0.00%;[<=0]-$0.0,,\"M\""
  }

  measure: sum_variavel {
    type: sum
    sql: ${TABLE}.{% parameter tipo_analise %} ;;
    value_format:"[>=1000]0.0;[>=0]0.00%;[<=0]-0.0"
    html:
    {% if unpivot_dre.metrica2._value == "LUCRO FINANCEIRO BRUTO" %}
    <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% elsif unpivot_dre.metrica2._value == "MARGEM FINANCEIRA BRUTA" %}
    <i><p style="color: black; background-color: #FAD8AD">{{ rendered_value }}</p></i>
    {% elsif unpivot_dre.metrica2._value == "LUCROS SERVICOS BRUTOS" %}
    <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% elsif unpivot_dre.metrica2._value == "MARGEM SERVICOS BRUTAS" %}
    <i><p style="color: black; background-color: #FAD8AD">{{ rendered_value }}</p></i>
    {% elsif unpivot_dre.metrica2._value == "LUCRO BRUTO TOTAL" %}
    <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% elsif unpivot_dre.metrica2._value == "MARGEM BRUTA TOTAL" %}
    <i><p style="color: black; background-color: #FAD8AD">{{ rendered_value }}</p></i>
    {% elsif unpivot_dre.metrica2._value == "RESULTADO OPERACIONAL" %}
    <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% elsif unpivot_dre.metrica2._value == "MARGEM OPERACIONAL" %}
    <i><p style="color: black; background-color: #FAD8AD">{{ rendered_value }}</p></i>
    {% elsif unpivot_dre.metrica2._value == "EBT" %}
    <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% elsif unpivot_dre.metrica2._value == "LUCRO LIQUIDO AJUSTADO" %}
    <p style="color: black; font-weight: bold ; background-color: #F87433">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; font-size:100%">{{ rendered_value }}</p>
    {% endif %};;
  }
}
