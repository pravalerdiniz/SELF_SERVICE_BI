# The name of this view in Looker is "Correcao Ipca"

view: correcao_ipca {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."FINANCEIRO"."CORRECAO_IPCA"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in Lid_boookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cd Mes Ipca" in Explore.

  dimension: cd_mes_ipca {
    type: string
    label: "Código MMYY IPCA"
    description: "Código de mês e ano da taxa IPCA aplicada."
    sql: ${TABLE}."CD_MES_IPCA" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: cpf_aluno {
    type: number
    group_label: "Dados do Aluno"
    label: "CPF"
    description: "CPF do aluno sem zero a esquerda."
    sql: ${TABLE}."CPF" ;;
    hidden: no
  }

  dimension: cpf_aluno_ajustado {
    type: string
    group_label: "Dados do Aluno"
    label: "CPF do Aluno Ajustado"
    description: "Indica o CPF do Aluno, com o formato padrão de 11 dígitos"
    sql: cast(right(concat('000000',${cpf_aluno}),11) AS VARCHAR) ;;
    required_access_grants: [grupo_cpf]
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_cessao_original {
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
    sql: ${TABLE}."DATA_CESSAO_ORIGINAL" ;;
  }

  dimension_group: data_compra {
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
    sql: ${TABLE}."DATA_COMPRA" ;;
  }

  dimension_group: data_concessao {
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
    sql: ${TABLE}."DATA_CONCESSAO" ;;
  }

  dimension_group: data_correcao {
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
    sql: ${TABLE}."DATA_CORRECAO" ;;
  }

  dimension_group: data_tit_ipca {
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
    sql: ${TABLE}."DATA_TIT_IPCA" ;;
  }

  dimension_group: data_vencimento {
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
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  dimension: ds_banco {
    type: string
    sql: ${TABLE}."DS_BANCO" ;;
    hidden: yes

  }

  dimension: ds_fundo_investimento {
    type: string
    sql: ${TABLE}."DS_FUNDO_INVESTIMENTO" ;;
    hidden: no
  }

  dimension: id_banco {
    type: string
    sql: ${TABLE}."ID_BANCO" ;;
    hidden: yes
  }

  dimension: id_boleto {
    type: string
    group_label: "Dados do Boleto"
    label: "ID Boleto"
    description: "Indica o ID único do Boleto."
    sql: ${TABLE}."ID_BOLETO" ;;
    primary_key: yes
  }

  dimension: id_contrato {
    group_label: "Dados do Contrato"
    type: string
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  dimension: id_cpf {
    type: string
    group_label: "Dados do Aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_fundo_investimento {
    type: string
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
    hidden: no
  }

  dimension: id_seunum {
    type: string
    sql: ${TABLE}."ID_SEUNUM" ;;
  }

  dimension: vl_ipca {
    type: number
    hidden: yes
    sql: ${TABLE}."VL_ACRESCIMO_IPCA" ;;
  }

  dimension: tx_ipca12_m {
    type: number
    sql: ${TABLE}."TX_IPCA12M" ;;
  }

  dimension: vl_aquisicao {
    type: number
    sql: ${TABLE}."VL_AQUISICAO" ;;
    hidden: yes
  }

  dimension: vl_boleto {
    type: number
    sql: ${TABLE}."VL_BOLETO" ;;
    hidden: yes
  }

  dimension: vl_boleto_ipca {
    type: number
    sql: ${TABLE}."VL_BOLETO_IPCA" ;;
    hidden: yes
  }

  dimension: vl_presente_aquisicao {
    type: number
    sql: ${TABLE}."VL_PRESENTE_AQUISICAO" ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sum_boleto {
    type: sum
    description: "Soma dos valores de boleto."
    sql: ${vl_boleto} ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_boleto_ipca {
    type: sum
    description: "Soma dos valores de boleto com taxa IPCA_12M aplicada."
    sql: ${vl_boleto_ipca} ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_aquisicao {
    type: sum
    description: "Soma dos valores de aquisição do boleto."
    sql: ${vl_aquisicao} ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_aquisicao_vp {
    type: sum
    description: "Soma dos valores de aquisição (Valor Presente) do boleto."
    sql: ${vl_presente_aquisicao} ;;
    value_format: "\R$ #,###.00"
  }
  measure: sum_ipca {
    type: sum
    description: "Soma dos valores de *reajuste* do IPCA."
    value_format: "\R$ #,###.00"
    sql: ${vl_ipca} ;;
  }
}
