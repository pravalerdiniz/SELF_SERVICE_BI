view: crx_agentes_detalhes_pausas {
  derived_table: {
    sql: select f.value:"DURACAO"::varchar as DURACAO_PAUSA,
      f.value:"MOTIVO_PAUSA"::varchar as MOTIVO_PAUSA,
      f.value:"DATA_EVENTO_INI"::date as DATA_EVENTO_INI,
      f.value:"nome"::varchar as NOME,
      A.PAUSAS:"ID"::INT ID
      from "GRADUADO"."SELF_SERVICE_BI"."CRX_AGENTES" a,
      lateral flatten (input => pausas) f
      where f.value:"DATA_EVENTO_INI"::date is not null
       ;;
  }

  measure: count {
    type: count
    label: "Quantidade de Pausa"
    group_label: "Dados da Pausa"
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    hidden: yes
    sql: ${TABLE}."ID" ;;
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



  dimension_group: data_evento_ini {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_EVENTO_INI" ;;
    label: "Pausa"
    description: "Indica a data em que a pausa foi realizada"
  }


dimension: nome_data {
  sql: CONCAT(${nome},${data_evento_ini_raw});;
  primary_key: yes
  hidden: yes






}
  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
    hidden: yes
  }

  set: detail {
    fields: [duracao_pausa, motivo_pausa, data_evento_ini_raw, nome]
  }
}
