view: alunos_log_negativacao {
  derived_table: {
    sql: select LN.value:SEUNUM AS SEUNUM,
      LN.value:FLG_NEGATIVADO AS FLG_NEGATIVADO,
      LN.value:ID_ETAPA_PROCESSAMENTO AS ID_ETAPA_PROCESSAMENTO,
      LN.value:ID_ARQUIVO AS ID_ARQUIVO,
      LN.value:ID_PROVEDOR AS ID_PROVEDOR,
      LN.value:ID_FUNDO_INVESTIMENTO AS ID_FUNDO_INVESTIMENTO,
      LN.value:ID_PAPEL AS ID_PAPEL,
      LN.value:DATA_INSERT AS DATA_INSERT,
      LN.value:DATA_UPDATE AS DATA_UPDATE
      from "GRADUADO"."SELF_SERVICE_BI"."ALUNOS",
      lateral flatten(input => LOG_NEGATIVACAO) AS LN
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: seunum {
    type: string
    sql: ${TABLE}."SEUNUM" ;;
  }

  dimension: flg_negativado {
    type: string
    sql: ${TABLE}."FLG_NEGATIVADO" ;;
  }

  dimension: id_etapa_processamento {
    type: string
    sql: ${TABLE}."ID_ETAPA_PROCESSAMENTO" ;;
  }

  dimension: id_arquivo {
    type: string
    sql: ${TABLE}."ID_ARQUIVO" ;;
  }

  dimension: id_provedor {
    type: string
    sql: ${TABLE}."ID_PROVEDOR" ;;
  }

  dimension: id_fundo_investimento {
    type: string
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: id_papel {
    type: string
    sql: ${TABLE}."ID_PAPEL" ;;
  }

  dimension: data_insert {
    type: string
    sql: ${TABLE}."DATA_INSERT" ;;
  }

  dimension: data_update {
    type: string
    sql: ${TABLE}."DATA_UPDATE" ;;
  }

  set: detail {
    fields: [
      seunum,
      flg_negativado,
      id_etapa_processamento,
      id_arquivo,
      id_provedor,
      id_fundo_investimento,
      id_papel,
      data_insert,
      data_update
    ]
  }
}
