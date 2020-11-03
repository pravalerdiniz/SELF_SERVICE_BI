view: proposta_metas_gc {
  derived_table: {
    sql: select
            f.key as grupo_ies,
            f.value:JANEIRO::float as JANEIRO,
             f.value:FEVEREIRO::float as FEVEREIRO,
              f.value:MARCO::float as MARCO,
               f.value:ABRIL::float as ABRIL,
                f.value:MAIO::float as MAIO,
                 f.value:JUNHO::float as JUNHO,
                  f.value:JULHO::float as JULHO,
                   f.value:AGOSTO::float as AGOSTO,
                    f.value:SETEMBRO::float as SETEMBRO,
                     f.value:OUTUBRO::float as OUTUBRO,
                      f.value:NOVEMBRO::float as NOVEMBRO,
                       f.value:DEZEMBRO::float as DEZEMBRO
            from GRADUADO.SELF_SERVICE_BI.PROPOSTA a,
            lateral flatten (input => metas_gc) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: grupo_ies {
    type: string
    label: "Grupo da Instituição"
    sql: ${TABLE}."GRUPO_IES" ;;
  }

  dimension: janeiro {
    type: number
    group_label: "Meta"
    label: "Janeiro"
    sql: ${TABLE}."JANEIRO" ;;
  }

  dimension: fevereiro {
    type: number
    group_label: "Meta"
    label: "Fevereiro"
    sql: ${TABLE}."FEVEREIRO" ;;
  }

  dimension: marco {
    type: number
    group_label: "Meta"
    label: "JMarço"
    sql: ${TABLE}."MARCO" ;;
  }

  dimension: abril {
    type: number
    group_label: "Meta"
    label: "Abril"
    sql: ${TABLE}."ABRIL" ;;
  }

  dimension: maio {
    type: number
    group_label: "Meta"
    label: "Maio"
    sql: ${TABLE}."MAIO" ;;
  }

  dimension: junho {
    type: number
    group_label: "Meta"
    label: "Junho"
    sql: ${TABLE}."JUNHO" ;;
  }

  dimension: julho {
    type: number
    group_label: "Meta"
    label: "Julho"
    sql: ${TABLE}."JULHO" ;;
  }

  dimension: agosto {
    type: number
    group_label: "Meta"
    label: "Agosto"
    sql: ${TABLE}."AGOSTO" ;;
  }

  dimension: setembro {
    type: number
    group_label: "Meta"
    label: "Setembro"
    sql: ${TABLE}."SETEMBRO" ;;
  }

  dimension: outubro {
    type: number
    group_label: "Meta"
    label: "Outubro"
    sql: ${TABLE}."OUTUBRO" ;;
  }

  dimension: novembro {
    type: number
    group_label: "Meta"
    label: "Novembro"
    sql: ${TABLE}."NOVEMBRO" ;;
  }

  dimension: dezembro {
    type: number
    group_label: "Meta"
    label: "Dezembro"
    sql: ${TABLE}."DEZEMBRO" ;;
  }

  set: detail {
    fields: [
      grupo_ies,
      janeiro,
      fevereiro,
      marco,
      abril,
      maio,
      junho,
      julho,
      agosto,
      setembro,
      outubro,
      novembro,
      dezembro
    ]
  }
}
