view: cobranca_e_risco {
  derived_table: {
    sql: select *  from stage.public.cobranca_risco_cobranca
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_acordo {
    type: number
    sql: ${TABLE}."ID_ACORDO" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
  }

  dimension: proposta {
    type: number
    sql: ${TABLE}."PROPOSTA" ;;
  }

  dimension: usuario_rede {
    type: string
    sql: ${TABLE}."USUARIO_REDE" ;;
  }

  dimension_group: dt_acordo {
    type: time
    sql: ${TABLE}."DT_ACORDO" ;;
  }

  dimension: anomes_dt_acordo {
    type: string
    sql: ${TABLE}."ANOMES_DT_ACORDO" ;;
  }

  dimension: dt_concessao {
    type: date
    sql: ${TABLE}."DT_CONCESSAO" ;;
  }

  dimension: anomes_cessao {
    type: string
    sql: ${TABLE}."ANOMES_CESSAO" ;;
  }

  dimension: vp_divida {
    type: number
    sql: ${TABLE}."VP_DIVIDA" ;;
  }

  dimension_group: data {
    type: time
    sql: ${TABLE}."DATA" ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: dec_status {
    type: string
    sql: ${TABLE}."DEC_STATUS" ;;
  }

  dimension: cessao {
    type: string
    sql: ${TABLE}."CESSAO" ;;
  }

  dimension: fundo {
    type: number
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: gerado {
    type: string
    sql: ${TABLE}."GERADO" ;;
  }

  dimension: status_quebra {
    type: string
    sql: ${TABLE}."STATUS_QUEBRA" ;;
  }

  dimension: taxa {
    type: number
    sql: ${TABLE}."TAXA" ;;
  }

  dimension: tipo_acordo {
    type: number
    sql: ${TABLE}."TIPO_ACORDO" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: produto {
    type: string
    sql: ${TABLE}."PRODUTO" ;;
  }

  dimension: wo {
    type: string
    sql: ${TABLE}."WO" ;;
  }

  dimension: complementar {
    type: string
    sql: ${TABLE}."COMPLEMENTAR" ;;
  }

  dimension: vp_anterior {
    type: number
    sql: ${TABLE}."VP_ANTERIOR" ;;
  }

  dimension: atraso {
    type: number
    sql: ${TABLE}."ATRASO" ;;
  }

  dimension: tx_pdd {
    type: number
    sql: ${TABLE}."TX_PDD" ;;
  }

  dimension: vl_pdd {
    type: number
    sql: ${TABLE}."VL_PDD" ;;
  }

  dimension: novo_vp {
    type: number
    sql: ${TABLE}."NOVO_VP" ;;
  }

  dimension: dif_vp {
    type: number
    sql: ${TABLE}."DIF_VP" ;;
  }

  dimension: vl_complementar {
    type: number
    sql: ${TABLE}."VL_COMPLEMENTAR" ;;
  }

  dimension: desconto {
    type: number
    sql: ${TABLE}."DESCONTO" ;;
  }

  dimension: vl_presente {
    type: number
    sql: ${TABLE}."VL_PRESENTE" ;;
  }

  set: detail {
    fields: [
      id_acordo,
      cpf,
      proposta,
      usuario_rede,
      dt_acordo_time,
      anomes_dt_acordo,
      dt_concessao,
      anomes_cessao,
      vp_divida,
      data_time,
      status,
      dec_status,
      cessao,
      fundo,
      gerado,
      status_quebra,
      taxa,
      tipo_acordo,
      nome,
      produto,
      wo,
      complementar,
      vp_anterior,
      atraso,
      tx_pdd,
      vl_pdd,
      novo_vp,
      dif_vp,
      vl_complementar,
      desconto,
      vl_presente
    ]
  }
}
