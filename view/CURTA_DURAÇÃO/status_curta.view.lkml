view: status_curta {
  sql_table_name: "VETERANO"."CURTA"."STATUS"
    ;;

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
    description: "DATA DE ACONTECIMENTO DO EVENTO"
    label: "Evento"
  }

  dimension: flg_ultimo_status {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_STATUS" ;;
    description: "INFORMA SE É O ULTIMO STATUS DO ALUNO"
    group_item_label: "É o Ultimo Status?"
  }

  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;
    description: "IDENTIFICADOR DO ALUNO"
    group_item_label: "Id do Aluno"
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
    description: "IDENTIFICADOR ÚNICO DO CURSO"
    group_item_label: "Id do Curso"
  }

  dimension: id_evento {
    type: string
    sql: ${TABLE}."ID_EVENTO" ;;
    description: "IDENTIFICADOR ÚNICO DO EVENTO"
    group_item_label: "Id do Evento"
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    description: "IDENTIFICAR DA INSTITUICAO"
    group_item_label: "Id da Instituição"
  }

  dimension: id_status {
    type: string
    sql: ${TABLE}."ID_STATUS" ;;
    description: "IDENTIFICADOR DO REGISTRO NA TABELA DE STATUS"
    primary_key: yes
    group_item_label: "Id do Status"
  }

  dimension: num_contrato {
    type: string
    sql: ${TABLE}."NUM_CONTRATO" ;;
    description: "NUMERO DO CONTRATO"
    group_item_label: "Numero do Contrato"
  }

  dimension: objeto {
    type: string
    sql: ${TABLE}."OBJETO" ;;
    description: "COMPILADO DE INFOMRAÇÕES INERENTES A CADA EVENTO"
    group_item_label: "Objeto com Informações Diversas"
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}."TIPO_EVENTO" ;;
    description: "DESCRIÇÃO DO EVENTO"
    group_item_label: "Tipo de Evento"
  }


  dimension: etapa {
    type: string
    sql: CASE WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.ACQUIRED' THEN 'Lead'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.RISK.APPROVED' THEN 'Aprovado Risco'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.WAITINGSIGNATURE' THEN 'Documentos Aprovados'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.SIGNATUREFINISHED' THEN 'Contrato Assinado'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.DISBURSED' THEN 'Cedido'
              ELSE NULL END
              ;;
    description: "Indica a etapa da jornada que o aluno do curta se encontra"
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
        sql: ${etapa} = 'Documentos Aprovados' ;;
        label: "3"
      }
      when: {
        sql: ${etapa} = 'Contrato Assinado' ;;
        label: "4"
      }

      when: {
        sql: ${etapa} = 'Cedido' ;;
        label: "5"
      }
      else: "0"
    }
    hidden: yes
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
    description: "DATA DA ULTIMA ATUALIZAÇÃO DO REGISTRO"
    label: "Ultima Atualização"
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  measure: total_alunos {
    type: count_distinct
    sql: ${id_aluno} ;;
    group_item_label: "Total de Alunos"
  }

  measure: total_contratos {
    type: count_distinct
    sql: ${num_contrato} ;;
    group_item_label: "Total de Contratos"
  }
}
