view: jornada {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."JORNADA"
    ;;

  dimension_group: dt_status {
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
    sql: ${TABLE}."DT_STATUS" ;;
    label: "Etapa"
    description: "Este campo é uma regra de negócio*. Data em que o aluno passou pela etapa. Esse campo pode ser utilizado como filtro para visualizar o funil completo, ou seja, acompanhar todas as propostas no funil em um determinado momento"
  }

  dimension: wtd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "Week to Date - Data da Etapa"
    type: yesno
    sql:  (EXTRACT(DOW FROM ${dt_status_raw}) < EXTRACT(DOW FROM GETDATE())
                OR
          (EXTRACT(DOW FROM ${dt_status_raw}) = EXTRACT(DOW FROM GETDATE())))  ;;
    link: {label: "Documentação - Data da Etapa"
    url:"https://pravaler.atlassian.net/wiki/spaces/IDD/pages/724533442/JORNADA+DT+STATUS"}
    description: "Este campo é uma regra de negócio*. Use esse campo em conjunto com o campo de Etapa, para realizar análises entre semanas diferentes usando como base o dia da semana da data corrente"
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    hidden: yes
  }

  dimension: mtd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "Month to Date - Data da Etapa"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${dt_status_raw}) < EXTRACT(DAY FROM GETDATE())
                OR
          (EXTRACT(DAY FROM ${dt_status_raw}) = EXTRACT(DAY FROM GETDATE())))  ;;
    link: {label: "Documentação - Data da Etapa"
    url:"https://pravaler.atlassian.net/wiki/spaces/IDD/pages/724533442/JORNADA+DT+STATUS"}
    description: "Este campo é uma regra de negócio*. Use esse campo em conjunto com o campo de Etapa, para realizar análises entre meses diferentes usando como base o dia do mês da data corrente."
  }

  dimension: ytd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "Year to Date - Data da Etapa"
    type: yesno
    sql:  (EXTRACT(DOY FROM ${dt_status_raw}) < EXTRACT(DOY FROM GETDATE())
                OR
            (EXTRACT(DOY FROM ${dt_status_raw}) = EXTRACT(DOY FROM GETDATE())))  ;;
  link: {label: "Documentação - Data da Etapa"
  url:"https://pravaler.atlassian.net/wiki/spaces/IDD/pages/724533442/JORNADA+DT+STATUS"}
  description: "Este campo é uma regra de negócio*. Use esse campo em conjunto com o campo de Etapa, para realizar análises entre anos diferentes usando como base o dia do ano da data corrente."
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
    description: "Etapas da esteira de contratação do Pravaler"
    link: {label:"Documentação - Etapa"
    url:"https://pravaler.atlassian.net/wiki/spaces/IDD/pages/741638196/ETAPA"}
    order_by_field: ordem_etapa
  }




  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    value_format: "0"
    group_label: "Dados do Aluno"
    group_item_label: "ID CPF do Aluno"
    description: "Indica o ID do CPF correspondente ao CPF do aluno"

  }


  dimension: aluno_cpf {
    type: number
    sql: ${dim_cpf.cpf} ;;
    group_label: "Dados do Aluno"
    group_item_label: "CPF"
    value_format: "0"
    description: "Indica o CPF do aluno"
  }


  dimension: email_aluno{
    type: string
    sql: ${dim_cpf.email} ;;
    group_label: "Dados do Aluno"
    group_item_label: "E-mail "
    description: "Indica o e-mail do aluno"
  }

  dimension: nome_aluno {
    type: string
    sql: ${dim_cpf.nome} ;;
    group_label: "Dados do Aluno"
    group_item_label: "Nome"
    description: "Indica o Nome do aluno"
  }

  dimension: celular_aluno {
    type: number
    sql: ${dim_cpf.celular} ;;
    group_label: "Dados do Aluno"
    group_item_label: "Celular"
    description: "Indica o celular do aluno"
  }


  dimension: cpf_aluno_proposta {
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
    hidden: yes
    group_item_label: "Proposta Atual?"
    description: "Indica se é a proposta atual do aluno. Ou seja a última com alteração de status (Sim - Não)"
  }


  dimension: flg_continuacao{
    type: yesno
    sql: ${TABLE}."FLG_CONTINUACAO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Proposta de Continuação?"
    description: "Este campo é uma regra de negócio*. Indica se é a proposta é continuação de uma proposta anterior ou não"
    link: {label:"Documentação - Proposta de Continuação"
      url:"https://pravaler.atlassian.net/wiki/spaces/IDD/pages/720240983"}
  }


  dimension: semestre_financiamento {
    type: string
    sql: ${TABLE}."SEMESTRE_FINANCIAMENTO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Semestre Financiado"
    hidden: yes
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
    description: "Este campo é uma regra de negócio*. Indica o tipo da proposta (ex. Novo, Renovação)"
    link: {label:"Documentação - Tipo de Proposta"
      url:"https://pravaler.atlassian.net/wiki/spaces/IDD/pages/789577836/TIPO+DE+PROPOSTA"}
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

  dimension: wtd_only_inicio {
    group_label: "Filtros para Análise de Períodos"
    label: "Week to Date - Data de Início da Proposta"
    type: yesno
    sql:  (EXTRACT(DOW FROM ${data_inicio_da_proposta_raw}) < EXTRACT(DOW FROM GETDATE())
                OR
          (EXTRACT(DOW FROM ${data_inicio_da_proposta_raw}) = EXTRACT(DOW FROM GETDATE())))  ;;
    description: "Use esse campo, em conjunto com o campo de Data de Início da Proposta, para realizar análises entre semanas diferentes usando como base o dia da semana da data corrente."
  }

  dimension: mtd_only_inicio {
    group_label: "Filtros para Análise de Períodos"
    label: "Month to Date - Data de Início da Proposta"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${data_inicio_da_proposta_raw}) < EXTRACT(DAY FROM GETDATE())
                OR
          (EXTRACT(DAY FROM ${data_inicio_da_proposta_raw}) = EXTRACT(DAY FROM GETDATE())))  ;;
    description: "Use esse campo, em conjunto com o campo de Data de Início da Proposta, para realizar análises entre meses diferentes usando como base o dia do mês da data corrente."
  }

  dimension: ytd_only_inicio {
    group_label: "Filtros para Análise de Períodos"
    label: "Year to Date - Data de Início da Proposta"
    type: yesno
    sql:  (EXTRACT(DOY FROM ${data_inicio_da_proposta_raw}) < EXTRACT(DOY FROM GETDATE())
                OR
            (EXTRACT(DOY FROM ${data_inicio_da_proposta_raw}) = EXTRACT(DOY FROM GETDATE())))  ;;
    description: "Use esse campo, em conjunto com o campo de Data de Início da Proposta, para realizar análises entre anos diferentes usando como base o dia do ano da data corrente."
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
    label: "Data do Último Status"
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
    link: { label:"Documentação - Último Status da Proposta"
      url:"https://pravaler.atlassian.net/wiki/spaces/IDD/pages/756514819/LTIMO+STATUS+DA+PROPOSTA"}
    description: "Este campo é uma regra de negócio*. Indica a última alteração de status que a proposta teve"

  }

  dimension: ultimo_status_geral {
    type: number
    sql: ${TABLE}."ULT_STATUS_GERAL" ;;
    group_label: "Telemetria"
    group_item_label: "Último Status da Proposta - Geral"
    link: { label:"Documentação - Último Status da Proposta"
      url:"https://pravaler.atlassian.net/wiki/spaces/IDD/pages/756514819/LTIMO+STATUS+DA+PROPOSTA"}
    description: "Este campo é uma regra de negócio*. Indica a última alteração de status que a proposta teve, somente com o status pai"

  }

  dimension: tempo_no_status {
    type: number
    sql: datediff('day',${data_ultimo_status_raw},current_date) ;;
    group_label: "Telemetria"
    group_item_label: "Tempo no Último Status"
    description: "Indica a quantidade de dias que o aluno está parado no último status."
    drill_fields: [id_proposta,id_cpf,etapa_ultimo_status]
  }


  dimension: tempo_no_status_hora {
    type: number
    sql: datediff('hour',${data_ultimo_status_raw},current_date) ;;
    group_label: "Telemetria"
    group_item_label: "Horas no Status"
    description: "Indica quantas horas o aluno está no mesmo status"
    hidden: yes
  }

  dimension: grupo_status_renovacao {
    type: string
    sql: ${TABLE}."GRUPO" ;;
    group_label: "Telemetria"
    group_item_label: "Descrição Grupo do Status de Renovação"
    description: "Descrição Grupo do Status de Renovação"
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
    group_item_label: "Faixa de Tempo no Último Status"
    description: "Indica a faixa de tempo, em dias, que o aluno está no último status."
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
    hidden: yes
    sql: CAST(${ordem_etapa_funil} AS INT) ;;

  }

  dimension: ordem_etapa_funil {
    type: string
    case: {
      when: {
        sql: ${etapa} = 'Lead' ;;
        label: "0"
      }
      when: {
        sql: ${etapa} = 'Elegivel' ;;
        label: "0"
      }

      when: {
        sql: ${etapa} = 'Simulado' ;;
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
        label: "5"
      }
      when: {
        sql: ${etapa} = 'Aprovado Instituicao' ;;
        label: "6"
      }

      when: {
        sql: ${etapa} = 'Contrato Gerado';;
        label: "8"
      }

      when: {
        sql: ${etapa} = 'Aguardando Documento';;
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
        sql: ${etapa} = 'Formalizado' ;;
        label: "12"
      }
      when: {
        sql: ${etapa} = 'Cedido';;
        label: "13"
      }
      else: "14"
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
        sql: ${ultimo_status_detalhado} in ('40.13') ;;
        label: "Aguardando envio de documento"
      }

      when: {
        sql: ${ultimo_status_detalhado} in ('40.5') ;;
        label: "Aguardando assinatura"
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
        sql: ${ultimo_status_geral} in (2011,2013,2014,2015) ;;
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
        sql: ${ultimo_status_detalhado} in ('2044.13') ;;
        label: "Aguardando envio de documento"
      }
      when: {
        sql: ${ultimo_status_detalhado} in ('2044.5') ;;
        label: "Aguardando assinatura"
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
        sql: ${etapa_ultimo_status_renovacao} = 'Aguardando documentos' ;;
        label: "5"
      }

      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Contratos Gerados' ;;
        label: "6"
      }
      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Aguardando assinatura' ;;
        label: "6"
      }
      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Formalizado' ;;
        label: "7"
      }
      when: {
        sql: ${etapa_ultimo_status_renovacao} = 'Cedido';;
        label: "8"
      }
      else: "0"
    }
  group_label: "Telemetria"
  label: "Ordem - Última Etapa (Renovação)"
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
    hidden: yes
  }


  dimension: faixa_tempo_sla_finalizado2 {
    type: string
    group_label: "Telemetria"
    label: "SLA de Finalizado - Faixa de Tempo"
    case: {
      when: {
        sql: ${jornada_pivot.sla_fin_novos} = '0' ;;
        label: "0"
      }
      else: "0 >"
    }
    hidden: yes
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

  dimension_group: dt_referencia {
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
    sql: ${TABLE}."DT_CESSAO" ;;
    label: "Data Prevista da Cessão"
    description: "Data prevista da cessão quando o aluno passou pela determinada etapa, conforme calendário operacional"
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

  measure: aguardando_documento_contrato {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Aguardando Documento"
    }
    filters: {
      field: tipo_proposta
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Aguardando Documento"
    drill_fields: [id_cpf, id_proposta]
    description: "Soma de todos os alunos novos que passaram pela etapa Aguardando Documento"
  }



  measure: aguardando_assinatura_contrato {
    type: sum
    sql: ${status_etapa} ;;
    filters: {
      field: etapa
      value: "Aguardando Assinatura"
    }
    filters: {
      field: tipo_proposta
      value: "NOVO"
    }
    group_label: "Etapa - Aluno Novo"
    group_item_label: "Aguardando Assinatura"
    drill_fields: [id_cpf, id_proposta]
    description: "Soma de todos os alunos novos que passaram pela etapa Aguardando Assinatura"
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
    drill_fields: [id_cpf, cpf_aluno_proposta,id_proposta,etapa,status_etapa,data_inicio_da_proposta_date,data_ultimo_status_date]
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
    drill_fields: [cpf_aluno_proposta, aluno_nome, id_proposta,
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
    sql: ${count_cpf} ;;
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
    group_item_label: "Tempo no Último Status - Média"
    value_format: "0"
    drill_fields: [detail*]
    description: "Media de tempo no status atual."
  }


  measure: tempo_status_median {
    type: median
    sql: ${tempo_no_status} ;;
    group_item_label: "Tempo no Último Status - Mediana"
    value_format: "0"
    drill_fields: [detail*]
    description: "Mediana de tempo no status atual."
  }

  measure: tempo_status_hora {
    type: average
    sql: ${tempo_no_status_hora} ;;
    drill_fields: [detail*]
    group_label: "Tempo no Status Atual"
    group_item_label: "Horas"
    value_format: "0"
    description: "Média de horas no status"
    hidden: yes
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


  measure: aprovacao_instituicao_novos_media {
    type: average
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_apr_ies_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "4. Aprovação da Instituição - Média"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,finalizar_proposta_novos]
    description: "Media do tempo entre o aluno ser aprovado por risco e ser aprovado pela instituição"
  }

  measure: aguardando_documento_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_agu_doc_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "5. Aguardando Documento"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,aguardando_documento_novos]
    description: "Mediana do tempo entre o aluno ser aprovado pela instituição e aguardar o envio dos documentos pendentes."
  }


  measure: agu_assinatura_contrato_novos {
    type: median
    sql_distinct_key: ${id_proposta} ;;
    sql: ${jornada_pivot.sla_agu_ass_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "7. Aguardando Assinatura de Contrato"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,agu_assinatura_contrato_novos]
    description: "Mediana do tempo entre o aluno ter o contrato gerado e aguardar o contrato ser assinado"
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
    sql: coalesce(${iniciar_proposta_novos},0)+
     coalesce(${finalizar_proposta_novos},0)+
    coalesce(${mesa_risco_novos},0)+coalesce(${aprovacao_instituicao_novos},0)+
    coalesce(${aguardando_documento_novos},0)+
    coalesce(${agu_assinatura_contrato_novos},0)+
    coalesce(${formalizacao_novos},0)+
    coalesce(${cessao_novos},0);;

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


  measure: sla_apr_ies_renov_media {
    type: average
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_apr_ies_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação | Média"
    group_item_label: "3. Aprovação da Instituição"
    value_format: "0"
    description: "Media do tempo entre o aluno ser aprovado no behavior e ser aprovado pela instituição"
    hidden: yes
  }
  measure: sla_agu_doc_renov {
    type: median
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_agu_doc_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "4. Aguardando Documento"
    value_format: "0"
    description: "Mediana do tempo entre o aluno ser aprovado pela instituição e aguardar o envio dos documentos"
  }

  measure: sla_agu_ass_renov {
    type: median
    sql_distinct_key: ${id_proposta};;
    sql: ${jornada_pivot.sla_agu_ass_renov} ;;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "6. Aguardando Assinatura de Contrato"
    value_format: "0"
    description: "Mediana do tempo entre o aluno ter o contrato gerado e aguardar a assinatura do contrato"
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
     ${sla_agu_doc_renov}+
    ${sla_agu_ass_renov}
    ${sla_form_renov}+${sla_ced_renov};;
    drill_fields: [detail*]
    group_label: "Tempo de Jornada - Renovação"
    group_item_label: "Total - Tempo de Jornada do Aluno de Renovação"
    value_format: "0"
    description: "Soma da mediana do tempo de todas as etapas do aluno de renovação durante o processo de contratação no PRAVALER"
  }
dimension: url {
  type: string
  group_label: "Atribuição"
  group_item_label: "URL"
  description: "Primeira URL da proposta/lead"
  sql: ${TABLE}."URL" ;;
}

  dimension: canal {
    type: string
    group_label: "Atribuição"
    group_item_label: "Canal"
    description: "Primeiro Canal da proposta referente a URL de entrada do aluno"
    sql: ${TABLE}."CANAL" ;;
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

dimension: flg_d1 {
  type:  yesno
  sql: ${dt_status_date} < current_date;;
  description: "Flag de D-1"
  group_item_label: "Flag D-1"
  hidden:  yes
}

  dimension_group: dt_segundo_repasse {
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
    sql: ${TABLE}."DT_SEGUNDO_REPASSE" ;;
    label: "Data Segundo Repasse"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Segundo Repasse"
    hidden: yes
  }

  measure: avg_segundo_repasse {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_segundo_repasse_date}) ;;
    label: "Média de dias até o Segundo Repasse"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Segundo Repasse"
  }

  dimension_group: dt_aguardando_cessao {
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
    sql: ${TABLE}."DT_AGUARDANDO_CESSAO" ;;
    label: "Data Aguardando Cessão"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aguardnado Cessão"
    hidden: yes
  }

  measure: avg_aguardando_cessao {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aguardando_cessao_date}) ;;
    label: "Média de dias até o Aguardnado Cessão"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aguardnado Cessão"
  }

  dimension_group: dt_cedido {
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
    sql: ${TABLE}."DT_CEDIDO" ;;
    label: "Data Cedido"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Cedido"
    hidden: yes
  }

  measure: avg_cedido {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_cedido_date}) ;;
    label: "Média de dias até o Cedido"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Cedido"
  }

  dimension_group: dt_cancelado {
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
    sql: ${TABLE}."DT_CANCELADO" ;;
    label: "Data Cancelado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Cancelado"
    hidden: yes
  }

  measure: avg_cancelado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_cancelado_date}) ;;
    label: "Média de dias até a etapa Cancelado"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Cancelado"
  }

  dimension_group: dt_cadastro_finalizado {
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
    sql: ${TABLE}."DT_CADASTRO_FINALIZADO" ;;
    label: "Data Cadastro Finalizado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Cadastro Finalizado"
    hidden: yes
  }

  measure: avg_cadastro_finalizado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_cadastro_finalizado_date}) ;;
    label: "Média de dias até a etapa Cadastro Finalizado"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Cadastro Finalizado"
  }

  dimension_group: dt_elegivel {
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
    sql: ${TABLE}."DT_ELEGIVEL" ;;
    label: "Data Elegivel"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Elegível"
    hidden: yes
  }

  measure: avg_elegivel {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_elegivel_date}) ;;
    label: "Média de dias até a etapa Elegível"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de ELegível"
  }

  dimension_group: dt_aprovado_risco {
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
    sql: ${TABLE}."DT_APROVADO_RISCO" ;;
    label: "Data Aprovado Risco"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aprovado Risco"
    hidden: yes
  }

  measure: avg_aprovado_risco {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aprovado_risco_date}) ;;
    label: "Média de dias até a etapa Aprovado Risco"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aprovado Risco"
  }

  dimension_group: dt_formalizado {
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
    sql: ${TABLE}."DT_FORMALIZADO" ;;
    label: "Data Formalizado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Formalizado"
    hidden: yes
  }

  measure: avg_Formalizado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_formalizado_date}) ;;
    label: "Média de dias até a etapa Formalizado"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Formalizado"
  }

  dimension_group: dt_aprovado_behavior {
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
    sql: ${TABLE}."DT_APROVADO_BEHAVIOR" ;;
    label: "Data Aprovado Behavior"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aprovado Behavior"
    hidden: yes
  }

  measure: avg_Aprovado_Behavior {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aprovado_behavior_date}) ;;
    label: "Média de dias até a etapa Aprovado Behavior"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aprovado Behavior"
  }

  dimension_group: dt_aguardando_assinatura {
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
    sql: ${TABLE}."DT_AGUARDANDO_ASSINATURA" ;;
    label: "Data Aguardando Assinatura"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aguardando Assinatura"
    hidden: yes
  }

  measure: avg_aguardando_assinatura {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aguardando_assinatura_date}) ;;
    label: "Média de dias até a etapa Aguardando Assinatura"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aguardando Assinatura"
  }

  dimension_group: dt_iniciado_elegivel {
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
    sql: ${TABLE}."DT_INICIADO_ELEGIVEL" ;;
    label: "Data Iniciado / Elegível"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Iniciado / Elegível"
    hidden: yes
  }

  measure: avg_iniciado_elegivel {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_iniciado_elegivel_date}) ;;
    label: "Média de dias até a etapa Iniciado / Elegível"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Iniciado / Elegível"
  }

  dimension_group: dt_iniciado {
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
    sql: ${TABLE}."DT_INICIADO" ;;
    label: "Data Iniciado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Iniciado"
    hidden: yes
  }

  measure: avg_dt_iniciado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_iniciado_date}) ;;
    label: "Média de dias até a etapa Iniciado"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Iniciado"
  }

  dimension_group: dt_aguardando_documento {
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
    sql: ${TABLE}."DT_AGUARDANDO_DOCUMENTO" ;;
    label: "Data Aguardando Documento"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aguardando Documento"
    hidden: yes
  }

  measure: avg_aguardando_documento {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aguardando_documento_date}) ;;
    label: "Média de dias até a etapa Aguardando Documento"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aguardando Documento"
  }


  dimension_group: dt_lead {
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
    sql: ${TABLE}."DT_LEAD" ;;
    label: "Data Lead"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Lead"
    hidden: yes
  }

  measure: avg_Lead {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_lead_date}) ;;
    label: "Média de dias até a etapa Lead"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Lead"
  }

  dimension_group: dt_aguardando_documentos {
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
    sql: ${TABLE}."DT_AGUARDANDO_DOCUMENTOS" ;;
    label: "Data Aguardando Documentos"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aguardando Documentos"
    hidden: yes
  }

  measure: avg_aguardando_documentos {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aguardando_documentos_date}) ;;
    label: "Média de dias até a etapa Aguardando Documentos"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aguardando Documentos"
  }

  dimension_group: dt_aprovado_instituicao {
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
    sql: ${TABLE}."DT_APROVADO_INSTITUICAO" ;;
    label: "Data Aprovado Instituição"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aprovado Instituição"
    hidden: yes
  }

  measure: avg_aprovado_instituicao {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aprovado_instituicao_date}) ;;
    label: "Média de dias até a etapa Aprovado Instituição"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aprovado Instituição"
  }

  dimension_group: dt_simulado {
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
    sql: ${TABLE}."DT_SIMULADO" ;;
    label: "Data Simulado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Simulado"
    hidden: yes
  }

  measure: avg_simulado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_simulado_date}) ;;
    label: "Média de dias até a etapa Simulado"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Simulado"
  }

  dimension_group: dt_finalizado {
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
    sql: ${TABLE}."DT_FINALIZADO" ;;
    label: "Data Finalizado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Finalizado"
    hidden: yes
  }

  measure: avg_finalizado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_finalizado_date}) ;;
    label: "Média de dias até a etapa Finalizado"
    group_label: "Média de dias por Etapa"
    description: "Média em dias da diferença entre o início da proposta até a etapa de Finalizado"
  }

  set: detail {
    fields: [
      id_cpf,
      cpf_aluno_proposta,
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
