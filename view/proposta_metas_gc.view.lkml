view: proposta_metas_gc {
    derived_table: {
      sql: select
            f.key as grupo_ies,
            f.value:INICIADOS::float as INICIADOS,
             f.value:APROVADOS_RISCO::float as APROVADOS_RISCO,
              f.value:FINALIZADOS::float as FINALIZADOS,
               f.value:APROVADOS_IES::float as APROVADOS_IES,
                f.value:GERADOS::float as GERADOS,
                 f.value:CEDIDOS::float as CEDIDOS,
                  f.value:REGIONAL::varchar as REGIONAL,
                   f.value:ANO::int as ANO,
                   f.value:MES::varchar as MES
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

    dimension: iniciados {
      type: number
      label: "Iniciados"
      sql: ${TABLE}."INICIADOS" ;;
    }

    dimension: aprovados_risco {
      type: number
      label: "Aprovados Risco"
      sql: ${TABLE}."APROVADOS_RISCO" ;;
    }

    dimension: finalizados {
      type: number
      label: "Finalizados"
      sql: ${TABLE}."FINALIZADOS" ;;
    }

    dimension: aprovados_ies {
      type: number
      label: "Aprovados IES"
      sql: ${TABLE}."APROVADOS_IES" ;;
    }

    dimension: gerados {
      type: number
      label: "Gerados"
      sql: ${TABLE}."GERADOS" ;;
    }

    dimension: cedidos {
      type: number
      label: "Cedidos"
      sql: ${TABLE}."CEDIDOS" ;;
    }

    dimension: regional {
      type: string
      label: "Regional"
      sql: ${TABLE}."REGIONAL" ;;
    }

    dimension: ano {
      type: number
      label: "Ano"
      sql: ${TABLE}."ANO" ;;
    }

    dimension: mes {
      type: string
      label: "Mês"
      sql: ${TABLE}."MES" ;;
    }




  measure: min_cedidos {
    type: min
    label: "Minimo"
    group_label: "Cedidos"
    sql: ${cedidos} ;;

  }

  measure: max_cedidos {
    type: max
    label: "Máximo"
    group_label: "Cedidos"
    sql: ${cedidos} ;;

  }


  measure: avg_cedidos {
    type: average
    label: "Média"
    group_label: "Cedidos"
    sql: ${cedidos} ;;

  }








    measure: sum_cedidos {
     type: sum
     label: "Soma"
    group_label: "Cedidos"
    sql: ${cedidos} ;;

    }









    set: detail {
      fields: [
        grupo_ies,
        iniciados,
        aprovados_risco,
        finalizados,
        aprovados_ies,
        gerados,
        cedidos,
        regional,
        ano,
        mes
      ]
    }
  }
