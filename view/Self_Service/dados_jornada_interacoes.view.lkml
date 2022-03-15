view: dados_jornada_interacoes {
  derived_table: {
    persist_for: "1 hour"
    sql: select
            CPF_REQUESTER,
            f.value:ID_PROPOSTA::varchar as ID_PROPOSTA,
            f.value:DATA_INICIO_PROPOSTA::timestamp as DATA_INICIO_PROPOSTA,
            f.value:DT_STATUS::timestamp as DT_STATUS,
            f.value:ETAPA::varchar as ETAPA,
            f.value:STATUS_ETAPA::int as STATUS_ETAPA,
            f.value:TIPO_PROPOSTA::varchar as TIPO_PROPOSTA

      from GRADUADO.SELF_SERVICE_BI.INTERACOES a,
      lateral flatten (input => INFOS_JORNADA) f
      ;;
  }
  dimension_group: DATA_INICIO_PROPOSTA{
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
    group_label: "Data Inicio Proposta"
    sql: ${TABLE}.DATA_INICIO_PROPOSTA ;;
    label: "Data Inicio Proposta"
  }

  dimension_group: DT_STATUS{
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
    group_label: "Data Status"
    sql: ${TABLE}.DT_STATUS ;;
    label: "Data Status"
  }
  dimension: ID_PROPOSTA {
    type: string
    label: "ID Proposta"
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }
  dimension: cpf_requester {
    type: number
    label: "CPF"
    sql: ${TABLE}."CPF_REQUESTER" ;;
  }
  dimension: ETAPA {
    type: string
    label: "ETAPA"
    sql: ${TABLE}."ETAPA" ;;
  }

  dimension: STATUS_ETAPA {
    type: number
    label: "STATUS_ETAPA"
    sql: ${TABLE}."STATUS_ETAPA" ;;
  }

  dimension: TIPO_PROPOSTA {
    type: string
    label: "TIPO_PROPOSTA"
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
  }
}
