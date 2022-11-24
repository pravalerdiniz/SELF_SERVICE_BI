view: final_pdd {
  sql_table_name: "AD_HOC"."FINAL_PDD"
    ;;

  dimension: ano_cessao_cpf {
    type: string
    label: "Cessão Aluno"
    group_label: "Dados do Aluno"
    description: "Ano da cessão do primeiro contrato do aluno"
    sql: ${TABLE}."ANO_CESSAO_CPF" ;;
  }

  dimension: ano_cessao_fundo {
    type: string
    label: "Cessão Fundo"
    group_label: "Dados do Fundo"
    description: "Ano da cessão do primeiro contrato do aluno no fundo de investimento"
    sql: ${TABLE}."ANO_CESSAO_FUNDO" ;;
  }

  dimension_group: data_cessao {
    type: time
    label: "Data Cessão"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_CESSAO" ;;
  }

  dimension: tdt_ano_obs {
    type: string
    label: "Ano/Mês Observação"
    group_label: "Datas Referência"
    description: "Ano e mês de observação do registro"
    sql: ${TABLE}."TDT_ANO_OBS" ;;
  }

  dimension_group: data_visao {
    type: time
    label: "Data Visão"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_VISAO" ;;
  }

  dimension: dias_atraso_cpf {
    type: number
    label: "Atraso Aluno"
    group_label: "Dados do Aluno"
    description: "Maior quantidade de dias de atraso no pagamento dos boletos pelo aluno"
    sql: ${TABLE}."DIAS_ATRASO_CPF" ;;
  }

  measure: total_dias_atraso_cpf {
    type: sum
    label: "Soma Atraso Aluno"
    group_label: "Dados do Aluno"
    description: "Maior quantidade de dias de atraso no pagamento dos boletos pelo aluno"
    sql: ${dias_atraso_cpf} ;;
  }

  measure: average_dias_atraso_cpf {
    type: average
    label: "Média Atraso Aluno"
    group_label: "Dados do Aluno"
    description: "Maior quantidade de dias de atraso no pagamento dos boletos pelo aluno"
    sql: ${dias_atraso_cpf} ;;
  }

  dimension: dias_atraso_fundo {
    type: number
    label: "Atraso Fundo"
    group_label: "Dados do Fundo"
    description: "Dias de atraso para o pagamento do fundo"
    sql: ${TABLE}."DIAS_ATRASO_FUNDO" ;;
  }

  dimension: fundo {
    type: number
    label: "Fundo de Investimento"
    group_label: "Dados do Fundo"
    description: "Identifica o fundo utilizado"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: id_ies {
    label: "IES ID"
    group_label: "Dados da IES"
    description: "ID da instituição no qual o curso é ofertado"
    type: number
    sql: ${TABLE}."ID_IES" ;;
  }

  dimension: id_produto {
    label: "Produto ID"
    group_label: "Dados de Cessão"
    description: "ID que indica o curso do aluno."
    type: number
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: maturidade_cessao {
    label: "Maturidade Cessão"
    group_label: "Dados de Cessão"
    description: "Indica quantas cessões o aluno já passou"
    type: number
    sql: ${TABLE}."MATURIDADE_CESSAO" ;;
  }

  dimension: maturidade_cpf {
    type: number
    label: "Maturidade Aluno"
    group_label: "Dados do Aluno"
    description: "Indica a quanto tempo o aluno está na base do pravaler"
    sql: ${TABLE}."MATURIDADE_CPF" ;;
  }

  dimension: maturidade_fundo {
    type: number
    label: "Maturidade do Fundo"
    group_label: "Dados do Fundo"
    description: "Maturidade do cpf, indica a quanto tempo o aluno está na base do pravaler no fundo sendo analisado."
    sql: ${TABLE}."MATURIDADE_FUNDO" ;;
  }

  dimension: maturidade_visao {
    type: number
    label: "Maturidade Aluno Mês Visao"
    group_label: "Dados do Aluno"
    description: "Maturidade no CPF no mês que está sendo calculado"
    sql: ${TABLE}."MATURIDADE_VISAO" ;;
  }

  dimension: min_maturidade_cessao {
    type: number
    label: "Mínimo Maturidade Cessão"
    group_label: "Dados de Cessão"
    description: "Menor valor da maturidade na cessao realizada"
    sql: ${TABLE}."MIN_MATURIDADE_CESSAO" ;;
  }

  dimension_group: mindetdt_vecto {
    type: time
    label: "Data Menor Vencimento"
    description: "Menor data de vencimento do cpf"
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."MINDETDT_VECTO" ;;
  }

  dimension: provisao_cpf {
    type: number
    label: "Provisão Aluno"
    group_label: "Dados do Aluno"
    description: "Valor da provisão para cada cpf"
    sql: ${TABLE}."PROVISAO_CPF" ;;
  }

  dimension: provisao_cpf_pct {
    type: number
    label: "Porcentagem Provisão Aluno"
    group_label: "Dados do Aluno"
    description: "Percentual da provisão por cpf"
    sql: ${TABLE}."PROVISAO_CPF_PCT" ;;
  }

  dimension: provisao_cpf_tx_pdd_nova {
    type: number
    label: "Taxa Provisão Aluno"
    group_label: "Dados do Aluno"
    description: "Taxa aplicada a provisão"
    sql: ${TABLE}."PROVISAO_CPF_TX_PDD_NOVA" ;;
  }

  dimension: provisao_fundo {
    type: number
    label: "Provisão Fundo"
    group_label: "Dados do Fundo"
    description: "Fundo que  sairá a provisão: bv, etc"
    sql: ${TABLE}."PROVISAO_FUNDO" ;;
  }

  dimension: provisao_fundo_pct {
    type: number
    label: "Porcentagem Provisão Fundo"
    description: "Percentual de provisão por fundo"
    group_label: "Dados do Fundo"
    sql: ${TABLE}."PROVISAO_FUNDO_PCT" ;;
  }

  dimension: rating_cpf {
    type: string
    label: "Rating Aluno"
    group_label: "Dados do Aluno"
    description: "Classificação do cpf"
    sql: ${TABLE}."RATING_CPF" ;;
  }

  dimension: rating_fundo {
    type: string
    label: "Rating Fundo"
    group_label: "Dados do Fundo"
    description: "Classificação do fundo"
    sql: ${TABLE}."RATING_FUNDO" ;;
  }

  dimension: safra_cessao_cpf {
    type: string
    label: "Safra Aluno"
    group_label: "Dados do Aluno"
    description: "Indica a safra e cessao que o cpf está passando"
    sql: ${TABLE}."SAFRA_CESSAO_CPF" ;;
  }

  dimension: safra_cessao_fundo {
    type: string
    label: "Safra Fundo"
    description: "Indica a safra e cessao do fundo"
    group_label: "Dados do Fundo"
    sql: ${TABLE}."SAFRA_CESSAO_FUNDO" ;;
  }

  dimension: safra_cessao_sem {
    type: string
    label: "Safra Cessão"
    group_label: "Dados de Cessão"
    description: "Indica a safra e cessao do semestre"
    sql: ${TABLE}."SAFRA_CESSAO_SEM" ;;
  }

  dimension: sem_visao {
    type: string
    label: "Semestre Visão"
    group_label: "Datas Referência"
    description: "Semestre em que está sendo feita a analise"
    sql: ${TABLE}."SEM_VISAO" ;;
  }

  dimension: tdt_ano_mes {
    type: string
    group_label: "Datas Referência"
    label: "Data Referência"
    description: "Ano e mês de referência do registro"
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: tdt_cpf {
    type: number
    label: "ID CPF"
    group_label: "Dados do Aluno"
    description: "Número atribuído como máscara do cpf do aluno"
    sql: ${TABLE}."TDT_CPF" ;;
  }

  dimension: tx_pdd_nova {
    type: number
    label: "Taxa PDD Nova"
    group_label: "Valores"
    description: "Taxa \"nova\" cobrada no pdd"
    value_format: "0.00%"
    sql: ${TABLE}."TX_PDD_NOVA" ;;
  }

  measure: sum_tx_pdd_nova {
    type: sum
    label: "Soma Taxa PDD Nova"
    group_label: "Valores"
    description: "Taxa \"nova\" cobrada no pdd"
    value_format: "0.00%"
    sql: ${tx_pdd_nova} ;;
  }

  dimension: valor_presente {
    type: number
    value_format: "$#,##0.00"
    label: "Valor presente"
    group_label: "Valores"
    description: "Valor presente"
    sql: ${TABLE}."VALOR_PRESENTE" ;;
  }

  measure: sum_VP {
    type: sum
    value_format: "$#,##0.00"
    label: "Soma Valor Presente"
    group_label: "Valores"
    description: "Valor presente"
    sql: ${valor_presente} ;;
  }

  measure: avg_VP {
    type: average
    value_format: "$#,##0.00"
    label: "Média Valor Presente"
    group_label: "Valores"
    description: "Valor presente"
    sql: ${valor_presente} ;;
  }

  measure: count_cpf {
    type: count_distinct
    label: "Qtd Alunos"
    group_label: "Dados do Aluno"
    description: "Quantidade de alunos (cpfs)"
    sql: ${tdt_cpf} ;;
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
