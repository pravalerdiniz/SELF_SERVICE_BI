view: jornada {
  sql_table_name: "SELF_SERVICE_BI"."JORNADA"
    ;;

  dimension: ds_ult_status_detalhado {
    type: string
    sql: ${TABLE}."DS_ULT_STATUS_DETALHADO" ;;
    label: "Descrição do Último Status Detalhado"
    description: "Descrição do último status detalhado"
  }

  dimension: ds_ult_status_geral {
    type: string
    sql: ${TABLE}."DS_ULT_STATUS_GERAL" ;;
  label: "Descrição do Último Status Geral"
    description: "Descrição do último status geral"
  }

  dimension_group: dt_status {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."DT_STATUS" ;;
    label: "Status"
    description: "Indica a data do status"
  }

  dimension_group: dt_ultimo_status {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."DT_ULTIMO_STATUS" ;;
    label: "Último Status"
    description: "Indica a data do último status"
  }

  dimension: etapa {
    type: string
    sql: ${TABLE}."ETAPA" ;;
    label: "Etapa"
    description: "Etapa do último status do aluno"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    label: "ID CPF"
    description: "Indica o ID do CPF correspondente ao CPF do aluno"
  }

  dimension: id_elegivel {
    type: number
    sql: ${TABLE}."ID_ELEGIVEL" ;;
    label: "ID Elegivel"
    description: "Indica o código de elegibilidade"
  }

  dimension: id_proposta {
    type: number
    sql: ${TABLE}."ID_PROPOSTA" ;;
    label: "ID Proposta"
    description: "Número de identificação da proposta"
  }

  dimension: proposta_ativa {
    type: string
    sql: ${TABLE}."PROPOSTA_ATIVA" ;;
    label: "Proposta Ativa?"
    description: "Indica se a proposta está ativa (Sim - Não)"
  }

  dimension: semestre_financiamento {
    type: string
    sql: ${TABLE}."SEMESTRE_FINANCIAMENTO" ;;
    label: "Semestre Financiado"
    description: "Indica o semestre financiado"
  }

  dimension: status_etapa {
    type: number
    sql: ${TABLE}."STATUS_ETAPA" ;;
    label: "Status Etapa"
    description: "Indica se o status está ativo(1) ou não (0)"
  }

  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
    label: "Tipo de Proposta"
    description: "Indica o tipo da proposta (ex. Novo, Renovação)"
  }

  dimension: ult_status_detalhado {
    type: string
    sql: ${TABLE}."ULT_STATUS_DETALHADO" ;;
    label: "Último Status Detalhado"
    description: "Indica o último status detalhado"
  }

  dimension: ult_status_geral {
    type: number
    sql: ${TABLE}."ULT_STATUS_GERAL" ;;
    label: "Último Status Geral"
    description: "Indica o último status geral"
  }


  measure: count {
    type: count
    drill_fields: [id_proposta]
  }

  measure: lead {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Lead"
    }
    filters: {
      field: tipo_proposta
      value: "Novo"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Lead"
    description: "Soma de todos os alunos novos que passaram pela etapa Lead"
  }

  measure: iniciados {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Iniciado"
    }
    filters: {
      field: tipo_proposta
      value: "Novo"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Iniciado"
    description: "Soma de todos os alunos novos que passaram pela etapa Iniciado"
  }

  measure: finalizados {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Finalizado"
    }
    filters: {
      field: tipo_proposta
      value: "Novo"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Finalizado"
    description: "Soma de todos os alunos novos que passaram pela etapa Finalizado"
  }

  measure: apr_risco {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Aprovado Risco"
    }
    filters: {
      field: tipo_proposta
      value: "Novo"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Aprovado Risco"
    description: "Soma de todos os alunos novos que passaram pela etapa Aprovado Risco"
  }

  measure: apr_ies {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Aprovado Instituicao"
    }
    filters: {
      field: tipo_proposta
      value: "Novo"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Aprovado Instituição"
    description: "Soma de todos os alunos novos que passaram pela etapa Aprovado Instituição"
  }

  measure: gerado {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Contrato Gerado"
    }
    filters: {
      field: tipo_proposta
      value: "Novo"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Contrato Gerado"
    description: "Soma de todos os alunos novos que passaram pela etapa Contrato Gerado"
  }

  measure: assinado {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Contrato Assinado"
    }
    filters: {
      field: tipo_proposta
      value: "Novo"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Contrato Assinado"
    description: "Soma de todos os alunos novos que passaram pela etapa Contrato Assinado"
  }

  measure: form {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Formalizado"
    }
    filters: {
      field: tipo_proposta
      value: "Novo"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Formalizado"
    description: "Soma de todos os alunos novos que passaram pela etapa Formalizado"
  }

  measure: cedidos {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Cedido"
    }
    filters: {
      field: tipo_proposta
      value: "Novo"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Cedido"
    description: "Soma de todos os alunos novos que passaram pela etapa Cedido"
  }

# ETAPA RENOVAÇÃO

  measure: iniciado {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Iniciado"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Iniciado"
    description: "Soma de todos os alunos renovação que passaram pela etapa Iniciado"
  }

  measure: elegivel {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value:"Elegivel"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Elegível"
    description: "Soma de todos os alunos renovação que passaram pela etapa Elegível"
  }

  measure: apr_behavior {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Aprovado Behavior"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Aprovado Behavior"
    description: "Soma de todos os alunos renovação que passaram pela etapa Aprovado Behavior"
  }

  measure: apr_instituicao {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Aprovado Instituicao"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Aprovado Instituição"
    description: "Soma de todos os alunos renovação que passaram pela etapa Aprovado Instituição"
  }

  measure: dados_confirmados {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Dados Confirmados"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Dados Confirmados"
    description: "Soma de todos os alunos renovação que passaram pela etapa Finalizado"
  }

  measure: contrato_gerado {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Contrato Gerado"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Contrato Gerado"
    description: "Soma de todos os alunos renovação que passaram pela etapa Contrato Gerado"
  }

  measure: contrato_assinado {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Contrato Assinado"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Contrato Assinado"
    description: "Soma de todos os alunos renovação que passaram pela etapa Contrato Assinado"
  }

  measure: formalizado {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Formalizado"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Formalizado"
    description: "Soma de todos os alunos renovação que passaram pela etapa Formalizado"
  }

  measure: cedido {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Cedido"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Cedido"
    description: "Soma de todos os alunos renovação que passaram pela etapa Cedido"
  }

  measure: sum_status {
    type: sum
    sql: ${status_etapa} ;;
    value_format: "#,###"
    drill_fields: [id_cpf, id_proposta]
    group_label: "Quantidade de Status"
    group_item_label: "Valor"
    description: "Soma de Status da Etapa, indicando que o aluno passou pela etapa sendo analisada"
  }

  measure: perc_status {
    type: percent_of_total
    drill_fields: [id_cpf, id_proposta]
    group_label: "Quantidade de Status"
    group_item_label: "Porcentagem"
    sql: ${sum_status} ;;
    description: "Porcentagem do total da soma de status"
  }

   measure: count_cpf {
     type: count_distinct
     sql: ${id_cpf} ;;
     label: "Quantidade de Alunos"
     description: "Contagem de CPFs únicos"
   }

  measure: perc_cpf {
    type: percent_of_total
    sql: ${id_cpf} ;;
    label: "Percentual de Alunos"
    description: "Percentual do total de alunos"
  }

  measure: count_proposta {
    type: count_distinct
    sql: ${id_proposta} ;;
    label: "Quantidade de Propostas"
    description: "Contagem de Propostas"
  }

  measure: perc_proposta {
    type: percent_of_total
    sql: ${id_proposta} ;;
    label: "Percentual de Propostas"
    description: "Percentual do total de propostas"
  }

   measure: conversao {
     type: number
     sql: ${cedidos}/nullif(${iniciados},0) ;;
     value_format: "0.0%"
     description: "Indica a conversão de iniciados para cedidos, em porcentagem"
   }
  #----------------time frame

  dimension_group: data_inicio_da_proposta {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."DATA_INICIO_DA_PROPOSTA" ;;
    label: "Início da Proposta"
    description: "Esse campo pode ser utilizado como filtro para visualizar o funil safrado, ou seja, acompanhar a jornada por proposta"
  }

  dimension_group: primeiro_interesse {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."PRIMEIRO_INTERESSE" ;;
    label: "Primeiro Interesse"
    description: "Indica a data do primeiro acesso do aluno ao site do PRAVALER nos últimos 6 meses"
  }

  dimension_group: data_status {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."DATA_STATUS" ;;
    label: "Etapa"
    description: "Data em que o aluno passou pela etapa. Esse campo pode ser utilizado como filtro para visualizar o funil completo, ou seja, acompanhar todas as propostas no funil em um determinado momento"
  }

  dimension_group: data_ultimo_status {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."DATA_ULTIMO_STATUS" ;;
    label: "Último Status"
    description: "Indica a data da última alteração de status que a proposta teve"
  }

  dimension_group: ultimo_interesse {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."ULTIMO_INTERESSE" ;;
    description: "Indica a data do último acesso realizado pelo aluno ao site do PRAVALER antes de iniciar uma proposta"
  }
#   #Telemetria - verificar

#   dimension: descricao_detalhada_ultimo_status {
#     type: string
#     sql: ${TABLE}."DS_ULT_STATUS_DETALHADO" ;;
#     group_label: "Telemetria"
#     group_item_label: "Descrição Detalhada"
#     description: "Descrição do status filho do último status"

#   }

#   dimension: descricao_geral_ultimo_status {
#     type: string
#     sql: ${TABLE}."DS_ULT_STATUS_GERAL" ;;
#     group_label: "Telemetria"
#     group_item_label: "Descrição Geral"
#     description: "Descrição do status pai do último status"

#   }

#   dimension: ultimo_status {
#     type: string
#     sql: ${TABLE}."ULT_STATUS_DETALHADO" ;;
#     group_label: "Telemetria"
#     group_item_label: "Último Status da Proposta - Detalhado"
#     description: "Indica a última alteração de status que a proposta teve"

#   }

#   dimension: ultimo_status_geral {
#     type: number
#     sql: left(${ultimo_status},position('.',${ultimo_status})-1) ;;
#     group_label: "Telemetria"
#     group_item_label: "Último Status da Proposta - Geral"
#     description: "Indica a última alteração de status que a proposta teve, somente com o status pai"

#   }

#   dimension: tempo_no_status {
#     type: number
#     sql: datediff('day',${ultimo_status_geral},current_date) ;;
#     group_label: "Telemetria"
#     group_item_label: "Tempo no Status"
#     description: "Indica a quantos dias o aluno está no mesmo status"
#   }

#   dimension: tempo_no_status_hora {
#     type: number
#     sql: datediff('hour',${ultimo_status_geral},current_date) ;;
#     group_label: "Telemetria"
#     group_item_label: "Horas no Status"
#     description: "Indica a quantas horas o aluno está no mesmo status"
#   }

#   dimension: faixa_tempo_no_status {
#     type: string
#     case: {
#       when: {
#         sql: ${tempo_no_status} <= 5 ;;
#         label: "< 5"
#       }
#       when: {
#         sql: ${tempo_no_status} <= 15 ;;
#         label: "5 - 15"
#       }
#       when: {
#         sql: ${tempo_no_status} <= 30 ;;
#         label: "15 - 30"
#       }
#       else: "30 >"
#     }
#     group_label: "Telemetria"
#     group_item_label: "Faixa de Tempo no Status"
#     description: "Indica a faixa de tempo, em dias, que o aluno está no mesmo status"
#   }

#   dimension: ordem_faixa_tempo {
#     type: string
#     case: {
#       when: {
#         sql: ${tempo_no_status} <= 5 ;;
#         label: "1"
#       }
#       when: {
#         sql: ${tempo_no_status} <= 15 ;;
#         label: "2"
#       }
#       when: {
#         sql: ${tempo_no_status} <= 30 ;;
#         label: "3"
#       }
#       else: "4"
#     }
#     hidden: yes
#   }

#   dimension: ordem_faixa {
#     type: number
#     sql: ${ordem_faixa_tempo} ;;
#     hidden: yes
#   }

#   dimension: etapa_ultimo_status {
#     type: string
#     case: {
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1)  in (0,1) ;;
#         label: "Preenchendo Proposta"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1) = 2 ;;
#         label: "Análise de Risco"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1) in (8,9,10,19) ;;
#         label: "Não Aprovado por Risco"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1)  in (11) ;;
#         label: "Tela da Instituição"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1)  in (13,14,39,36) ;;
#         label: "Não Aprovado pela Instituição"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1)  in (25) ;;
#         label: "Preenchendo Dados Adicionais"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1)  in (31) ;;
#         label: "Aprovado para Geração de Contrato"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1)  in (40,42) ;;
#         label: "Formalização"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1)  in (41) ;;
#         label: "Formalizado"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1)  in (46,47,49) ;;
#         label: "Não Aprovado pela Formalização"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1)  in (50) ;;
#         label: "Cedido"
#       }
#       when: {
#         sql: left(${ultimo_status},position('.',${ultimo_status})-1)  in (51) ;;
#         label: "Segundo Repasse"
#       }
#       else: "Outros"
#     }
#     group_label: "Telemetria"
#     group_item_label: "Etapa Atual"
#     description: "Etapa do último status do aluno"
#   }

#  dimension: de_para_sla {
#     type: string
#     case: {
#       when: {
#         sql: ${etapa_ultimo_status} = 'Preenchendo Proposta' and ${funil_geral_pivot.proposta_reprocessada} = 'Não' ;;
#         label: "Proposta Nova"
#       }
#       when: {
#         sql: ${etapa_ultimo_status} = 'Preenchendo Proposta' and ${funil_geral_pivot.proposta_reprocessada} = 'Sim' ;;
#         label: "Proposta Reprocessada"
#       }
#       when: {
#         sql: ${etapa_ultimo_status} = 'Cedido' and year(${ultimo_status_geral}) = year(current_date) and month(${ultimo_status_geral}) = month(current_date) ;;
#         label: "No Mês"
#       }
#       when: {
#         sql: ${etapa_ultimo_status} = 'Cedido' and (year(${ultimo_status_geral}) <> year(current_date) or month(${ultimo_status_geral}) <> month(current_date)) ;;
#         label: "Fora do Mês"
#       }
#       when: {
#         sql: ${tempo_no_status} <= ${sla_etapa_atual_num} or ${etapa_ultimo_status} = 'Formalizado';;
#         label: "Dentro"
#       }
#       when: {
#         sql: ${tempo_no_status} > ${sla_etapa_atual_num} ;;
#         label: "Fora"
#       }
#       else: "Não Atribuído"
#     }
#     group_label: "Telemetria"
#     group_item_label: "Status do SLA"
#     description: "Indica se o aluno está acima ou abaixo do SLA da etapa atual"
#   }

}
