view: risk {
  sql_table_name: "CURTA"."RISK"
    ;;

  dimension: analise_risco {
    type: string
    sql: ${TABLE}."ANALISE_RISCO" ;;
    description: "ANALISES DE RISCO JÁ CALCULADAS"
    hidden: yes
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
    group_item_label: "Data de Criação"
  }

  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;
    description: "IDENTIFICAR ÚNICO DO ALUNO"
    primary_key: yes
    hidden: yes
  }

  dimension: id_fiador {
    type: string
    sql: ${TABLE}."ID_FIADOR" ;;
    description: "IDENTIFICAR ÚNICO DO FIADOR"
    hidden: yes
  }

  dimension: renda {
    type: string
    sql: ${TABLE}."RENDA" ;;
    description: "RENDA DO ALUNO"
    group_item_label: "Renda do Aluno"
  }

  dimension: renda_fiador {
    type: string
    sql: ${TABLE}."RENDA_FIADOR" ;;
    description: "RENDA DO FIADOR"
    group_item_label: "Renda do Fiador"
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
    hidden: yes
  }
}
