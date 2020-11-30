view: jornada {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."JORNADA"
    ;;

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
    label: "Etapa"
    description: "Data em que o aluno passou pela etapa. Esse campo pode ser utilizado como filtro para visualizar o funil completo, ou seja, acompanhar todas as propostas no funil em um determinado momento"
  }

  #dimension_group: dt_ultimo_status { -- dimensão duplicada
  #  type: time
  #  timeframes: [
  #    raw,
  #    time,
  #    date,
  #    week,
  #    month,
  #    quarter,
  #    year,
  #    time_of_day,
  #    month_name,
  #    day_of_year,
  #    hour_of_day,
  #    month_num
  #  ]
  #  sql: ${TABLE}."DT_ULTIMO_STATUS" ;;
  #  label: "Último Status"
  #  description: "Indica a data do último status"
  #}

  dimension: etapa {
    type: string
    sql: ${TABLE}."ETAPA" ;;
    group_label: "Dados da Etapa"
    group_item_label: "Etapa"
    description: "Etapas da esteira de contratação do PRAVALER"
  }




  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    value_format: "0"
    group_label: "Dados da Proposta"
    group_item_label: "ID CPF do Aluno"
    description: "Indica o ID do CPF correspondente ao CPF do aluno"
  }



  dimension: cpf_aluno {
    type: number
    sql: ${proposta.cpf_aluno} ;;
    group_label: "Dados da Proposta"
    group_item_label: "ID CPF do Aluno"
    hidden: yes
    description: "Indica o ID do CPF correspondente ao CPF do aluno"
  }

  dimension: id_elegivel {
    type: number
    sql: ${TABLE}."ID_ELEGIVEL" ;;
    group_label: "Dados da Proposta"
    group_item_label: "ID Elegivel"
    description: "Indica o código de elegibilidade"
  }

  dimension: id_proposta {
    type: string
    primary_key: yes
    sql: ${TABLE}."ID_PROPOSTA" ;;
    group_label: "Dados da Proposta"
    group_item_label: "ID Proposta"
    description: "Número de identificação da proposta"
  }

  dimension: flg_proposta_atual {
    type: string
    sql: ${TABLE}."FLG_PROPOSTA_ATUAL" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Proposta Atual?"
    description: "Indica se é a proposta atual do aluno. Ou seja a última com alteração de status (Sim - Não)"
  }


  dimension: flg_continuacao{
    type: yesno
    sql: ${TABLE}."FLG_CONTINUACAO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Proposta de Continuação?"
    description: "Indica se é a proposta é continuação de uma proposta anterior ou não"
  }



  dimension: semestre_financiamento {
    type: string
    sql: ${TABLE}."SEMESTRE_FINANCIAMENTO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Semestre Financiado"
    description: "Indica o semestre financiado"
  }

  dimension: status_etapa {
    type: number
    sql: ${TABLE}."STATUS_ETAPA" ;;
    group_label: "Dados da Etapa"
    group_item_label: "Status Etapa"
    description: "Indica se o aluno passou pela etapa ou não. 1 = Sim; 0 = Não"
  }



  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Tipo de Proposta"
    description: "Indica o tipo da proposta (ex. Novo, Renovação)"
  }

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
    sql: ${TABLE}."DATA_INICIO_PROPOSTA" ;;
    label: "Início da Proposta"
    description: "Esse campo pode ser utilizado como filtro para visualizar o funil safrado, ou seja, acompanhar a jornada por proposta"
  }

  #dimension_group: data_status { -- dimensão duplicada
  #  type: time
  #  timeframes: [
  #    raw,
  #    time,
  #    date,
  #    week,
  #    month,
  #    quarter,
  #    year,
  #    time_of_day,
  #    month_name,
  #    day_of_year,
  #    hour_of_day,
  #    month_num
  #  ]
  #  sql: ${TABLE}."DT_STATUS" ;;
  #  label: "Etapa"
  #  description: "Data em que o aluno passou pela etapa. Esse campo pode ser utilizado como filtro para visualizar o funil completo, ou seja, acompanhar todas as propostas no funil em um determinado momento"
  #}

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
    sql: ${TABLE}."DT_ULTIMO_STATUS" ;;
    label: "Último Status"
    description: "Indica a data da última alteração de status que a proposta teve"
  }


  #Telemetria

  dimension: descricao_detalhada_ultimo_status {
    type: string
    sql: ${TABLE}."DS_ULT_STATUS_DETALHADO" ;;
    group_label: "Telemetria"
    group_item_label: "Descrição Detalhada"
    description: "Descrição do status filho do último status"
  }

  dimension: descricao_geral_ultimo_status {
    type: string
    sql: ${TABLE}."DS_ULT_STATUS_GERAL" ;;
    group_label: "Telemetria"
    group_item_label: "Descrição Geral"
    description: "Descrição do status pai do último status"
  }


  dimension: ultimo_status_detalhado {
    type: string
    sql: ${TABLE}."ULT_STATUS_DETALHADO" ;;
    group_label: "Telemetria"
    group_item_label: "Último Status da Proposta - Detalhado"
    description: "Indica a última alteração de status que a proposta teve"

  }

  dimension: ultimo_status_geral {
    type: number
    sql: ${TABLE}."ULT_STATUS_GERAL" ;;
    group_label: "Telemetria"
    group_item_label: "Último Status da Proposta - Geral"
    description: "Indica a última alteração de status que a proposta teve, somente com o status pai"

  }

  dimension: tempo_no_status {
    type: number
    sql: datediff('day',${data_ultimo_status_raw},current_date) ;;
    group_label: "Telemetria"
    group_item_label: "Tempo no Status"
    description: "Indica a quantos dias o aluno está no mesmo status"
    drill_fields: [id_proposta,id_cpf,etapa_ultimo_status]
  }

  dimension: tempo_no_status_hora {
    type: number
    sql: datediff('hour',${data_ultimo_status_raw},current_date) ;;
    group_label: "Telemetria"
    group_item_label: "Horas no Status"
    description: "Indica a quantas horas o aluno está no mesmo status"
  }



  dimension: faixa_tempo_no_status {
    type: string
    case: {
      when: {
        sql: ${tempo_no_status} <= 5 ;;
        label: "< 5"
      }
      when: {
        sql: ${tempo_no_status} <= 15 ;;
        label: "5 - 15"
      }
      when: {
        sql: ${tempo_no_status} <= 30 ;;
        label: "15 - 30"
      }
      else: "30 >"
    }
    group_label: "Telemetria"
    group_item_label: "Faixa de Tempo no Status"
    description: "Indica a faixa de tempo, em dias, que o aluno está no mesmo status"
  }




  dimension: ordem_faixa_tempo {
    type: string
    case: {
      when: {
        sql: ${tempo_no_status} <= 5 ;;
        label: "1"
      }
      when: {
        sql: ${tempo_no_status} <= 15 ;;
        label: "2"
      }
      when: {
        sql: ${tempo_no_status} <= 30 ;;
        label: "3"
      }
      else: "4"
    }
    hidden: yes
  }


  dimension: ordem_faixa {
    type: number
    sql: ${ordem_faixa_tempo} ;;
    hidden: yes
  }

  dimension: ordem_etapa {
    type: number
    group_label: "Dados da Etapa"
    label: "Ordem - Etapa"
    description: "Indica a ordem correta por etapa do funil. "
    sql: ${ordem_etapa_funil} ;;

  }

  dimension: ordem_etapa_funil {
    type: string
    case: {
      when: {
        sql: ${etapa} = 'Lead' ;;
        label: "1"
      }
      when: {
        sql: ${etapa} = 'Iniciado'  ;;
        label: "2"
      }
      when: {
        sql: ${etapa} = 'Iniciado / Elegivel'  ;;
        label: "2"
      }
      when: {
        sql: ${etapa} = 'Finalizado' ;;
        label: "3"
      }
      when: {
        sql: ${etapa} = 'Aprovado Risco' ;;
        label: "4"
      }

      when: {
        sql: ${etapa} = 'Aprovado Behavior' ;;
        label: "4"
      }
      when: {
        sql: ${etapa} = 'Aprovado Instituicao' ;;
        label: "5"
      }
      when: {
        sql: ${etapa} = 'Dados Confirmados';;
        label: "6"
      }
      when: {
        sql: ${etapa} = 'Confirmacao De Dados';;
        label: "6"
      }
      when: {
        sql: ${etapa} = 'Contrato Gerado' ;;
        label: "7"
      }
      when: {
        sql: ${etapa} = 'Contrato Assinado' ;;
        label: "8"
      }

      when: {
        sql: ${etapa} = 'Formalizado' ;;
        label: "9"
      }
      when: {
        sql: ${etapa} = 'Cedido';;
        label: "10"
      }
      else: "0"
    }
    hidden: yes
  }


  dimension: etapa_ultimo_status {
    type: string
    case: {
      when: {
        sql: ${ultimo_status_geral} in (0,1) ;;
        label: "Preenchendo Proposta"
      }
      when: {
        sql: ${ultimo_status_geral} = 2 ;;
        label: "Análise de Risco"
      }
      when: {
        sql: ${ultimo_status_geral} in (8,9,10,19) ;;
        label: "Não Aprovado por Risco"
      }
      when: {
        sql: ${ultimo_status_geral} in (11) ;;
        label: "Tela da Instituição"
      }
      when: {
        sql: ${ultimo_status_geral} in (13,14,39,36) ;;
        label: "Não Aprovado pela Instituição"
      }
      when: {
        sql: ${ultimo_status_geral} in (25) ;;
        label: "Preenchendo Dados Adicionais"
      }
      when: {
        sql: ${ultimo_status_geral} in (31) ;;
        label: "Aprovado para Geração de Contrato"
      }
      when: {
        sql: ${ultimo_status_geral} in (40,42) ;;
        label: "Formalização"
      }
      when: {
        sql: ${ultimo_status_geral} in (41) ;;
        label: "Formalizado"
      }
      when: {
        sql: ${ultimo_status_geral} in (46,47,49) ;;
        label: "Não Aprovado pela Formalização"
      }
      when: {
        sql: ${ultimo_status_geral} in (50) ;;
        label: "Cedido"
      }
      when: {
        sql: ${ultimo_status_geral} in (51) ;;
        label: "Segundo Repasse"
      }
      else: "Outros"
    }
    group_label: "Telemetria"
    group_item_label: "Etapa Atual"
    description: "Etapa do último status do aluno"
  }









  dimension: etapa_ultimo_status_renovacao {
    type: string
    case: {
      when: {
        sql: ${ultimo_status_geral} in (2000,2001,2002) ;;
        label: "Pré Elegibilidade/Iniciado"
      }
      when: {
        sql: ${ultimo_status_geral} = 2010 ;;
        label: "Aguardando Análise Behavior"
      }

      when: {
        sql: ${ultimo_status_geral} in (2011) ;;
        label: "Tela da Instituição"
      }
      when: {
        sql: ${ultimo_status_geral} in (2031,2036) ;;
        label: "Aprovados pela Instituição"
      }
      when: {
        sql: ${ultimo_status_geral} in (2040) ;;
        label: "Aguardando Confirmação de Dados"
      }
      when: {
        sql: ${ultimo_status_geral} in (2044);;
        label: "Contratos Gerados"
      }

      when: {
        sql: ${ultimo_status_geral} in (2041) ;;
        label: "Formalizado"
      }
      when: {
        sql: ${ultimo_status_geral} in (2046) ;;
        label: "Não Aprovado pela Formalização"
      }
      when: {
        sql: ${ultimo_status_geral} in (2050) ;;
        label: "Cedido"
      }
      when: {
        sql: ${ultimo_status_geral} in (2058) ;;
        label: "Cancelado"
      }


      else: "Outros"
    }
    group_label: "Telemetria"
    group_item_label: "Etapa Atual - Renovação"
    description: "Etapa do último status do aluno de renovação"
  }


  dimension: ordem_ultima_etapa_rnv {
    type: string
    case: {
      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Pré Elegibilidade/Iniciado' ;;
        label: "1"
      }
      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Aguardando Análise Behavior'  ;;
        label: "2"
      }
      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Tela da Instituição'  ;;
        label: "3"
      }
      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Aprovados pela Instituição' ;;
        label: "4"
      }
      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Aguardando Confirmação de Dados' ;;
        label: "5"
      }

      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Contratos Gerados' ;;
        label: "6"
      }
      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Formalizado' ;;
        label: "5"
      }
      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Cedido';;
        label: "6"
      }
      else: "0"
    }
    hidden: yes
  }







  dimension: faixa_tempo_sla_iniciados2 {
    type: string
    group_label: "Telemetria"
    label: "SLA de Iniciados - Faixa de Tempo"
    case: {
      when: {
        sql: ${jornada_pivot.sla_ini_novos} = '0' ;;
        label: "0"
      }
      else: "0 >"
    }
  }


  dimension: faixa_tempo_sla_finalizado2 {
    type: string
    group_label: "Telemetria"
    label: "SLA de Finalizado - Faixa de Tempo"
    case: {
      when: {
        sql: ${jornada_pivot.sla_fin_novos} = 0 ;;
        label: "0"
      }
      else: "0 >"
    }
  }

  dimension: dias_iniciar_proposta_novos {
    type: number
    sql: ${jornada_pivot.sla_ini_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "1. Iniciar Proposta"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,iniciar_proposta_novos]
    description: "Diferença de dias entre o aluno ser lead e iniciar uma proposta"
    hidden: yes
  }


  dimension: dias_finalizar_proposta_novos {
    type: number
    sql: ${jornada_pivot.sla_fin_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "1. Iniciar Proposta"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,iniciar_proposta_novos]
    description: "Diferença de dias entre o aluno ser lead e iniciar uma proposta"
    hidden: yes
  }




  dimension: aluno_email {
    sql: ${proposta.aluno_email};;
    hidden: yes

  }

  dimension: aluno_nome {
    sql: ${proposta.aluno_nome};;
    hidden: yes

  }

  dimension: aluno_celular {
    sql: ${proposta.aluno_celular};;
    hidden: yes

  }


  dimension: grupo_instituicao {
    sql: ${proposta.grupo_instituicao};;
    hidden: yes

  }


  dimension: ds_instituicao {
    sql: ${proposta.ds_instituicao};;
    hidden: yes

  }



  dimension: ds_campus {
    sql: ${proposta.ds_campus};;
    hidden: yes

  }





  dimension: nm_modalidade_produto{
    sql: ${proposta.nm_modalidade_produto};;
    hidden: yes

  }


  dimension: nm_produto{
    sql: ${proposta.nm_produto};;
    hidden: yes

  }

  dimension: ds_curso{
    sql: ${proposta.ds_curso};;
    hidden: yes

}





  measure: count {
    type: count
    drill_fields: [id_proposta]
    hidden: yes
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
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Lead"
    drill_fields: [id_cpf, id_proposta]
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
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Iniciado"
    drill_fields: [id_cpf, id_proposta]
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
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Finalizado"
    drill_fields: [id_cpf, id_proposta]
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
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Aprovado Risco"
    drill_fields: [id_cpf, id_proposta]
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
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Aprovado Instituição"
    drill_fields: [id_cpf, id_proposta]
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
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Contrato Gerado"
    drill_fields: [id_cpf, id_proposta]
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
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Contrato Assinado"
    drill_fields: [id_cpf, id_proposta]
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
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Formalizado"
    drill_fields: [id_cpf, id_proposta]
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
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Cedido"
    drill_fields: [id_cpf, id_proposta]
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
      value: "RENOVACAO"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Iniciado"
    drill_fields: [id_cpf, id_proposta]
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
      value: "RENOVACAO"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Elegível"
    drill_fields: [id_cpf, id_proposta]
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
      value: "RENOVACAO"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Aprovado Behavior"
    drill_fields: [id_cpf, id_proposta]
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
      value: "RENOVACAO"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Aprovado Instituição"
    drill_fields: [id_cpf, id_proposta]
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
      value: "RENOVACAO"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Dados Confirmados"
    drill_fields: [id_cpf, id_proposta]
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
      value: "RENOVACAO"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Contrato Gerado"
    drill_fields: [id_cpf, id_proposta]
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
      value: "RENOVACAO"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Contrato Assinado"
    drill_fields: [id_cpf, id_proposta]
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
      value: "RENOVACAO"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Formalizado"
    drill_fields: [id_cpf, id_proposta]
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
      value: "RENOVACAO"
    }
    group_label: "Etapa - Aluno Renovação"
    group_item_label: "Cedido"
    drill_fields: [id_cpf, id_proposta]
    description: "Soma de todos os alunos renovação que passaram pela etapa Cedido"
  }


  #ETAPA DE INTERCÂMBIO


  measure: cadastro_finalizado {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Cadastro Finalizado"
    }
    filters: {
      field: tipo_proposta
      value: "INTERCAMBIO"
    }
    group_label: "Etapa - Aluno Intercâmbio"
    group_item_label: "Cadastro Finalizado"
    drill_fields: [id_cpf, id_proposta]
    description: "Soma de todos os alunos novos que passaram pela etapa de Cadastro Finalizado"
  }




  measure: aguardando_documento {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Aguardando Documentos"
    }
    filters: {
      field: tipo_proposta
      value: "INTERCAMBIO"
    }
    group_label: "Etapa - Aluno Intercâmbio"
    group_item_label: "Aguardando Documento"
    drill_fields: [id_cpf, id_proposta]
    description: "Soma de todos os alunos novos que passaram pela etapa de Aguardando Documento"
  }


  measure: aguardando_assinatura {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Aguardando Assinatura"
    }
    filters: {
      field: tipo_proposta
      value: "INTERCAMBIO"
    }
    group_label: "Etapa - Aluno Intercâmbio"
    group_item_label: "Aguardando Assinatura do Contrato"
    drill_fields: [id_cpf, id_proposta]
    description: "Soma de todos os alunos novos que passaram pela etapa de Aguardando Assinatura"
  }


  measure: aguardando_cessao {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Aguardando Cessao"
    }
    filters: {
      field: tipo_proposta
      value: "INTERCAMBIO"
    }
    group_label: "Etapa - Aluno Intercâmbio"
    group_item_label: "Aguardando Cessao"
    drill_fields: [id_cpf, id_proposta]
    description: "Soma de todos os alunos novos que passaram pela etapa de Aguardando Cessao"
  }


  measure: cedido_intercambio {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Cedido"
    }
    filters: {
      field: tipo_proposta
      value: "INTERCAMBIO"
    }
    group_label: "Etapa - Aluno Intercâmbio"
    group_item_label: "Cedido"
    drill_fields: [id_cpf, id_proposta]
    description: "Soma de todos os alunos novos que passaram pela etapa de Cedido"
  }

  measure: sum_status {
    type: sum
    sql: ${status_etapa} ;;
    value_format: "#,###"
    drill_fields: [id_cpf, cpf_aluno,id_proposta,etapa,status_etapa,data_inicio_da_proposta_date,data_ultimo_status_date]
    filters: [status_etapa: "1"]
    group_label: "Quantidade de Status"
    group_item_label: "Valor"
    description: "Soma de Status da Etapa, indicando que o aluno passou pela etapa sendo analisada"
  }

  measure: perc_status {
    type: percent_of_total
    drill_fields: [detail*]
    group_label: "Quantidade de Status"
    group_item_label: "Porcentagem"
    sql: ${sum_status} ;;

    description: "Porcentagem do total da soma de status"
  }

   measure: count_cpf {
     type: count_distinct
     sql: ${id_cpf} ;;
    drill_fields: [cpf_aluno, aluno_nome, id_proposta,
      aluno_email,
      aluno_celular,
      ds_curso,
      grupo_instituicao,
      ds_instituicao,
      ds_campus,
      nm_modalidade_produto,
      nm_produto]
     group_label: "Quantidade de Alunos"
     group_item_label: "Valor"
     description: "Contagem de CPFs únicos"
   }






  measure: perc_cpf {
    type: percent_of_total
    sql: ${id_cpf} ;;
    drill_fields: [detail*]
    group_label: "Quantidade de Alunos"
    group_item_label: "Porcentagem"
    description: "Percentual do total de alunos"
  }

  measure: count_proposta {
    type: count_distinct
    sql: ${id_proposta} ;;
    drill_fields: [detail*]
    group_label: "Quantidade de Propostas"
    group_item_label: "Valor"
    description: "Contagem de Propostas"
  }

  measure: perc_proposta {
    type: percent_of_total
    sql: ${id_proposta} ;;
    drill_fields: [detail*]
    group_label: "Quantidade de Propostas"
    group_item_label: "Porcentagem"
    description: "Percentual do total de propostas"
  }

  measure: conversao {
    type: number
    sql: ${cedidos}/nullif(${iniciados},0) ;;
    value_format: "0.0%"
    description: "Indica a conversão de iniciados para cedidos, em porcentagem"
  }

  measure: conversao_intercambio {
    type: number
    label: "Conversão - Intercâmbio"
    sql: ${cedido_intercambio}/nullif(${cadastro_finalizado},0) ;;
    value_format: "0.0%"
    description: "Indica a conversão de iniciados para cedidos, em porcentagem"
  }

  measure: tempo_status {
    type: average
    sql: ${tempo_no_status} ;;
    group_label: "Tempo no Status Atual"
    group_item_label: "Dias"
    value_format: "0"
    drill_fields: [detail*]
    description: "Media de tempo no status"
  }

  measure: tempo_status_hora {
    type: average
    sql: ${tempo_no_status_hora} ;;
    drill_fields: [detail*]
    group_label: "Tempo no Status Atual"
    group_item_label: "Horas"
    value_format: "0"

    description: "Média de horas no status"
  }

  # Jornada Novos


  measure: iniciar_proposta_novos2 {
    type: median
    sql: ${dias_iniciar_proposta_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "1. Iniciar Proposta (Maior que 0)"
    value_format: "0"
    filters: [dias_iniciar_proposta_novos: ">0"
    ]
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,iniciar_proposta_novos2]
    description: "Mediana do tempo entre o aluno ser lead e iniciar uma proposta, desconsiderando os alunos que tem diferença de dias = 0"
  }


  measure: iniciar_proposta_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql:${jornada_pivot.sla_ini_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "1. Iniciar Proposta"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,iniciar_proposta_novos]
    description: "Mediana do tempo entre o aluno ser lead e iniciar uma proposta"
  }

  measure: finalizar_proposta_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_fin_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "2. Finalizar Proposta"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,finalizar_proposta_novos]
    description: "Mediana do tempo entre o aluno iniciar e finalizar uma proposta"
  }


  measure: finalizar_proposta_novos2 {
    type: median
    sql: ${dias_finalizar_proposta_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "2. Finalizar Proposta (Maior que 0)"
    value_format: "0"
    filters: [dias_finalizar_proposta_novos: ">0"
    ]
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,iniciar_proposta_novos2]
    description: "Mediana do tempo entre o aluno iniciar  e finalizar uma proposta, desconsiderando os alunos que tem diferença de dias = 0"
  }



  measure: mesa_risco_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_apr_risco_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "3. Mesa de Risco"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,mesa_risco_novos]
    description: "Mediana do tempo entre o aluno finalizar uma proposta e ser aprovado por risco"
  }

  measure: aprovacao_instituicao_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_apr_ies_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "4. Aprovação da Instituição"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,finalizar_proposta_novos]
    description: "Mediana do tempo entre o aluno ser aprovado por risco e ser aprovado pela instituição"
  }

  measure: confirmacao_dados_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_conf_dados_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "5. Confirmação de Dados Adicionais"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,confirmacao_dados_novos]
    description: "Mediana do tempo entre o aluno ser aprovado pela instituição e ter seus dados confirmados"
  }

  measure: geracao_contrato_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_cont_ger_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "6. Geração de Contrato"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,geracao_contrato_novos]
    description: "Mediana do tempo entre o aluno ter seus dados confirmados e ter seu contrato gerado"
  }

  measure: assinatura_contrato_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_cont_ass_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "7. Assinatura de Contrato"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,assinatura_contrato_novos]
    description: "Mediana do tempo entre o aluno ter o contrato gerado e assinar o contrato (tanto aluno quanto garantidor)"
  }

  measure: formalizacao_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_form_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "8. Formalização"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,formalizacao_novos]
    description: "Mediana do tempo entre o aluno ter seu contrato assinado e ter todos seus documentos aprovados pela formalização"
  }

  measure: cessao_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_ced_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "9. Cessão"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,cessao_novos]
    description: "Mediana do tempo entre o aluno estar formalizado e ser cedido"
  }


  measure: median_total_novos {
    type: number
    sql: ${iniciar_proposta_novos}+
     ${finalizar_proposta_novos}+
    ${mesa_risco_novos}+${aprovacao_instituicao_novos}+
    ${confirmacao_dados_novos}+
    ${geracao_contrato_novos}+
    ${assinatura_contrato_novos}+
    ${formalizacao_novos}+
    ${cessao_novos};;

    group_label: "Tempo de Jornada - Novos"
    group_item_label: "Total - Tempo de Jornada do Aluno Novo"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,data_ultimo_status_date,median_total_novos]
    description: "Soma da mediana do tempo de todas as etapas do aluno novo durante o processo de contratação no PRAVALER"
  }


  measure: total_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_total_novos} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "Total"
    value_format: "0"
    hidden: yes
    description: "Média da diferença de data, em dias, entre o aluno iniciar a proposta e ser cedido"
  }

  # Jornada Renovação
  measure: sla_eleg_renov {
    type: median
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_eleg_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "1. Elegibilidade"
    value_format: "0"
    description: "Mediana do tempo entre o aluno iniciar uma id_proposta e se tornar elegível"
  }

  measure: sla_beha_renov {
    type: median
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_beha_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "2. Aprovação Behavior"
    value_format: "0"
    description: "Mediana do tempo entre o aluno ser elegível e ser aprovado no behavior"
  }
  measure: sla_apr_ies_renov {
    type: median
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_apr_ies_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "3. Aprovação da Instituição"
    value_format: "0"
    description: "Mediana do tempo entre o aluno ser aprovado no behavior e ser aprovado pela instituição"
  }
  measure: sla_dados_conf_renov {
    type: median
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_dados_conf_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "4. Confirmação de Dados"
    value_format: "0"
    description: "Mediana do tempo entre o aluno ser aprovado pela instituição e ter seus dados confirmados"
  }
  measure: sla_cont_ger_renov {
    type: median
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_cont_ger_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "5. Geração de Contrato"
    value_format: "0"
    description: "Mediana do tempo entre o aluno ter seus dados confirmados e o contrato gerado"
  }
  measure: sla_cont_ass_renov {
    type: median
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_cont_ass_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "6. Assinatura de Contrato"
    value_format: "0"
    description: "Mediana do tempo entre o aluno ter o contrato gerado e ter o contrato assinado"
  }

  measure: sla_form_renov {
    type: median
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_form_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "7. Formalização"
    value_format: "0"
    description: "Mediana do tempo entre o aluno ter seu contrato assinado e ter todos seus documentos aprovados pela formalização"
  }

  measure: sla_ced_renov {
    type: median
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_ced_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "8. Cessão"
    value_format: "0"
    description: "Mediana do tempo entre o aluno ter o contrado formalizado e cedido."
  }

  measure: median_total_renov {
    type: number
    sql: ${sla_eleg_renov}+${sla_beha_renov}+
     ${sla_form_renov}+${sla_apr_ies_renov}+
     ${sla_dados_conf_renov}+
    ${sla_cont_ass_renov}
    ${sla_form_renov}+${sla_ced_renov};;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "Total - Tempo de Jornada do Aluno de Renovação"
    value_format: "0"
    description: "Soma da mediana do tempo de todas as etapas do aluno de renovação durante o processo de contratação no PRAVALER"
  }


  measure: total_renov {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_total_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "Total"
    value_format: "0"
    hidden: yes
    description: "Média da diferença de data, em dias, entre o aluno iniciar a proposta e ser cedido"
  }


  set: detail {
    fields: [
      id_cpf,
      cpf_aluno,
      id_proposta,
      etapa,
      status_etapa,
      flg_proposta_atual,
      tipo_proposta,
      descricao_geral_ultimo_status,
      data_inicio_da_proposta_date,
      dt_status_date,
      proposta.fia_parentesco,
      proposta.reside_com,
      proposta.fia_aluno_moram_juntos,
      proposta.aluno_email
    ]
  }

}
