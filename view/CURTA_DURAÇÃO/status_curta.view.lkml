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
      day_of_week,
      day_of_month,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_EVENTO" ;;
    description: "DATA DE ACONTECIMENTO DO EVENTO"
    label: "Evento"
  }

  dimension: wtd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "Week to Date - Data da Etapa"
    type: yesno
    sql:  (EXTRACT(DOW FROM ${data_evento_raw}) < EXTRACT(DOW FROM GETDATE())
                OR
          (EXTRACT(DOW FROM ${data_evento_raw}) = EXTRACT(DOW FROM GETDATE())))  ;;
    description:"Use esse campo em conjunto com o campo de Etapa, para realizar análises entre semanas diferentes usando como base o dia da semana da data corrente"
  }

  dimension: mtd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "Month to Date - Data da Etapa"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${data_evento_raw}) < EXTRACT(DAY FROM GETDATE())
                OR
          (EXTRACT(DAY FROM ${data_evento_raw}) = EXTRACT(DAY FROM GETDATE())))  ;;
    description: "Use esse campo em conjunto com o campo de Etapa, para realizar análises entre meses diferentes usando como base o dia do mês da data corrente."
  }





  dimension_group: data_inicio {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      day_of_week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DT_INICIO" ;;
    description: "DATA DE INICIO DO PROCESSO DE CONTRATAÇÃO DO ALUNO"
    label: "Inicio do Processo de Contratação"
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

  dimension: cpf_aluno {
    type: number
    sql: ${student.cpf_aluno} ;;
    group_item_label: "CPF Aluno"
    hidden: yes
  }

  dimension: nome_aluno {
    type: string
    sql: ${student.nome_aluno} ;;
    group_item_label: "Nome do Aluno"
    hidden: yes
  }

  dimension: nome_curso {
    type: string
    sql: ${student.nome_curso} ;;
    group_item_label: "Nome do Curso"
    hidden: yes
  }


  dimension: nome_fantasia_instituicao {
    type: string
    sql: ${student.nome_curso} ;;
    group_item_label: "Nome do Instituição"
    hidden: yes
  }


  dimension: flg_aluno_resp_fin {
    type: number
    sql: ${student.flg_aluno_resp_fin} ;;
    group_item_label: "Responsável Financeiro?"
    hidden: yes
  }


  dimension: telefone_aluno_1 {
    type: number
    sql: ${student.telefone_aluno_1} ;;
    group_item_label: "Telefone"
    hidden: yes
  }


















  dimension: etapa {
    type: string
    sql: CASE WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.ACQUIRED' THEN 'Lead'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.RISK.APPROVED' THEN 'Aprovado Risco'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.DOCS.RECEIVEDALL' THEN 'Documentos Recebidos'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.SIGNATUREFINISHED' THEN 'Contrato Assinado'
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
        sql: ${etapa} = 'Documentos Recebidos' ;;
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



  dimension: funil_completo {
    type: string
    sql: CASE WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.ACQUIRED' THEN 'Lead'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.RISK.APPROVED' THEN 'Aprovado Risco'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.RISK.DISAPPROVED' THEN 'Reprovado Risco'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.DOCS.RECEIVEDALL' THEN 'Documentos Recebidos'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.DOCS.APPROVED' THEN 'Documentos Aprovados'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.DOCUMENTS.WRONG' THEN 'Documentos Reprovados'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.CREATED' THEN 'Contrato Criado'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.WAITINGSIGNATURE' THEN 'Aguardando Assinatura'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.SIGNATUREFINISHED' THEN 'Contrato Assinado'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.DISBURSED' THEN 'Cedido'
              WHEN  ${TABLE}."TIPO_EVENTO" = 'STUDENT.CONTRACT.CANCELED' THEN 'Contrato Cancelado'
              ELSE NULL END
              ;;
    description: "Indica todas as etapas do funil de contratação do aluno. Seguindo a documentação 'Status Funil Completo' localizado no confluence."
    group_item_label: "Funil - Completo"
    order_by_field: ordem_funil_completo_regra
  }

  dimension: ordem_funil_completo_regra {
    type: number
    group_label: "Dados da Etapa"
    label: "Ordem - Funil Completo"
    description: "Indica a ordem correta por etapa do funil. "
    hidden: yes
    sql: CAST(${ordem_funil_completo} AS INT) ;;

  }



  dimension: ordem_funil_completo {
    type: string
    case: {
      when: {
        sql: ${funil_completo} = 'Lead' ;;
        label: "1"
      }
      when: {
        sql: ${funil_completo} = 'Aprovado Risco' ;;
        label: "2"
      }
      when: {
        sql: ${funil_completo} = 'Reprovado Risco' ;;
        label: "3"
      }
      when: {
        sql: ${funil_completo} = 'Documentos Recebidos' ;;
        label: "4"
      }
      when: {
        sql: ${funil_completo} = 'Documentos Aprovados' ;;
        label: "5"
      }
      when: {
        sql: ${funil_completo} = 'Documentos Reprovados' ;;
        label: "6"
      }
      when: {
        sql: ${funil_completo} = 'Contrato Criado' ;;
        label: "7"
      }
      when: {
        sql: ${funil_completo} = 'Aguardando Assinatura' ;;
        label: "8"
      }
      when: {
        sql: ${funil_completo} = 'Contrato Assinado' ;;
        label: "9"
      }

      when: {
        sql: ${funil_completo} = 'Cedido' ;;
        label: "10"
      }
      when: {
        sql: ${funil_completo} = 'Contrato Cancelado' ;;
        label: "11"
      }
      else: "0"
    }
    hidden: yes
  }



dimension: tempo_curta {
  type: number
  group_label: "Dados da Etapa"
  label: "Tempo - Minutos"
  sql: ${curta_lead_time.TEMPO_ETAPA}/60 ;;
  value_format: "hh:mm:ss"
}


  dimension: faixa_tempo_curta {
    type: string
    group_label: "Dados da Etapa"
    label: "Faixa de Tempo - Minutos"
     case: {
      when: {
        sql: ${tempo_curta} <= 5 ;;
        label: "< 5"
      }
      when: {
        sql: ${tempo_curta} <= 15 ;;
        label: "5 - 15"
      }
      when: {
        sql: ${tempo_curta} <= 30 ;;
        label: "15 - 30"
      }
      else: "30 >"
    }

  }


  dimension: tempo_curta_segundos {
    type: number
    group_label: "Dados da Etapa"
    label: "Tempo - Segundos"
    sql: ${curta_lead_time.TEMPO_ETAPA} ;;
  }

  measure: average_tempo_curta {
    type: average
    group_label: "Tempo Minutos - Etapa"
    label: "Média"
    sql: ${curta_lead_time.TEMPO_ETAPA}/60 ;;
    value_format: "hh:mm:ss"
  }






  measure: med_tempo_curta {
    type: median
    group_label: "Tempo Minutos - Etapa"
    label: "Mediana"
    sql: ${tempo_curta} ;;

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
    drill_fields: [cpf_aluno,nome_aluno,nome_curso,nome_fantasia_instituicao,flg_aluno_resp_fin,telefone_aluno_1,etapa,data_evento_date]
  }

  measure: total_contratos {
    type: count_distinct
    sql: ${num_contrato} ;;
    group_item_label: "Total de Contratos"
  }
}
