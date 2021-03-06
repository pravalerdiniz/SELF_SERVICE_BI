view: log_negativacao {
  derived_table: {
    persist_for: "1 hour"
    sql: select v.value:CPF::int "CPF",
       v.value:DATA_UPDATE::datetime "DATA",
       v.value:FLAG_NEGATIVADO::boolean "FLAG_NEGATIVADO",
       v.value:ID_ETAPA_PROCESSAMENTO::int "ID_ETAPA_PROCESSAMENTO",
       v.value:ID_FUNDO_INVESTIMENTO::int "ID_FUNDO_INVESTIMENTO",
       v.value:ID_PROVEDOR::int "ID_PROVEDOR",
       v.value:PAPEL::varchar "PAPEL"
from "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO" f,
lateral flatten(input => f.log_negativacao) v
where log_negativacao is not null
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
  }

  dimension_group: data {
    type: time
    sql: ${TABLE}."DATA" ;;
  }

  dimension: flag_negativado {
    type: string
    suggestable: yes
    sql: ${TABLE}."FLAG_NEGATIVADO" ;;
  }

  dimension: id_etapa_processamento {
    type: number
    suggestable: yes
    sql: ${TABLE}."ID_ETAPA_PROCESSAMENTO" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    suggestable: yes
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: id_provedor {
    type: number
    suggestable: yes
    sql: ${TABLE}."ID_PROVEDOR" ;;
  }

  dimension: papel {
    type: string
    suggestable: yes
    sql: ${TABLE}."PAPEL" ;;
  }

  set: detail {
    fields: [
      cpf,
      data_time,
      flag_negativado,
      id_etapa_processamento,
      id_fundo_investimento,
      id_provedor,
      papel
    ]
  }
}
