# The name of this view in Looker is "Orcameto Cc"
view: orcameto_cc {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."ORCAMETO_CC"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ano" in Explore.

  dimension: ano {
    type: number
    sql: ${TABLE}."ANO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ano {
    type: sum
    sql: ${ano} ;;
  }

  measure: average_ano {
    type: average
    sql: ${ano} ;;
  }

  dimension: areas {
    type: string
    sql: ${TABLE}."AREAS" ;;
  }

  dimension: class_frente {
    type: string
    sql: ${TABLE}."CLASS_FRENTE" ;;
  }

  dimension: conta_contabil {
    type: string
    sql: ${TABLE}."CONTA_CONTABIL" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data {
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
    sql: ${TABLE}."DATA" ;;
  }

  dimension: desc_fornecedor {
    type: string
    sql: ${TABLE}."DESC_FORNECEDOR" ;;
  }

  dimension: descricao_cc {
    type: string
    sql: ${TABLE}."DESCRICAO_CC" ;;
  }

  dimension: descricao_despesa {
    type: string
    sql: ${TABLE}."DESCRICAO_DESPESA" ;;
  }

  dimension: folha_aquisicao {
    type: string
    sql: ${TABLE}."FOLHA_AQUISICAO" ;;
  }

  dimension: folha_investimento {
    type: string
    sql: ${TABLE}."FOLHA_INVESTIMENTO" ;;
  }

  dimension: folha_manutencao {
    type: string
    sql: ${TABLE}."FOLHA_MANUTENCAO" ;;
  }

  dimension: folha_renovacao {
    type: string
    sql: ${TABLE}."FOLHA_RENOVACAO" ;;
  }

  dimension: frente {
    type: string
    sql: ${TABLE}."FRENTE" ;;
  }

  dimension: linha_df {
    type: string
    sql: ${TABLE}."LINHA_DF" ;;
  }

  dimension: montante {
    type: number
    sql: ${TABLE}."MONTANTE" ;;
  }

  dimension: operacional_aquisicao {
    type: string
    sql: ${TABLE}."OPERACIONAL_AQUISICAO" ;;
  }

  dimension: operacional_investimento {
    type: string
    sql: ${TABLE}."OPERACIONAL_INVESTIMENTO" ;;
  }

  dimension: operacional_manutencao {
    type: string
    sql: ${TABLE}."OPERACIONAL_MANUTENCAO" ;;
  }

  dimension: operacional_renovacao {
    type: string
    sql: ${TABLE}."OPERACIONAL_RENOVACAO" ;;
  }

  dimension: tipo_despesa {
    type: string
    sql: ${TABLE}."TIPO_DESPESA" ;;
  }

  dimension: tipo_orcamento {
    type: string
    sql: ${TABLE}."TIPO_ORCAMENTO" ;;
  }

  dimension: visao {
    type: string
    sql: ${TABLE}."VISAO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
