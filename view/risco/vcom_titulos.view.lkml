view: vcom_titulos {
  sql_table_name: "CCR"."VCOM_TITULOS"
    ;;

  ## DIMENSÕES ##

  dimension: id_boleto {
    type: string
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."ID_BOLETO" ;;
    primary_key: yes
  }

  dimension: id_mdw {
    type: string
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."ID_MDW" ;;
  }

  dimension: id_cpf {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: cpf {
    type: string
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."CPF" ;;
  }

  dimension: id_seunum {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."ID_SEUNUM" ;;
  }

  dimension: id_nossonum {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."ID_NOSSONUM" ;;
  }

  dimension: id_tit_vcom {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."ID_TIT_VCOM" ;;
  }

  dimension: id_par_vcom {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."ID_PAR_VCOM" ;;
  }

  dimension: num_parcela {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."NUM_PARCELA" ;;
  }

  dimension: contrato {
    type: string
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."CONTRATO" ;;
  }

  dimension: etapa {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."ETAPA" ;;
  }

  dimension: fluxo {
    type: string
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."FLUXO" ;;
  }

  dimension: layoutatual {
    type: string
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."LAYOUTATUAL" ;;
  }

  dimension: mensagem_erro {
    type: string
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."MENSAGEM_ERRO" ;;
  }

  dimension: flg_cpf_enviado {
    type: yesno
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."FLG_CPF_ENVIADO" ;;
  }

  dimension: flg_titulo_enviado {
    type: yesno
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."FLG_TITULO_ENVIADO" ;;
  }

  dimension: flg_em_aberto {
    type: yesno
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."FLG_EM_ABERTO" ;;
  }

  dimension: flg_cpf_quitado {
    type: yesno
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."FLG_CPF_QUITADO" ;;
  }

  dimension: flg_recebido {
    type: yesno
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."FLG_RECEBIDO" ;;
  }

  dimension: classificacao_erro {
    type: string
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."CLASSIFICACAO_ERRO" ;;
  }

  ## DATAS ##

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

}
