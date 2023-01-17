# The name of this view in Looker is "Status"
view: status_intercambio {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."INTERCAMBIO"."STATUS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_evento {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_EVENTO" ;;
  }

  dimension_group: dt_inicio {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DT_INICIO" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Flg Ultimo Status" in Explore.

  dimension: flg_ultimo_status {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_STATUS" ;;
  }

  dimension: id_aluno {
    label: "id_garantidor"
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_evento {
    type: string
    sql: ${TABLE}."ID_EVENTO" ;;
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_status {
    type: string
    sql: ${TABLE}."ID_STATUS" ;;
  }

  dimension: journey_status {
    type: string
    sql: ${TABLE}."JOURNEY_STATUS" ;;
  }

  dimension: num_contrato {
    type: string
    sql: ${TABLE}."NUM_CONTRATO" ;;
  }

  dimension: objeto {
    type: string
    sql: ${TABLE}."OBJETO" ;;
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}."TIPO_EVENTO" ;;
  }

  dimension_group: ultima_atualizacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ULTIMA_ATUALIZACAO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: etapa {
    type: string
    sql: CASE WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CREATED' THEN 'Lead'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.RISK.APPROVED' THEN 'Aprovado Risco'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.IDENTIFICATION.PROCESSING' THEN 'Biometria - Análise Iniciada'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.IDENTIFICATION.APPROVED' THEN 'Biometria - Aprovada'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.IDENTIFICATION.REPROVED' THEN 'Biometria Reprovada'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.IDENTIFICATION.PENDING' THEN 'Biometria Pendente'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.ACQUIRED' THEN 'Cadastro Completo'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.DOCS.RECEIVEDALL' THEN 'Documentos Recebidos'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.DOCS.APPROVED' THEN 'Documentos Aprovados'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.DOCUMENTS.WRONG' THEN 'Documentos Reprovados'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.RISK.INCOMEAPPROVED' OR
              ${TABLE}."TIPO_EVENTO" = 'STUDENT.INCOME.APPROVED'
              THEN 'Aprovado Risco (Renda)'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.WAITINGSIGNATURE' THEN 'Aguardando Assinatura'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.SIGNATUREFINISHED' OR
               ${TABLE}."TIPO_EVENTO" = 'MANAGEMENT.CONTRACT.SIGNED'
              THEN 'Contrato Assinado'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.DISBURSED' THEN 'Cedido'

      ELSE NULL END
      ;;
    description: "Indica as etapas da jornada de contratação do aluno do curta duração"
    group_item_label: "Etapa"
    order_by_field: ordem_etapa
  }



  dimension: ordem_etapa {
    type: number
    group_label: "Dados da Etapa"
    label: "Ordem - Etapa"
    description: "Indica a ordem correta por etapa do funil. "
    hidden: yes
    sql: CAST(${ordem_etapa_funil} AS INT) ;;

  }




  dimension: ordem_etapa_funil {
    type: string
    case: {
      when: {
        sql: ${etapa} = 'Lead' ;;
        label: "1"
      }
      when: {
        sql: ${etapa} = 'Aprovado Risco' ;;
        label: "2"
      }
      when: {
        sql: ${etapa} = 'Biometria - Análise Iniciada' ;;
        label: "3"
      }

      when: {
        sql: ${etapa} = 'Biometria - Aprovada' ;;
        label: "4"
      }

      when: {
        sql: ${etapa} = 'Cadastro Completo' ;;
        label: "5"
      }

      when: {
        sql: ${etapa} = 'Documentos Recebidos' ;;
        label: "6"
      }
      when: {
        sql: ${etapa} = 'Documentos Aprovados' ;;
        label: "7"
      }
      when: {
        sql: ${etapa} = 'Aprovado Risco (Renda)' ;;
        label: "9"
      }

      when: {
        sql: ${etapa} = 'Aguardando Assinatura' ;;
        label: "10"
      }
      when: {
        sql: ${etapa} = 'Contrato Assinado' ;;
        label: "11"
      }

      when: {
        sql: ${etapa} = 'Cedido' ;;
        label: "12"
      }
      else: "0"
    }
    hidden: yes
  }

}
