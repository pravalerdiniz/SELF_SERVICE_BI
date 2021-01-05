view: unpivot_dre {
  derived_table: {
    sql:  select * from "VETERANO"."FATO"."FATO_DRE"
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
    order by data;;
  }



  dimension_group: data {
    type: time
    timeframes: [
      raw,
      week,
      month,
      quarter,
      month_name,
      month_num,
      year
    ]
    convert_tz: no
    label: "Fechamento"
    description: "Indica a data do fechamento"
    datatype: date
    sql: ${TABLE}."DATA" ;;
  }


dimension: tipo {
  type: string
  sql: ${TABLE}."TIPO" ;;
  value_format: ""
  group_label: ""
  group_item_label: "Real/Orçado"
  description: "Indica se a métrica é proveniente do orçamento ou realizado."
}


  dimension: metrica {
    type: string
    sql: ${TABLE}."METRICA" ;;
    value_format: ""
    group_label: ""
    group_item_label: "Métrica"
    description: ""
  }


  dimension: valor {
    type: number
    sql: ${TABLE}."VALOR" ;;
    value_format: ""
    group_label: ""
    group_item_label: "Valor"
    description: ""

}


  measure: sum_valor {
    type: sum
    sql: ${valor} ;;
    group_label: "Valor"
    group_item_label: "Soma"
    value_format:"[>=10000]$0.00,,\"M\";[>=0]0.00%;-$0.00,,\"M\""
    description: ""

  }


  measure: avg_valor {
    type: average
    sql: ${valor} ;;
    value_format: ""
    group_label: "Valor"
    group_item_label: "Média"
    description: ""

  }







}
