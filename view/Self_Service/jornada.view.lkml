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
      day_of_month,
      week_of_year
    ]
    sql: ${TABLE}."DT_STATUS" ;;
    label: "Etapa"
    description: "Este campo é uma regra de negócio*. Data em que o aluno passou pela etapa. Esse campo pode ser utilizado como filtro para visualizar o funil completo, ou seja, acompanhar todas as propostas no funil em um determinado momento"
  }

  parameter: timeframe_picker {
    type: unquoted
    hidden:  yes
    default_value: "week"
    allowed_value: {
      value: "date"
    }
    allowed_value: {
      value: "week"
    }
    allowed_value: {
      value: "month"
    }
  }

  dimension: date {
    hidden: yes
    sql:
    {% if timeframe_picker._parameter_value == 'date' %}
      ${dt_status_date}
    {% elsif timeframe_picker._parameter_value == 'month' %}
      ${dt_status_month}
    {% elsif timeframe_picker._parameter_value == 'week' %}
      ${dt_status_week}
    {% else %}
      ${dt_status_date}
    {% endif %};;
    label: "data teste"
    #type: date
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
    description: "Etapas da esteira de contratação do Pravaler. Deve ser usado com o campo Status Etapa para identificar por quais o aluno já passou."
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

  dimension: cpf_aluno_ajustado {
    type: string
    group_label: "Dados do Aluno"
    label: "CPF do Aluno Ajustado"
    description: "Indica o CPF do Aluno, com o formato padrão de 11 dígitos"
    sql: cast(right(concat('000000',${aluno_cpf}),11) AS VARCHAR) ;;
    required_access_grants: [grupo_cpf]
  }


  dimension: cpf_hash {
    type: string
    sql: md5(CONCAT('IYwAR6jHKzAq',${cpf_aluno_ajustado})) ;;
    group_label: "Dados do Aluno"
    label: "CPF Criptografado (MD5)"
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
    value_format: "0"
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



  dimension: id_proposta {
    type: string
    primary_key: yes
    sql: ${TABLE}."ID_PROPOSTA" ;;
    group_label: "Dados da Proposta"
    group_item_label: "ID Proposta"
    description: "Número de identificação da proposta"
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




  dimension: status_etapa {
    type: number
    sql: ${TABLE}."STATUS_ETAPA" ;;
    group_label: "Dados da Etapa"
    group_item_label: "Status Etapa"
    description: "Indica se o aluno passou pela etapa ou não. 1 = Sim; 0 = Não. Deve ser usado junto ao campo de Etapa."
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
      month_num,
      week_of_year
    ]
    sql: ${TABLE}."DATA_INICIO_PROPOSTA" ;;
    label: "Início da Proposta"
    description: "Esse campo pode ser utilizado como filtro para visualizar o funil safrado, ou seja, acompanhar a jornada por proposta"
  }

  dimension_group: data_elegivel {
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
      month_num,
      week_of_year
    ]
    sql: ${TABLE}."DT_ELEGIVEL" ;;
    label: "Elegíbilidade"
    description: "Esse campo pode ser utilizado como filtro para visualizar o funil safrado, ou seja, acompanhar a jornada por proposta de renovação"
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

  dimension: ytd_only_apr_behavior {
    group_label: "Filtros para Análise de Períodos"
    label: "Year to Date - Data de Aprovado Behavior"
    type: yesno
    sql:  (EXTRACT(DOY FROM ${dt_aprovado_behavior_raw}) < EXTRACT(DOY FROM GETDATE())
                OR
            (EXTRACT(DOY FROM ${dt_aprovado_behavior_raw}) = EXTRACT(DOY FROM GETDATE())))  ;;
    description: "Use esse campo, em conjunto com o campo de Data de Aprovado Behavior, para realizar análises entre anos diferentes usando como base o dia do ano da data corrente."
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
        sql: ${ultimo_status_detalhado} in ('2019.1', '2019.10', '2019.12', '2019.3') ;;
        label: "Reprovado por Risco"
      }
      when: {
        sql: ${ultimo_status_detalhado} in ('2019.15') ;;
        label: "Reprovado por duas ou mais parcelas em atraso"
      }
      when: {
        sql: ${ultimo_status_detalhado} in ('2019.15','2019.16') ;;
        label: "Reprovado Behavior"
      }
      when: {
        sql: ${ultimo_status_detalhado} in ('2019.13','2019.18', '2019.19') ;;
        label: "Reprovado BV"
      }

      when: {
        sql: ${ultimo_status_detalhado} in ('2039.1', '101.0') ;;
        label: "Formado"
      }
      when: {
        sql: ${ultimo_status_detalhado} in ('102.0','2009.0',
        '2029.1','2046.2','2048.0','2048.1','2058.0') ;;
        label: "Não Renovado"
      }
      when: {
        sql: ${ultimo_status_detalhado} in ('2040.0','2042.1','2042.2','2042.3',
        '2044.1','2044.13'
) ;;
        label: "Pendente de Renovação - Pravaler"
      }
      when: {
        sql: ${ultimo_status_geral} in (2039) ;;
        label: "Reprovado pela IES"
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
        #sql: ${jornada_pivot.sla_ini_novos} = '0' ;;
        sql: ${sla_ini_novos} = '0' ;;
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
        #sql: ${jornada_pivot.sla_fin_novos} = '0' ;;
        sql: ${sla_fin_novos} = '0' ;;
        label: "0"
      }
      else: "0 >"
    }
    hidden: yes
  }

  dimension: dias_iniciar_proposta_novos {
    type: number
    #sql: ${jornada_pivot.sla_ini_novos} ;;
    sql: ${sla_ini_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "1. Iniciar Proposta"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date]
    description: "Diferença de dias entre o aluno ser lead e iniciar uma proposta"
    hidden: yes

  }


  dimension: dias_finalizar_proposta_novos {
    type: number
    #sql: ${jornada_pivot.sla_fin_novos} ;;
    sql: ${sla_fin_novos} ;;
    group_label: "Tempo de Jornada - Novos"
    group_item_label: "1. Iniciar Proposta"
    value_format: "0"
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date]
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
    hidden: yes
  }

dimension: url {
  type: string
  group_label: "Dados de Primeiro Canal"
  group_item_label: "URL"
  description: "Primeira URL da proposta/lead"
  sql: ${TABLE}."URL" ;;
  hidden:  no
}

  dimension: id_url {
    type: string
    group_label: "Dados de Primeiro Canal"
    group_item_label: "ID_URL"
    description: "ID da Primeira URL da proposta/lead"
    sql: ${TABLE}."ID_URL" ;;
    hidden:  no
  }

  dimension: canal {
    type: string
    group_label: "Dados de Primeiro Canal"
    group_item_label: "Canal"
    description: "Primeiro Canal da proposta referente a URL de entrada do aluno"
    sql: ${TABLE}."CANAL" ;;
    hidden:  no
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
      year,
      month_num
    ]
    sql: ${TABLE}."DT_SEGUNDO_REPASSE" ;;
    label: "Data Segundo Repasse"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Segundo Repasse"

  }

  measure: avg_segundo_repasse {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_segundo_repasse_date}) ;;
    label: "Segundo Repasse"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Segundo Repasse"
    value_format: "0"
  }

  dimension_group: dt_aguardando_cessao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_AGUARDANDO_CESSAO" ;;
    label: "Data Aguardando Cessão"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aguardnado Cessão"

  }

  measure: avg_aguardando_cessao {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aguardando_cessao_date}) ;;
    label: "Cessão"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aguardando Cessão"
    value_format: "0"
  }

  dimension_group: dt_cedido {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_CEDIDO" ;;
    label: "Data Cedido"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Cedido"

  }

  measure: avg_cedido {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_cedido_date}) ;;
    label: "Cedido"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Cedido"
    value_format: "0"
  }

  dimension_group: dt_cancelado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_CANCELADO" ;;
    label: "Data Cancelado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Cancelado"

  }

  measure: avg_cancelado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_cancelado_date}) ;;
    label: "Cancelado"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Cancelado"
    value_format: "0"
  }

  dimension_group: dt_cadastro_finalizado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_CADASTRO_FINALIZADO" ;;
    label: "Data Cadastro Finalizado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Cadastro Finalizado"

  }

  measure: avg_cadastro_finalizado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_cadastro_finalizado_date}) ;;
    label: "Cadastro Finalizado"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Cadastro Finalizado"
    value_format: "0"
  }

  dimension_group: dt_elegivel {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_ELEGIVEL" ;;
    label: "Data Elegivel"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Elegível"

  }

  measure: avg_elegivel {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_elegivel_date}) ;;
    label: "Elegível"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de ELegível"
    value_format: "0"
  }

  dimension_group: dt_aprovado_risco {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_APROVADO_RISCO" ;;
    label: "Data Aprovado Risco"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aprovado Risco"

  }

  measure: avg_aprovado_risco {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aprovado_risco_date}) ;;
    label: "Aprovado Risco"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aprovado Risco"
    value_format: "0"
  }

  dimension_group: dt_formalizado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_FORMALIZADO" ;;
    label: "Data Formalizado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Formalizado"

  }

  measure: avg_Formalizado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_formalizado_date}) ;;
    label: "Formalizado"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Formalizado"
    value_format: "0"
  }

  dimension_group: dt_aprovado_behavior {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num,
      month_name
    ]
    sql: ${TABLE}."DT_APROVADO_BEHAVIOR" ;;
    label: "Data Aprovado Behavior"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aprovado Behavior"

  }

  dimension: ciclo_aprov_behavior {
    type: string
    group_label: "Dados de Renovação"
    hidden: no
    group_item_label: "Ciclo de Renovação (Aprov Behavior)"
    description: "Informa o ciclo da proposta de renovação do aluno de acordo com a data de Aprovação Behavior"
    sql: case when ${dt_aprovado_behavior_date} between '2021-06-01' and '2021-10-31' then '2021.2'
              when ${dt_aprovado_behavior_date} between '2021-11-01' and '2022-05-31' then '2022.1'
              when ${dt_aprovado_behavior_date} between '2022-06-01' and '2022-10-31' then '2022.2'
              else 'Outro' end;;
  }

  measure: avg_Aprovado_Behavior {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aprovado_behavior_date}) ;;
    label: "Aprovado Behavior"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aprovado Behavior"
    value_format: "0"
  }

  dimension_group: dt_aguardando_assinatura {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num,
      month_name,
      day_of_month,
      day_of_week,
      week_of_year
    ]
    sql: ${TABLE}."DT_AGUARDANDO_ASSINATURA" ;;
    label: "Data Aguardando Assinatura"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aguardando Assinatura"

  }

  measure: avg_aguardando_assinatura {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aguardando_assinatura_date}) ;;
    label: "Aguardando Assinatura"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aguardando Assinatura"
    value_format: "0"
  }

  dimension_group: dt_iniciado_elegivel {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_INICIADO_ELEGIVEL" ;;
    label: "Data Iniciado / Elegível"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Iniciado / Elegível"

  }

  measure: avg_iniciado_elegivel {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_iniciado_elegivel_date}) ;;
    label: "Iniciado / Elegível"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Iniciado / Elegível"
    value_format: "0"
  }

  dimension_group: dt_iniciado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_INICIADO" ;;
    label: "Data Iniciado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Iniciado"

  }

  measure: avg_dt_iniciado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_iniciado_date}) ;;
    label: "Iniciado"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Iniciado"
    value_format: "0"
  }

  dimension_group: dt_aguardando_documento {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_AGUARDANDO_DOCUMENTO" ;;
    label: "Data Aguardando Documento"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aguardando Documento"

  }

  measure: avg_aguardando_documento {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aguardando_documento_date}) ;;
    label: "Aguardando Documento"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aguardando Documento"
    value_format: "0"
  }


  dimension_group: dt_lead {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_LEAD" ;;
    label: "Data Lead"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Lead"

  }

  measure: avg_Lead {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_lead_date}) ;;
    label: "Lead"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Lead"
    value_format: "0"
  }

  dimension_group: dt_aguardando_documentos {
    type: time
    timeframes: [
     raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_AGUARDANDO_DOCUMENTOS" ;;
    label: "Data Aguardando Documentos"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aguardando Documentos"

  }

  measure: avg_aguardando_documentos {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aguardando_documentos_date}) ;;
    label: "Aguardando Documentos"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aguardando Documentos"
    value_format: "0"
  }

  dimension_group: dt_aprovado_instituicao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_APROVADO_INSTITUICAO" ;;
    label: "Data Aprovado Instituição"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Aprovado Instituição"

  }

  measure: avg_aprovado_instituicao {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_aprovado_instituicao_date}) ;;
    label: "Aprovado Instituição"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Aprovado Instituição"
    value_format: "0"
  }

  dimension_group: dt_simulado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num
    ]
    sql: ${TABLE}."DT_SIMULADO" ;;
    label: "Data Simulado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Simulado"

  }

  measure: avg_simulado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_simulado_date}) ;;
    label: "Simulado"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Simulado"
    value_format: "0"
  }

  dimension_group: dt_finalizado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      year,
      month_num,
      day_of_month
    ]
    sql: ${TABLE}."DT_FINALIZADO" ;;
    label: "Data Finalizado"
    group_label: "Última Data das Etapas"
    description: "Ultima data que a proposta passou pela etapa de Finalizado"

  }

  measure: avg_finalizado {
    type: average
    sql: datediff(day, ${data_inicio_da_proposta_date}, ${dt_finalizado_date}) ;;
    label: "Finalizado"
    group_label: "Média de dias até a Etapa"
    hidden: yes
    description: "Média em dias da diferença entre o início da proposta até a etapa de Finalizado"
    value_format: "0"
  }


  dimension: sla_lead_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND ((datediff(day,${dt_lead_raw} , ${dt_simulado_raw}) < 0
                   or ${dt_lead_raw} is null or ${dt_simulado_raw} is null))
              then null
              else datediff(day,${dt_lead_raw} , ${dt_simulado_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }





  dimension: sla_ini_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND ((datediff(day,${dt_simulado_raw} , ${dt_iniciado_raw}) < 0
                   or ${dt_simulado_raw} is null or ${dt_iniciado_raw} is null))
              then null
              else datediff(day,${dt_simulado_raw} , ${dt_iniciado_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_fin_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${dt_iniciado_raw} , ${dt_finalizado_raw}) < 0)
                  -- or ${dt_iniciado_raw} is null or ${dt_finalizado_raw} is null)
              then null
              else datediff(day,${dt_iniciado_raw}
              , coalesce(${dt_finalizado_raw},${dt_iniciado_raw}) )
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_apr_risco_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,coalesce(${dt_finalizado_raw},${dt_iniciado_raw}) , ${dt_aprovado_risco_raw}) < 0)
                  -- or ${dt_finalizado_raw} is null or ${dt_aprovado_risco_raw} is null)
              then null
              else datediff(day,coalesce(${dt_finalizado_raw},${dt_iniciado_raw})
              , coalesce(${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}))
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_apr_ies_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,coalesce(${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}),${dt_aprovado_instituicao_raw}) < 0)
                   --or ${dt_aprovado_risco_raw} is null or ${dt_aprovado_instituicao_raw} is null)
              then null
              else datediff(day,coalesce(${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw})
              , coalesce(${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}))
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_agu_ass_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,coalesce(${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}),${dt_aguardando_assinatura_raw}) < 0)
                   --or ${dt_aprovado_instituicao_raw} is null or ${dt_aguardando_assinatura_raw} is null)
              then null
              else datediff(day,coalesce(${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw})
              ,coalesce(${dt_aguardando_assinatura_raw},${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}))
         end ;;

    #case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${dt_aguardando_documento_raw},${dt_aguardando_assinatura_raw}) < 0
    #               or ${dt_aguardando_documento_raw} is null or ${dt_aguardando_assinatura_raw} is null)
    #          then null
    #          else datediff(day,${dt_aguardando_documento_raw},${dt_aguardando_assinatura_raw})
    #     end ;;
      value_format: "0"
      hidden: yes
    }

  dimension: sla_agu_doc_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND
                  (datediff(day,coalesce(${dt_aguardando_assinatura_raw},${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}),${dt_aguardando_documento_raw}) < 0)
                   --or ${dt_aguardando_assinatura_raw} is null or ${dt_aguardando_documento_raw} is null)
              then null
              else datediff(day,coalesce(${dt_aguardando_assinatura_raw},${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw})
              ,coalesce(${dt_aguardando_documento_raw}, ${dt_aguardando_assinatura_raw},${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}))
         end ;;

   # case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${dt_aprovado_instituicao_raw},${dt_aguardando_documento_raw}) < 0
   #                or ${dt_aprovado_instituicao_raw} is null or ${dt_aguardando_documento_raw} is null)
   #           then null
   #           else datediff(day,${dt_aprovado_instituicao_raw},${dt_aguardando_documento_raw})
   #      end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_form_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,coalesce(${dt_aguardando_documento_raw}, ${dt_aguardando_assinatura_raw},${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}),${dt_formalizado_raw}) < 0)
                   --or ${dt_aguardando_documento_raw} is null or ${dt_formalizado_raw} is null)
              then null
              else datediff(day,coalesce(${dt_aguardando_documento_raw}, ${dt_aguardando_assinatura_raw},${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw})
              , coalesce(${dt_formalizado_raw},${dt_aguardando_documento_raw}, ${dt_aguardando_assinatura_raw},${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}))
         end ;;

       #case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${dt_aguardando_assinatura_raw},${dt_formalizado_raw}) < 0
       #           or ${dt_aguardando_assinatura_raw} is null or ${dt_formalizado_raw} is null)
       #      then null
       #      else datediff(day,${dt_aguardando_assinatura_raw},${dt_formalizado_raw})
       # end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_ced_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,coalesce(${dt_formalizado_raw},${dt_aguardando_documento_raw}, ${dt_aguardando_assinatura_raw},${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}),${dt_cedido_raw}) < 0)
                   --or ${dt_formalizado_raw} is null or ${dt_cedido_raw} is null)
              then null
              else datediff(day,coalesce(${dt_formalizado_raw},${dt_aguardando_documento_raw}, ${dt_aguardando_assinatura_raw},${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw})
              ,coalesce(${dt_cedido_raw},${dt_formalizado_raw},${dt_aguardando_documento_raw}, ${dt_aguardando_assinatura_raw},${dt_aprovado_instituicao_raw},${dt_aprovado_risco_raw},${dt_finalizado_raw},${dt_iniciado_raw}))
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_total_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${dt_iniciado_raw},${dt_cedido_raw}) < 0
                   or ${dt_iniciado_raw} is null or ${dt_cedido_raw} is null)
              then null
              else datediff(day,${dt_iniciado_raw},${dt_cedido_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

# Renovação
  dimension: sla_eleg_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(second,${dt_iniciado_raw} , ${dt_iniciado_elegivel_raw}) < 0
                   or ${dt_iniciado_raw} is null or ${dt_iniciado_elegivel_raw} is null)
              then null
              else datediff(second,${dt_iniciado_raw} , ${dt_iniciado_elegivel_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_beha_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(second,coalesce(${dt_iniciado_elegivel_raw},${dt_iniciado_raw})  , ${dt_aprovado_behavior_raw}) < 0)
                   --or ${dt_iniciado_elegivel_raw} is null or ${dt_aprovado_behavior_raw} is null)
              then null
              else datediff(second,coalesce(${dt_iniciado_elegivel_raw},${dt_iniciado_raw})
              ,coalesce(${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}))
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_apr_ies_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(second,coalesce(${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}) , ${dt_aprovado_instituicao_raw}) < 0)
                   --or ${dt_aprovado_behavior_raw} is null or ${dt_aprovado_instituicao_raw} is null)
              then null
              else datediff(second,coalesce(${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw})
              ,coalesce(${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}))
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_agu_ass_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(second,coalesce(${dt_aguardando_documento_raw},${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}),${dt_aguardando_assinatura_raw}) < 0)
                   --or ${dt_aprovado_instituicao_raw} is null or ${dt_aguardando_assinatura_raw} is null)
              then null
              else datediff(second,coalesce(${dt_aguardando_documento_raw},${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw})
              ,coalesce(${dt_aguardando_assinatura_raw},${dt_aguardando_documento_raw},${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}))
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_agu_doc_renov {
    type: number
    sql:  case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(second,coalesce(${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}),${dt_aguardando_documento_raw}) < 0)
                   --or ${dt_aguardando_assinatura_raw} is null or ${dt_aguardando_documento_raw} is null)
              then null
              else datediff(second,coalesce(${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw})
              ,coalesce(${dt_aguardando_documento_raw},${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}))
         end ;;

    #case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${dt_aprovado_instituicao_raw},${dt_aguardando_documento_raw}) < 0
    #               or ${dt_aprovado_instituicao_raw} is null or ${dt_aguardando_documento_raw} is null)
    #          then null
    #          else datediff(day,${dt_aprovado_instituicao_raw},${dt_aguardando_documento_raw})
    #     end ;;
    value_format: "0"
    hidden: yes
  }




  dimension: sla_form_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(second,coalesce(${dt_aguardando_assinatura_raw},${dt_aguardando_documento_raw},${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}),${dt_formalizado_raw}) < 0)
                   --or ${dt_aguardando_documento_raw} is null or ${dt_formalizado_raw} is null)
              then null
              else datediff(second,coalesce(${dt_aguardando_assinatura_raw},${dt_aguardando_documento_raw},${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw})
              ,coalesce(${dt_formalizado_raw},${dt_aguardando_assinatura_raw},${dt_aguardando_documento_raw},${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}))
         end ;;

       #case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${dt_aguardando_assinatura_raw},${dt_formalizado_raw}) < 0
       #           or ${dt_aguardando_assinatura_raw} is null or ${dt_formalizado_raw} is null)
       #      then null
       #      else datediff(day,${dt_aguardando_assinatura_raw},${dt_formalizado_raw})
       # end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_ced_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,coalesce(${dt_formalizado_raw},${dt_aguardando_assinatura_raw},${dt_aguardando_documento_raw},${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}),${dt_cedido_raw}) < 0)
                   --or ${dt_formalizado_raw} is null or ${dt_cedido_raw} is null)
              then null
              else datediff(day,coalesce(${dt_formalizado_raw},${dt_aguardando_assinatura_raw},${dt_aguardando_documento_raw},${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw})
              ,coalesce(${dt_cedido_raw},${dt_formalizado_raw},${dt_aguardando_assinatura_raw},${dt_aguardando_documento_raw},${dt_aprovado_instituicao_raw}, ${dt_aprovado_behavior_raw}, ${dt_iniciado_elegivel_raw},${dt_iniciado_raw}))
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_total_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${dt_iniciado_raw},${dt_cedido_raw}) < 0
                   or ${dt_iniciado_raw} is null or ${dt_cedido_raw} is null)
              then null
              else datediff(day,${dt_iniciado_raw},${dt_cedido_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }


  measure: mediana_iniciados_novos {
    type: median
    #sql_distinct_key: ${id_proposta} ;;
    #sql:${jornada_pivot.sla_ini_novos} ;;
    sql:${sla_ini_novos} ;;
    group_label: "Mediana do tempo de Jornada - Novos"
    group_item_label: "1. Lead até Iniciar Proposta"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,mediana_iniciados_novos]
    description: "Mediana do tempo entre o aluno ser lead e iniciar uma proposta"
  }

  measure: mediana_finalizado_novos {
    type: median
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_fin_novos} ;;
    sql: ${sla_fin_novos} ;;
    group_label: "Mediana do tempo de Jornada - Novos"
    group_item_label: "2. Iniciar Proposta até Finalizar Proposta"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,mediana_finalizado_novos]
    description: "Mediana do tempo entre o aluno iniciar e finalizar uma proposta"
  }


  measure: mediana_mesa_risco_novos{
    type: median
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_apr_risco_novos} ;;
    sql: ${sla_apr_risco_novos} ;;
    group_label: "Mediana do tempo de Jornada - Novos"
    group_item_label: "3. Finalizar Proposta até Aprovado Risco"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,mediana_mesa_risco_novos]
    description: "Mediana do tempo entre o aluno finalizar uma proposta e ser aprovado por risco"
  }

  measure: mediana_aprovado_instituicao_novos {
    type: median
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_apr_ies_novos} ;;
    sql: ${sla_apr_ies_novos} ;;
    group_label: "Mediana do tempo de Jornada - Novos"
    group_item_label: "4. Aprovado Risco até Aprovado Instituição"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,mediana_finalizado_novos]
    description: "Mediana do tempo entre o aluno ser aprovado por risco e ser aprovado pela instituição"
  }


  measure:mediana_aguard_doc_novos{
    type: median
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_agu_doc_novos} ;;
    sql: ${sla_agu_doc_novos} ;;
    group_label: "Mediana do tempo de Jornada - Novos"
    group_item_label: "5. Aprovado Instituição até Aguardando Documento"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,mediana_aguard_doc_novos]
    description: "Mediana do tempo entre o aluno ser aprovado pela instituição e aguardar o envio dos documentos pendentes."
  }


  measure: mediana_aguard_ass_ctt_novos {
    type: median
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_agu_ass_novos} ;;
    sql: ${sla_agu_ass_novos} ;;
    group_label: "Mediana do tempo de Jornada - Novos"
    group_item_label: "7. Aguardando Documento até Aguardando Assinatura"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,mediana_aguard_ass_ctt_novos]
    description: "Mediana do tempo entre o aluno ter o contrato gerado e aguardar o contrato ser assinado"
  }

  measure: mediana_formalizados_novos {
    type: median
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_form_novos} ;;
    sql: ${sla_form_novos} ;;
    group_label: "Mediana do tempo de Jornada - Novos"
    group_item_label: "8. Aguardando Assinatura até Formalizado"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,mediana_formalizados_novos]
    description: "Mediana do tempo entre o aluno ter seu contrato assinado e ter todos seus documentos aprovados pela formalização"
  }

  measure: mediana_cedidos_novos {
    type: median
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_ced_novos} ;;
    sql: ${sla_ced_novos} ;;
    group_label: "Mediana do tempo de Jornada - Novos"
    group_item_label: "9. Formalizado até Cedido"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,mediana_cedidos_novos]
    description: "Mediana do tempo entre o aluno estar formalizado e ser cedido"
  }


  measure: mediana_total_novos {
    type: number
    sql: coalesce(${mediana_iniciados_novos},0)+
           coalesce(${mediana_finalizado_novos},0)+
          coalesce(${mediana_mesa_risco_novos},0)+
          coalesce(${mediana_aprovado_instituicao_novos},0)+
          coalesce(${mediana_aguard_doc_novos},0)+
          coalesce(${mediana_aguard_ass_ctt_novos},0)+
          coalesce(${mediana_formalizados_novos},0)+
          coalesce(${mediana_cedidos_novos},0);;

      group_label: "Mediana do tempo de Jornada - Novos"
      group_item_label: "10. Tempo Total da Jornada do Aluno Novo"
      value_format: "0"
    hidden:  yes
      drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,data_ultimo_status_date,mediana_total_novos]
      description: "Soma da mediana do tempo de todas as etapas do aluno novo durante o processo de contratação no PRAVALER"
    }


      # Jornada Renovação
    measure: sla_eleg_renov2 {
      type: median
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_eleg_renov} ;;
      sql: coalesce(${sla_eleg_renov}/86400,0) ;;
      drill_fields: [detail*]
      group_label: "Mediana do Tempo de Jornada - Renovação"
      group_item_label: "1. Iniciar Proposta até Elegível"
      value_format: "0.0"
      description: "Mediana do tempo entre o aluno iniciar uma id_proposta e se tornar elegível"
    }

    measure: sla_beha_renov2 {
      type: median
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_beha_renov} ;;
      sql: coalesce(${sla_beha_renov}/86400,0) ;;
      drill_fields: [detail*]
      group_label: "Mediana do Tempo de Jornada - Renovação"
      group_item_label: "2. Elegível até Aprovado Behavior"
      value_format: "0.0"
      description: "Mediana do tempo entre o aluno ser elegível e ser aprovado no behavior"
    }
    measure: sla_apr_ies_renov2 {
      type: median
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_apr_ies_renov} ;;
      sql: coalesce(${sla_apr_ies_renov}/86400,0) ;;
      drill_fields: [detail*]
      group_label: "Mediana do Tempo de Jornada - Renovação"
      group_item_label: "3. Aprovado Behavior até Aprovado Instituição"
      value_format: "0.0"
      description: "Mediana do tempo entre o aluno ser aprovado no behavior e ser aprovado pela instituição"
    }


      measure: sla_agu_doc_renov2 {
      type: median
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_agu_doc_renov} ;;
      sql: ${sla_agu_doc_renov}/86400 ;;
      drill_fields: [detail*]
      group_label: "Mediana do Tempo de Jornada - Renovação"
      group_item_label: "4. Aprovado Instituição até Aguardando Documento"
      value_format: "0.0"
      description: "Mediana do tempo entre o aluno ser aprovado pela instituição e aguardar o envio dos documentos"
    }

    measure: sla_agu_ass_renov2 {
      type: median
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_agu_ass_renov} ;;
      sql: ${sla_agu_ass_renov}/86400 ;;
      drill_fields: [detail*]
      group_label: "Mediana do Tempo de Jornada - Renovação"
      group_item_label: "6. Aguardando Document até Aguardando Assinatura"
      value_format: "0.0"
      description: "Mediana do tempo entre o aluno ter o contrato gerado e aguardar a assinatura do contrato"
    }

    measure: sla_form_renov2 {
      type: median
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_form_renov} ;;
      sql: ${sla_form_renov}/86400 ;;
      drill_fields: [detail*]
      group_label: "Mediana do Tempo de Jornada - Renovação"
      group_item_label: "7. Aguardando Assinatura até Formalizado"
      value_format: "0.0"
      description: "Mediana do tempo entre o aluno ter seu contrato assinado e ter todos seus documentos aprovados pela formalização"
    }

    measure: sla_ced_renov2 {
      type: median
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_ced_renov} ;;
      sql: ${sla_ced_renov} ;;
      drill_fields: [detail*]
      group_label: "Mediana do Tempo de Jornada - Renovação"
      group_item_label: "8. Formalizado até Cedido"
      value_format: "0"
      description: "Mediana do tempo entre o aluno ter o contrado formalizado e cedido."
    }

    measure: median_total_renov {
      type: number
      sql: coalesce(${sla_eleg_renov},0)
          +coalesce(${sla_beha_renov},0)
          +coalesce(${sla_apr_ies_renov},0)
          +coalesce(${sla_agu_doc_renov},0)
          +coalesce(${sla_agu_ass_renov},0)
          +coalesce(${sla_form_renov},0)
          +coalesce(${sla_ced_renov},0);;
      drill_fields: [detail*]
      group_label: "Mediana do Tempo de Jornada - Renovação"
      group_item_label: "Tempo Total de Jornada do Aluno de Renovação"
      value_format: "0.0"
      description: "Soma da mediana do tempo de todas as etapas do aluno de renovação durante o processo de contratação no PRAVALER"
    }

  measure: media_iniciados_novos {
    type: average
    #sql_distinct_key: ${id_proposta} ;;
    #sql:${jornada_pivot.sla_ini_novos} ;;
    sql:${sla_ini_novos} ;;
    group_label: "Média do tempo de Jornada - Novos"
    group_item_label: "1. Lead até Iniciar Proposta"
    value_format: "0"
    hidden: yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_iniciados_novos]
    description: "Média do tempo entre o aluno ser lead e iniciar uma proposta"
  }

  measure: max_iniciados_novos {
    type: max
    #sql_distinct_key: ${id_proposta} ;;
    #sql:${jornada_pivot.sla_ini_novos} ;;
    sql:${sla_ini_novos} ;;
    group_label: "Máxima do tempo de Jornada - Novos"
    group_item_label: "1. Lead até Iniciar Proposta"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_iniciados_novos]
    description: "Maxima do tempo entre o aluno ser lead e iniciar uma proposta"
  }

  measure: min_iniciados_novos {
    type: min
    #sql_distinct_key: ${id_proposta} ;;
    #sql:${jornada_pivot.sla_ini_novos} ;;
    sql:${sla_ini_novos} ;;
    group_label: "Mínima do tempo de Jornada - Novos"
    group_item_label: "1. Lead até Iniciar Proposta"
    value_format: "0"
    hidden: yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_iniciados_novos]
    description: "Mínima do tempo entre o aluno ser lead e iniciar uma proposta"
  }

  measure: media_finalizados_novos {
    type: average
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_fin_novos} ;;
    sql: ${sla_fin_novos} ;;
    group_label: "Média do tempo de Jornada - Novos"
    group_item_label: "2. Iniciar Proposta até Finalizar Proposta"
    value_format: "0"
    hidden: yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_finalizados_novos]
    description: "Média do tempo entre o aluno iniciar e finalizar uma proposta"
  }

  measure: max_finalizados_novos {
    type: max
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_fin_novos} ;;
    sql: ${sla_fin_novos} ;;
    group_label: "Máxima do tempo de Jornada - Novos"
    group_item_label: "2. Iniciar Proposta até Finalizar Proposta"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_finalizados_novos]
    description: "Máxima do tempo entre o aluno iniciar e finalizar uma proposta"
  }

  measure: min_finalizados_novos {
    type: min
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_fin_novos} ;;
    sql: ${sla_fin_novos} ;;
    group_label: "Mínima do tempo de Jornada - Novos"
    group_item_label: "2. Iniciar Proposta até Finalizar Proposta"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_finalizados_novos]
    description: "Mínima do tempo entre o aluno iniciar e finalizar uma proposta"
  }

  measure: media_mesa_risco_novos {
    type: average
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_apr_risco_novos} ;;
    sql: ${sla_apr_risco_novos} ;;
    group_label: "Média do tempo de Jornada - Novos"
    group_item_label: "3. Finalizar Proposta até Aprovado Risco"
    value_format: "0"
    hidden: yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_mesa_risco_novos]
    description: "Média do tempo entre o aluno finalizar uma proposta e ser aprovado por risco"
  }

  measure: max_mesa_risco_novos {
    type: max
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_apr_risco_novos} ;;
    sql: ${sla_apr_risco_novos} ;;
    group_label: "Máxima do tempo de Jornada - Novos"
    group_item_label: "3. Finalizar Proposta até Aprovado Risco"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_mesa_risco_novos]
    description: "Máxima do tempo entre o aluno finalizar uma proposta e ser aprovado por risco"
  }

  measure: min_mesa_risco_novos {
    type: min
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_apr_risco_novos} ;;
    sql: ${sla_apr_risco_novos} ;;
    group_label: "Mínima do tempo de Jornada - Novos"
    group_item_label: "3. Finalizar Proposta até Aprovado Risco"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_mesa_risco_novos]
    description: "Mínima do tempo entre o aluno finalizar uma proposta e ser aprovado por risco"
  }

  measure: media_aprovado_instituicao_novos {
    type: average
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_apr_ies_novos} ;;
    sql: ${sla_apr_ies_novos} ;;
    group_label: "Média do tempo de Jornada - Novos"
    group_item_label: "4. Aprovado Risco até Aprovado Instituição"
    value_format: "0"
    hidden: yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_aprovado_instituicao_novos]
    description: "Média do tempo entre o aluno ser aprovado por risco e ser aprovado pela instituição"
  }

  measure: max_aprovado_instituicao_novos {
    type: max
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_apr_ies_novos} ;;
    sql: ${sla_apr_ies_novos} ;;
    group_label: "Máxima do tempo de Jornada - Novos"
    group_item_label: "4. Aprovado Risco até Aprovado Instituição"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_aprovado_instituicao_novos]
    description: "Máxima do tempo entre o aluno ser aprovado por risco e ser aprovado pela instituição"
  }

  measure: min_aprovado_instituicao_novos {
    type: min
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_apr_ies_novos} ;;
    sql: ${sla_apr_ies_novos} ;;
    group_label: "Mínima do tempo de Jornada - Novos"
    group_item_label: "4. Aprovado Risco até Aprovado Instituição"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_aprovado_instituicao_novos]
    description: "Mínima do tempo entre o aluno ser aprovado por risco e ser aprovado pela instituição"
  }

  measure: media_aguard_doc_novos {
    type: average
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_agu_doc_novos} ;;
    sql: ${sla_agu_doc_novos} ;;
    group_label: "Média do tempo de Jornada - Novos"
    group_item_label: "6. Aprovado Instituição até Aguardando Documento"
    value_format: "0"
    hidden: yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_aguard_doc_novos]
    description: "Média do tempo entre o aluno ser aprovado pela instituição e aguardar o envio dos documentos pendentes."
  }

  measure: max_aguard_doc_novos {
    type: max
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_agu_doc_novos} ;;
    sql: ${sla_agu_doc_novos} ;;
    group_label: "Máxima do tempo de Jornada - Novos"
    group_item_label: "6. Aprovado Instituição até Aguardando Documento"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_aguard_doc_novos]
    description: "Máxima do tempo entre o aluno ser aprovado pela instituição e aguardar o envio dos documentos pendentes."
  }

  measure: min_aguard_doc_novos {
    type: min
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_agu_doc_novos} ;;
    sql: ${sla_agu_doc_novos} ;;
    group_label: "Mínima do tempo de Jornada - Novos"
    group_item_label: "6. Aprovado Instituição até Aguardando Documento"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_aguard_doc_novos]
    description: "Mínima do tempo entre o aluno ser aprovado pela instituição e aguardar o envio dos documentos pendentes."
  }

  measure: media_aguard_ass_ctt_novos {
    type: average
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_agu_ass_novos} ;;
    sql: ${sla_agu_ass_novos} ;;
    group_label: "Média do tempo de Jornada - Novos"
    group_item_label: "5. Aguardando Documento até Aguardando Assinatura"
    value_format: "0"
    hidden: yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_aguard_ass_ctt_novos]
    description: "Média do tempo entre o aluno ter o contrato gerado e aguardar o contrato ser assinado"
  }

  measure: max_aguard_ass_ctt_novos {
    type: max
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_agu_ass_novos} ;;
    sql: ${sla_agu_ass_novos} ;;
    group_label: "Máxima do tempo de Jornada - Novos"
    group_item_label: "5. Aguardando Documento até Aguardando Assinatura"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_aguard_ass_ctt_novos]
    description: "Máxima do tempo entre o aluno ter o contrato gerado e aguardar o contrato ser assinado"
  }

  measure: min_aguard_ass_ctt_novos {
    type: min
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_agu_ass_novos} ;;
    sql: ${sla_agu_ass_novos} ;;
    group_label: "Mínima do tempo de Jornada - Novos"
    group_item_label: "5. Aguardando Documento até Aguardando Assinatura"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_aguard_ass_ctt_novos]
    description: "Mínima do tempo entre o aluno ter o contrato gerado e aguardar o contrato ser assinado"
  }

  measure: media_formalizado_novos {
    type: average
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_form_novos} ;;
    sql: ${sla_form_novos} ;;
    group_label: "Média do tempo de Jornada - Novos"
    group_item_label: "8. Aguardando Assinatura até Formalizado"
    value_format: "0"
    hidden: yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_formalizado_novos]
    description: "Média do tempo entre o aluno ter seu contrato assinado e ter todos seus documentos aprovados pela formalização"
  }

  measure: max_formalizado_novos {
    type: max
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_form_novos} ;;
    sql: ${sla_form_novos} ;;
    group_label: "Máxima do tempo de Jornada - Novos"
    group_item_label: "8. Aguardando Assinatura até Formalizado"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_formalizado_novos]
    description: "Máxima do tempo entre o aluno ter seu contrato assinado e ter todos seus documentos aprovados pela formalização"
  }

  measure: min_formalizado_novos {
    type: min
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_form_novos} ;;
    sql: ${sla_form_novos} ;;
    group_label: "Mínima do tempo de Jornada - Novos"
    group_item_label: "8. Aguardando Assinatura até Formalizado"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_formalizado_novos]
    description: "Mínima do tempo entre o aluno ter seu contrato assinado e ter todos seus documentos aprovados pela formalização"
  }

  measure: media_cedidos_novos {
    type: average
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_ced_novos} ;;
    sql: ${sla_ced_novos} ;;
    group_label: "Média do tempo de Jornada - Novos"
    group_item_label: "9. Formalizado até Cedido"
    value_format: "0"
    hidden: yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_cedidos_novos]
    description: "Média do tempo entre o aluno estar formalizado e ser cedido"
  }

  measure: max_cedidos_novos {
    type: max
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_ced_novos} ;;
    sql: ${sla_ced_novos} ;;
    group_label: "Máxima do tempo de Jornada - Novos"
    group_item_label: "9. Formalizado até Cedido"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_cedidos_novos]
    description: "Máxima do tempo entre o aluno estar formalizado e ser cedido"
  }

  measure: min_cedidos_novos {
    type: min
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_ced_novos} ;;
    sql: ${sla_ced_novos} ;;
    group_label: "Minima do tempo de Jornada - Novos"
    group_item_label: "9. Formalizado até Cedido"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_cedidos_novos]
    description: "Mínima do tempo entre o aluno estar formalizado e ser cedido"
  }

  measure: average_total_novos {
    type: number
    sql:  coalesce(${media_iniciados_novos},0)+
          coalesce(${media_finalizados_novos},0)+
          coalesce(${media_mesa_risco_novos},0)+
          coalesce(${media_aprovado_instituicao_novos},0)+
          coalesce(${media_aguard_doc_novos},0)+
          coalesce(${media_aguard_ass_ctt_novos},0)+
          coalesce(${media_formalizado_novos},0)+
          coalesce(${media_cedidos_novos},0);;

      group_label: "Média do tempo de Jornada - Novos"
      group_item_label: "Tempo Total de Jornada do Aluno Novo"
      value_format: "0"
    hidden: yes
      drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,data_ultimo_status_date,average_total_novos]
      description: "Soma da Média do tempo de todas as etapas do aluno novo durante o processo de contratação no PRAVALER"
    }

  dimension: tempo_total_novos {
    type: number
    sql:  coalesce(${sla_ini_novos},0)+
coalesce(${sla_fin_novos},0)+
coalesce(${sla_apr_risco_novos},0)+
coalesce(${sla_apr_ies_novos},0)+
coalesce(${sla_agu_doc_novos},0)+
coalesce(${sla_agu_ass_novos},0)+
coalesce(${sla_form_novos},0)+
coalesce(${sla_ced_novos},0);;

      group_label: "Tempo Total de Jornada - Novos"
      group_item_label: "Tempo Total de Jornada do Aluno Novo"
      value_format: "0"
      hidden:  yes
      drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,data_ultimo_status_date,average_total_novos]
      description: "Soma do tempo de todas as etapas do aluno novo durante o processo de contratação no PRAVALER"
    }

  measure: max_total_novos {
    type: max
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_ced_novos} ;;
    sql: ${tempo_total_novos} ;;
    group_label: "Máxima do tempo de Jornada - Novos"
    group_item_label: "Tempo Total de Jornada do Aluno Novo"
    value_format: "0"
    hidden:  yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_cedidos_novos]
    description: "Máxima do tempo de todas as etapas do aluno novo durante o processo de contratação no PRAVALER"
  }

  measure: min_total_novos {
    type: min
    #sql_distinct_key: ${id_proposta} ;;
    #sql: ${jornada_pivot.sla_ced_novos} ;;
    sql: ${tempo_total_novos} ;;
    group_label: "Mínima do tempo de Jornada - Novos"
    group_item_label: "Tempo Total de Jornada do Aluno Novo"
    value_format: "0"
    hidden: yes
    drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,dt_status_date,media_cedidos_novos]
    description: "Mínima do tempo de todas as etapas do aluno novo durante o processo de contratação no PRAVALER"
  }

    # Jornada Renovação
    measure: sla_eleg_renov23 {
      type: average
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_eleg_renov} ;;
      sql: coalesce(${sla_eleg_renov}/86400,0) ;;
      drill_fields: [detail*]
      group_label: "Média do tempo de Jornada - Renovação"
      group_item_label: "1. Iniciar Proposta até Elegível"
      value_format: "0.0"
      description: "Média do tempo entre o aluno iniciar uma id_proposta e se tornar elegível"
    }

    measure: sla_beha_renov23 {
      type: average
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_beha_renov} ;;
      sql: ${sla_beha_renov}/86400 ;;
      drill_fields: [detail*]
      group_label: "Média do tempo de Jornada - Renovação"
      group_item_label: "2. Elegível até Aprovado Behavior"
      value_format: "0.0"
      description: "Média do tempo entre o aluno ser elegível e ser aprovado no behavior"
    }
    measure: sla_apr_ies_renov23 {
      type: average
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_apr_ies_renov} ;;
      sql: ${sla_apr_ies_renov}/86400 ;;
      drill_fields: [detail*]
      group_label: "Média do tempo de Jornada - Renovação"
      group_item_label: "3. Aprovado Behavior até Aprovado Instituição"
      value_format: "0.0"
      description: "Média do tempo entre o aluno ser aprovado no behavior e ser aprovado pela instituição"
    }

    measure: sla_agu_doc_renov23 {
      type: average
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_agu_doc_renov} ;;
      sql: ${sla_agu_doc_renov}/86400 ;;
      drill_fields: [detail*]
      group_label: "Média do tempo de Jornada - Renovação"
      group_item_label: "4. Aprovado Instituição até Aguardando Documento"
      value_format: "0.0"
      description: "Média do tempo entre o aluno ser aprovado pela instituição e aguardar o envio dos documentos"
    }

    measure: sla_agu_ass_renov23 {
      type: average
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_agu_ass_renov} ;;
      sql: ${sla_agu_ass_renov}/86400 ;;
      drill_fields: [detail*]
      group_label: "Média do tempo de Jornada - Renovação"
      group_item_label: "6. Aguardando Documento até Aguardando Assinatura"
      value_format: "0.0"
      description: "Média do tempo entre o aluno ter o contrato gerado e aguardar a assinatura do contrato"
    }

    measure: sla_form_renov23 {
      type: average
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_form_renov} ;;
      sql: ${sla_form_renov}/86400 ;;
      drill_fields: [detail*]
      group_label: "Média do tempo de Jornada - Renovação"
      group_item_label: "7. Aguardando Assinatura até Formalizado"
      value_format: "0.0"
      description: "Média do tempo entre o aluno ter seu contrato assinado e ter todos seus documentos aprovados pela formalização"
    }

    measure: sla_ced_renov23 {
      type: average
      #sql_distinct_key: ${id_proposta};;
      #sql: ${jornada_pivot.sla_ced_renov} ;;
      sql: ${sla_ced_renov} ;;
      drill_fields: [detail*]
      group_label: "Média do tempo de Jornada - Renovação"
      group_item_label: "8. Formalizado até Cedido"
      value_format: "0"
      description: "Média do tempo entre o aluno ter o contrado formalizado e cedido."
    }

  measure: average_total_renovacao {
    type: number
    sql:  coalesce(${sla_eleg_renov23},0)+
          coalesce(${sla_agu_ass_renov23},0)+
          coalesce(${sla_agu_doc_renov23},0)+
          coalesce(${sla_apr_ies_renov23},0)+
          coalesce(${sla_beha_renov23},0)+
          coalesce(${sla_ced_renov23},0)+
          coalesce(${sla_form_renov23},0);;

      group_label: "Média do tempo de Jornada - Renovação"
      group_item_label: "Tempo Total de Jornada do Aluno Novo"
      value_format: "0.0"
      drill_fields: [id_cpf,id_proposta,data_inicio_da_proposta_date,etapa,status_etapa,data_ultimo_status_date,average_total_novos]
      description: "Soma da Média do tempo de todas as etapas do aluno novo durante o processo de contratação no PRAVALER"
    }


##TEMPO - QUANTIDADE DE DIAS DA PROPOSTA NA ETAPA##

dimension: qtd_dias_iniciados {
  type: number
  sql: ${TABLE}."QTD_DIAS_INICIADOS"/ 86400.0 ;;
  hidden: no
  group_label: "Quantidade de Dias da Proposta na Etapa"
  group_item_label: "Novos - Iniciados"
  value_format: "0.0"
}

  measure: average_qtd_dias_iniciados {
    type: average
    sql: ${qtd_dias_iniciados} ;;
    group_label: "Média - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Iniciados"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de dias que a proposta ficou parada na etapa de Iniciados, em todas as vezes que passou por ela"
  }

  measure: median_qtd_dias_iniciados {
    type: median
    sql: ${qtd_dias_iniciados} ;;
    group_label: "Mediana - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Iniciados"
    value_format: "0.0"
    hidden: no
    description: "Indica a mediana da quantidade de dias que a proposta ficou parada na etapa de Iniciados, em todas as vezes que passou por ela"
  }

  measure: max_qtd_dias_iniciados {
    type: max
    sql: ${qtd_dias_iniciados} ;;
    group_label: "Máxima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Iniciados"
    value_format: "0.0"
    hidden: no
    description: "Indica a máxima da quantidade de dias que a proposta ficou parada na etapa de Iniciados, em todas as vezes que passou por ela"
  }

  measure: min_qtd_dias_iniciados {
    type: min
    sql: ${qtd_dias_iniciados} ;;
    group_label: "Mínima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Iniciados"
    value_format: "0.0"
    hidden: no
    description: "Indica a mínima da quantidade de dias que a proposta ficou parada na etapa de Iniciados, em todas as vezes que passou por ela"
  }

  dimension: qtd_dias_finalizados {
    type: number
    sql: ${TABLE}."QTD_DIAS_FINALIZADOS"/ 86400.0 ;;
    hidden: no
    group_label: "Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Finalizados"
    value_format: "0.0"
  }

  measure: average_qtd_dias_finalizados {
    type: average
    sql: ${qtd_dias_finalizados} ;;
    group_label: "Média - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Finalizados"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de dias que a proposta ficou parada na etapa de Finalizados, em todas as vezes que passou por ela"
  }

  measure: median_qtd_dias_finalizados {
    type: median
    sql: ${qtd_dias_finalizados} ;;
    group_label: "Mediana - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Finalizados"
    value_format: "0.0"
    hidden: no
    description: "Indica a mediana da quantidade de dias que a proposta ficou parada na etapa de Finalizados, em todas as vezes que passou por ela"
  }

  measure: max_qtd_dias_finalizados {
    type: max
    sql: ${qtd_dias_finalizados} ;;
    group_label: "Máxima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Finalizados"
    value_format: "0.0"
    hidden: no
    description: "Indica a máxima da quantidade de dias que a proposta ficou parada na etapa de Finalizados, em todas as vezes que passou por ela"
  }

  measure: min_qtd_dias_finalizados {
    type: min
    sql: ${qtd_dias_finalizados} ;;
    group_label: "Mínima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Finalizados"
    value_format: "0.0"
    hidden: no
    description: "Indica a mínima da quantidade de dias que a proposta ficou parada na etapa de Finalizados, em todas as vezes que passou por ela"
  }

  dimension: qtd_dias_apr_risco {
    type: number
    sql: ${TABLE}."QTD_DIAS_APR_RISCO"/ 86400.0 ;;
    hidden: no
    group_label: "Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aprovação Risco"
    value_format: "0.0"
  }

  measure: average_qtd_dias_apr_risco {
    type: average
    sql: ${qtd_dias_apr_risco} ;;
    group_label: "Média - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aprovação Risco"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de dias que a proposta ficou parada na etapa de Aprovação Risco, em todas as vezes que passou por ela"
  }

  measure: median_qtd_dias_apr_risco {
    type: median
    sql: ${qtd_dias_apr_risco} ;;
    group_label: "Mediana - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aprovação Risco"
    value_format: "0.0"
    hidden: no
    description: "Indica a mediana da quantidade de dias que a proposta ficou parada na etapa de Aprovação Risco, em todas as vezes que passou por ela"
  }

  measure: max_qtd_dias_apr_risco {
    type: max
    sql: ${qtd_dias_apr_risco} ;;
    group_label: "Máxima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aprovação Risco"
    value_format: "0.0"
    hidden: no
    description: "Indica a máxima da quantidade de dias que a proposta ficou parada na etapa de Aprovação Risco, em todas as vezes que passou por ela"
  }

  measure: min_qtd_dias_apr_risco {
    type: min
    sql: ${qtd_dias_apr_risco} ;;
    group_label: "Mínima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aprovação Risco"
    value_format: "0.0"
    hidden: no
    description: "Indica a mínima da quantidade de dias que a proposta ficou parada na etapa de Aprovação Risco, em todas as vezes que passou por ela"
  }

  dimension: qtd_dias_apr_ies {
    type: number
    sql: ${TABLE}."QTD_DIAS_APR_IES"/ 86400.0 ;;
    hidden: no
    group_label: "Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aprovação IES"
    value_format: "0.0"
  }

  measure: average_qtd_dias_apr_ies {
    type: average
    sql: ${qtd_dias_apr_ies} ;;
    group_label: "Média - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aprovação IES"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de dias que a proposta ficou parada na etapa de Aprovação IES, em todas as vezes que passou por ela"
  }

  measure: median_qtd_dias_apr_ies {
    type: median
    sql: ${qtd_dias_apr_ies} ;;
    group_label: "Mediana - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aprovação IES"
    value_format: "0.0"
    hidden: no
    description: "Indica a mediana da quantidade de dias que a proposta ficou parada na etapa de Aprovação IES, em todas as vezes que passou por ela"
  }

  measure: max_qtd_dias_apr_ies {
    type: max
    sql: ${qtd_dias_apr_ies} ;;
    group_label: "Máxima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aprovação IES"
    value_format: "0.0"
    hidden: no
    description: "Indica a máxima da quantidade de dias que a proposta ficou parada na etapa de Aprovação IES, em todas as vezes que passou por ela"
  }

  measure: min_qtd_dias_apr_ies {
    type: min
    sql: ${qtd_dias_apr_ies} ;;
    group_label: "Mínima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aprovação IES"
    value_format: "0.0"
    hidden: no
    description: "Indica a mínima da quantidade de dias que a proposta ficou parada na etapa de Aprovação IES, em todas as vezes que passou por ela"
  }

  dimension: qtd_dias_agg_doc {
    type: number
    sql: ${TABLE}."QTD_DIAS_AGG_DOC"/ 86400.0 ;;
    hidden: no
    group_label: "Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Documentos"
    value_format: "0.0"
  }

  measure: average_qtd_dias_agg_doc {
    type: average
    sql: ${qtd_dias_agg_doc} ;;
    group_label: "Média - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Documentos"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de dias que a proposta ficou parada na etapa Aguardando Documentos, em todas as vezes que passou por ela"
  }

  measure: median_qtd_dias_agg_doc {
    type: number
    sql: median(${qtd_dias_agg_doc}) ;;
    group_label: "Mediana - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Documentos"
    value_format: "0.0"
    hidden: no
    description: "Indica a mediana da quantidade de dias que a proposta ficou parada na etapa Aguardando Documentos, em todas as vezes que passou por ela"
  }

  measure: max_qtd_dias_agg_doc {
    type: max
    sql: ${qtd_dias_agg_doc} ;;
    group_label: "Máxima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Documentos"
    value_format: "0.0"
    hidden: no
    description: "Indica a máxima da quantidade de dias que a proposta ficou parada na etapa Aguardando Documentos, em todas as vezes que passou por ela"
  }

  measure: min_qtd_dias_agg_doc {
    type: min
    sql: ${qtd_dias_agg_doc} ;;
    group_label: "Mínima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Documentos"
    value_format: "0.0"
    hidden: no
    description: "Indica a mínima da quantidade de dias que a proposta ficou parada na etapa Aguardando Documentos, em todas as vezes que passou por ela"
  }

  dimension: qtd_dias_agg_ass {
    type: number
    sql: ${TABLE}."QTD_DIAS_AGG_ASS"/ 86400.0 ;;
    hidden: no
    group_label: "Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Assinatura"
    value_format: "0.0"
  }

  measure: average_qtd_dias_agg_ass {
    type: average
    sql: ${qtd_dias_agg_ass} ;;
    group_label: "Média - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Assinatura"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de dias que a proposta ficou parada na etapa Aguardando Assinatura, em todas as vezes que passou por ela"
  }

  measure: median_qtd_dias_agg_ass {
    type: median
    sql: ${qtd_dias_agg_ass} ;;
    group_label: "Mediana - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Assinatura"
    value_format: "0.0"
    hidden: no
    description: "Indica a mediana da quantidade de dias que a proposta ficou parada na etapa Aguardando Assinatura, em todas as vezes que passou por ela"
  }

  measure: max_qtd_dias_agg_ass {
    type: max
    sql: ${qtd_dias_agg_ass} ;;
    group_label: "Máxima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Assinatura"
    value_format: "0.0"
    hidden: no
    description: "Indica a máxima da quantidade de dias que a proposta ficou parada na etapa Aguardando Assinatura, em todas as vezes que passou por ela"
  }

  measure: min_qtd_dias_agg_ass {
    type: min
    sql: ${qtd_dias_agg_ass} ;;
    group_label: "Mínima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Assinatura"
    value_format: "0.0"
    hidden: no
    description: "Indica a mínima da quantidade de dias que a proposta ficou parada na etapa Aguardando Assinatura, em todas as vezes que passou por ela"
  }

  dimension: qtd_dias_form {
    type: number
    sql: ${qtd_dias_agg_doc}+${qtd_dias_agg_ass} ;;
    hidden: no
    group_label: "Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Formalizados"
    value_format: "0.0"
  }

  measure: average_qtd_dias_form {
    type: average
    sql: ${qtd_dias_agg_doc}+${qtd_dias_agg_ass} ;;
    group_label: "Média - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Formalizados"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de dias que a proposta ficou parada na etapa de Formalizados, em todas as vezes que passou por ela"
  }

  measure: median_qtd_dias_form {
    type: median
    sql: ${qtd_dias_agg_doc}+${qtd_dias_agg_ass} ;;
    group_label: "Mediana - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Formalizados"
    value_format: "0.0"
    hidden: no
    description: "Indica a mediana da quantidade de dias que a proposta ficou parada na etapa de Formalizados, em todas as vezes que passou por ela"
  }

  measure: median_qtd_dias_form_old {
    type: median
    sql: ${TABLE}."QTD_DIAS_FORM"/ 86400.0 ;;
    group_label: "Mediana - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Formalizados (Antigo)"
    value_format: "0.0"
    hidden: no
    description: "Indica a mediana da quantidade de dias que a proposta ficou parada na etapa de Formalizados, em todas as vezes que passou por ela"
  }

  measure: max_qtd_dias_form {
    type: max
    sql: ${qtd_dias_agg_doc}+${qtd_dias_agg_ass} ;;
    group_label: "Máxima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Formalizados"
    value_format: "0.0"
    hidden: no
    description: "Indica a máxima da quantidade de dias que a proposta ficou parada na etapa de Formalizados, em todas as vezes que passou por ela"
  }

  measure: min_qtd_dias_form {
    type: min
    sql: ${qtd_dias_agg_doc}+${qtd_dias_agg_ass} ;;
    group_label: "Mínima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Formalizados"
    value_format: "0.0"
    hidden: no
    description: "Indica a mínima da quantidade de dias que a proposta ficou parada na etapa de Formalizados, em todas as vezes que passou por ela"
  }

  dimension: qtd_dias_cedido {
    type: number
    sql: ${TABLE}."QTD_DIAS_CEDIDO"/ 86400.0;;
    hidden: no
    group_label: "Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Cedidos"
    value_format: "0.0"
  }

  measure: average_qtd_dias_cedido {
    type: average
    sql: ${qtd_dias_cedido} ;;
    group_label: "Média - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Cedidos"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de dias que a proposta ficou parada na etapa de Cedidos, em todas as vezes que passou por ela"
  }

  measure: median_qtd_dias_cedido {
    type: median
    sql: ${qtd_dias_cedido} ;;
    group_label: "Mediana - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Cedidos"
    value_format: "0.0"
    hidden: no
    description: "Indica a mediana da quantidade de dias que a proposta ficou parada na etapa de Cedidos, em todas as vezes que passou por ela"
  }

  measure: max_qtd_dias_cedido {
    type: max
    sql: ${qtd_dias_cedido} ;;
    group_label: "Máxima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Cedidos"
    value_format: "0.0"
    hidden: no
    description: "Indica a máxima da quantidade de dias que a proposta ficou parada na etapa de Cedidos, em todas as vezes que passou por ela"
  }

  measure: min_qtd_dias_cedido {
    type: min
    sql: ${qtd_dias_cedido} ;;
    group_label: "Mínima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Cedidos"
    value_format: "0.0"
    hidden: no
    description: "Indica a mínima da quantidade de dias que a proposta ficou parada na etapa de Cedidos, em todas as vezes que passou por ela"
  }


  dimension: total_qtd_dias_novo {
    type: number
    group_label: "Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Total"
    sql: coalesce(${qtd_dias_iniciados},0)+
    coalesce(${qtd_dias_finalizados},0)+
    coalesce(${qtd_dias_apr_risco},0)+
    coalesce(${qtd_dias_apr_ies},0)+
    coalesce(${qtd_dias_agg_doc},0)+
    coalesce(${qtd_dias_agg_ass},0)+
    coalesce(${qtd_dias_cedido},0);;
    hidden:  no
    value_format: "0.0"
    }

  measure: max_qtd_dias_novo {
    type: max
    sql: ${total_qtd_dias_novo} ;;
    group_label: "Máxima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Total"
    value_format: "0.0"
    hidden: no
    description: "Indica a máxima da quantidade total de dias em que a proposta levou entre Iniciado e Cessão"
  }

  measure: min_qtd_dias_novo {
    type: min
    sql: ${total_qtd_dias_novo} ;;
    group_label: "Mínima - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Total"
    value_format: "0.0"
    hidden: no
    description: "Indica a mínima da quantidade total de dias em que a proposta levou entre Iniciado e Cessão"
  }


  measure: average_total_qtd_dias_novos {
    type: number
    sql: coalesce(${average_qtd_dias_iniciados},0)+
    coalesce(${average_qtd_dias_finalizados},0)+
    coalesce(${average_qtd_dias_apr_risco},0)+
    coalesce(${average_qtd_dias_apr_ies},0)+
    coalesce(${average_qtd_dias_agg_doc},0)+
    coalesce(${average_qtd_dias_agg_ass},0)+
    coalesce(${average_qtd_dias_cedido},0) ;;
    group_label: "Média - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Total"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade total de dias em que a proposta levou entre Iniciado e Cessão"
    }

  measure: median_total_qtd_dias_novos {
    type: number
    sql: coalesce(${median_qtd_dias_iniciados},0)+
    coalesce(${median_qtd_dias_finalizados},0)+
    coalesce(${median_qtd_dias_apr_risco},0)+
    coalesce(${median_qtd_dias_apr_ies},0)+
    coalesce(${median_qtd_dias_agg_doc},0)+
    coalesce(${median_qtd_dias_agg_ass},0)+
    coalesce(${median_qtd_dias_cedido},0) ;;
    group_label: "Mediana - Quantidade de Dias da Proposta na Etapa"
    group_item_label: "Novos - Total"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade total de dias em que a proposta levou entre Iniciado e Cessão"
  }


##TEMPO - QUANTIDADE DE VEZES DA PROPOSTA NA ETAPA##


  dimension: qtd_vezes_iniciado {
    type: number
    sql: ${TABLE}."QTD_VEZES_INICIADO" ;;
    group_label: "Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Qtd - Iniciados"
    value_format: "0"
    hidden: no
    description: "Indica a quantidade de vezes que a proposta passou pela etapa de Iniciado"
  }

  measure: average_qtd_vezes_iniciado {
    type: average
    sql: ${qtd_vezes_iniciado} ;;
    group_label: "Média - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Iniciados"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de vezes que a proposta passou pela etapa de Iniciado"
  }

  measure: median_qtd_vezes_iniciado {
    type: median
    sql: ${qtd_vezes_iniciado} ;;
    group_label: "Mediana - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Iniciados"
    value_format: "0"
    hidden: no
    description: "Indica a mediana da quantidade de vezes que a proposta passou pela etapa de Iniciado"
  }

  measure: max_qtd_vezes_iniciado {
    type: max
    sql: ${qtd_vezes_iniciado} ;;
    group_label: "Máxima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Iniciados"
    value_format: "0"
    hidden: no
    description: "Indica a máxima da quantidade de vezes que a proposta passou pela etapa de Iniciado"
  }

  measure: min_qtd_vezes_iniciado {
    type: min
    sql: ${qtd_vezes_iniciado} ;;
    group_label: "Mínima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Iniciados"
    value_format: "0"
    hidden: no
    description: "Indica a mínima da quantidade de vezes que a proposta passou pela etapa de Iniciado"
  }

  dimension: qtd_vezes_finalizados {
    type: number
    sql: ${TABLE}."QTD_VEZES_FINALIZADOS" ;;
    group_label: "Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Qtd - Finalizados"
    value_format: "0"
    hidden: no
    description: "Indica a quantidade de vezes que a proposta passou pela etapa de Finalizados"
  }

  measure: average_qtd_vezes_finalizados {
    type: average
    sql: ${qtd_vezes_finalizados} ;;
    group_label: "Média - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Finalizados"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de vezes que a proposta passou pela etapa de Finalizado"
  }

  measure: median_qtd_vezes_finalizados {
    type: median
    sql: ${qtd_vezes_finalizados} ;;
    group_label: "Mediana - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Finalizados"
    value_format: "0"
    hidden: no
    description: "Indica a mediana da quantidade de vezes que a proposta passou pela etapa de Finalizado"
  }

  measure: max_qtd_vezes_finalizados {
    type: max
    sql: ${qtd_vezes_finalizados} ;;
    group_label: "Máxima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Finalizados"
    value_format: "0"
    hidden: no
    description: "Indica a máxima da quantidade de vezes que a proposta passou pela etapa de Finalizado"
  }

  measure: min_qtd_vezes_finalizados {
    type: min
    sql: ${qtd_vezes_finalizados} ;;
    group_label: "Mínima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Finalizados"
    value_format: "0"
    hidden: no
    description: "Indica a mínima da quantidade de vezes que a proposta passou pela etapa de Finalizado"
  }

  dimension: qtd_vezes_apr_risco{
    type: number
    sql: ${TABLE}."QTD_VEZES_APR_RISCO" ;;
    group_label: "Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Qtd - Apr. Risco"
    value_format: "0"
    hidden: no
    description: "Indica a quantidade de vezes que a proposta passou pela etapa de Apr. Risco"
  }

  measure: average_qtd_vezes_apr_risco {
    type: average
    sql: ${qtd_vezes_apr_risco} ;;
    group_label: "Média - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aprovação Risco"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de vezes que a proposta passou pela etapa de Aprovação Risco"
  }

  measure: median_qtd_vezes_apr_risco {
    type: median
    sql: ${qtd_vezes_apr_risco} ;;
    group_label: "Mediana - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aprovação Risco"
    value_format: "0"
    hidden: no
    description: "Indica a mediana da quantidade de vezes que a proposta passou pela etapa de Aprovação Risco"
  }

  measure: max_qtd_vezes_apr_risco {
    type: max
    sql: ${qtd_vezes_apr_risco} ;;
    group_label: "Máxima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aprovação Risco"
    value_format: "0"
    hidden: no
    description: "Indica a máxima da quantidade de vezes que a proposta passou pela etapa de Aprovação Risco"
  }

  measure: min_qtd_vezes_apr_risco {
    type: min
    sql: ${qtd_vezes_apr_risco} ;;
    group_label: "Mínima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aprovação Risco"
    value_format: "0"
    hidden: no
    description: "Indica a mínima da quantidade de vezes que a proposta passou pela etapa de Aprovação Risco"
  }

  dimension: qtd_vezes_apr_ies{
    type: number
    sql: ${TABLE}."QTD_VEZES_APR_IES" ;;
    group_label: "Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Qtd - Apr. IES"
    value_format: "0"
    hidden: no
    description: "Indica a quantidade de vezes que a proposta passou pela etapa de Apr. IES"
  }

  measure: average_qtd_vezes_apr_ies {
    type: average
    sql: ${qtd_vezes_apr_ies} ;;
    group_label: "Média - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aprovação IES"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de vezes que a proposta passou pela etapa de Aprovação IES"
  }

  measure: median_qtd_vezes_apr_ies {
    type: median
    sql: ${qtd_vezes_apr_ies} ;;
    group_label: "Mediana - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aprovação IES"
    value_format: "0"
    hidden: no
    description: "Indica a mediana da quantidade de vezes que a proposta passou pela etapa de Aprovação IES"
  }

  measure: max_qtd_vezes_apr_ies {
    type: max
    sql: ${qtd_vezes_apr_ies} ;;
    group_label: "Máxima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aprovação IES"
    value_format: "0"
    hidden: no
    description: "Indica a máxima da quantidade de vezes que a proposta passou pela etapa de Aprovação IES"
  }

  measure: min_qtd_vezes_apr_ies {
    type: min
    sql: ${qtd_vezes_apr_ies} ;;
    group_label: "Mínima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aprovação IES"
    value_format: "0"
    hidden: no
    description: "Indica a mínima da quantidade de vezes que a proposta passou pela etapa de Aprovação IES"
  }

  dimension: qtd_vezes_agg_doc {
    type: number
    sql: ${TABLE}."QTD_VEZES_AGG_DOC" ;;
    group_label: "Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Qtd - Agg Doc"
    value_format: "0"
    hidden: no
    description: "Indica a quantidade de vezes que a proposta passou pela etapa de Aguardando Documento"
  }

  measure: average_qtd_vezes_agg_doc {
    type: average
    sql: ${qtd_vezes_agg_doc} ;;
    group_label: "Média - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Documentos"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de vezes que a proposta passou pela etapa de Aguardando Documentos"
  }

  measure: median_qtd_vezes_agg_doc {
    type: median
    sql: ${qtd_vezes_agg_doc} ;;
    group_label: "Mediana - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Documentos"
    value_format: "0"
    hidden: no
    description: "Indica a mediana da quantidade de vezes que a proposta passou pela etapa de Aguardando Documentos"
  }

  measure: max_qtd_vezes_agg_doc {
    type: max
    sql: ${qtd_vezes_agg_doc} ;;
    group_label: "Máxima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Documentos"
    value_format: "0"
    hidden: no
    description: "Indica a máxima da quantidade de vezes que a proposta passou pela etapa de Aguardando Documentos"
  }

  measure: min_qtd_vezes_agg_doc {
    type: min
    sql: ${qtd_vezes_agg_doc} ;;
    group_label: "Mínima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Documentos"
    value_format: "0"
    hidden: no
    description: "Indica a mínima da quantidade de vezes que a proposta passou pela etapa de Aguardando Documentos"
  }

  dimension: qtd_vezes_agg_ass {
    type: number
    sql: ${TABLE}."QTD_VEZES_AGG_ASS" ;;
    group_label: "Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Qtd - Agg Ass"
    value_format: "0"
    hidden: no
    description: "Indica a quantidade de vezes que a proposta passou pela etapa de Aguardando Assinatura"
  }

  measure: average_qtd_vezes_agg_ass {
    type: average
    sql: ${qtd_vezes_agg_ass} ;;
    group_label: "Média - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Assinatura"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de vezes que a proposta passou pela etapa de Aguardando Assinatura"
  }

  measure: median_qtd_vezes_agg_ass {
    type: median
    sql: ${qtd_vezes_agg_ass} ;;
    group_label: "Mediana - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Assinatura"
    value_format: "0"
    hidden: no
    description: "Indica a mediana da quantidade de vezes que a proposta passou pela etapa de Aguardando Assinatura"
  }

  measure: max_qtd_vezes_agg_ass {
    type: max
    sql: ${qtd_vezes_agg_ass} ;;
    group_label: "Máxima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Assinatura"
    value_format: "0"
    hidden: no
    description: "Indica a máxima da quantidade de vezes que a proposta passou pela etapa de Aguardando Assinatura"
  }

  measure: min_qtd_vezes_agg_ass {
    type: min
    sql: ${qtd_vezes_agg_ass} ;;
    group_label: "Mínima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Aguardando Assinatura"
    value_format: "0"
    hidden: no
    description: "Indica a mínima da quantidade de vezes que a proposta passou pela etapa de Aguardando Assinatura"
  }

  dimension: qtd_vezes_formalizado {
    type: number
    sql: ${TABLE}."QTD_VEZES_FORMALIZADO" ;;
    group_label: "Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Qtd - Formalizado"
    value_format: "0"
    hidden: no
    description: "Indica a quantidade de vezes que a proposta passou pela etapa de Formalizado"
  }

  measure: average_qtd_vezes_formalizado {
    type: average
    sql: ${qtd_vezes_formalizado} ;;
    group_label: "Média - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Formalizados"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de vezes que a proposta passou pela etapa de Formalizado"
  }

  measure: median_qtd_vezes_formalizado {
    type: median
    sql: ${qtd_vezes_formalizado} ;;
    group_label: "Mediana - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Formalizados"
    value_format: "0"
    hidden: no
    description: "Indica a mediana da quantidade de vezes que a proposta passou pela etapa de Formalizado"
  }

  measure: max_qtd_vezes_formalizado {
    type: max
    sql: ${qtd_vezes_formalizado} ;;
    group_label: "Máxima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Formalizados"
    value_format: "0"
    hidden: no
    description: "Indica a máxima da quantidade de vezes que a proposta passou pela etapa de Formalizado"
  }

  measure: min_qtd_vezes_formalizado {
    type: min
    sql: ${qtd_vezes_formalizado} ;;
    group_label: "Mínima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Formalizados"
    value_format: "0"
    hidden: no
    description: "Indica a mínima da quantidade de vezes que a proposta passou pela etapa de Formalizado"
  }

  dimension: qtd_vezes_cedido {
    type: number
    sql: ${TABLE}."QTD_VEZES_CEDIDO" ;;
    group_label: "Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Qtd - Cedidos"
    value_format: "0"
    hidden: no
    description: "Indica a quantidade de vezes que a proposta passou pela etapa de Cedido"
  }

  measure: average_qtd_vezes_cedido {
    type: average
    sql: ${qtd_vezes_cedido} ;;
    group_label: "Média - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Cedidos"
    value_format: "0.0"
    hidden: no
    description: "Indica a média da quantidade de vezes que a proposta passou pela etapa de Cedido"
  }

  measure: median_qtd_vezes_cedido {
    type: median
    sql: ${qtd_vezes_cedido} ;;
    group_label: "Mediana - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Cedidos"
    value_format: "0"
    hidden: no
    description: "Indica a mediana da quantidade de vezes que a proposta passou pela etapa de Cedido"
  }

  measure: max_qtd_vezes_cedido {
    type: max
    sql: ${qtd_vezes_cedido} ;;
    group_label: "Máxima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Cedidos"
    value_format: "0"
    hidden: no
    description: "Indica a máxima da quantidade de vezes que a proposta passou pela etapa de Cedido"
  }

  measure: min_qtd_vezes_cedido {
    type: min
    sql: ${qtd_vezes_cedido} ;;
    group_label: "Mínima - Quantidade de Vezes da Proposta na Etapa"
    group_item_label: "Novos - Cedidos"
    value_format: "0"
    hidden: no
    description: "Indica a mínima da quantidade de vezes que a proposta passou pela etapa de Cedido"
  }



####################################################

  set: detail {
    fields: [
      id_cpf,
      cpf_aluno_proposta,
      id_proposta,
      etapa,
      status_etapa,
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

measure: ultima_data_etapa {
  type: max
  sql: ${dt_status_date} ;;
  hidden:  yes
}

  measure: tempo_na_etapa {
    type: number
    sql: datediff('day',${ultima_data_etapa},current_date) ;;
    group_label: "Telemetria"
    hidden: yes
    group_item_label: "Tempo na Última Etapa"
    description: "Indica a quantidade de dias que o aluno está parado na última etapa."
  }

dimension: flg_ultima_etapa {
  type:  yesno
  sql: ${TABLE}."FLG_ULTIMA_ETAPA";;
  label: "Última Etapa"
  description: "Indica se o registro é a ultima etapa de contratação daquela proposta"
}

#Campos Ocultos - Lulinha 22/06/2022


  # dimension: id_elegivel {
  #   type: number
  #   sql: ${TABLE}."ID_ELEGIVEL" ;;
  #   group_label: "Dados da Proposta"
  #   group_item_label: "ID Elegivel"
  #   description: "Indica o código de elegibilidade"
  # }


dimension: flg_proposta_atual {
  type: string
  sql: ${TABLE}."FLG_PROPOSTA_ATUAL" ;;
  group_label: "Dados da Proposta"
  hidden: yes
  group_item_label: "Proposta Atual?"
   description: "Indica se é a proposta atual do aluno. Ou seja a última com alteração de status (Sim - Não)"
  }


  # dimension: semestre_financiamento {
  #   type: string
  #   sql: ${TABLE}."SEMESTRE_FINANCIAMENTO" ;;
  #   group_label: "Dados da Proposta"
  #   group_item_label: "Semestre Financiado"
  #   hidden: yes
  #   description: "Indica o semestre financiado"
  # }

dimension: flag_balcao {
  type: yesno
  sql: case when ${aluno_cpf} in (select distinct cpf_lead from "VETERANO"."MGM"."LEADS_BALCAO") then 'Yes' else 'No' end;;
  label: "Flag Balcão"
}

  dimension: flag_afiliados {
    type: yesno
    sql: case when ${aluno_cpf} in (select distinct cd_cpf_lead from "BICHO"."MGM"."LEADS_CANAL_ENTRADA") then 'Yes' else 'No' end ;;
    label: "Flag Afiliados"
  }

  dimension: tempo_aprovies_enviodoc {
    type: number
    sql: datediff(second,${dt_aprovado_instituicao_raw},${proposta_datas_interfile.dt_envio_documentacao_raw})/86400 ;;
    group_label: "Telemetria"
    group_item_label: "Tempo entre Aprovação IES e Envio do Documento"
    description: "Indica a quantidade de dias entre a Aprovação do aluno pela IES e o envio do primeiro documento"
    drill_fields: [id_proposta,id_cpf,etapa_ultimo_status]
  }

  measure: median_aprovies_enviodoc {
    type: number
    sql: median(${tempo_aprovies_enviodoc}) ;;
    group_item_label: "Tempo entre Aprovação IES e Envio do Documento - Mediana"
    value_format: "0.0"
    description: "Mediana de dias entre a Aprovação do aluno pela IES e o envio do primeiro documento"
  }


  measure: average_aprovies_enviodoc {
    type: average
    sql: ${tempo_aprovies_enviodoc} ;;
    group_item_label: "Tempo entre Aprovação IES e Envio do Documento - Média"
    value_format: "0.0"
    description: "Média de dias entre a Aprovação do aluno pela IES e o envio do primeiro documento"
  }

  dimension: tempo_enviodoc_aguass {
    type: number
    sql: datediff(second,${proposta_datas_interfile.dt_envio_documentacao_raw},${dt_aguardando_assinatura_raw})/86400 ;;
    group_label: "Telemetria"
    group_item_label: "Tempo entre Envio do Documento e Aguardando Assinatura"
    description: "Indica a quantidade de dias entre o envio do primeiro documento e o momento que o aluno entra na etapa Aguardando Assinatura"
    drill_fields: [id_proposta,id_cpf,etapa_ultimo_status]
  }

  measure: median_enviodoc_aguass {
    type: number
    sql: median(${tempo_enviodoc_aguass}) ;;
    group_item_label: "Tempo entre Envio do Documento e Aguardando Assinatura - Mediana"
    value_format: "0.0"
    description: "Mediana de dias entre o envio do primeiro documento e o momento que o aluno entra na etapa Aguardando Assinatura"
  }


  measure: average_enviodoc_aguass {
    type: average
    sql: ${tempo_enviodoc_aguass} ;;
    group_item_label: "Tempo entre Envio do Documento e Aguardando Assinatura - Média"
    value_format: "0.0"
    description: "Média de dias entre o envio do primeiro documento e o momento que o aluno entra na etapa Aguardando Assinatura"
  }

  measure: var_mensalidade_cadastro_analiseies {
    type: average
    sql: ${proposta.mensalidade_ies}/nullif(${instituicao.valor_mensalidade},0)-1 ;;
    group_label: "Mensalidades"
    group_item_label: "Var % Mensalidade Cadastro x Mensalidade Análise IES"
    value_format: "0.0%"
  }

  measure: var_mensalidade_informada_analiseies {
    type: average
    sql: ${proposta.mensalidade_ies}/nullif(${proposta.mensalidade_inf_alu},0)-1 ;;
    group_label: "Mensalidades"
    group_item_label: "Var % Mensalidade Inf Aluno x Mensalidade Análise IES"
    value_format: "0.0%"
  }

  measure: var_median_mensalidade_cadastro_analiseies {
    type: median
    sql: ${proposta.mensalidade_ies}/nullif(${instituicao.valor_mensalidade},0)-1 ;;
    group_label: "Mensalidades"
    group_item_label: "Var Mediana % Mensalidade Cadastro x Mensalidade Análise IES"
    value_format: "0.0%"
  }

  measure: var_median_mensalidade_informada_analiseies {
    type: median
    sql: ${proposta.mensalidade_ies}/nullif(${proposta.mensalidade_inf_alu},0)-1 ;;
    group_label: "Mensalidades"
    group_item_label: "Var Mediana % Mensalidade Inf Aluno x Mensalidade Análise IES"
    value_format: "0.0%"
  }


}
