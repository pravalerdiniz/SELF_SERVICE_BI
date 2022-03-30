view: aproveitamento_estoque_nok {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.APROVEITAMENTO_ESTOQUE
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: gerente {
    type: string
    label: "Gerente"
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: etapa {
    type: string
    label: "Etapa"
    sql: ${TABLE}."ETAPA" ;;
  }

  dimension: aproveitamento_estoque {
    type: number
    label: "Aproveitamento Estoque"
    sql: ${TABLE}."APROVEITAMENTO_ESTOQUE" ;;
  }

  measure:aproveitamento_estoque_num{
    type: sum
    label: "Aproveitamento Estoque num"
    value_format: "0.00%"
    sql: ${TABLE}."APROVEITAMENTO_ESTOQUE" ;;
  }

  measure: iniciado {
    type: average
    sql: ${aproveitamento_estoque} ;;
    filters: {
      field: etapa
      value: "Iniciado"
    }
    group_label: "Aproveitamento por Etapa"
    group_item_label: "Aproveitamento Iniciado"
    drill_fields: [aproveitamento_estoque]
    description: "Média do % de aproveitamento da etapa Iniciado"
  }

  measure: aprov_ies {
    type: average
    sql: ${aproveitamento_estoque} ;;
    filters: {
      field: etapa
      value: "Aprovado Instituicao"
    }
    group_label: "Aproveitamento por Etapa"
    group_item_label: "Aproveitamento Aprov IES"
    drill_fields: [aproveitamento_estoque]
    description: "Média do % de aproveitamento da etapa Aprovado IES"
  }

  measure: agg_doc {
    type: average
    sql: ${aproveitamento_estoque} ;;
    filters: {
      field: etapa
      value: "Aguardando Documento"
    }
    group_label: "Aproveitamento por Etapa"
    group_item_label: "Aproveitamento Agg Doc"
    drill_fields: [aproveitamento_estoque]
    description: "Média do % de aproveitamento da etapa Aguardando Documento"
  }

  measure: agg_ass {
    type: average
    sql: ${aproveitamento_estoque} ;;
    filters: {
      field: etapa
      value: "Aguardando Assinatura"
    }
    group_label: "Aproveitamento por Etapa"
    group_item_label: "Aproveitamento Agg Ass"
    drill_fields: [aproveitamento_estoque]
    description: "Média do % de aproveitamento da etapa Aguardando Assinatura"
  }

  set: detail {
    fields: [gerente, etapa, aproveitamento_estoque]
  }
}
