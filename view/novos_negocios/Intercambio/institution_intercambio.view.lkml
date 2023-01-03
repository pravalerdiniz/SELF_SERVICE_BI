# The name of this view in Looker is "Institution"
view: institution_intercambio {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."INTERCAMBIO"."INSTITUTION"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Agencia Banco" in Explore.

  dimension: agencia_banco {
    type: number
    sql: ${TABLE}."AGENCIA_BANCO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_agencia_banco {
    type: sum
    sql: ${agencia_banco} ;;
  }

  measure: average_agencia_banco {
    type: average
    sql: ${agencia_banco} ;;
  }

  dimension: bairro_instituicao {
    type: string
    sql: ${TABLE}."BAIRRO_INSTITUICAO" ;;
  }

  dimension: base_juros {
    type: string
    sql: ${TABLE}."BASE_JUROS" ;;
  }

  dimension: cep_instituicao {
    type: string
    sql: ${TABLE}."CEP_INSTITUICAO" ;;
  }

  dimension: cidade_instituicao {
    type: string
    sql: ${TABLE}."CIDADE_INSTITUICAO" ;;
  }

  dimension: cnpj_banco {
    type: string
    sql: ${TABLE}."CNPJ_BANCO" ;;
  }

  dimension: cnpj_instituicao {
    type: string
    sql: ${TABLE}."CNPJ_INSTITUICAO" ;;
  }

  dimension: codigo_banco {
    type: number
    sql: ${TABLE}."CODIGO_BANCO" ;;
  }

  dimension: comissao {
    type: number
    sql: ${TABLE}."COMISSAO" ;;
  }

  dimension: complemento {
    type: string
    sql: ${TABLE}."COMPLEMENTO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: contrato_data_atualizacao {
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
    sql: ${TABLE}."CONTRATO_DATA_ATUALIZACAO" ;;
  }

  dimension: contrato_data_reembolso {
    type: number
    sql: ${TABLE}."CONTRATO_DATA_REEMBOLSO" ;;
  }

  dimension: cupons {
    type: string
    sql: ${TABLE}."CUPONS" ;;
  }

  dimension_group: curso_data_atualizacao {
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
    sql: ${TABLE}."CURSO_DATA_ATUALIZACAO" ;;
  }

  dimension_group: data_atualizacao_endereco {
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
    sql: ${TABLE}."DATA_ATUALIZACAO_ENDERECO" ;;
  }

  dimension: data_emissao_contrato {
    type: number
    sql: ${TABLE}."DATA_EMISSAO_CONTRATO" ;;
  }

  dimension: digito_agencia_banco {
    type: number
    sql: ${TABLE}."DIGITO_AGENCIA_BANCO" ;;
  }

  dimension: digito_conta_banco {
    type: number
    sql: ${TABLE}."DIGITO_CONTA_BANCO" ;;
  }

  dimension: ds_curso {
    type: string
    sql: ${TABLE}."DS_CURSO" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: estado_instituicao {
    type: string
    sql: ${TABLE}."ESTADO_INSTITUICAO" ;;
  }

  dimension: flg_curso_antecipacao {
    type: yesno
    sql: ${TABLE}."FLG_CURSO_ANTECIPACAO" ;;
  }

  dimension: flg_curso_gestao {
    type: yesno
    sql: ${TABLE}."FLG_CURSO_GESTAO" ;;
  }

  dimension: flg_intituicao_ativa {
    type: yesno
    sql: ${TABLE}."FLG_INTITUICAO_ATIVA" ;;
  }

  dimension: id_contrato_instituicao {
    type: string
    sql: ${TABLE}."ID_CONTRATO_INSTITUICAO" ;;
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_segmento {
    type: string
    sql: ${TABLE}."ID_SEGMENTO" ;;
  }

  dimension_group: instituicao_data_atualizacao {
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
    sql: ${TABLE}."INSTITUICAO_DATA_ATUALIZACAO" ;;
  }

  dimension: logo_instituicao {
    type: string
    sql: ${TABLE}."LOGO_INSTITUICAO" ;;
  }

  dimension: nome_banco {
    type: string
    sql: ${TABLE}."NOME_BANCO" ;;
  }

  dimension: nome_central_instituicao {
    type: string
    sql: ${TABLE}."NOME_CENTRAL_INSTITUICAO" ;;
  }

  dimension: nome_corporativo_instituicao {
    type: string
    sql: ${TABLE}."NOME_CORPORATIVO_INSTITUICAO" ;;
  }

  dimension: nome_curso {
    type: string
    sql: ${TABLE}."NOME_CURSO" ;;
  }

  dimension: nome_fantasia_instituicao {
    type: string
    sql: ${TABLE}."NOME_FANTASIA_INSTITUICAO" ;;
  }

  dimension: nome_segmento {
    type: string
    sql: ${TABLE}."NOME_SEGMENTO" ;;
  }

  dimension: numero_conta_banco {
    type: number
    sql: ${TABLE}."NUMERO_CONTA_BANCO" ;;
  }

  dimension: numero_instituicao {
    type: string
    sql: ${TABLE}."NUMERO_INSTITUICAO" ;;
  }

  dimension: parcelamento {
    type: string
    sql: ${TABLE}."PARCELAMENTO" ;;
  }

  dimension: primeira_data_vencimento_contrato {
    type: number
    sql: ${TABLE}."PRIMEIRA_DATA_VENCIMENTO_CONTRATO" ;;
  }

  dimension: rua_instituicao {
    type: string
    sql: ${TABLE}."RUA_INSTITUICAO" ;;
  }

  dimension: score_segmento {
    type: string
    sql: ${TABLE}."SCORE_SEGMENTO" ;;
  }

  dimension: tx_mensal {
    type: number
    sql: ${TABLE}."TX_MENSAL" ;;
  }

  dimension: tx_multa {
    type: number
    sql: ${TABLE}."TX_MULTA" ;;
  }

  dimension: vl_curso {
    type: number
    sql: ${TABLE}."VL_CURSO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
