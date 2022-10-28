# The name of this view in Looker is "Request Log"
view: request_log {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."REQUEST_LOG"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Acp Valor" in Explore.

  dimension: acp_valor {
    type: number
    sql: ${TABLE}."ACP_VALOR" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_acp_valor {
    type: sum
    sql: ${acp_valor} ;;
  }

  measure: average_acp_valor {
    type: average
    sql: ${acp_valor} ;;
  }

  dimension: alu_contrato {
    type: number
    sql: ${TABLE}."ALU_CONTRATO" ;;
  }

  dimension: bairro {
    type: string
    sql: ${TABLE}."BAIRRO" ;;
  }

  dimension: cep {
    type: number
    sql: ${TABLE}."CEP" ;;
  }

  dimension: cidade {
    type: string
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: codigo_banco {
    type: number
    sql: ${TABLE}."CODIGO_BANCO" ;;
  }

  dimension: codigo_empresa {
    type: number
    sql: ${TABLE}."CODIGO_EMPRESA" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_atualizacao {
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
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension_group: data_criacao {
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
    sql: ${TABLE}."DATA_CRIACAO" ;;
  }

  dimension: digito_verificador {
    type: number
    sql: ${TABLE}."DIGITO_VERIFICADOR" ;;
  }

  dimension: endereco {
    type: string
    sql: ${TABLE}."ENDERECO" ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: mensagens {
    type: string
    sql: ${TABLE}."MENSAGENS" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}."ORIGIN" ;;
  }

  dimension: quantidade_parcelas {
    type: number
    sql: ${TABLE}."QUANTIDADE_PARCELAS" ;;
  }

  dimension: release_contrato {
    type: number
    sql: ${TABLE}."RELEASE_CONTRATO" ;;
  }

  dimension: rg {
    type: string
    sql: ${TABLE}."RG" ;;
  }

  dimension_group: rg_data_emissao {
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
    sql: ${TABLE}."RG_DATA_EMISSAO" ;;
  }

  dimension: rg_emissor {
    type: string
    sql: ${TABLE}."RG_EMISSOR" ;;
  }

  dimension: sucesso {
    type: yesno
    sql: ${TABLE}."SUCESSO" ;;
  }

  dimension: tx_comissao {
    type: number
    sql: ${TABLE}."TX_COMISSAO" ;;
  }

  dimension: user_name {
    type: string
    sql: ${TABLE}."USER_NAME" ;;
  }

  dimension: valor_mensalidade {
    type: number
    sql: ${TABLE}."VALOR_MENSALIDADE" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, user_name]
  }
}
