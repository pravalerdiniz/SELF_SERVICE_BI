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
    description: ""
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
    description: ""
    sql: ${TABLE}."DATA_MENOR_VENCIMENTO_PDD" ;;
  }

  dimension_group: data_modificacao {
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
    label: "Modificação"
    description: ""
    sql: ${TABLE}."DATA_MODIFICACAO" ;;
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
    label: "Título Calcular"
    description: ""
    sql: ${TABLE}."DATA_TITULO_CALCULAR" ;;
  }

## Campos que precisam de definição

  dimension: nome_arquivo_origem {
    type: string
    group_label: "Dados de Boleto"
    label: "Nome do Arquivo de Origem"
    description: ""
    sql: ${TABLE}."NOME_ARQUIVO_ORIGEM" ;;
  }

  dimension: nome_fundo {
    type: string
    group_label: "Dados do Fundo de Investimento"
    label: "Nome do Fundo de Investimento"
    description: ""
    sql: ${TABLE}."NOME_FUNDO" ;;
  }

  ## Números

  dimension: qtd_boletos_dif {
    type: number
    group_label: "Dados de Boleto"
    label: "Quantidade de Boletos Diferentes"
    description: "Indica o número de boletos diferentes ressultantes da comparação entre a PDD e a OT"
    sql: ${TABLE}."QTD_BOLETOS_DIF" ;;
    value_format: "#"
  }

  measure: sum_qtd_boletos_dif {
    type: sum
    sql: ${qtd_boletos_dif} ;;
    group_label: "Valores de Boleto"
    label: "Soma de Boletos diferentes"
    description: "Soma da quantidade de Boletos diferentes"
    value_format: "#"
  }

  dimension: qtd_boletos_ot {
    type: number
    group_label: "Dados de Boleto"
    label: "Quantidade de Boletos OT"
    description: "Indica a Quantidade de Boletos da Base OT"
    sql: ${TABLE}."QTD_BOLETOS_OT" ;;
    value_format: "#"
  }

  measure: sum_qtd_boletos_ot {
    type: sum
    sql: ${qtd_boletos_ot} ;;
    group_label: "Valores de Boleto"
    label: "Soma de Boletos OT"
    description: "Soma da quantidade de Boletos OT"
    value_format: "#"
  }

  dimension: qtd_boletos_pdd {
    type: number
    group_label: "Dados de Boleto"
    label: "Quantidade de Boletos PDD"
    description: "Indica a Quantidade de Boletos da tabela PDD"
    sql: ${TABLE}."QTD_BOLETOS_PDD" ;;
    value_format: "#"
  }

  measure: sum_qtd_boletos_pdd {
    type: sum
    sql: ${qtd_boletos_pdd} ;;
    group_label: "Valores de Boleto"
    label: "Soma de Boletos PDD"
    description: "Soma da quantidade de Boletos PDD"
    value_format: "#"
  }

  dimension: qtd_dias_dif_vencimento {
    type: number
    group_label: ""
    label: "qtd_dias_dif_vencimento"
    description: ""
    sql: ${TABLE}."QTD_DIAS_DIF_VENCIMENTO" ;;
    value_format: "#"
  }

  measure: avg_dias_dif_vencimento {
    type: average
    sql: ${qtd_dias_dif_vencimento} ;;
    group_label: ""
    label: ""
    description: ""
    value_format: ""
  }

  ## Valores

  ## face_dif
  dimension: vl_face_dif {
    type: number
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${TABLE}."VL_FACE_DIF" ;;
  }

  measure: sum_vl_face_dif {
    type: sum
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_face_dif} ;;
  }

  measure: avg_vl_face_dif {
    type: average
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_face_dif} ;;
  }

  ## face_total_ot
  dimension: vl_face_total_ot {
    type: number
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${TABLE}."VL_FACE_TOTAL_OT" ;;
  }

  measure: sum_vl_face_total_ot {
    type: sum
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_face_total_ot} ;;
  }

  measure: avg_vl_face_total_ot {
    type: average
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_face_total_ot}  ;;
  }

  ## face_total_pdd
  dimension: vl_face_total_pdd {
    type: number
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${TABLE}."VL_FACE_TOTAL_PDD" ;;
  }

  measure: sum_vl_face_total_pdd {
    type: sum
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_face_total_pdd};;
  }

  measure: avg_vl_face_total_pdd {
    type: average
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_face_total_pdd} ;;
  }

  ## vl_presente_dif
  dimension: vl_presente_dif {
    type: number
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${TABLE}."VL_PRESENTE_DIF" ;;
  }

  measure: sum_vl_presente_dif{
    type: sum
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_presente_dif};;
  }

  measure: avg_vl_presente_dif{
    type: average
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_presente_dif} ;;
  }

  ## vl_presente_total_ot
  dimension: vl_presente_total_ot {
    type: number
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${TABLE}."VL_PRESENTE_TOTAL_OT" ;;
  }

  measure: sum_vl_presente_total_ot{
    type: sum
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_presente_total_ot};;
  }

  measure: avg_vl_presente_total_ot{
    type: average
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_presente_total_ot} ;;
  }

  ## vl_presente_total_pdd
  dimension: vl_presente_total_pdd {
    type: number
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${TABLE}."VL_PRESENTE_TOTAL_PDD" ;;
  }

  measure: sum_vl_presente_total_pdd{
    type: sum
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_presente_total_pdd};;
  }

  measure: avg_vl_presente_total_pdd{
    type: average
    group_label: "Valores"
    label: ""
    description: ""
    sql: ${vl_presente_total_pdd} ;;
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
