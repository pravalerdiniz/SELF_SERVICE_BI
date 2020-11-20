view: unpivot_dre {
  derived_table: {
    sql:  select * from "VETERANO"."FATO"."FATO_DRE"
unpivot(valor for metrica in (RECEITA_JUROS_LIQUIDA ,
PDD ,
CUSTO_CAPTACAO  ,
RECEITA_SERVICOS_LIQUIDA  ,
CUSTO_COM_PESSOAL ,
CUSTO_SERVICOS_PRESTADOS  ,
DESPESA_COM_PESSOAL ,
G_A ,
RESULTADO_FINANCEIRO  ,
DEPRECIACAO_AMORTIZACAO ,
PLANO_INCENTIVOS_LONGO_PRAZO  ,
IRPJ_CSLL ))
    order by data;;
  }



dimension: data {
  type: string
  sql: ${TABLE}."DATA" ;;
  group_label: ""
  group_item_label:"Data"
  description: "Ano-mês de fechamento."
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
    value_format: ""
    group_label: "Valor"
    group_item_label: "Soma"
    description: ""

  }
}
