view: proposta_motivo_rejeicao_docs {
    derived_table: {
      sql: select
              id_proposta,
              f.value::varchar as motivo_rejeicao_documento
              from GRADUADO.SELF_SERVICE_BI.PROPOSTA a,
              lateral flatten (input => motivo_rejeicao_documento) f
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
      hidden: no
      description: "Quantidade de documentos por motivos de rejeição por proposta durante a formalização"
      label: "Motivo de rejeicao docs"
    }

    dimension: id_proposta {
      type: number
      hidden: yes
      primary_key: yes
      sql: ${TABLE}."ID_PROPOSTA" ;;
    }

    dimension: motivo_rejeicao_documento {
      type: string
      sql: ${TABLE}."MOTIVO_REJEICAO_DOCUMENTO" ;;
      description: "Indica todos os motivos de rejeição dos documentos para formalização"
      label: "Motivo de rejeicao docs"
    }

    set: detail {
      fields: [id_proposta, motivo_rejeicao_documento]
    }
  }
