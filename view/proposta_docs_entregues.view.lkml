view: proposta_docs_entregues {
  derived_table: {
    sql: select
      id_proposta,
      f.value::varchar as docs_entregues
      from GRADUADO.SELF_SERVICE_BI.PROPOSTA a,
      lateral flatten (input => docs_entregues) f
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: no
    label: "Documentos Entregues"
    description: "Quantidade de documentos entregues por proposta durante a formalização"
  }

  dimension: sum_documentos{
    type: number
    sql: CASE WHEN ${docs_entregues} IS NOT NULL THEN 1 ELSE 0 END ;;
    drill_fields: [detail*]
    label: "Soma Documentos Entregues"
    hidden:yes
    description: "Soma de documentos entregues por proposta durante a formalização"
  }


  measure: average_documentos{
    type: average
    sql: ${sum_documentos};;
    drill_fields: [detail*]
    label: "Média Documentos Entregues"
    hidden:yes
    description: "Quantidade média de documentos entregues por proposta durante a formalização"
  }






  dimension: id_proposta {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }



  dimension: docs_entregues {
    type: string
    sql: ${TABLE}."DOCS_ENTREGUES" ;;
    description: "Indica todos os documentos entregues para formalização"
    label: "Documentos Entregues"
  }

  set: detail {
    fields: [id_proposta, docs_entregues]
  }
}
