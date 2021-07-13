view: contracts_desc_taxas {
  derived_table: {
    sql: select
            id_contrato,
            f.value:fee_amount::float as PERC_TAXA,
            f.value:fee_type::varchar as TIPO_TAXA
            from "VETERANO"."CURTA"."CONTRACTS" a,
            lateral flatten (input => DESC_TAXAS) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_contrato {
    type: string
    group_item_label: "Código do Contrato"
    description: "Indica o código do contrato do aluno"
    primary_key: yes
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  dimension: perc_taxa {
    type: number
    group_item_label: "Percentual de Taxa"
    description: "Indica o percentual de taxa atribuido ao contrato do aluno"
    sql: ${TABLE}."PERC_TAXA" ;;
  }

  dimension: tipo_taxa {
    type: string
    group_item_label: "Tipo de Taxa"
    description: "Indica o tipo de taxa atribuido ao contrato do aluno"
    sql: ${TABLE}."TIPO_TAXA" ;;
  }

  set: detail {
    fields: [id_contrato, perc_taxa, tipo_taxa]
  }
}
