# The name of this view in Looker is "Faturamento Provas Pravaler"
view: faturamento_provas_pravaler {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."PROVAS_PRAVALER"."FATURAMENTO_PROVAS_PRAVALER"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cpf Cnpj" in Explore.

  dimension: cpf_cnpj {
    type: string
    sql: ${TABLE}."CPF_CNPJ" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_cancelamento_boleto {
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
    sql: ${TABLE}."DATA_CANCELAMENTO" ;;
  }

  dimension_group: data_competencia_servico {
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
    sql: ${TABLE}."DATA_COMP_SERVICO" ;;
  }

  dimension_group: data_emissao_boleto {
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
    sql: ${TABLE}."DATA_EMISSAO" ;;
  }

  dimension_group: data_recebimento {
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
    sql: ${TABLE}."DATA_RECEBIMENTO" ;;
  }

  dimension_group: data_vencimento_boleto {
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

  dimension: modelo_de_contrato {
    type: string
    sql: ${TABLE}."MODELO_DE_CONTRATO" ;;
  }

  dimension: nome_fantasia {
    type: string
    sql: ${TABLE}."NOME_FANTASIA" ;;
  }

  dimension: nome_produto {
    type: string
    sql: ${TABLE}."NOME_PRODUTO" ;;
  }

  dimension: nome_razao_social {
    type: string
    sql: ${TABLE}."NOME_RAZAO" ;;
  }

  dimension: id_nota_fiscal {
    type: number
    sql: ${TABLE}."NOTA_FISCAL" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_nota_fiscal {
    type: sum
    sql: ${id_nota_fiscal} ;;
  }

  measure: average_nota_fiscal {
    type: average
    sql: ${id_nota_fiscal} ;;
  }

  dimension: status_boleto {
    type: string
    sql: ${TABLE}."SITUACAO" ;;
  }

  dimension: tipo_de_prova {
    type: string
    sql: ${TABLE}."TIPO_DE_PROVA" ;;
  }

  measure: valor_boleto_ted {
    type: sum
    sql: ${TABLE}."VALOR_BOLETO_TED" ;;
  }

  measure: valor_bruto_impostos {
    type: sum
    sql: ${TABLE}."VALOR_BRUTO_IRRF_CSRF" ;;
  }

  measure: valor_prest_servs {
    type: sum
    sql: ${TABLE}."VALOR_PREST_SERVS" ;;
  }

  measure: valor_recebimento {
    type: sum
    sql: ${TABLE}."VALOR_RECEBIMENTO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
