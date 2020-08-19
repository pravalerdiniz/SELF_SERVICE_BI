view: farol {
  derived_table: {
    sql: select a.id_cpf, replcae(id_proposta,'BOF-','') ID_PROPOSTA
      , cast(concat(date,' ',time)as datetime) DATA
      ,VL_STATUS_DETALHADO
      from VETERANO.FATO.FATO_STATUS a
      inner join VETERANO.DIMENSAO.DIM_STATUS b
      on a.id_status_destino = b.id_status
      qualify row_number() over(partition by  a.id_cpf order by a.id) = 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension_group: data {
    type: time
    sql: ${TABLE}."DATA" ;;
  }

  dimension: vl_status_detalhado {
    type: string
    sql: ${TABLE}."VL_STATUS_DETALHADO" ;;
  }

  dimension: ID_PROPOSTA {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  measure: count_cpf {
    type:  count_distinct
    sql: ${id_cpf} ;;
    drill_fields: [id_cpf, ID_PROPOSTA]
  }

  set: detail {
    fields: [id_cpf, data_time, vl_status_detalhado]
  }
}
