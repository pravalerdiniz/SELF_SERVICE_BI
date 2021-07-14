view: alunos_hotlead {
  derived_table: {
    persist_for: "1 hour"
    sql: select
            id_cpf,
            f.key,
            f.value:CAMPANHA::varchar as CAMPANHA,
            f.value:DT_ENVIO::date as DATA_ENVIO
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
            lateral flatten (input => CAMPANHAS) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: key {
    type: string
    hidden: yes
    sql: ${TABLE}."KEY" ;;
  }

  dimension: campanha {
    type: string
    sql: ${TABLE}."CAMPANHA" ;;
  }

  dimension: data_envio {
    type: date
    sql: ${TABLE}."DATA_ENVIO" ;;
  }

  set: detail {
    fields: [id_cpf, key, campanha, data_envio]
  }
}
