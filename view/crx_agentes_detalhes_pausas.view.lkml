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

  measure: duracao_pausa {
    type: sum
    group_label: "Dados da Pausa"
    group_item_label: "Duração da Pausa"
    description: "Indica o tempo que durou a pausa realizada pelo atendente"
    sql: ${TABLE}."DURACAO_PAUSA"/ 86400.0 ;;
    value_format: "[hh]:mm:ss"
  }

  dimension: motivo_pausa {
    type: string
    group_label: "Dados da Pausa"
    group_item_label: "Motivo da Pausa"
    description: "Indica o motivo pelo qual a pausa foi realizada. Ex: feedback, pausa lanche, etc"
    sql: ${TABLE}."MOTIVO_PAUSA" ;;
  }

  dimension: data_evento_ini {
    type: date
    group_label: "Dados da Pausa"
    group_item_label: "Data da Pausa"
    description: "Indica a data em que a pausa foi realizada"
        sql: ${TABLE}."DATA_EVENTO_INI" ;;
  }



dimension: nome_data {
  sql: CONCACT(${nome},${data_evento_ini});;
  primary_key: yes
  hidden: yes






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
