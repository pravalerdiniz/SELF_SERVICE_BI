view: instituicao_contrato_produto_info {
  derived_table: {
    persist_for: "24 hours"
    sql:SELECT id_instituicao
      , ID_IES_CONTRATO
      ,f2.BANCO
      ,f2.DS_BANCO_AGENCIA
      ,f2.DS_BANCO_CC
      ,f2.DIA_VENCIMENTO
      ,f2.TIPO_VENCIMENTO
      ,f2.ORIGINADORES_ATIVOS
      ,f2.DESC_ORIGINADORES_ATIVOS
      ,aux.value::string as DESC_ORIGINADORES_ATIVOS_STR
      ,f2.ORIGINADORES_INATIVOS
      ,f2.DESC_ORIGINADORES_INATIVOS
      ,f2.PERC_DESAGIO
      ,f2.PERC_COMISSAO
      ,f2.VL_DIAS_WO
      ,f2.FLG_WO
      ,f2.ID_PRODUTO
      ,f2.NM_PRODUTO
      ,f2.FLG_ATIVO
      ,f2.FLG_CORTE
      ,f2.MODALIDADE_RISCO FROM
          (select distinct
            id_instituicao
          ,f.value:ID_IES_CONTRATO::int as ID_IES_CONTRATO
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
          ,f.value:FLG_ATIVO::boolean as FLG_ATIVO
          ,f.value:FLG_CORTE::boolean as FLG_CORTE
          ,f.value:MODALIDADE::varchar as MODALIDADE_RISCO
          from GRADUADO.SELF_SERVICE_BI.INSTITUICAO a,
          lateral flatten (input => ies_contrato) f
          ) f2,
      lateral flatten(input => f2.DESC_ORIGINADORES_ATIVOS) aux;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: id_instituicao_id_contrato_id_produto_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${id_instituicao},${id_ies_contrato},${id_produto}) ;;
  }


  dimension: id_instituicao {
    type: string
    label: "ID da Instituição"
    description: "Indica o ID da Instituição de Ensino"
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }



  dimension: id_ies_contrato {
    type: number
    label: "Contrato da IES"
    description: "Indica o número do contrato da Instituição por produto"
    sql: ${TABLE}."ID_IES_CONTRATO" ;;
  }

  dimension: banco {
    type: string
    group_label: "Dados Bancários"
    label: "Banco"
    description: "Indica o nome do Banco da Instituição"
    sql: ${TABLE}."BANCO" ;;
  }

  dimension: ds_banco_agencia {
    type: string
    group_label: "Dados Bancários"
    label: "Agência"
    description: "Indica o número da agência bancária da Instituição"
    sql: ${TABLE}."DS_BANCO_AGENCIA" ;;
  }

  dimension: ds_banco_cc {
    type: string
    group_label: "Dados Bancários"
    label: "Conta Corrente"
    description: "Indica o número da conta corrente da Instituição"
    sql: ${TABLE}."DS_BANCO_CC" ;;
  }

  dimension: dia_vencimento {
    type: number
    label: "Dia de Vencimento"
    description: "Indica o dia de vencimento do contrato da instituição"
    sql: ${TABLE}."DIA_VENCIMENTO" ;;
  }

  dimension: tipo_vencimento {
    type: string
    label: "Tipo de Vencimento"
    description: "Indica se o vencimento é em dia Útil ou em Dias Corridos. Ex: U = Útil, C = Corrido"
    sql: ${TABLE}."TIPO_VENCIMENTO" ;;
  }

  dimension: originadores_ativos {
    type: string
    group_label: "Originador - Ativo"
    label: "ID dos Originadores Ativos"
    description: "Indica os originadores que tem contrato ativo com a instituição"
    sql: ${TABLE}."ORIGINADORES_ATIVOS" ;;
  }

  dimension: desc_originadores_ativos {
    type: string
    group_label: "Originador - Ativo"
    label: "Descrição dos Originadores Ativos"
    description: "Indica os originadores que tem contrato ativo com a instituição"
    sql: ${TABLE}."DESC_ORIGINADORES_ATIVOS" ;;
  }

  dimension: desc_originador_ativo {
    type: string
    group_label: "Originador - Ativo"
    label: "Descrição do Originador Ativo"
    description: "Indica os originadores que tem contrato ativo com a instituição"
    sql: ${TABLE}."DESC_ORIGINADORES_ATIVOS_STR" ;;
  }

  dimension: modalidade_risco {
    type: string
    label: "Modalidade - Risco"
    description: "Indica a modalidade do produto seguindo parametros da Análise de Risco e Crédito"
    sql: ${TABLE}."MODALIDADE_RISCO" ;;
  }

  dimension: originadores_inativos {
    type: string
    group_label: "Originador - Inativo"
    label: "ID dos Originadores Inativos"
    description: "Indica os originadores que tem contrato inativo com a instituição"
    sql: ${TABLE}."ORIGINADORES_INATIVOS" ;;
  }

  dimension: desc_originadores_inativos {
    type: string
    group_label: "Originador - Inativo"
    label: "Descrição dos Originadores Inativos"
    description: "Indica os originadores que contrato inativo com a instituição"
    sql: ${TABLE}."DESC_ORIGINADORES_INATIVOS" ;;
  }

  dimension: perc_desagio {
    type: number
    label: "Percentual de Deságio"
    description: "Indica o percentual de deságio da Instituição por produto"
    sql: ${TABLE}."PERC_DESAGIO" ;;
  }

  dimension: perc_comissao {
    type: number
    label: "Percentual de Comissão"
    description: "Indica o percentual de comissão pago para a instituição por produto"
    sql: ${TABLE}."PERC_COMISSAO" ;;
  }

  dimension: vl_dias_wo {
    type: number
    label: "Dias em W.O"
    description: "Indica a quantidade de dias que a instituição está em WriteOff"
    sql: ${TABLE}."VL_DIAS_WO" ;;
  }

  dimension: flg_wo {
    type: yesno
    label: "Está em W.O?"
    description: "Indica se o contrato da instituição está em W.O"
    sql: ${TABLE}."FLG_WO" ;;
  }

  dimension: flg_corte {
    type: yesno
    label: "Nota de Corte?"
    description: "Indica se o contrato da instituição com determinado produto possui Nota de Corte para SCORE,"
    sql: ${TABLE}."FLG_CORTE" ;;
  }

  dimension: id_produto {
    type: string
    label: "ID do Produto"
    description: "Indica o ID do Produto correspondente ao contrato com a Instituição"
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: nm_produto {
    type: string
    label: "Nome do Produto"
    description: "Indica o Nome do Produto correspondente ao contrato com a Instituição"
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: flg_ativo {
    type: yesno
    label: "Contrato Ativo?"
    description: "Indica se o contrato da instituição com produto está ativo ou não."
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
