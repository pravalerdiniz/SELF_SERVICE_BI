# The name of this view in Looker is "Vcom"
view: vcom {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "POS_GRADUADO"."CCR"."VCOM"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Contrato" in Explore.

  dimension: contrato {
    type: string
    sql: ${TABLE}."CONTRATO" ;;
  }

  dimension: cpf {
    type: string
    sql: ${TABLE}."CPF" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_atualizao_mdw {
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
    sql: ${TABLE}."DT_ATUALIZAO_MDW" ;;
  }

  dimension_group: dt_cricao_mdw {
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
    sql: ${TABLE}."DT_CRICAO_MDW" ;;
  }

  dimension: etapa {
    type: number
    sql: ${TABLE}."ETAPA" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_etapa {
    type: sum
    sql: ${etapa} ;;
  }

  measure: average_etapa {
    type: average
    sql: ${etapa} ;;
  }

  dimension: flg_cpf_enviado {
    type: yesno
    sql: ${TABLE}."FLG_CPF_ENVIADO" ;;
  }

  dimension: flg_cpf_quitado {
    type: yesno
    sql: ${TABLE}."FLG_CPF_QUITADO" ;;
  }

  dimension: flg_em_aberto {
    type: yesno
    sql: ${TABLE}."FLG_EM_ABERTO" ;;
  }

  dimension: flg_recebido {
    type: yesno
    sql: ${TABLE}."FLG_RECEBIDO" ;;
  }

  dimension: flg_titulo_enviado {
    type: yesno
    sql: ${TABLE}."FLG_TITULO_ENVIADO" ;;
  }

  dimension: fluxo {
    type: string
    sql: ${TABLE}."FLUXO" ;;
  }

  dimension: id_boleto {
    type: string
    sql: ${TABLE}."ID_BOLETO" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_mdw {
    type: string
    sql: ${TABLE}."ID_MDW" ;;
  }

  dimension: id_nossonum {
    type: number
    sql: ${TABLE}."ID_NOSSONUM" ;;
  }

  dimension: id_seunum {
    type: number
    sql: ${TABLE}."ID_SEUNUM" ;;
  }

  dimension: id_tit_vcom {
    type: number
    sql: ${TABLE}."ID_TIT_VCOM" ;;
  }

  dimension: layoutatual {
    type: string
    sql: ${TABLE}."LAYOUTATUAL" ;;
  }

  dimension: mensagem_erro {
    type: string
    sql: ${TABLE}."MENSAGEM_ERRO" ;;
  }

  dimension: num_parcela {
    type: number
    sql: ${TABLE}."NUM_PARCELA" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
