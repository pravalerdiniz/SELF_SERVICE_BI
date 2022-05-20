view: painel_de_carga {
  derived_table: {
    sql: SELECT *, DATEDIFF(MINUTE,data_carga, convert_timezone('America/Sao_Paulo',current_timestamp())) diferenca FROM (
      SELECT fluxo, max(dt_conclusao) data_carga FROM GRADUADO.MONITORIA_BANCO.PAINEL_CARGA
      group by 1)
             ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: fluxo {
    type: string
    sql: ${TABLE}."FLUXO" ;;
  }

  dimension_group: datis {
    type: time
    timeframes: [raw,
      time,
      date]
    sql: ${TABLE}."DATA_CARGA" ;;
  }



  dimension: diferenca {
    type: number
    sql: ${TABLE}."DIFERENCA" ;;
  }

  set: detail {
    fields: [fluxo, datis_raw]
  }
}
