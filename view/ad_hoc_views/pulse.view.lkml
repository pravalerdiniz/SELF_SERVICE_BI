view: pulse {
  sql_table_name: "GENTE_GESTAO"."PULSE"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }




  dimension_group: data_pesquisa {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    description: "Indica a data de realização da pesquisa"
    sql: ${TABLE}."DATA_PESQUISA" ;;
  }

  dimension: diretoria {
    type: string
    sql: ${TABLE}."DIRETORIA" ;;
  }

  dimension: grau_concordancia {
    type: string
    sql: ${TABLE}."GRAU_CONCORDANCIA" ;;
    order_by_field: ordem_grau_concordancia
  }

  dimension: ordem_grau_concordancia {
    type: number
    group_label: "Grau de Concordancia"
    label: "Ordem - Grau"
    hidden: yes
    sql: CAST(${ordem_grau} AS INT) ;;

  }

  dimension: ordem_grau {
    type: string
    case: {
      when: {
        sql: ${grau_concordancia} = 'Concordo totalmente' ;;
        label: "1"
      }
      when: {
        sql: ${grau_concordancia} = 'Concordo' ;;
        label: "2"
      }
      when: {
        sql: ${grau_concordancia} = 'Não concordo, nem discordo' ;;
        label: "3"
      }

      when: {
        sql: ${grau_concordancia} = 'Discordo' ;;
        label: "4"
      }
      when: {
        sql: ${grau_concordancia} = 'Discordo totalmente' ;;
        label: "5"
      }
      else: "0"
    }
    hidden: yes
  }

  dimension: sentimento {
    type: string
    sql: ${TABLE}."SENTIMENTO" ;;
  }

  dimension: sentimento_cat {
    type: number
    sql: ${TABLE}."SENTIMENTO_CAT" ;;
  }

  dimension: tempo_casa {
    type: string
    order_by_field: ordem_tempo_casa
    sql: ${TABLE}."TEMPO_CASA" ;;
  }

  dimension: ordem_tempo_casa {
    type: number
    group_label: "Tempo de Casa"
    label: "Ordem - Tempo de Casa"
    hidden: yes
    sql: CAST(${ordem_tempo} AS INT) ;;

  }


  dimension: ordem_tempo {
    type: string
    case: {
      when: {
        sql: ${tempo_casa} = '3 meses ou menos' ;;
        label: "1"
      }
      when: {
        sql: ${tempo_casa} = 'Entre 4 e 6 meses' ;;
        label: "2"
      }
      when: {
        sql: ${tempo_casa} = 'Entre 7 e 11 meses' ;;
        label: "3"
      }

      when: {
        sql: ${tempo_casa} = 'Entre 1 ano e 1 ano e 11 meses' ;;
        label: "4"
      }
      when: {
        sql: ${tempo_casa} = '2 anos ou mais' ;;
        label: "5"
      }
      else: "0"
    }
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
