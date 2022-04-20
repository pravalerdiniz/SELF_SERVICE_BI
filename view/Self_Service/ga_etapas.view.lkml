view: ga_etapas {
    derived_table: {
      persist_for: "1 hour"
      sql: select a.date,
          f.key as chave,
          f.value:FINALIZADO::int as FINALIZADO,
          f.value:INICIADO::int as INICIADO,
          f.value:LEAD::int as LEAD,
          f.value:SIMULADO::int as SIMULADO
          from GRADUADO.SELF_SERVICE_BI.GOOGLE_ANALYTICS a,
          lateral flatten (input => ETAPAS) f
       ;;
    }

    dimension: chave {
      type: string
      sql: concat(${TABLE}."chave",${date_date}) ;;
      primary_key: yes
      hidden: yes
    }

    dimension_group: date {
      type: time
      timeframes: [ week_of_year,
        raw,
        date,
        week,
        month,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      sql: ${TABLE}."DATE" ;;
      label: "Data da sessão"
      description: "Data considerada para análise do site"
      hidden: yes
    }

    measure: total_lead {
      type: sum
      label: "1. Soma Leads"
      description: "Soma total da etapa Lead no site."
      sql: ${TABLE}."LEAD" ;;
      group_label: "Etapas"
    }

    measure: total_simulado {
      type: sum
      label: "2. Soma Simulados"
      description: "Soma total da etapa Simulado no site."
      sql: ${TABLE}."SIMULADO" ;;
      group_label: "Etapas"
    }

    measure: total_iniciado {
      type: sum
      label: "3. Soma Iniciados"
      description: "Soma total da etapa Iniciado no site."
      sql: ${TABLE}."INICIADO" ;;
      group_label: "Etapas"
    }

    measure: total_finalizado {
      type: sum
      label: "4. Soma Finalizados"
      description: "Soma total da etapa Finalizado no site."
      sql: ${TABLE}."FINALIZADO" ;;
      group_label: "Etapas"
    }

  measure: media_lead {
    type: average
    label: "1. Média Leads"
    description: "Soma total da etapa Lead no site."
    sql: ${TABLE}."LEAD" ;;
    group_label: "Etapas | Média"
  }

  measure: media_simulado {
    type: average
    label: "2. Média Simulados"
    description: "Soma total da etapa Simulado no site."
    sql: ${TABLE}."SIMULADO" ;;
    group_label: "Etapas | Média"
  }

  measure: media_iniciado {
    type: average
    label: "3. Média Iniciados"
    description: "Soma total da etapa Iniciado no site."
    sql: ${TABLE}."INICIADO" ;;
    group_label: "Etapas | Média"
  }

  measure: media_finalizado {
    type: average
    label: "4. Média Finalizados"
    description: "Soma total da etapa Finalizado no site."
    sql: ${TABLE}."FINALIZADO" ;;
    group_label: "Etapas | Média"
  }

  }
