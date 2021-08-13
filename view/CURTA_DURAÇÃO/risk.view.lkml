view: risk {
  sql_table_name: "VETERANO"."CURTA"."RISK"
    ;;

  dimension: analise_risco {
    type: string
    sql: ${TABLE}."ANALISE_RISCO" ;;
    description: "ANALISES DE RISCO JÁ CALCULADAS"
    hidden: yes
  }

  dimension: score {
    type: string
    sql: ${TABLE}."SCORE" ;;
    description: "SCORE ATRIBUIDO AO ALUNO (CPF)"
    group_item_label: "Score"
  }

  dimension: gh_aluno {
    type:  string
    sql: ${TABLE}."GH_ALUNO" ;;
    description: "GRUPO HOMOGÊNEO ATRIBUÍDO AO ALUNO"
    group_item_label: "GH do Aluno"
  }


  dimension: score_fiador {
    type: string
    sql: ${TABLE}."SCORE_FIADOR" ;;
    description: "SCORE ATRIBUIDO AO RESPONSÁVEL FINANCEIRO (CPF)"
    group_item_label: "Score do Responsável Financeiro"
  }

  dimension: gh_fiador {
    type:  string
    sql: ${TABLE}."GH_FIADOR" ;;
    description: "GRUPO HOMOGÊNEO ATRIBUÍDO AO RESPONSÁVEL FINANCEIRO"
    group_item_label: "GH do Responsável Financeiro"
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

  dimension: modelo_score {
    type: string
    sql: ${TABLE}."MODELO_SCORE" ;;
    description: "INDICA O MODELO DE CLASSIFICAÇÃO DO SCORE"
    group_item_label: "Score_Model"
  }

  dimension: modelo_score_fiador {
    type: string
    sql: ${TABLE}."MODELO_SCORE_FIADOR" ;;
    description: "INDICA O MODELO DE CLASSIFICAÇÃO DO SCORE DO RESPONSÁVEL FINANCEIRO"
    group_item_label: "Score_Model_Fiador"
  }

  dimension: cpf_fiador {
    type: string
    sql: ${TABLE}."CPF_FIADOR" ;;
    description: "CPF DO RESPONSÁVEL FINANCEIRO"
    group_item_label: "CPF do Fiador"
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
    description: "IDENTIFICAR ID ÚNICO DO RESPONSÁVEL FINANCEIRO "
    hidden: yes
  }

  dimension: renda {
    type: string
    sql: ${TABLE}."RENDA" ;;
    description: "RENDA DO ALUNO"
    value_format: "$ #,###"
    group_item_label: "Renda do Aluno"
  }

  dimension: renda_fiador {
    type: string
    sql: ${TABLE}."RENDA_FIADOR" ;;
    description: "RENDA DO FIADOR"
    value_format: "$ #,###"
    hidden: yes
    group_item_label: "Renda do Responsável Financeiro"
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

  measure: sum_renda_aluno {
    type: sum
    sql: ${renda} ;;
    group_label: "Renda"
    group_item_label: "Soma"
    value_format: "$ #,###"
    description: "Indica a soma do valor da renda do aluno da última vez que ele passou pela análise de crédito"
    drill_fields: []

  }

  measure: avg_renda_aluno {
    type: average
    sql: ${renda} ;;
    group_label: "Renda"
    group_item_label: "Média"
    value_format: "$ #,###"
    description: "Indica a média do valor da renda do aluno da última vez que ele passou pela análise de crédito"
    drill_fields: []

  }


  measure: med_renda_aluno {
    type: median
    sql: ${renda} ;;
    group_label: "Renda"
    group_item_label: "Médiana"
    value_format: "$ #,###"
    description: "Indica a mediana do valor da renda do aluno da última vez que ele passou pela análise de crédito"
    drill_fields: []

  }

  measure: min_renda_aluno {
    type: min
    sql: ${renda} ;;
    group_label: "Renda"
    group_item_label: "Mínimo"
    value_format: "$ #,###"
    description: "Indica o minimo do valor da renda do aluno da última vez que ele passou pela análise de crédito"
    drill_fields: []

  }

  measure: max_renda_aluno {
    type: max
    sql: ${renda} ;;
    group_label: "Renda"
    group_item_label: "Máximo"
    value_format: "$ #,###"
    description: "Indica o máximo do valor da renda do aluno da última vez que ele passou pela análise de crédito"
    drill_fields: []

  }

  measure: sum_renda_fiador {
    type: sum
    sql: ${renda_fiador} ;;
    group_label: "Renda Fiador"
    group_item_label: "Fiador Soma"
    value_format: "$ #,###"
    hidden: yes
    description: "Indica a soma do valor da renda do Responsável Financeiro, da última vez que o aluno passou pela análise de crédito"
    drill_fields: []

  }

  measure: avg_renda_fiador {
    type: average
    sql: ${renda_fiador} ;;
    group_label: "Renda Fiador"
    group_item_label: "Fiador Média"
    value_format: "$ #,###"
    hidden: yes
    description: "Indica a média do valor da renda do Responsável Financeiro, da última vez que o aluno passou pela análise de crédito"
    drill_fields: []

  }


  measure: med_renda_fiador {
    type: median
    sql: ${renda_fiador} ;;
    group_label: "Renda Fiador"
    group_item_label: "Fiador Mediana"
    value_format: "$ #,###"
    hidden: yes
    description: "Indica a mediana do valor da renda do Responsável Financeiro, da última vez que o aluno passou pela análise de crédito"
    drill_fields: []

  }

  measure: min_renda_fiador {
    type: min
    sql: ${renda_fiador} ;;
    group_label: "Renda Fiador"
    group_item_label: "Fiador Mínimo"
    value_format: "$ #,###"
    hidden: yes
    description: "Indica o mínimo do valor da renda do Responsável Financeiro, da última vez que o aluno passou pela análise de crédito"
    drill_fields: []

  }

  measure: max_renda_fiadorr {
    type: max
    sql: ${renda_fiador} ;;
    group_label: "Renda Fiador"
    group_item_label: "Fiador Máximo"
    value_format: "$ #,###"
    hidden: yes
    description: "Indica o máximo do valor da renda do Responsável Financeiro, da última vez que o aluno passou pela análise de crédito"
    drill_fields: []

  }


  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
