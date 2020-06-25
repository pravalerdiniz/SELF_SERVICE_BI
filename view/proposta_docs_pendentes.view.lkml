view: proposta_docs_pendentes {
  derived_table: {
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
    hidden: yes
    label: "Quantidade"
  }

  dimension: id_proposta {
    type: number
    hidden: yes
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
