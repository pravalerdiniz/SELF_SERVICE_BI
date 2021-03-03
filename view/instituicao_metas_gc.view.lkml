view: instituicao_metas_gc {
    derived_table: {
      sql: select
           concat(grupo,data) grupo_ies_ano_mes,
           grupo grupo_instituicao,
             INICIADOS,
            APROVADOS_RISCO,
             FINALIZADOS,
                APROVADOS_IES,
                 GERADOS,
                  CEDIDOS,
                  REGIONAL,
                   ANO,
                    MES,
                   DIA,
                  GERENTE,
                    DATA,
                    INICIADOS_ORCAMENTO,
                    CEDIDOS_ORCAMENTO
                   from VETERANO.DIMENSAO.DIM_META_GC
 ;;
    }

  dimension: iniciados_orcamento{
    type: number
    label: "Iniciados Orçamento"
    sql: ${TABLE}."INICIADOS_ORCAMENTO" ;;
  }

  dimension: cedidos_orcamento{
    type: number
    label: "Cedidos Orçamento"
    sql: ${TABLE}."CEDIDOS_ORCAMENTO" ;;
  }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: grupo_ies_ano_mes {
      type: string
      label: "Grupo da Instituição - Meta"
      primary_key: yes
      hidden: yes
      sql: ${TABLE}."GRUPO_IES_ANO_MES" ;;
    }






  dimension: grupo_instituicao {
    type: string
    label: "Grupo da Instituição - Meta"
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
  }


  dimension_group: data_meta {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Meta"
    description: "Indica a data da meta."
    sql: ${TABLE}."DATA" ;;
  }

  dimension: dia{
    type: number
    label: "Dia"
    sql: ${TABLE}."DIA" ;;
  }


  dimension: gerente{
    type: string
    label: "Gerente"
    sql: ${TABLE}."GERENTE" ;;
  }







    dimension: iniciados {
      type: number
      label: "Iniciados"
      sql: ${TABLE}."INICIADOS" ;;
    }

    dimension: aprovados_risco {
      type: number
      label: "Aprovados Risco"
      value_format: "0.00%"
      sql: ${TABLE}."APROVADOS_RISCO" ;;
    }

    dimension: finalizados {
      type: number
      label: "Finalizados"
      value_format: "0.00%"
      sql: ${TABLE}."FINALIZADOS" ;;
    }

    dimension: aprovados_ies {
      type: number
      label: "Aprovados IES"
      value_format: "0.00%"
      sql: ${TABLE}."APROVADOS_IES" ;;
    }

    dimension: gerados {
      type: number
      label: "Gerados"
      value_format: "0.00%"
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








    measure:sum_cedidos {
    type: sum
    label: "Soma"
    group_label: "Cedidos"
    sql: ${cedidos} ;;

    }

  measure: min_gerados {
    type: min
    label: "Minimo"
    value_format: "0.00%"
    group_label: "Gerados"
    sql: ${gerados} ;;

  }

  measure: max_gerados {
    type: max
    label: "Máximo"
    group_label: "Gerados"
    value_format: "0.00%"
    sql: ${gerados} ;;

  }



  measure: sum_gerados {
    type: sum
    label: "Soma"
    group_label: "Gerados"
    value_format: "0.00%"
    sql: ${gerados} ;;

  }

  measure: avg_gerados {
    type: average
    label: "Média"
    group_label: "Gerados"
    value_format: "0.00%"
    sql: ${gerados} ;;

  }


  measure:soma_finalizados {
    type: sum
    label: "Soma"
    group_label: "Finalizados"
    value_format: "0.00%"
    sql: ${finalizados} ;;

  }

  measure: min_finalizados {
    type: min
    label: "Minimo"
    group_label: "Finalizados"
    value_format: "0.00%"
    sql: ${finalizados} ;;

  }

  measure: max_finalizados {
    type: max
    label: "Máximo"
    group_label: "Finalizados"
    value_format: "0.00%"
    sql: ${finalizados} ;;

  }


  measure: avg_finalizados {
    type:average
    label: "Média"
    group_label: "Finalizados"
    value_format: "0.00%"
    sql: ${finalizados} ;;

  }


  measure:sum_aprovados_risco {
    type:sum
    label: "Soma"
    group_label: "Aprovados Risco"
    value_format: "0.00%"
    sql: ${aprovados_risco} ;;

  }

  measure: min_aprovados_risco {
    type:min
    label: "Minimo"
    group_label: "Aprovados Risco"
    value_format: "0.00%"
    sql: ${aprovados_risco} ;;

  }

  measure: max_aprovados_risco {
    type:max
    label: "Máximo"
    group_label: "Aprovados Risco"
    value_format: "0.00%"
    sql: ${aprovados_risco} ;;

  }


  measure:avg_aprovados_risco {
    type: average
    label: "Média"
    group_label: "Aprovados Risco"
    value_format: "0.00%"
    sql: ${aprovados_risco} ;;

  }


  measure:sum_aprovados_ies {
    type:sum
    label: "Soma"
    group_label: "Aprovados Instituição"
    value_format: "0.00%"
    sql: ${aprovados_ies} ;;

  }

  measure: min_aprovados_ies {
    type: min
    label: "Minimo"
    group_label: "Aprovados Instituição"
    value_format: "0.00%"
    sql: ${aprovados_ies} ;;

  }

  measure: max_aprovados_ies {
    type: max
    label: "Máximo"
    group_label: "Aprovados Instituição"
    value_format: "0.00%"
    sql: ${aprovados_ies} ;;

  }


  measure: avg_aprovados_ies {
    type: average
    label: "Média"
    group_label: "Aprovados Instituição"
    value_format: "0.00%"
    sql: ${aprovados_ies} ;;

  }

  measure:sum_iniciados {
    type:sum
    label: "Soma"
    group_label: "Iniciados"
    sql: ${iniciados} ;;

  }

  measure: min_iniciados {
    type: min
    label: "Minimo"
    group_label: "Iniciados"
    sql: ${iniciados} ;;

  }

  measure: max_iniciados {
    type: max
    label: "Máximo"
    group_label: "Iniciados"
    sql: ${iniciados} ;;

  }


  measure:avg_iniciados {
    type:average
    label: "Média"
    group_label: "Iniciados"
    sql: ${iniciados} ;;

  }










    set: detail {
      fields: [
        grupo_instituicao,
        grupo_ies_ano_mes,
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
