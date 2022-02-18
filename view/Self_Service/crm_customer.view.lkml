view: crm_customer {
  derived_table: {
    sql: SELECT * FROM GRADUADO.CRM.CUSTOMER
      ;;
  }

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

  dimension: id_cpf {
    type: number
    group_label: "Dados do Aluno BO"
    label: "CPF do Aluno"
    description: "Indica o CPF do Aluno vindo do BO"
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}."CPF_CIO" ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "Dados da Campanha"
    label: "ID do Grupo Campanha"
    description: "Indica o ID do Grupo da CAmpanha disparada"
    sql: ${TABLE}."CAMPAIGN_ID" ;;
  }

  dimension: id_tamplate {
    type: number
    group_label: "Dados da Campanha"
    label: "ID da Campanha"
    description: "Indica o ID da campanha disparada"
    sql: ${TABLE}."ID_TAMPLATE" ;;
  }

  dimension: nome_tamplate {
    type: string
    group_label: "Dados da Campanha"
    label: "Nome da Campanha"
    description: "Indica o Nome da campanha disparada"
    sql: ${TABLE}."NOME_TAMPLATE" ;;
  }

  dimension: msg_template {
    type: string
    group_label: "Dados da Campanha"
    label: "Mensagem da Campanha"
    description: "Indica Mensagem da campanha disparada"
    sql: ${TABLE}."MSG_TEMPLATE" ;;
  }

  dimension: assunto_acao {
    type: string
    group_label: "Dados da Campanha"
    label: "Assunto da Campanha"
    description: "Indica o Assunto da campanha disparada"
    sql: ${TABLE}."ASSUNTO_ACAO" ;;
  }

  dimension: nome_evento {
    type: string
    group_label: "Dados do Evento"
    label: "Nome do Evento"
    description: "Indica o evento efetuado (Disparo, Entregue, Aberto, clicado)"
    sql: ${TABLE}."NOME_EVENTO" ;;
  }

  dimension_group: data_entrega {
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
    sql: ${TABLE}."DATA_ENTREGA" ;;
  }

  dimension: canal_de_contato {
    type: string
    group_label: "Dados da Campanha"
    label: "Canal de Contato"
    description: "Indica o canal que houve a comunicação"
    sql: ${TABLE}."CANAL_DE_CONTATO" ;;
  }

  dimension: body {
    type: string
    group_label: "Dados da Campanha"
    label: "Texto da mensagem"
    description: "Indica o texto da comunicação que foi enviada"
    sql: ${TABLE}."BODY" ;;
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

  dimension: mudou_etapa {
    type: string
    case: {
      when: {
        sql: ${dados_jornada_crm.DT_STATUS_date} > ${data_entrega_date}
             AND ${dados_jornada_crm.DT_STATUS_date} <= add_days(3,${crm_customer.data_entrega_date} ;;
        label: "1"
      }
      else: "0"
    }
    group_label: "Dados do Evento"
    label: "Mudou Etapa"
    description: "Indicador de mudança de status"
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
      id_tamplate,
      nome_tamplate,
      msg_template,
      assunto_acao,
      nome_evento,
      data_entrega_time,
      canal_de_contato,
      body,
      tipo_contato,
      infos_jornada
    ]
  }
}
