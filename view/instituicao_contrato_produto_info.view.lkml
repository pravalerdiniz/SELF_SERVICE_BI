view: instituicao_contrato_produto_info {
  derived_table: {
    sql: select
        id_instituicao
        ,f.key as ID_IES_CONTRATO
        ,f.value:BANCO::varchar as BANCO
      ,f.value:AGENCIA::varchar as DS_BANCO_AGENCIA
      ,f.value:CONTA::varchar as DS_BANCO_CC
      ,f.value:DIA_VENCIMENTO::number as DIA_VENCIMENTO
      ,f.value:TIPO_VENCIMENTO::varchar as TIPO_VENCIMENTO
      ,f.value:ORIGINADORES_ATIVOS::array  as ORIGINADORES_ATIVOS
      ,f.value:DESC_ORIGINADORES_ATIVOS::array as DESC_ORIGINADORES_ATIVOS
      ,f.value:ORIGINADORES_INATIVOS::array as ORIGINADORES_INATIVOS
      ,f.value:DESC_ORIGINADORES_INATIVOS::array as DESC_ORIGINADORES_INATIVOS
      ,f.value:PERC_DESAGIO::float as PERC_DESAGIO
      ,f.value:PERC_COMISSAO::float as PERC_COMISSAO
      ,f.value:VL_DIAS_WP::number as VL_DIAS_WO
      ,f.value:FLG_WO::boolean as FLG_WO
      ,f.value:ID_PRODUTO::varchar as ID_PRODUTO
      ,f.value:NM_PRODUTO::varchar  NM_PRODUTO
      ,f.value:FLG_ATIVO::varchar as FLG_ATIVO
      from GRADUADO.SELF_SERVICE_BI.INSTITUICAO a,
      lateral flatten (input => ies_contrato) f
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_instituicao {
    type: string

    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_ies_contrato {
    type: string
    sql: ${TABLE}."ID_IES_CONTRATO" ;;
  }

  dimension: banco {
    type: string
    sql: ${TABLE}."BANCO" ;;
  }

  dimension: ds_banco_agencia {
    type: string
    sql: ${TABLE}."DS_BANCO_AGENCIA" ;;
  }

  dimension: ds_banco_cc {
    type: string
    sql: ${TABLE}."DS_BANCO_CC" ;;
  }

  dimension: dia_vencimento {
    type: number
    sql: ${TABLE}."DIA_VENCIMENTO" ;;
  }

  dimension: tipo_vencimento {
    type: string
    sql: ${TABLE}."TIPO_VENCIMENTO" ;;
  }

  dimension: originadores_ativos {
    type: string
    sql: ${TABLE}."ORIGINADORES_ATIVOS" ;;
  }

  dimension: desc_originadores_ativos {
    type: string
    sql: ${TABLE}."DESC_ORIGINADORES_ATIVOS" ;;
  }

  dimension: originadores_inativos {
    type: string
    sql: ${TABLE}."ORIGINADORES_INATIVOS" ;;
  }

  dimension: desc_originadores_inativos {
    type: string
    sql: ${TABLE}."DESC_ORIGINADORES_INATIVOS" ;;
  }

  dimension: perc_desagio {
    type: number
    sql: ${TABLE}."PERC_DESAGIO" ;;
  }

  dimension: perc_comissao {
    type: number
    sql: ${TABLE}."PERC_COMISSAO" ;;
  }

  dimension: vl_dias_wo {
    type: number
    sql: ${TABLE}."VL_DIAS_WO" ;;
  }

  dimension: flg_wo {
    type: string
    sql: ${TABLE}."FLG_WO" ;;
  }

  dimension: id_produto {
    type: string
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: nm_produto {
    type: string
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: flg_ativo {
    type: string
    sql: ${TABLE}."FLG_ATIVO" ;;
  }

  set: detail {
    fields: [
      id_instituicao,
      id_ies_contrato,
      banco,
      ds_banco_agencia,
      ds_banco_cc,
      dia_vencimento,
      tipo_vencimento,
      originadores_ativos,
      desc_originadores_ativos,
      originadores_inativos,
      desc_originadores_inativos,
      perc_desagio,
      perc_comissao,
      vl_dias_wo,
      flg_wo,
      id_produto,
      nm_produto,
      flg_ativo
    ]
  }
}
