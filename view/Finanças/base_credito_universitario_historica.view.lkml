# The name of this view in Looker is "Base Credito Universitario Historica"
view: base_credito_universitario_historica {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "OT"."BASE_CREDITO_UNIVERSITARIO_HISTORICA"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Atraso Cpf" in Explore.

  dimension: atraso_cpf {
    label: "Arrasto do CPF, ou seja quantidade de dias do boleto com maior atraso."
    type: number
    sql: ${TABLE}."ATRASO_CPF" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  dimension: cpf_sacado {
    type: number
    sql: ${TABLE}."CPF_SACADO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_compra {
    label: "Data de aquisição"
    description: "Data que aquisição do título."
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

  dimension_group: data_liquidacao {
    label: "Data liquidação"
    description: "Data de liquidação do título, seja por baixa, cancelamento, ipca ou qualquer outra causa."
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
    sql: ${TABLE}."DATA_LIQUIDACAO" ;;
  }

  dimension_group: data_movimento {
    label: "Data do movimento"
    description: "Data do último movimento na base OT."
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
    sql: ${TABLE}."DATA_MOVIMENTO" ;;
  }

  dimension_group: data_prejuizo {
    label: "Data WO"
    description: "Data que o título entrou em Writeoff."
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
    sql: ${TABLE}."DATA_PREJUIZO" ;;
  }

  dimension_group: data_referencia {
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
    sql: ${TABLE}."DATA_REFERENCIA" ;;
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

  dimension: id_contrato {
    type: string
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  dimension: id_fundo {
    type: number
    sql: ${TABLE}."ID_FUNDO" ;;
  }

  dimension: qtd_dias_uteis {
    description: "Quantidade de dias úteis entre a data de referência e a data de vencimento."
    type: number
    sql: ${TABLE}."QTD_DIAS_UTEIS" ;;
  }

  dimension: safra {
    type: string
    sql: ${TABLE}."SAFRA" ;;
  }

  dimension: seunum {
    type: string
    sql: ${TABLE}."SEUNUM" ;;
  }

  dimension: taxa_cessao {
    type: number
    sql: ${TABLE}."TAXA_CESSAO" ;;
  }

  dimension: tipo_aluno {
    type: string
    sql: ${TABLE}."TIPO_ALUNO" ;;
  }

  dimension: valor_compra {
    type: number
    sql: ${TABLE}."VALOR_COMPRA;;
    hidden: yes
  }

  dimension: valor_face {
    type: number
    sql: ${TABLE}."VALOR_FACE" ;;
    hidden: yes
  }

  dimension: valor_presente {
    type: number
    sql: ${TABLE}."VALOR_PRESENTE" ;;
    hidden: yes
  }

  measure: soma_valor_aquisicao {
    type: sum
    sql: ${valor_compra};;
    label: "Valor de aquisição."
    description: "Soma do valor de aquisição"
  }

  measure: soma_valor_face {
    type: sum
    sql: ${valor_face};;
    label: "Valor de face."
    description: "Soma do valor de face"
  }

  measure: soma_valor_presente {
    type: sum
    sql: ${valor_presente};;
    label: "Valor de aquisição."
    description: "Soma do valor de aquisição"
  }
  measure: count {
    type: count_distinct
    label: "Quantidade de alunos"
    sql_distinct_key: ${cpf_sacado};;
    drill_fields: []
  }
}
