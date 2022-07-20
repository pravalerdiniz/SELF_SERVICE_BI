view: comparacao_ot {
  sql_table_name: "AD_HOC"."COMPARACAO_OT"
    ;;
  dimension: cpf_cliente {
    type: number
    group_label: "Dados do Aluno"
    label: "CPF"
    sql: ${TABLE}."CPF_CLIENTE" ;;
    primary_key: yes
    value_format: "#"
  }

  dimension: id_cpf {
    type: number
    group_label: "Dados do Aluno"
    label: "ID CPF"
    description: "Indica o código de referência do CPF do Aluno"
    sql: ${TABLE}."ID_CPF" ;;
    value_format: "#"
  }

  dimension_group: data_menor_vencimento_ot {
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
    label: "Menor Vencimento OT"
    description: "Data de Menor Vencimento da OT"
    sql: ${TABLE}."DATA_MENOR_VENCIMENTO_OT" ;;
  }

  dimension_group: data_menor_vencimento_pdd {
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
    label: "Menor Vencimento PDD"
    description: "Data de Menor Vencimento da PDD"
    sql: ${TABLE}."DATA_MENOR_VENCIMENTO_PDD" ;;
  }


  dimension_group: data_titulo_calcular {
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
    label: "Cálculo do Título"
    description: "Data que a base foi calculada pela OT"
    sql: ${TABLE}."DATA_TITULO_CALCULAR" ;;
  }

  dimension: nome_fundo {
    type: string
    group_label: "Dados do Título"
    label: "Nome do Fundo de Investimento"
    description: "Nome do fundo de investimento que o financiamento está alocado"
    sql: ${TABLE}."NOME_FUNDO" ;;
  }

  dimension: id_fundo {
    type: number
    group_label: "Dados do Título"
    label: "Id Fundo de Investimento"
    description: "Indica o ID do Fundo de Investimento"
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
    value_format: "#"
  }

  ## NÚMEROS BOLETOS ##

  dimension: qtd_boletos_dif {
    type: number
    group_label: "Dados de Comparação"
    label: "Diferença entre as Quantidade de Boletos"
    description: "Indica o número de boletos diferentes ressultantes da comparação entre a PDD e a OT"
    sql: ${TABLE}."QTD_BOLETOS_DIF" ;;
    value_format: "#"
  }

  measure: sum_qtd_boletos_dif {
    type: sum
    sql: ${qtd_boletos_dif} ;;
    group_label: "Dados de Comparação"
    label: "Soma de Boletos diferentes"
    description: "Soma da quantidade de Boletos diferentes"
    value_format: "#"
  }

  dimension: qtd_boletos_ot {
    type: number
    group_label: "Quantidade de Boleto"
    label: "Quantidade de Boletos OT"
    description: "Indica a Quantidade de Boletos da Base OT"
    sql: ${TABLE}."QTD_BOLETOS_OT" ;;
    value_format: "#"
  }

  measure: sum_qtd_boletos_ot {
    type: sum
    sql: ${qtd_boletos_ot} ;;
    group_label: "Quantidade de Boleto"
    label: "Soma de Boletos OT"
    description: "Soma da quantidade de Boletos OT"
    value_format: "#"
  }

  measure: avg_qtd_boletos_ot {
    type: average
    sql: ${qtd_boletos_ot} ;;
    group_label: "Quantidade de Boleto"
    label: "Média de Boletos OT"
    description: "Soma da quantidade de Boletos OT"
    value_format: "#"
  }

  dimension: qtd_boletos_pdd {
    type: number
    group_label: "Quantidade de Boleto"
    label: "Quantidade de Boletos PDD"
    description: "Indica a Quantidade de Boletos da tabela PDD"
    sql: ${TABLE}."QTD_BOLETOS_PDD" ;;
    value_format: "#"
  }

  measure: sum_qtd_boletos_pdd {
    type: sum
    sql: ${qtd_boletos_pdd} ;;
    group_label: "Quantidade de Boleto"
    label: "Soma de Boletos PDD"
    description: "Soma da quantidade de Boletos PDD"
    value_format: "#"
  }

  measure: avg_qtd_boletos_pdd {
    type: average
    sql: ${qtd_boletos_pdd} ;;
    group_label: "Quantidade de Boleto"
    label: "Média de Boletos PDD"
    description: "Soma da quantidade de Boletos PDD"
    value_format: "#"
  }

  dimension: qtd_dias_dif_vencimento {
    type: number
    group_label: "Dados de Comparação"
    label: "Diferença entre vencimentos"
    description: "Esse campo é o resultado da comparação entre o menor vencimento da OT e o menor vencimento da PDD"
    sql: ${TABLE}."QTD_DIAS_DIF_VENCIMENTO" ;;
    value_format: "#"
  }

  measure: sum_dias_dif_vencimento {
    type: sum
    sql: ${qtd_dias_dif_vencimento} ;;
    group_label: "Dados de Comparação"
    label: "Soma Dias de Diferença entre vencimentos"
    description: "Soma da comparação entre os menor vencimentos da OT e da PDD"
    value_format: "#"
  }

  ## Valores ##

  ## face_dif
  dimension: vl_face_dif {
    type: number
    group_label: "Dados de Comparação"
    label: "Diferença entre Valores de Face"
    description: "Valor resultado da comparação do valor de face da OT e valor de face da PDD"
    sql: ${TABLE}."VL_FACE_DIF" ;;
  }

  measure: sum_vl_face_dif {
    type: sum
    group_label: "Dados de Comparação"
    label: "Soma Diferença Valor de Face"
    description: "A soma da diferença dos valores de comparação de face"
    sql: ${vl_face_dif} ;;
  }

  ## face_total_ot
  dimension: vl_face_total_ot {
    type: number
    group_label: "Valores"
    label: "Valor de Face OT"
    description: ""
    sql: ${TABLE}."VL_FACE_TOTAL_OT" ;;
  }

  measure: sum_vl_face_total_ot {
    type: sum
    group_label: "Valores"
    label: "Soma Valor de Face OT"
    value_format: "0.00"
    description: ""
    sql: ${vl_face_total_ot} ;;
  }

  measure: avg_vl_face_total_ot {
    type: average
    group_label: "Valores"
    label: "Média Valor de Face OT"
    description: ""
    sql: ${vl_face_total_ot}  ;;
  }

  ## face_total_pdd
  dimension: vl_face_total_pdd {
    type: number
    group_label: "Valores"
    label: "Valor de Face PDD"
    description: ""
    sql: ${TABLE}."VL_FACE_TOTAL_PDD" ;;
  }

  measure: sum_vl_face_total_pdd {
    type: sum
    group_label: "Valores"
    label: "Soma Valor de Face PDD"
    value_format: "0.00"
    description: ""
    sql: ${vl_face_total_pdd};;
  }

  measure: avg_vl_face_total_pdd {
    type: average
    group_label: "Valores"
    label: "Média Valor de Face PDD"
    description: ""
    sql: ${vl_face_total_pdd} ;;
  }

  ## vl_presente_dif
  dimension: vl_presente_dif {
    type: number
    group_label: "Dados de Comparação"
    label: "Diferença entre Valor Presente"
    description: "Valor resultado da comparação do valor presente da OT e valor presente da PDD"
    sql: ${TABLE}."VL_PRESENTE_DIF" ;;
  }

  measure: sum_vl_presente_dif{
    type: sum
    group_label: "Dados de Comparação"
    label: "Soma Diferença Valor Presente"
    description: ""
    sql: ${vl_presente_dif};;
  }

  ## vl_presente_total_ot
  dimension: vl_presente_total_ot {
    type: number
    group_label: "Valores"
    label: "Valor Presente OT"
    description: ""
    sql: ${TABLE}."VL_PRESENTE_TOTAL_OT" ;;
  }

  measure: sum_vl_presente_total_ot{
    type: sum
    group_label: "Valores"
    value_format: "0.00"
    label: "Soma Valor Presente OT"
    description: ""
    sql: ${vl_presente_total_ot};;
  }

  measure: avg_vl_presente_total_ot{
    type: average
    group_label: "Valores"
    label: "Média Valor Presente OT"
    description: ""
    sql: ${vl_presente_total_ot} ;;
  }

  ## vl_presente_total_pdd
  dimension: vl_presente_total_pdd {
    type: number
    group_label: "Valores"
    label: "Valor Presente PDD"
    description: ""
    sql: ${TABLE}."VL_PRESENTE_TOTAL_PDD" ;;
  }

  measure: sum_vl_presente_total_pdd{
    type: sum
    group_label: "Valores"
    label: "Soma Valor Presente PDD"
    value_format: "0.00"
    description: ""
    sql: ${vl_presente_total_pdd};;
  }

  measure: avg_vl_presente_total_pdd{
    type: average
    group_label: "Valores"
    label: "Média Valor Presente PDD"
    description: ""
    sql: ${vl_presente_total_pdd} ;;
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  ## Campos de cálculo

  dimension: atraso_ot {
    type: number
    label: "Atraso OT"
    value_format: "#,##0"
    group_label: "Cálculo Comparação"
    sql: ${TABLE}."ATRASO_OT" ;;
  }

  dimension: atraso_prv {
    type: number
    label: "Atraso PRV"
    value_format: "#,##0"
    group_label: "Cálculo Comparação"
    sql: ${TABLE}."ATRASO_PRV" ;;
  }

  dimension: pct_atraso_ot {
    type: number
    label: "% Atraso OT"
    value_format: "0.00%"
    group_label: "Cálculo Comparação"
    sql: ${TABLE}."PCT_ATASO_OT" ;;
  }

  dimension: pct_atraso_prv {
    type: number
    label: "% Atraso PRV"
    value_format: "0.00%"
    group_label: "Cálculo Comparação"
    sql: ${TABLE}."PCT_ATASO_PRV" ;;
  }


}
