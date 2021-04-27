view: orcamento_atual {
  sql_table_name: "AD_HOC"."ORCAMENTO"
    ;;

  dimension: ano {
    type: number
    label: "Ano"
    description: "Indica o ano do orçamento"
    sql: ${TABLE}."ANO" ;;
  }

  dimension: class_frente {
    type: string
    group_label: "OKR"
    label: "KR - Frente de Negócio"
    description: "Indica os resultados chave dentro dos OKRs estabelecidos"
    sql: ${TABLE}."CLASS_FRENTE" ;;
  }

  dimension: conta_contabil {
    type: string
    label: "Conta Contábil"
    description: "Indica o número da conta contábil"
    sql: ${TABLE}."CONTA_CONTABIL" ;;
  }

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Orçamento"
    sql: ${TABLE}."DATA" ;;
  }

  dimension: desc_fornecedor {
    type: string
    label: "Fornecedor"
    description: "Indica a descrição do fornecedor da despesa do orçamento"
    sql: ${TABLE}."DESC_FORNECEDOR" ;;
  }

  dimension: descricao_cc {
    type: string
    group_label: "Centro de Custo"
    label: "Descrição - Centro de Custo"
    description: "Indica a descrição do centro de custo"
    sql: ${TABLE}."DESCRICAO_CC" ;;
  }

  dimension: descricao_despesa {
    type: string
    group_label: "Despesa"
    label: "Descrição - Despesa"
    description: "Indica a descrição da despesa no orçamento"
    sql: ${TABLE}."DESCRICAO_DESPESA" ;;
  }

  dimension: frente {
    type: string
    group_label: "OKR"
    label: "Objetivo - Frente de Negócio"
    description: "Indica o objetivo do OKR estabelecido da companhia no orçamento"
    sql: ${TABLE}."FRENTE" ;;
  }

  dimension: montante {
    type: number
    label: "Montante"
    description: "Indica o valor do montante no orçamento"
    sql: ${TABLE}."MONTANTE" ;;
  }

  dimension: tipo_despesa {
    type: string
    group_label: "Despesa"
    label: "Tipo de Despesa"
    description: "Indica o tipo de despesa no orçamento."
    sql: ${TABLE}."TIPO_DESPESA" ;;
  }

  dimension: tipo_orcamento {
    type: string
    label: "Tipo de Orçamento"
    description: "Indica o tipo de orçamento.Ex:Operacional"
    sql: ${TABLE}."TIPO_ORCAMENTO" ;;
  }

  dimension: visao {
    type: string
    label: "Visão"
    description: "Indica a visão do orçamento.Ex: Orçamento ou Realizado"
    sql: ${TABLE}."VISAO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_montante {
    type: sum
    group_label: "Montante"
    label: "Soma"
    value_format: "$ #,###.00"
    sql: ${montante} ;;
    drill_fields: []
  }

  measure: avg_montante {
    type: average
    group_label: "Montante"
    label: "Média"
    value_format: "$ #,###.00"
    sql: ${montante} ;;
    drill_fields: []
  }


  measure: min_montante {
    type: min
    group_label: "Montante"
    label: "Mínimo"
    value_format: "$ #,###.00"
    sql: ${montante} ;;
    drill_fields: []
  }


  measure: max_montante {
    type: max
    group_label: "Montante"
    label: "Máximo"
    value_format: "$ #,###.00"
    sql: ${montante} ;;
    drill_fields: []
  }



}
