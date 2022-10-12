
view: funil_nova_proposta {

  sql_table_name: "GRADUADO"."AD_HOC"."FUNIL_NOVA_PROPOSTA"
    ;;


  dimension: como_soube {
    type: string
    sql: ${TABLE}."COMO_SOUBE" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DT_STATUS" ;;
  }

  dimension_group: data_safrado {
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
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_SAFRADO" ;;
  }

  dimension: etapa {
    type: string
    sql: ${TABLE}."ETAPA" ;;
    order_by_field: ordem_etapa
  }

  dimension: qtd {
    type: number
    sql: ${TABLE}."QTD" ;;
  }

  dimension: ordem_etapa {
    type: number
    hidden: yes
    sql: CAST(${ordem_etapa_funil} AS INT) ;;

  }

  dimension: ordem_etapa_funil {
    type: string
    case: {
      when: {
        sql: ${etapa} = 'LEAD' ;;
        label: "0"
      }
      when: {
        sql: ${etapa} = 'Elegivel' ;;
        label: "0"
      }

      when: {
        sql: ${etapa} = 'SIMULADO' ;;
        label: "1"
      }
      when: {
        sql: ${etapa} = 'INICIADO'  ;;
        label: "2"
      }
      when: {
        sql: ${etapa} = 'Iniciado / Elegivel'  ;;
        label: "2"
      }
      when: {
        sql: ${etapa} = 'FINALIZADO' ;;
        label: "3"
      }
      when: {
        sql: ${etapa} = 'APROVADO RISCO' ;;
        label: "4"
      }

      when: {
        sql: ${etapa} = 'Aprovado Behavior' ;;
        label: "5"
      }

      when: {
        sql: ${etapa} = 'MATRICULA AE' ;;
        label: "6"
      }

      when: {
        sql: ${etapa} = 'APROVADO INSTITUICAO' ;;
        label: "6"
      }

      when: {
        sql: ${etapa} = 'Contrato Gerado';;
        label: "8"
      }

      when: {
        sql: ${etapa} = 'AGUARDANDO DOCUMENTO';;
        label: "9"
      }

      when: {
        sql: ${etapa} = 'AGUARDANDO ASSINATURA' ;;
        label: "10"
      }
      when: {
        sql: ${etapa} = 'Contrato Assinado' ;;
        label: "11"
      }

      when: {
        sql: ${etapa} = 'FORMALIZADO' ;;
        label: "12"
      }
      when: {
        sql: ${etapa} = 'CEDIDO';;
        label: "13"
      }
      else: "14"
    }
    hidden: yes
  }

  measure: total_qtd {
    type: sum
    sql: ${qtd} ;;
  }

}
