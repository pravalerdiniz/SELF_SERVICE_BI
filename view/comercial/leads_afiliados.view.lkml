view: leads_afiliados {
    sql_table_name: GRADUADO.BALCAO_AFILIADOS.LEADS
      ;;

    dimension: ID_CANAL {
      type: number
      label: "Código Canal"
      sql: ${TABLE}."ID_CANAL" ;;
      group_label: "Dados Leads Afiliados"
    }


    dimension: CPF_LEAD {
      type: number
      label: "CPF Lead"
      sql: ${TABLE}."CPF_LEAD" ;;
      group_label: "Dados Leads Afiliados"
    }

    measure: count_cpf {
      type: count_distinct
      sql: ${CPF_LEAD} ;;
      label: "Quantidade leads afiliados"
      group_label: "Métricas"
    }

    dimension: ID_LEAD_CANAL_ORIGEM {
      type: string
      label: "Código Canal Origem"
      sql: ${TABLE}."ID_LEAD_CANAL_ORIGEM" ;;
      group_label: "Dados Leads Afiliados"
    }

    dimension_group: dt_alteracao_registro {
      type: time
      timeframes: [
        raw,
        time,
        date,
        day_of_week,
        week,
        month,
        quarter,
        year,
        time_of_day,
        month_name,
        day_of_year,
        hour_of_day,
        month_num,
        day_of_month
      ]
      sql: ${TABLE}."DT_ALTERACAO_REGISTRO" ;;
      label: "Alteração registro"
    }

    dimension_group: dt_carga {
      type: time
      timeframes: [
        raw,
        time,
        date,
        day_of_week,
        week,
        month,
        quarter,
        year,
        time_of_day,
        month_name,
        day_of_year,
        hour_of_day,
        month_num,
        day_of_month
      ]
      sql: ${TABLE}."DT_CARGA" ;;
      label: "Carga"
    }

    dimension_group: dt_inclusao_registro {
      type: time
      timeframes: [
        raw,
        time,
        date,
        day_of_week,
        week,
        month,
        quarter,
        year,
        time_of_day,
        month_name,
        day_of_year,
        hour_of_day,
        month_num,
        day_of_month
      ]
      sql: ${TABLE}."DT_INCLUSAO_REGISTRO" ;;
      label: "Inclusão"
    }

    dimension: FLG_VERIFICACAO_PRV_PROPOSTA {
      type: yesno
      label: "Flag verificação proposta"
      sql: ${TABLE}."FLG_VERIFICACAO_PRV_PROPOSTA" ;;
      group_label: "Dados Leads Afiliados"
    }

    dimension: nr_gerado_prv_proposta {
      type: number
      label: "Número gerado Proposta"
      sql: ${TABLE}."NR_GERADO_PRV_PROPOSTA" ;;
      group_label: "Dados Leads Afiliados"
    }

    dimension: nr_proposta_canal_origem {
      type: number
      label: "Número Proposta Canal Origem"
      sql: ${TABLE}."NR_PROPOSTA_CANAL_ORIGEM" ;;
      group_label: "Dados Leads Afiliados"
    }

    }
