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
    description: "Indica o ID do CPF"
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
    drill_fields: []
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

# ETAPAS ALUNO - NOVO - coloca no filter tipo_proposta = x
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
    description: "Soma de todos os alunos novos que passaram pela etapa de lead"
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
    description: "Soma de todos os alunos novos que passaram pela etapa de iniciado"
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
    description: "Soma de todos os alunos novos que passaram pela etapa de finalizado"
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
   #drill_fields: [data_inicio_da_proposta_date,id_cpf, id_proposta] FALTA ACRESCENTR o CAMPO DATA INICIO PROPOSTA
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Aprovado Risco"
    description: "Soma de todos os alunos novos que passaram pela etapa de aprovado risco"
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
    #drill_fields: [[data_inicio_da_proposta_date] - FALTA ACRESCENTR o CAMPO DATA INICIO PROPOSTA
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Aprovado Instituição"
    description: "Soma de todos os alunos novos que passaram pela etapa de aprovado instituição"
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
    description: "Soma de todos os alunos novos que passaram pela etapa de contrato gerado"
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
    description: "Soma de todos os alunos novos que passaram pela etapa de contrato assinado"
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
    description: "Soma de todos os alunos novos que passaram pela etapa de formalizado"
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
    description: "Soma de todos os alunos novos que passaram pela etapa de cedido"
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
    description: "Soma de todos os alunos renovação que passaram pela etapa de iniciado"
  }

  measure: elegivel {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value:"Elegível"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Elegível"
    description: "Soma de todos os alunos renovação que passaram pela etapa de elegível"
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
    description: "Soma de todos os alunos renovação que passaram pela etapa de aprovado behavior"
  }

  measure: apr_instituicao {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Aprovado Instituição"
    }
    filters: {
      field: tipo_proposta
      value: "Renovação"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Aprovado Instituição"
    description: "Soma de todos os alunos renovação que passaram pela etapa de aprovado instituição"
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
    description: "Soma de todos os alunos renovação que passaram pela etapa de finalizado"
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
    description: "Soma de todos os alunos renovação que passaram pela etapa de contrato gerado"
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
    description: "Soma de todos os alunos renovação que passaram pela etapa de contrato assinado"
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
    description: "Soma de todos os alunos renovação que passaram pela etapa de formalizado"
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
    description: "Soma de todos os alunos renovação que passaram pela etapa de cedido"
  }



#   measure: conversao {
#     type: number
#     sql: ${cedidos}/nullif(${iniciados},0) ;;
#     value_format: "0.0%"
#     description: "Indica a conversão de iniciados para cedidos, em porcentagem"
#   }

#   measure: count_cpf {
#     type: count_distinct
#     sql: ${cpf} ;;
#     group_label: "Quantidade de Alunos"
#     group_item_label: "Valor"
#     description: "Contagem de CPFs únicos"
#   }

#   measure: perc_cpf {
#     type: percent_of_total
#     sql: ${count_cpf} ;;
#     group_label: "Quantidade de Alunos"
#     group_item_label: "Porcentagem"
#     description: "Porcentagem do total de CPFs únicos"
#   }

#   measure: idade_aluno {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${idade_do_aluno} ;;
#     group_label: "Idade"
#     group_item_label: "Aluno"
#     description: "Média de idade do aluno"
#   }

#   measure: idade_fiador {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${idade_do_fiador} ;;
#     group_label: "Idade"
#     group_item_label: "Garantidor"
#     description: "Média de idade do garantidor"
#   }

#   measure: sum_renda_alu {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_do_aluno} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda do Aluno"
#     group_item_label: "Soma"
#     description: "Soma da renda do aluno"
#   }

#   measure: avg_renda_alu {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_do_aluno} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda do Aluno"
#     group_item_label: "Média"
#     description: "Média da renda do aluno"
#   }

#   measure: sum_renda_fia {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_do_fiador} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda do Garantidor"
#     group_item_label: "Soma"
#     description: "Soma da renda do garantidor"
#   }

#   measure: avg_renda_fia {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_do_fiador} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda do Garantidor"
#     group_item_label: "Média"
#     description: "Média da renda do garantidor"
#   }

#   measure: sum_renda_fam {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_familiar} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda Familiar"
#     group_item_label: "Soma"
#     description: "Soma da renda familiar"
#   }

#   measure: avg_renda_fam {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${renda_familiar} ;;
#     value_format: "$ #,###.00"
#     group_label: "Renda Familiar"
#     group_item_label: "Média"
#     description: "Média da renda familiar"
#   }

#   measure: iniciar_proposta {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_ini} ;;
#     group_label: "SLA"
#     group_item_label: "Iniciar Proposta"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno ser lead e iniciar uma proposta"
#   }

#   measure: finalizar_proposta {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_fin} ;;
#     group_label: "SLA"
#     group_item_label: "Finalizar Proposta"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno iniciar e finalizar uma proposta"
#   }

#   measure: mesa_risco {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_apr_risco} ;;
#     group_label: "SLA"
#     group_item_label: "Mesa de Risco"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno finalizar uma proposta e ser aprovado por risco"
#   }

#   measure: aprovacao_instituicao {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_apr_ies} ;;
#     group_label: "SLA"
#     group_item_label: "Aprovação da Instituição"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno ser aprovado por risco e ser aprovado pela instituição"
#   }

#   measure: geracao_contrato {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_cont_ger} ;;
#     group_label: "SLA"
#     group_item_label: "Geração de Contrato"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno ser aprovado pela instituição e ter seu contrato gerado"
#   }

#   measure: assinatura_contrato {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_cont_ass} ;;
#     group_label: "SLA"
#     group_item_label: "Assinatura de Contrato"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno ter o contrato gerado e assinar o contrato (tanto aluno quanto garantidor)"
#   }

#   measure: formalizacao {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_form} ;;
#     group_label: "SLA"
#     group_item_label: "Formalização"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno ter seu contrato assinado e ter todos seus documentos aprovados pela formalização"
#   }

#   measure: cessao {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${funil_geral_pivot.sla_ced} ;;
#     group_label: "SLA"
#     group_item_label: "Cessão"
#     value_format: "0"
#     description: "Média da diferença de data, em dias, entre o aluno estar formalizado e ser cedido"
#   }

#   measure: sum_qtd_mens_desej {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${qtd_mensalidade_desejada} ;;
#     value_format: "#,###"
#     group_label: "Quantidade de Mensalidade Desejada"
#     group_item_label: "Soma"
#     description: "Soma da quantidade de mensalidades que o aluno pediu no financiamento"
#   }

#   measure: avg_qtd_mens_desej {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${qtd_mensalidade_desejada} ;;
#     value_format: "#,###"
#     group_label: "Quantidade de Mensalidade Desejada"
#     group_item_label: "Média"
#     description: "Média da quantidade de mensalidades que o aluno pediu no financiamento"
#   }

#   measure: sum_qtd_mens_fin {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${qtd_mensalidade_financiada} ;;
#     value_format: "#,###"
#     group_label: "Quantidade de Mensalidade Financiada"
#     group_item_label: "Soma"
#     description: "Soma da quantidade de mensalidades que foram efetivamente financiadas pelo PRAVALER"
#   }

#   measure: avg_qtd_mens_fin {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${qtd_mensalidade_financiada} ;;
#     group_label: "Quantidade de Mensalidade Financiada"
#     group_item_label: "Média"
#     description: "Média da quantidade de mensalidades que foram efetivamente financiadas pelo PRAVALER"
#   }

#   measure: sum_valor_desej {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiamento_desejado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor de Financiamento Desejado"
#     group_item_label: "Soma"
#     description: "Soma do valor de financiamento desejado"
#   }

#   measure: avg_valor_desej {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiamento_desejado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor de Financiamento Desejado"
#     group_item_label: "Média"
#     description: "Valor médio de financiamento desejado"
#   }

#   measure: min_valor_desej {
#     type: min
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiamento_desejado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor de Financiamento Desejado"
#     group_item_label: "Mínimo"
#     description: "Valor mínimo de financiamento desejado"
#   }

#   measure: max_valor_desej {
#     type: max
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiamento_desejado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor de Financiamento Desejado"
#     group_item_label: "Máximo"
#     description: "Valor máximo de financiamento desejado"
#   }

#   measure: sum_valor_fin {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Financiado"
#     group_item_label: "Soma"
#     description: "Soma dos valores efetivamente financiados pelo PRAVALER"
#   }

#   measure: avg_valor_fin {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Financiado"
#     group_item_label: "Média"
#     description: "Valor médio efetivamente financiado pelo PRAVALER"
#   }

#   measure: min_valor_fin {
#     type: min
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Financiado"
#     group_item_label: "Mínimo"
#     description: "Valor mínimo efetivamente financiado pelo PRAVALER"
#   }

#   measure: max_valor_fin {
#     type: max
#     sql_distinct_key: ${proposta} ;;
#     sql: ${vl_financiado} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Financiado"
#     group_item_label: "Máximo"
#     description: "Valor máximo efetivamente financiado pelo PRAVALER"
#   }

#   measure: sum_mensalidade {
#     type: sum_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${mensalidade} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Mensalidade"
#     group_item_label: "Soma"
#     description: "Soma do valor de mensalidade"
#   }

#   measure: avg_mensalidade {
#     type: average_distinct
#     sql_distinct_key: ${proposta} ;;
#     sql: ${mensalidade} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Mensalidade"
#     group_item_label: "Média"
#     description: "Valor médio de mensalidade"
#   }

#   measure: min_mensalidade {
#     type: min
#     sql_distinct_key: ${proposta} ;;
#     sql: ${mensalidade} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Mensalidade"
#     group_item_label: "Mínimo"
#     description: "Valor mínimo de mensalidade"
#   }

#   measure: max_mensalidade {
#     type: max
#     sql_distinct_key: ${proposta} ;;
#     sql: ${mensalidade} ;;
#     value_format: "$ #,###"
#     group_label: "Valor Mensalidade"
#     group_item_label: "Máximo"
#     description: "Valor máximo de mensalidade"
#   }


#   measure: count_proposta {
#     type: count_distinct
#     sql: ${proposta} ;;
#     drill_fields: [cpf,proposta]
#     group_label: "Quantidade de Propostas"
#     group_item_label: "Valor"
#     description: "Contagem única de propostas"
#   }

#   measure: perc_proposta {
#     type: percent_of_total
#     sql: ${count_proposta} ;;
#     group_label: "Quantidade de Propostas"
#     group_item_label: "Porcentagem"
#     description: "Porcentagem do total de propostas únicas"
#   }

#   measure: avg_juros_mensal {
#     type: average
#     sql: ${juros_mensal} ;;
#     group_label: "Juros Total"
#     group_item_label: "Média"
#     description: "Valor médio de juros do contrato"
#   }

#   measure: max_juros_mensal {
#     type: max
#     sql: ${juros_mensal} ;;
#     group_label: "Juros Total"
#     group_item_label: "Máximo"
#     description: "Maior valor de juros do contrato"
#   }

#   measure: min_juros_mensal {
#     type: min
#     sql: ${juros_mensal} ;;
#     group_label: "Juros Total"
#     group_item_label: "Mínimo"
#     description: "Menor valor de juros do contrato"
#   }

#   measure: avg_juros_aluno {
#     type: average
#     sql: ${juros_aluno} ;;
#     group_label: "Juros do Aluno"
#     group_item_label: "Média"
#     description: "Valor médio de juros do aluno"
#   }

#   measure: max_juros_aluno {
#     type: max
#     sql: ${juros_aluno} ;;
#     group_label: "Juros do Aluno"
#     group_item_label: "Máximo"
#     description: "Maior valor de juros do aluno"
#   }

#   measure: min_juros_aluno {
#     type: min
#     sql: ${juros_aluno} ;;
#     group_label: "Juros do Aluno"
#     group_item_label: "Mínimo"
#     description: "Menor valor de juros do aluno"
#   }

#   measure: tempo_status {
#     type: average
#     sql: ${tempo_no_status} ;;
#     group_label: "Tempo no Status"
#     group_item_label: "Dias"
#     value_format: "0"
#     description: "Média de tempo no status"
#   }

#   measure: tempo_status_hora {
#     type: average
#     sql: ${tempo_no_status_hora} ;;
#     group_label: "Tempo no Status"
#     group_item_label: "Horas"
#     value_format: "0"
#     description: "Média de horas no status"
#   }

}
