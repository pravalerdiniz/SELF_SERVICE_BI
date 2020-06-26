view: financeiro_extrato_titulo {
  derived_table: {
    sql: select
      id_titulo,
      f.key as id_extrato_titulo,
      f.value:ds_extrato_transacao::varchar as ds_extrato_transacao,
      f.value:ds_extrato_transacao_tipo::varchar as ds_extrato_transacao_tipo,
      f.value:vl_extrato::float(2) as vl_extrato
      from GRADUADO.SELF_SERVICE_BI.FINANCEIRO a,
      lateral flatten (input => id_extrato_titulo_info) f
       ;;
  }

  dimension: id_titulo {
    type: number
    sql: ${TABLE}."ID_TITULO" ;;
    label: "ID Título"
    description: "Indica o ID referência da tabela Financeiro"
    value_format: "#"
  }

  dimension: id_extrato_titulo {
    type: string
    sql: ${TABLE}."ID_EXTRATO_TITULO" ;;
    description: "Indica o ID único do extrato de pagamento. Extrato de pagamento referente aos alunos do fundo de investimento 'Gestão'"
    label: "ID Extrato Título"
    value_format: "#"
  }

  dimension: ds_extrato_transacao {
    type: string
    sql: ${TABLE}."DS_EXTRATO_TRANSACAO" ;;
    description: "Indica oual a transação correspondente ao extrato. Ex: Parcela, Comissão, Boleto, Taxas Adicionais."
    label: "Extrato da Transação"
  }

  dimension: ds_extrato_transacao_tipo {
    type: string
    sql: ${TABLE}."DS_EXTRATO_TRANSACAO_TIPO" ;;
    description: "Indica qual o tipo de transação correspondente ao extrato.Ex: Crédito, Débito, Tarifa Bancária."
    label: "Tipo de Extrato da Transação"
  }

  dimension: vl_extrato {
    type: number
    sql: ${TABLE}."VL_EXTRATO" ;;
    description: "Indica qual o valor da transação de cada extrato de pagamento."
    label: "Valor do Extrato"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    label: "Quantidade de Extratos"
    description: "Contagem de Extrato por título"
  }

  measure: sum_vl_extrato {
    type: sum
    sql: ${vl_extrato} ;;
    group_label: "Extrato"
    group_item_label: "Soma"
    description: "Soma do valor do extrato."
  }



  measure: avg_vl_extrato {
    type: average
    sql: ${vl_extrato} ;;
    group_label: "Extrato"
    group_item_label: "Média"
    description: "Média do valor do extrato."
  }




  measure: max_vl_extrato {
    type: max
    sql: ${vl_extrato} ;;
    group_label: "Extrato"
    group_item_label: "Máximo"
    description: "Máximo do valor do extrato."
  }

  measure: min_vl_extrato {
    type: min
    sql: ${vl_extrato} ;;
    group_label: "Extrato"
    group_item_label: "Mínimo"
    description: "Mínimo do valor do extrato."
  }




  set: detail {
    fields: [id_titulo, id_extrato_titulo, ds_extrato_transacao, ds_extrato_transacao_tipo, vl_extrato]
  }
}
