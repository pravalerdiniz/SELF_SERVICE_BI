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
    drill_fields: []
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

  measure: count_proposta {
    type: count_distinct
    sql: ${id_proposta} ;;
    label: "Quantidade de Propostas"
    description: "Contagem de Propostas"
  }

   measure: conversao {
     type: number
     sql: ${cedidos}/nullif(${iniciados},0) ;;
     value_format: "0.0%"
     description: "Indica a conversão de iniciados para cedidos, em porcentagem"
   }

}
