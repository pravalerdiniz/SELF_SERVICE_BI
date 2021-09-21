view: curta_lead_time {
    derived_table: {
      sql: select *,
              datediff(second,data_evento_anterior,DATA_EVENTO) as TEMPO_ETAPA
              from (
              SELECT
              ID_STATUS,
              ID_ALUNO,
              TIPO_EVENTO,
              DATA_EVENTO,
              lag(data_evento,1)
              over(partition by id_aluno order by data_evento)
              as data_evento_anterior
              FROM  "VETERANO"."CURTA"."STATUS"
              where TIPO_EVENTO in ('STUDENT.ACQUIRED','STUDENT.RISK.APPROVED','STUDENT.DOCS.RECEIVEDALL','STUDENT.CONTRACT.CREATED','STUDENT.CONTRACT.SIGNATUREFINISHED', 'STUDENT.CONTRACT.DISBURSED', 'STUDENT.CONTRACT.CANCELED')
                 --qualify row_number() over(partition by id_aluno order by id_aluno) = 1
                    order by data_evento
              ) a
               ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: ID_STATUS
    {
      type: string
      sql: ${TABLE}."ID_STATUS" ;;
      primary_key: yes
      hidden: yes
    }


    dimension: id_aluno {
      type: string
      hidden: yes
      sql: ${TABLE}."ID_ALUNO" ;;
    }

    dimension: tipo_evento {
      type: string
      hidden: yes
      sql: ${TABLE}."TIPO_EVENTO" ;;
    }

    dimension_group: data_evento {
      type: time
      hidden: yes
      sql: ${TABLE}."DATA_EVENTO" ;;
    }

    dimension_group: data_evento_anterior {
      type: time
      hidden: yes
      sql: ${TABLE}."DATA_EVENTO_ANTERIOR" ;;
    }

    dimension: TEMPO_ETAPA {
      type: number
      hidden: yes
      label: "TEMPO ETAPA"
      sql: ${TABLE}."TEMPO_ETAPA" ;;
    }

    measure: average_tempo_etapa {
      type: average
      group_label: "Tempo"
      label: "Média"
      hidden: yes
      value_format: "[hh]:mm:ss"
      sql: ${TEMPO_ETAPA}/86400.0 ;;



    }

  measure: mediana_tempo_etapa {
    type: average
    group_label: "Tempo"
    label: "Mediana"
    hidden: yes
    value_format: "[hh]:mm:ss"
    sql: ${TEMPO_ETAPA}/86400.0 ;;


  }

    set: detail {
      fields: [id_aluno, tipo_evento, data_evento_time, data_evento_anterior_time, TEMPO_ETAPA]
    }
  }
