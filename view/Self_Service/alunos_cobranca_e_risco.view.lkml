view: alunos_cobranca_e_risco {
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
    primary_key: yes
  }

  dimension: proposta {
    type: number
    sql: ${TABLE}."PROPOSTA" ;;
  }

  dimension: usuario_rede {
    type: string
    group_item_label: "Usuario Rede"
    sql: ${TABLE}."USUARIO_REDE" ;;
  }

  dimension_group: dt_acordo {
    type: time
    group_item_label: "Data Acordo"
    sql: ${TABLE}."DT_ACORDO" ;;
  }

  dimension: anomes_dt_acordo {
    type: string
    group_item_label: "Anomes Data Acordo"
    sql: ${TABLE}."ANOMES_DT_ACORDO" ;;
  }

  dimension: dt_concessao {
    type: date
    group_item_label: "Data Concessao"
    sql: ${TABLE}."DT_CONCESSAO" ;;
  }

  dimension: anomes_cessao {
    type: string
    group_item_label: "Anomes Cessao"
    sql: ${TABLE}."ANOMES_CESSAO" ;;
  }

  measure: vp_divida {
    type: number
    group_item_label: "VP Divida"
    sql: ${TABLE}."VP_DIVIDA" ;;
  }

  dimension_group: data {
    type: time
    group_item_label: "Data"
    sql: ${TABLE}."DATA" ;;
  }

  dimension: status {
    type: number
    group_item_label: "Status"
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: dec_status {
    type: string
    group_item_label: "Dec. Status"
    sql: ${TABLE}."DEC_STATUS" ;;
  }

  dimension: cessao {
    type: string
    group_item_label: "Cessao"
    sql: ${TABLE}."CESSAO" ;;
  }

  dimension: fundo {
    type: number
    group_item_label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: gerado {
    type: string
    group_item_label: "Gerado"
    sql: ${TABLE}."GERADO" ;;
  }

  dimension: status_quebra {
    type: string
    group_item_label: "Status Quebra"
    sql: ${TABLE}."STATUS_QUEBRA" ;;
  }

  dimension: taxa {
    type: number
    group_item_label: "Taxa"
    sql: ${TABLE}."TAXA" ;;
  }

  dimension: tipo_acordo {
    type: number
    group_item_label: "Tipo Acordo"
    sql: ${TABLE}."TIPO_ACORDO" ;;
  }

  dimension: nome {
    type: string
    group_item_label: "Nome"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: produto {
    type: string
    group_item_label: "Produto"
    sql: ${TABLE}."PRODUTO" ;;
  }

  dimension: wo {
    type: string
    group_item_label: "WO"
    sql: ${TABLE}."WO" ;;
  }

  dimension: complementar {
    type: string
    group_item_label: "Complementar"
    sql: ${TABLE}."COMPLEMENTAR" ;;
  }

  measure: vp_anterior {
    type: number
    group_item_label: "VP Anterior"
    sql: ${TABLE}."VP_ANTERIOR" ;;
  }

  dimension: atraso {
    type: number
    group_item_label: "Atraso"
    sql: ${TABLE}."ATRASO" ;;
  }

  dimension: tx_pdd {
    type: number
    group_item_label: "Taxa PDD"
    sql: ${TABLE}."TX_PDD" ;;
  }

  measure: vl_pdd {
    type: number
    group_item_label: "VL PDD"
    sql: ${TABLE}."VL_PDD" ;;
  }

  dimension: novo_vp {
    type: number
    group_item_label: "Novo VP"
    sql: ${TABLE}."NOVO_VP" ;;
  }

  measure: dif_vp {
    type: number
    group_item_label: "Dif VP"
    sql: ${TABLE}."DIF_VP" ;;
  }

  measure: vl_complementar {
    type: number
    group_item_label: "Vl Complementar"
    sql: ${TABLE}."VL_COMPLEMENTAR" ;;
  }

  dimension: desconto {
    type: number
    group_item_label: "Desconto"
    sql: ${TABLE}."DESCONTO" ;;
  }

  measure: vl_presente {
    type: number
    group_item_label: "Vl Presente"
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
