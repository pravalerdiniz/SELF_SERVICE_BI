# The name of this view in Looker is "Fato Final Pdd"
view: fato_final_pdd {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "VETERANO"."FATO"."FATO_FINAL_PDD"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ano Cessao Cpf" in Explore.

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

  dimension: ano_mes_obs {
    type: string
    sql: ${TABLE}."ANO_MES_OBS" ;;
    hidden: yes
  }

  dimension: data_formatura {
    type: string
    sql: ${TABLE}."DATA_FORMATURA" ;;
  }

  dimension_group: data_visao {
    type: time
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
    label: "ID Fundo de Investimento"
    group_label: "Dados do Fundo"
    description: "Identifica o ID do fundo de investimento."
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: id_cpf {
    type: number
    label: "ID CPF"
    group_label: "Dados do Aluno"
    description: "Número atribuído como máscara do cpf do aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_curso {
    type: string
    label: "Produto ID"
    group_label: "Dados de Cessão"
    description: "ID que indica o curso do aluno."
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_ies {
    label: "IES ID"
    group_label: "Dados da IES"
    description: "ID da instituição no qual o curso é ofertado"
    type: number
    sql: ${TABLE}."ID_INSTITUICAO" ;;
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

  dimension_group: min_data_vencimento {
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
    sql: ${TABLE}."MIN_DATA_VENCIMENTO" ;;
  }

  dimension: min_maturidade_cessao {
    type: number
    sql: ${TABLE}."MIN_MATURIDADE_CESSAO" ;;
    hidden: yes
  }

  dimension: pdd {
    label: "Nome Fundo de Investimento"
    group_label: "Dados do Fundo"
    type: string
    sql: ${TABLE}."PDD" ;;
  }

  dimension: pdd_compl {
    type: string
    sql: ${TABLE}."PDD_COMPL" ;;
    hidden: yes
  }
#
  dimension: porc_provisao_cpf {
    label: "Porcentagem Provisão Aluno"
    group_label: "Dados do Aluno"
    description: "Percentual da provisão por cpf"
    sql: ${TABLE}."PORC_PROVISAO_CPF" ;;
  }

  dimension: proc_provisao_cpf {
    type: number
    sql: ${TABLE}."PROC_PROVISAO_CPF" ;;
    hidden: yes
  }

  dimension: produto_class {
    type: string
    sql: ${TABLE}."PRODUTO_CLASS" ;;
    hidden: yes
  }

  dimension: provisao_cpf {
    type: number

    label: "Provisão Aluno"
    group_label: "Dados do Aluno"
    description: "Valor da provisão para cada cpf"
    sql: ${TABLE}."PROVISAO_CPF" ;;
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

  dimension: rating_audit_cpf {
    type: string
    sql: ${TABLE}."RATING_AUDIT_CPF" ;;
    hidden: yes
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

  dimension: safra_cessao_semestre {
    type: string
    label: "Safra Cessão"
    group_label: "Dados de Cessão"
    description: "Indica a safra e cessao do semestre"
    sql: ${TABLE}."SAFRA_CESSAO_SEMESTRE" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."SCORE" ;;
    hidden: yes
  }

  dimension: semestre_visao {
     type: string
    label: "Semestre Visão"
    group_label: "Datas Referência"
    description: "Semestre em que está sendo feita a analise"
    sql: ${TABLE}."SEMESTRE_VISAO" ;;
  }

  dimension: status_formatura_txt {
    type: string
    sql: ${TABLE}."STATUS_FOMRATURA_TXT" ;;
    hidden: yes
  }

  dimension: status_formatura {
    type: string
    sql: ${TABLE}."STATUS_FORMATURA" ;;
    hidden: yes
  }

  dimension: tdt_ano_mes_obs {
    type: string
    label: "Ano/Mês Observação"
    group_label: "Datas Referência"
    description: "Ano e mês de observação do registro"
    sql: ${TABLE}."TDT_ANO_MES_OBS" ;;
  }

  dimension: tdt_ano_mes {
    type: string
    label: "Ano/Mês Referência"
    group_label: "Datas Referência"
    description: "Ano e mês de referência"
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: tx_pdd_nova {
    type: number
    label: "Taxa PDD Nova"
    group_label: "Valores"
    description: "Taxa \"nova\" cobrada no pdd"
    value_format: "0.00%"
    sql: ${TABLE}."TX_PDD_NOVA" ;;
  }

  dimension: valor_presente {
    type: number
    value_format: "$#,##0.00"
    label: "Valor presente"
    group_label: "Valores"
    description: "Valor presente"
    sql: ${TABLE}."VL_PRESENTE" ;;
  }

  measure: sum_VP {
    type: sum
    value_format: "$#,##0.00"
    label: "Soma Valor Presente"
    group_label: "Valores"
    description: "Valor presente"
    sql: ${valor_presente} ;;
  }

  measure: sum_tx_pdd_nova {
    type: sum
    label: "Soma Taxa PDD Nova"
    group_label: "Valores"
    description: "Taxa \"nova\" cobrada no pdd"
    value_format: "0.00%"
    sql: ${tx_pdd_nova} ;;
  }

  measure: count_cpf {
    type: count_distinct
    label: "Qtd Alunos"
    group_label: "Dados do Aluno"
    description: "Quantidade de alunos (cpfs)"
    sql: ${id_cpf} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
