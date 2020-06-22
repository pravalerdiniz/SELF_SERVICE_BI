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

  measure: count {
    type: count
    drill_fields: [detail*]
    label: "Quantidade"
  }

  dimension: id_titulo {
    type: number
    sql: ${TABLE}."ID_TITULO" ;;
    label: "ID Título"
  }

  dimension: id_extrato_titulo {
    type: string
    sql: ${TABLE}."ID_EXTRATO_TITULO" ;;
    label: "ID Extrato Título"
  }

  dimension: ds_extrato_transacao {
    type: string
    sql: ${TABLE}."DS_EXTRATO_TRANSACAO" ;;
    label: "Extrato da Transação"
  }

  dimension: ds_extrato_transacao_tipo {
    type: string
    sql: ${TABLE}."DS_EXTRATO_TRANSACAO_TIPO" ;;
    label: "Tipo de Extrato da Transação"
  }

  dimension: vl_extrato {
    type: number
    sql: ${TABLE}."VL_EXTRATO" ;;
    label: "Valor do Extrato"
  }

  set: detail {
    fields: [id_titulo, id_extrato_titulo, ds_extrato_transacao, ds_extrato_transacao_tipo, vl_extrato]
  }
}
