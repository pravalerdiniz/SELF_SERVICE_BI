view: crm_dados_zendesk {
    derived_table: {
      persist_for: "1 hour"
      sql: select
            EMAIL,
            CPF,
            f.value:CONTATO_FEITO_POR::varchar as CONTATO_FEITO_POR,
            f.value:DATA_FIM::timestamp as DATA_FIM,
            f.value:DATA_INICIO::timestamp as DATA_INICIO,
            f.value:DESCRICAO_TICKET::varchar as DESCRICAO_TICKET,
            f.value:DURACAO::float as DURACAO,
            f.value:FILA::varchar as FILA,
            f.value:ID_TICKET::int as ID_TICKET,
            f.value:MOTIVO_CONTATO_RECEPTIVO::varchar as MOTIVO_CONTATO_RECEPTIVO,
            f.value:STATUS_TICKET::varchar as STATUS_TICKET,
            f.value:TIPO::varchar as TIPO,
            f.value:TITULO_TICKET::varchar as TITULO_TICKET

        from GRADUADO.CRM.CUSTOMER a,
        lateral flatten (input => INFOS_ZENDESK) f
        ;;
    }
    dimension_group: DATA_INICIO{
      type: time
      timeframes: [
        raw,
        date,
        week,
        month,
        month_name,
        quarter,
        year,
        day_of_year
      ]
      convert_tz: no
      datatype: date
      group_label: "Data Inicio Ticket"
      sql: ${TABLE}.DATA_INICIO ;;
      label: "Data Inicio Ticket"
    }

  dimension_group: DATA_FIM{
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year
    ]
    convert_tz: no
    datatype: date
    group_label: "Data Fim Ticket"
    sql: ${TABLE}.DATA_FIM ;;
    label: "Data Fim Ticket"
  }

  dimension: cpf {
    type: number
    label: "CPF do Aluno"
    description: "Indica o CPF do Aluno"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: email {
    type: string
    label: "Email do Aluno"
    description: "Indica o email do Aluno"
    sql: ${TABLE}."EMAIL" ;;
  }

    dimension: ID_TICKET {
      type: string
      label: "ID do Ticket"
      sql: ${TABLE}."ID_TICKET" ;;
    }

    dimension: CONTATO_FEITO_POR {
      type: string
      label: "Contato Feito por"
      sql: ${TABLE}."CONTATO_FEITO_POR" ;;
    }

  dimension: DESCRICAO_TICKET {
    type: string
    label: "Descrição do Ticket"
    sql: ${TABLE}."DESCRICAO_TICKET" ;;
  }

    dimension: DURACAO {
      type: number
      label: "Duração do Ticket"
      sql: ${TABLE}."DURACAO" ;;
    }

    dimension: MOTIVO_CONTATO_RECEPTIVO {
      type: string
      label: "Motivo do Contato"
      sql: ${TABLE}."MOTIVO_CONTATO_RECEPTIVO" ;;
    }

  dimension: FILA {
    type: string
    label: "Fila"
    sql: ${TABLE}."FILA" ;;
  }

  dimension: STATUS_TICKET {
    type: string
    label: "Status do Ticket"
    sql: ${TABLE}."STATUS_TICKET" ;;
  }

  dimension: TIPO {
    type: string
    label: "Tipo do Ticket"
    sql: ${TABLE}."TIPO" ;;
  }

  dimension: TITULO_TICKET {
    type: string
    label: "Título do Ticket"
    sql: ${TABLE}."TITULO_TICKET" ;;
  }
  }
