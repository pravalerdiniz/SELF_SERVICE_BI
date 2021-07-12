view: proposta_docs_pendentes {
  derived_table: {
    persist_for: "1 hour"
    sql: select
      id_proposta,
      f.value::varchar as docs_pendentes
      from GRADUADO.SELF_SERVICE_BI.PROPOSTA a,
      lateral flatten (input => docs_pendentes) f
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: no
    label: "Documentos Pendentes"
    description: "Quantidade de documentos pendentes por proposta durante a formalização"
  }

  dimension: id_proposta {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: docs_pendentes {
    type: string
    sql: ${TABLE}."DOCS_PENDENTES" ;;
    description: "Indica todos os documentos pendentes por proposta"
    label: "Documentos Pendentes"
  }

  set: detail {
    fields: [id_proposta, docs_pendentes]
  }
}
