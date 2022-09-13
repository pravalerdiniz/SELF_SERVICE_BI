view: crm_customer {
  sql_table_name:GRADUADO.CRM.CUSTOMER
    ;;

#view: crm_customer {
 # derived_table: {
  #  sql: SELECT * FROM GRADUADO.CRM.CUSTOMER
   #   ;;
  #}

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  measure: count_id_envio {
    type: count_distinct
    sql: ${id_envio} ;;
    group_label: "Quantidade de Eventos"
    group_item_label: "Quantidade"
    description: "Contagem de eventos únicos"
  }

  measure: count_cpf {
    type: count_distinct
    sql: ${cpf} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Quantidade de Alunos"
    description: "Contagem de alunos unicos pelo campo cpf"
  }

  dimension: id_envio {
    type: string
    group_label: "Dados do Envio"
    label: "ID Envio"
    description: "Indica o ID do envio da comunicação"
    primary_key: yes
    sql: ${TABLE}."ID_ENVIO" ;;
  }

  dimension: origem_envio {
    type: string
    group_label: "Dados do Envio"
    label: "Origem do Envio"
    description: "Indica o a ferramenta de envio"
    sql: ${TABLE}."ORIGEM_ENVIO" ;;
  }

  dimension: nome {
    type: string
    group_label: "Dados do Aluno"
    label: "Nome do Aluno"
    description: "Indica o nome do Aluno"
    sql: ${TABLE}."NOME" ;;
  }


  dimension: email {
    type: string
    group_label: "Dados do Aluno"
    label: "Email do Aluno"
    description: "Indica o email do Aluno"
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: ddi {
    type: string
    group_label: "Dados do Aluno"
    label: "DDI do telefone do Aluno"
    description: "Indica o DDI do telefone do Aluno"
    sql: ${TABLE}."DDI" ;;
  }

  dimension: ddd {
    type: string
    group_label: "Dados do Aluno"
    label: "DDD do telefone do Aluno"
    description: "Indica o DDD do telefone do Aluno"
    sql: ${TABLE}."DDD" ;;
  }

  dimension: numero_celular {
    type: string
    group_label: "Dados do Aluno"
    label: "Número celular do Aluno"
    description: "Indica o número do celular do Aluno"
    sql: ${TABLE}."NUMERO_CELULAR" ;;
  }

  dimension: id_cpf {
    type: number
    group_label: "Dados do Aluno BO"
    label: "ID CPF do Aluno"
    description: "Indica o ID CPF do Aluno vindo do BO"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: cpf {
    type: number
    group_label: "Dados do Aluno"
    label: "CPF do Aluno"
    description: "Indica o CPF do Aluno"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: cpf_cio {
    type: string
    group_label: "Dados do Aluno"
    label: "CPF do Aluno CIO"
    description: "Indica o CPF do Aluno vindo da CIO"
    hidden: no
    sql: ${TABLE}."CPF_CIO" ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "Dados da Campanha"
    label: "ID da Campanha"
    description: "Indica o ID do Grupo da Campanha disparada"
    sql: ${TABLE}."CAMPAIGN_ID" ;;
  }

  dimension: name_campaign {
    type: string
    group_label: "Dados da Campanha"
    label: "Nome da Campanha"
    description: "Indica o nome da Campanha"
    sql: ${TABLE}."NAME_CAMPAIGN" ;;
  }

  dimension: tags_campaign {
    type: string
    group_label: "Dados da Campanha"
    label: "Tag Campanha"
    description: "Indica a Tag da Campanha"
    sql: ${TABLE}."TAGS_CAMPAIGN" ;;
  }

  dimension: id_tamplate_campaign {
    type: number
    group_label: "Dados da Campanha"
    label: "ID do Disparo"
    description: "Indica o ID do disparo feito"
    sql: ${TABLE}."ID_TAMPLATE_CAMPAIGN" ;;
  }

  dimension: nome_tamplate_campaign {
    type: string
    group_label: "Dados da Campanha"
    label: "Nome do Disparo"
    description: "Indica o Nome do Disparo feito"
    sql: ${TABLE}."NOME_TAMPLATE_CAMPAIGN" ;;
  }

  dimension: msg_template_campaign {
    type: string
    group_label: "Dados da Campanha"
    label: "Mensagem do Disparo"
    description: "Indica Mensagem do Disparo"
    sql: ${TABLE}."MSG_TEMPLATE_CAMPAIGN" ;;
  }

  dimension: assunto_acao_campaign {
    type: string
    group_label: "Dados da Campanha"
    label: "Assunto da Campanha"
    description: "Indica o Assunto da campanha disparada"
    sql: ${TABLE}."ASSUNTO_ACAO_CAMPAIGN" ;;
  }

  dimension: nome_evento {
    type: string
    group_label: "Dados do Evento"
    label: "Nome do Evento"
    description: "Indica o evento efetuado (Disparo, Entregue, Aberto, clicado)"
    sql: ${TABLE}."NOME_EVENTO" ;;
  }

  dimension: id_evento {
    type: string
    group_label: "Dados do Evento"
    label: "ID do Evento"
    description: "Indica o id referente a um disparo, ou seja, um e-mail, sms ou whatsapp"
    sql: ${TABLE}."ID_EVENTO" ;;
  }

  dimension_group: data_evento {
    type: time
   timeframes: [
    raw,
    time,
    date,
    week,
    day_of_month,
    month,
    month_name,
    quarter,
    year
  ]
    group_label: "Data Evento"
    label: "Data Evento"
    description: "Indica a data que foi realizado o evento"
    sql: ${TABLE}."DATA_EVENTO" ;;
  }

  dimension: canal_de_contato {
    type: string
    group_label: "Dados da Campanha"
    label: "Canal de Contato"
    description: "Indica o canal que houve a comunicação"
    sql: ${TABLE}."CANAL_DE_CONTATO" ;;
  }

  dimension: body_campaign {
    type: string
    group_label: "Dados da Campanha"
    label: "Texto da mensagem"
    description: "Indica o texto da comunicação que foi enviada"
    sql: ${TABLE}."BODY_CAMPAIGN" ;;
  }

  dimension: tipo_contato {
    type: string
    group_label: "Dados do Evento"
    label: "Tipo do Contato"
    description: "Indica se o contato foi feito de forma ativa ou receptiva"
    sql: ${TABLE}."TIPO_CONTATO" ;;
  }

  dimension: infos_jornada {
    type: string
    hidden: yes
    sql: ${TABLE}."INFOS_JORNADA" ;;
  }

  dimension: newsletter_id {
    type: number
    group_label: "Dados da Newsletter"
    label: "ID da Newsletter"
    description: "Indica o ID da Newsletter"
    sql: ${TABLE}."NEWSLETTER_ID" ;;
  }

  dimension: name_newsletter {
    type: string
    group_label: "Dados da Newsletter"
    label: "Nome da Newsletter"
    description: "Indica o Nome da Newsletter"
    sql: ${TABLE}."NAME_NEWSLETTER" ;;
  }

  dimension: tags_newsletter {
    type: string
    group_label: "Dados da Newsletter"
    label: "Tag Newsletter"
    description: "Indica a Tag da Newsletter"
    sql: ${TABLE}."TAGS_NEWSLETTER" ;;
  }

  dimension: id_tamplate_newsletter {
    type: number
    group_label: "Dados da Newsletter"
    label: "ID Template Newsletter"
    description: "Indica o ID Template Newsletter"
    sql: ${TABLE}."ID_TAMPLATE_NEWSLETTER" ;;
  }

  dimension: nome_tamplate_newsletter {
    type: string
    group_label: "Dados da Newsletter"
    label: "Nome Template Newsletter"
    description: "Indica o Nome Template Newsletter"
    sql: ${TABLE}."NOME_TAMPLATE_NEWSLETTER" ;;
  }

  dimension: msg_template_newsletter {
    type: string
    group_label: "Dados da Newsletter"
    label: "Mensagem da Newsletter"
    description: "Indica Mensagem da Newsletter"
    sql: ${TABLE}."MSG_TEMPLATE_NEWSLETTER" ;;
  }

  dimension: assunto_acao_newsletter {
    type: string
    group_label: "Dados da Newsletter"
    label: "Assunto da Newsletter"
    description: "Indica o Assunto da Newsletter"
    sql: ${TABLE}."ASSUNTO_ACAO_NEWSLETTER" ;;
  }

  dimension: body_newsletter {
    type: string
    group_label: "Dados da Newsletter"
    label: "Texto da mensagem Newsletter"
    description: "Indica o texto da comunicação que foi enviada - Newsletter"
    sql: ${TABLE}."BODY_NEWSLETTER" ;;
  }

#  dimension: mudou_etapa {
#    type: string
#    case: {
#      when: {
#       sql: ${dados_jornada_crm.DT_STATUS_date} > ${data_evento_date}
#             AND ${dados_jornada_crm.DT_STATUS_date} <= DATEADD(day, 3, ${data_evento_date}) ;;
#        label: "1"
#      }
#      else: "0"
#    }
#    group_label: "Dados do Evento"
#    label: "Mudou Etapa"
#    description: "Indicador de mudança de status"
#  }

#  dimension: mudou_etapa_2 {
#    type: string
#    case: {
#      when: {
#        sql: ${dados_jornada_crm.DT_STATUS_date} > ${data_evento_date}
#          AND ${dados_jornada_crm.DT_STATUS_date} <= DATEADD(day, 2, ${data_evento_date}) ;;
#        label: "1"
#      }
#      else: "0"
#    }
#    group_label: "Dados do Evento"
#    label: "Mudou de Etapa - 2 dias"
#    description: "Indicador de mudança de status - 2 dias"
#  }

#  dimension: mudou_etapa_1 {
#   type: string
#    case: {
#      when: {
#        sql: ${dados_jornada_crm.DT_STATUS_date} > ${data_evento_date}
#          AND ${dados_jornada_crm.DT_STATUS_date} <= DATEADD(day, 1, ${data_evento_date}) ;;
#        label: "1"
#      }
#      else: "0"
#    }
#    group_label: "Dados do Evento"
#    label: "Mudou de Etapa - 1 dia"
#    description: "Indicador de mudança de status - 1 dia"
#  }

  dimension: eficiencia_1_dia {
    type: yesno
    group_label: "Eficiencia"
    label: "Eficiência - 1 dia"
    description: "Indica se o aluno mudou de etapa até 1 dia depois do evento"
    sql: ${TABLE}."EFICIENCIA_1_DIA" ;;
  }

  dimension: eficiencia_2_dia {
    type: yesno
    group_label: "Eficiencia"
    label: "Eficiência - 2 diaS"
    description: "Indica se o aluno mudou de etapa até 2 dias após o evento"
    sql: ${TABLE}."EFICIENCIA_2_DIA" ;;
  }

  dimension: eficiencia_3_dia {
    type: yesno
    group_label: "Eficiencia"
    label: "Eficiência - 3 dias"
    description: "Indica se o aluno mudou de etapa até 3 dias após o evento"
    sql: ${TABLE}."EFICIENCIA_3_DIA" ;;
  }

  dimension: eficiencia_zen {
    type: yesno
    group_label: "Eficiencia"
    label: "Eficiência Zendesk - 3 dias"
    description: "Indicador que o aluno entrou em contato com nosso atendimento até 3 dias depois da comunicação"
    sql: ${TABLE}."EFICIENCIA_3_ZENDESK" ;;
  }

 # dimension: zendesk {
  #  type: string
   # case: {
    #  when: {
     #   sql: ${crm_dados_zendesk.DATA_INICIO_date} >= ${data_evento_date}
      #    AND ${crm_dados_zendesk.DATA_INICIO_date} <= DATEADD(day, 3, ${data_evento_date}) ;;
       # label: "1"
      #}
      #else: "0"
    #}
    #group_label: "Dados do Evento"
    #label: "Passou pela Zendesk"
    #description: "Indicador que o aluno entrou em contato com nosso atendimento até 3 dias depois da comunicação"
  #}

  dimension: erros {
    type: string
    group_label: "Dados do Envio"
    label: "Erros"
    description: "Indica o tipo de erro que houve no envio"
    sql: ${TABLE}."ERROS" ;;
  }

  set: detail {
    fields: [
      id_envio,
      origem_envio,
      nome,
      id_cpf,
      cpf,
      cpf_cio,
      campaign_id,
      id_tamplate_campaign,
      nome_tamplate_campaign,
      msg_template_campaign,
      assunto_acao_campaign,
      nome_evento,
      data_evento_time,
      canal_de_contato,
      body_campaign,
      newsletter_id,
      id_tamplate_newsletter,
      nome_tamplate_newsletter,
      msg_template_newsletter,
      assunto_acao_newsletter,
      body_newsletter,
      tipo_contato,
      infos_jornada
    ]
  }
}
