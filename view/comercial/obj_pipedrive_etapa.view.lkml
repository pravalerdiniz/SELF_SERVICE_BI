view: obj_pipedrive_etapa {
    derived_table: {
      persist_for: "1 hour"
      sql: select
            f.value:ID_NEGOCIO::int as ID_NEGOCIO,
            f.value:DATA_MUDANCA_ETAPA::timestamp as DATA_MUDANCA_ETAPA,
            f.value:FLG_ETAPA_ESTAGNADO::boolean as FLG_ETAPA_ESTAGNADO,
            f.value:ID_ETAPA::int as ID_ETAPA,
            f.value:ID_ETAPA_FUNIL::int as ID_ETAPA_FUNIL,
            f.value:ID_FUNIL::int as ID_FUNIL,
            f.value:NOME_ETAPA_FUNIL::varchar as NOME_ETAPA_FUNIL,
            f.value:NOME_FUNIL::varchar as NOME_FUNIL,
            f.value:SEGUNDOS_ESTAGNADO::int as SEGUNDOS_ESTAGNADO
            from GRADUADO.PIPEDRIVE.VW_PIPEDRIVE_DEALS_PIPELINE a,
            lateral flatten (input => infos_pipeline) f
 ;;
    }

  dimension: chave {
    type: string
    primary_key: yes
    hidden: yes
    sql: concat(${id_negocio},${id_etapa}) ;;
  }

    dimension: id_negocio {
      type: number
      sql: ${TABLE}."ID_NEGOCIO" ;;
      label: "ID Negócio"
    }

  dimension_group: dt_mudanca_etapa {
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
    sql: ${TABLE}."DATA_MUDANCA_ETAPA" ;;
    label: "Data Entrada na Etapa"
  }


  dimension: flg_etapa_estagnado {
    type: yesno
    sql: ${TABLE}."FLG_ETAPA_ESTAGNADO" ;;
    label: "Flag etapa estagnado"
  }
  dimension: id_etapa {
    type: number
    sql: ${TABLE}."ID_ETAPA" ;;
    label: "ID Etapa"
  }
  dimension: id_etapa_funil {
    type: number
    sql: ${TABLE}."ID_ETAPA_FUNIL" ;;
    label: "ID Etapa Funil"
  }
  dimension: id_funil {
    type: number
    sql: ${TABLE}."ID_FUNIL" ;;
    label: "ID Funil"
  }
  dimension: nome_etapa_funil {
    type: string
    sql: ${TABLE}."NOME_ETAPA_FUNIL" ;;
    label: "Nome Etapa Funil"
  }
  dimension: nome_funil {
    type: string
    sql: ${TABLE}."NOME_FUNIL" ;;
    label: "Nome do Funil"
  }
  measure: segundos_estagnado {
    type: sum
    sql: ${TABLE}."SEGUNDOS_ESTAGNADO" ;;
    label: "Tempo na Etapa (segundos)"
    value_format: "0"
  }

  measure: tempo_etapa {
    type: sum
    sql: (${TABLE}."SEGUNDOS_ESTAGNADO"/60/60/24) ;;
    label: "Tempo na Etapa (Dias)"
    value_format: "0"
  }

  measure: count_id_negocio {
    type: count_distinct
    sql: ${id_negocio} ;;
    label: "Qtd de negócios"
  }

 }
