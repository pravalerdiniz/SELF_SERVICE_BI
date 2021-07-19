view: documentos_solicitados {
  derived_table: {
    sql: select p.ID_PROPOSTA,
       v.value:DATA_ENVIO_DOCUMENTO::date "DATA_ENVIO_DOCUMENTO",
       v.value:COD_RELEASE_CONTRATO::int "COD_RELEASE_CONTRATO",
       v.value:DESCRICAO_DOCUMENTO::varchar "DESCRICAO_DOCUMENTO",
       v.value:ID_DOCUMENTO::int "ID_DOCUMENTO",
       v.value:ID_STATUS_DOCUMENTO::int "ID_STATUS_DOCUMENTO"
from "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA" p,
lateral flatten(input => p.DOCUMENTOS_SOLICITADOS) v
where DOCUMENTOS_SOLICITADOS is not null
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: data_envio_documento {
    type: date
    sql: ${TABLE}."DATA_ENVIO_DOCUMENTO" ;;
  }

  dimension: cod_release_contrato {
    type: number
    sql: ${TABLE}."COD_RELEASE_CONTRATO" ;;
  }

  dimension: descricao_documento {
    type: string
    sql: ${TABLE}."DESCRICAO_DOCUMENTO" ;;
  }

  dimension: id_documento {
    type: number
    sql: ${TABLE}."ID_DOCUMENTO" ;;
  }

  dimension: id_status_documento {
    type: number
    sql: ${TABLE}."ID_STATUS_DOCUMENTO" ;;
  }

  set: detail {
    fields: [
      id_proposta,
      data_envio_documento,
      cod_release_contrato,
      descricao_documento,
      id_documento,
      id_status_documento
    ]
  }
}
