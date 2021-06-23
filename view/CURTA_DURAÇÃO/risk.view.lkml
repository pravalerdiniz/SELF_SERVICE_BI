view: risk {
  sql_table_name: "CURTA"."RISK"
    ;;

  dimension: analise_risco {
    type: string
    sql: ${TABLE}."ANALISE_RISCO" ;;
    description: "ANALISES DE RISCO JÁ CALCULADAS"
  }

  dimension_group: dt_insecao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DT_INSECAO" ;;
    description: "DATA DA INSERÇÃO DA ANALISE DE RISCO DO ALUNO"
  }

  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;
    description: "IDENTIFICAR ÚNICO DO ALUNO"
  }

  dimension: id_fiador {
    type: string
    sql: ${TABLE}."ID_FIADOR" ;;
    description: "IDENTIFICAR ÚNICO DO FIADOR"
  }

  dimension: renda {
    type: string
    sql: ${TABLE}."RENDA" ;;
    description: "RENDA DO ALUNO"
  }

  dimension: renda_fiador {
    type: string
    sql: ${TABLE}."RENDA_FIADOR" ;;
    description: "RENDA DO FIADOR"
  }

  dimension_group: ultima_atualizacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."ULTIMA_ATUALIZACAO" ;;
    description: "DATA DA ULTIMA ATUALIZAÇÃO DA ANALISE DE RISCO DO ALUNO"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
