view: instituicao_metas_gc {
    derived_table: {
      persist_for: "24 hours"
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
                    CEDIDOS_ORCAMENTO,
                    META_INICIADOS_HISTORICO,
                    META_CEDIDOS_HISTORICO,
                    META_FINALIZADOS,
                    HISTORICO_FINALIZADOS,
                    LEAD,
                    SIMULADO,
                    AGUARDANDO_DOCUMENTO,
                    AGUARDANDO_ASSINATURA
                   from VETERANO.DIMENSAO.DIM_META_GC
 ;;
    }

  dimension: meta_iniciado_historico{
    type: number
    label: "Metas Iniciados -  Histórico"
    sql: ${TABLE}."META_INICIADOS_HISTORICO" ;;
    hidden: yes
  }

  dimension: meta_cedido_historico{
    type: number
    label: "Metas Cedidos -  Histórico"
    sql: ${TABLE}."META_CEDIDOS_HISTORICO" ;;
    hidden: yes
  }

  dimension: meta_finalizado_historico{
    type: number
    label: "Metas Finalizado -  Histórico"
    sql: ${TABLE}."HISTORICO_FINALIZADOS" ;;
    hidden: yes
  }

  dimension: meta_finalizado{
    type: number
    label: "Metas Finalizado -  Orçamento"
    sql: ${TABLE}."META_FINALIZADOS" ;;
    hidden: yes
  }

  dimension: iniciados_orcamento{
    type: number
    label: "Iniciados Orçamento"
    sql: ${TABLE}."INICIADOS_ORCAMENTO" ;;
    hidden: yes
  }

  dimension: cedidos_orcamento{
    type: number
    label: "Cedidos Orçamento"
    sql: ${TABLE}."CEDIDOS_ORCAMENTO" ;;
    hidden: yes
  }

  dimension: lead{
    type: number
    label: "Lead"
    sql: ${TABLE}."LEAD" ;;
    hidden: yes
  }

  dimension: simulado{
    type: number
    label: "Simulado"
    sql: ${TABLE}."SIMULADO" ;;
    hidden: yes
  }

  dimension: aguardando_documento{
    type: number
    label: "Aguardando Documento"
    sql: ${TABLE}."AGUARDANDO_DOCUMENTO" ;;
    hidden: yes
  }

  dimension: aguardando_assinatura{
    type: number
    label: "Aguardando Assinatura"
    sql: ${TABLE}."AGUARDANDO_ASSINATURA" ;;
    hidden: yes
  }

    measure: count {
      type: count
      drill_fields: [detail*]
      hidden: yes
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
      day_of_week,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year,
      day_of_month,
    ]
    convert_tz: no
    datatype: date
    label: "Meta"
    description: "Indica a data da meta."
    sql: ${TABLE}."DATA" ;;
  }

  dimension: ytd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "YTD"
    type: yesno
    sql:  (EXTRACT(DOY FROM ${data_meta_raw}) < EXTRACT(DOY FROM GETDATE())
                OR
            (EXTRACT(DOY FROM ${data_meta_raw}) = EXTRACT(DOY FROM GETDATE())))  ;;
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
      hidden: yes
    }

    dimension: aprovados_risco {
      type: number
      label: "Aprovados Risco"
      #value_format: "0.00%"
      sql: ${TABLE}."APROVADOS_RISCO" ;;
      hidden: yes
    }

    dimension: finalizados {
      type: number
      label: "Finalizados"
      #value_format: "0.00%"
      sql: ${TABLE}."FINALIZADOS" ;;
      hidden: yes
    }

    dimension: aprovados_ies {
      type: number
      label: "Aprovados IES"
      #value_format: "0.00%"
      sql: ${TABLE}."APROVADOS_IES" ;;
      hidden: yes
    }

    dimension: gerados {
      type: number
      label: "Gerados"
      value_format: "0.00%"
      sql: ${TABLE}."GERADOS" ;;
      hidden: yes
    }

    dimension: cedidos {
      type: number
      label: "Cedidos"
      sql: ${TABLE}."CEDIDOS" ;;
      hidden: yes
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

    ## Métricas #######################################

# Formalizado
  measure: min_cedidos {
    type: min
    label: "Minimo Formalizado"
    group_label: "Meta Formalizado"
    sql: ${cedidos} ;;
  }
  measure: max_cedidos {
    type: max
    label: "Máximo Formalizado"
    group_label: "Meta Formalizado"
    sql: ${cedidos} ;;
  }
  measure: avg_cedidos {
    type: average
    label: "Média Formalizado"
    group_label: "Meta Formalizado"
    sql: ${cedidos} ;;
  }
 measure:sum_cedidos {
    type: sum
    label: "Soma Formalizado"
    group_label: "Meta Formalizado"
    sql: ${cedidos} ;;
    }

# Gerado
  measure: min_gerados {
    type: min
    label: "Minimo"
    value_format: "0.00%"
    group_label: "Gerados"
    sql: ${gerados} ;;
    hidden: yes
  }
  measure: max_gerados {
    type: max
    label: "Máximo"
    group_label: "Gerados"
    value_format: "0.00%"
    sql: ${gerados} ;;
    hidden: yes
  }
  measure: sum_gerados {
    type: sum
    label: "Soma"
    group_label: "Gerados"
    value_format: "0.00%"
    sql: ${gerados} ;;
    hidden: yes
  }
  measure: avg_gerados {
    type: average
    label: "Média"
    group_label: "Gerados"
    value_format: "0.00%"
    sql: ${gerados} ;;
    hidden: yes
  }

#Finalizado
  measure:soma_finalizados {
    type: sum
    label: "Soma"
    group_label: "Finalizados"
    value_format: "0.00%"
    sql: ${finalizados} ;;
    hidden: yes
  }
  measure: min_finalizados {
    type: min
    label: "Minimo"
    group_label: "Finalizados"
    value_format: "0.00%"
    sql: ${finalizados} ;;
    hidden: yes
  }
  measure: max_finalizados {
    type: max
    label: "Máximo"
    group_label: "Finalizados"
    value_format: "0.00%"
    sql: ${finalizados} ;;
    hidden: yes
  }
  measure: avg_finalizados {
    type:average
    label: "Média"
    group_label: "Finalizados"
    value_format: "0.00%"
    sql: ${finalizados} ;;
    hidden: yes
  }
    measure:sum_finalizado_historico {
    type: sum
    label: "Soma Finalizado"
    group_label: "Meta Finalizado"
    description: "Indica a soma da meta da quantidade de finalizados histórico."
    sql: ${meta_finalizado_historico} ;;
  }
  measure: min_finalizado {
    type: min
    label: "Minimo Finalizado"
    group_label: "Meta Finalizado"
    sql: ${meta_finalizado_historico} ;;
  }
  measure: max_finalizado {
    type: max
    label: "Máximo Finalizado"
    group_label: "Meta Finalizado"
    sql: ${meta_finalizado_historico} ;;
  }
  measure: avg_finalizado {
    type: average
    label: "Média Finalizado"
    group_label: "Meta Finalizado"
    sql: ${meta_finalizado_historico} ;;
  }
measure:sum_finalizado {
    type: sum
    label: "Soma - Orçamento"
    group_label: "Finalizados"
    description: "Indica a soma da meta da quantidade de finalizados"
    sql: ${meta_finalizado} ;;
    hidden: yes
  }

#Aprovado Risco
  measure:sum_aprovados_risco {
    type:sum
    label: "Soma Aprovado Risco"
    group_label: "Meta Aprovado Risco"
    #value_format: "0.00%"
    sql: ${aprovados_risco} ;;
  }
  measure: min_aprovados_risco {
    type:min
    label: "Minimo Aprovado Risco"
    group_label: "Aprovados Risco"
    #value_format: "0.00%"
    sql: ${aprovados_risco} ;;
  }
 measure: max_aprovados_risco {
    type:max
    label: "Máximo Aprovado Risco"
    group_label: "Aprovados Risco"
    #value_format: "0.00%"
    sql: ${aprovados_risco} ;;
  }
measure:avg_aprovados_risco {
    type: average
    label: "Média Aprovado Risco"
    group_label: "Aprovados Risco"
    #value_format: "0.00%"
    sql: ${aprovados_risco} ;;
  }

#Aprovado IES
  measure:sum_aprovados_ies {
    type:sum
    label: "Soma Aprovado Instituição"
    group_label: "Aprovado Instituição"
    #value_format: "0.00%"
    sql: ${aprovados_ies} ;;
  }
  measure: min_aprovados_ies {
    type: min
    label: "Mínimo Aprovado Instituição"
    group_label: "Aprovado Instituição"
    #value_format: "0.00%"
    sql: ${aprovados_ies} ;;
  }
  measure: max_aprovados_ies {
    type: max
    label: "Máximo Aprovado Instituição"
    group_label: "Aprovado Instituição"
    #value_format: "0.00%"
    sql: ${aprovados_ies} ;;
  }
  measure: avg_aprovados_ies {
    type: average
    label: "Média Aprovado Instituição"
    group_label: "Aprovado Instituição"
    #value_format: "0.00%"
    sql: ${aprovados_ies} ;;
  }

#Iniciados
  measure:sum_iniciados {
    type:sum
    label: "Soma Iniciado"
    group_label: "Iniciado"
    sql: ${iniciados} ;;
  }
  measure: min_iniciados {
    type: min
    label: "Minimo Iniciado"
    group_label: "Iniciado"
    sql: ${iniciados} ;;
  }
  measure: max_iniciados {
    type: max
    label: "Máximo Iniciado"
    group_label: "Iniciado"
    sql: ${iniciados} ;;
  }
  measure:avg_iniciados {
    type:average
    label: "Média Iniciado"
    group_label: "Iniciado"
    sql: ${iniciados} ;;
  }
  measure:sum_iniciados_orcamento {
    type:sum
    label: "Soma - Orçamento"
    group_label: "Iniciados"
    sql: ${iniciados_orcamento} ;;
    hidden: yes
  }
  measure:sum_meta_iniciados {
    type:sum
    label: "Soma - Histórico"
    group_label: "Iniciados"
    sql: ${meta_iniciado_historico} ;;
    hidden: yes
  }
  measure: min_iniciados_orcamento {
    type: min
    label: "Minimo - Orçamento"
    group_label: "Iniciados"
    sql: ${iniciados_orcamento} ;;
    hidden: yes
  }
  measure: max_iniciados_orcamento {
    type: max
    label: "Máximo - Orçamento"
    group_label: "Iniciados"
    sql: ${iniciados_orcamento} ;;
    hidden: yes
  }
  measure:avg_iniciados_orcamento {
    type:average
    label: "Média - Orçamento"
    group_label: "Iniciados"
    sql: ${iniciados_orcamento} ;;
    hidden: yes
  }

# Cedidos
  measure: min_cedidos_orcamento {
    type: min
    label: "Minimo - Orçamento"
    group_label: "Cedidos"
    sql: ${cedidos_orcamento} ;;
    hidden: yes
  }

  measure: max_cedidos_orcamento {
    type: max
    label: "Máximo - Orçamento"
    group_label: "Cedidos"
    sql: ${cedidos_orcamento} ;;
    hidden: yes
  }


  measure: avg_cedidos_orcamento {
    type: average
    label: "Média - Orçamento"
    group_label: "Cedidos"
    sql: ${cedidos_orcamento} ;;
    hidden: yes
  }

  measure:sum_cedidos_orcamento {
    type: sum
    label: "Soma - Orçamento"
    group_label: "Cedidos"
    sql: ${cedidos_orcamento} ;;
    hidden: yes
  }

  measure:sum_cedidos_historico {
    type: sum
    label: "Soma - Histórico"
    group_label: "Cedidos"
    sql: ${meta_cedido_historico} ;;
    hidden: yes
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
        lead,
        simulado,
        aguardando_documento,
        aguardando_assinatura,
        regional,
        ano,
        mes
      ]
    }
  }
