view: crx_agentes_detalhes_pausas {
  derived_table: {
    sql: select f.value:"DURACAO"::varchar as DURACAO_PAUSA,
      f.value:"MOTIVO_PAUSA"::varchar as MOTIVO_PAUSA,
      f.value:"DATA_EVENTO_INI"::date as DATA_EVENTO_INI,
      f.value:"nome"::varchar as NOME
      from "GRADUADO"."SELF_SERVICE_BI"."CRX_AGENTES" a,
      lateral flatten (input => pausas) f
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: duracao_pausa {
    type: string
    sql: ${TABLE}."DURACAO_PAUSA" ;;
  }

  dimension: motivo_pausa {
    type: string
    sql: ${TABLE}."MOTIVO_PAUSA" ;;
  }

  dimension: data_evento_ini {
    type: date
    sql: ${TABLE}."DATA_EVENTO_INI" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
    hidden: yes
  }

  set: detail {
    fields: [duracao_pausa, motivo_pausa, data_evento_ini, nome]
  }
}
