view: jornada_interacoes_social {
    derived_table: {
      persist_for: "1 hour"
      sql: select
            id_cpf,
            f.key as chave_unica,
            f.value:DT_INICIO_IMPACTO::date as DT_INICIO_IMPACTO,
            f.value:DT_FINAL_IMPACTO::date as DT_FINAL_IMPACTO,
            f.value:CANAL::varchar as CANAL
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
            lateral flatten (input => interacoes_crm_por_canal) f
            where f.value:CANAL = 'SOCIAL'
 ;;
    }

    dimension: id_cpf {
      type: number
      primary_key: yes
      label: "ID CPF"
      description: "Indica o ID do CPF do aluno"
      hidden: yes
      sql: ${TABLE}."ID_CPF" ;;
    }

    dimension_group: dt_inicio_impacto {
      type: time
      timeframes: [
        raw,
        date,
        week,
        month,
        month_name,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      hidden: yes
      sql: ${TABLE}."DT_INICIO_IMPACTO" ;;
    }

    dimension_group: dt_final_impacto {
      type: time
      timeframes: [
        raw,
        date,
        week,
        month,
        month_name,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      hidden: yes
      sql: ${TABLE}."DT_FINAL_IMPACTO" ;;
    }

    dimension: dt_status_etapa {
      type: date
      sql:${jornada.dt_status_date}  ;;
      hidden: yes
    }

    dimension:  flag_social{
      type:  yesno
      sql: ${dt_status_etapa} >= ${dt_inicio_impacto_date}
        and ${dt_status_etapa} <= ${dt_final_impacto_date} ;;
        label: "Flag de Impacto - Canal Social"
        description: "Flag que aponta se o aluno teve impacto do canal Social na jornada nos últimos 180 dias"
    }

  }
