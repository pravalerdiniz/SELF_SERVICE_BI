view: final_pdd {
  derived_table: {
    sql: select
        id_cpf
        ,f.key as ano_mes
        ,f.value:ANO_CESSAO_CPF::varchar as ano_cessao_cpf
        ,f.value:ANO_CESSAO_FUNDO::varchar as  ano_cessao_fundo
        ,f.value:ANO_MES_OBS::varchar as ano_mes_obs
        ,f.value:DATA_VISAO::date as data_visao
        ,f.value:DIAS_ATRASO_FUNDO::int as dias_atraso_fundo
        ,f.value:FUNDO::int as fundo
        ,f.value:ID_INSTITUICAO::varchar as id_instituicao
        ,f.value:MATURIDADE_CESSAO::int as maturidade_cessao
        ,f.value:MATURIDADE_FUNDO::int as maturidade_fundo
        ,f.value:MATURIDADE_VISAO::int as maturidade_visao
        ,f.value:MIN_DATA_VENCIMENTO::date as min_data_vencimento
        ,f.value:MIN_MATURIDADE_CESSAO::int as min_maturidade_cessao
        ,f.value:PORC_PROVISAO_CPF::float as porc_provisao_cpf
        ,f.value:PROVISAO_CPF::int as provisao_cpf
        ,f.value:PROVISAO_FUNDO::float as provisao_fundo
        ,f.value:RATING_CPF::varchar as rating_cpf
        ,f.value:RATING_FUNDO::varchar as rating_fundo
        ,f.value:SAFRA_CESSAO_CPF::varchar as safra_cessao_cpf
        ,f.value:SAFRA_CESSAO_FUNDO::varchar as safra_cessao_fundo
        ,f.value:SAFRA_CESSAO_SEMESTRE::varchar as safra_cessao_semestre
        ,f.value:SEMESTRE_VISAO::varchar as semestre_visao
        ,f.value:VL_PRESENTE::number as vl_presente
        ,f.value:TX_PDD_NOVA::number as tx_pdd_nova
        ,f.value:PROVISAO_CPF_TX_PDD_NOVA::number as provisao_cpf_tx_pdd_nova
      from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
      lateral flatten (input => pdd) f
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    value_format: "0"
    group_label: "Dados do Aluno"
    group_item_label: "ID_CPF do Aluno"
    description: "Indica o ID do CPF do aluno"
  }

  dimension: ano_mes {
    type: string
    sql: ${TABLE}."ANO_MES" ;;
    description: "Indica o ano e mês referência"
    value_format: "0"
    group_label: "Dados do PDD"
    group_item_label: "Mês de observação"
  }

  dimension: ano_cessao_cpf {
    type: number
    sql: ${TABLE}."ANO_CESSAO_CPF" ;;
    value_format: "0"
    group_label: "Dados do PDD"
    group_item_label: "Ano Cessão CPF"
    description: "Ano da cessão que o CPF entrou no Pravaler"
  }

  dimension: ano_cessao_fundo {
    type: number
    sql: ${TABLE}."ANO_CESSAO_FUNDO" ;;
    value_format: "0"
    group_label: "Dados do PDD"
    group_item_label: "Ano Cessão Fundo"
    description: "Ano da cessão que o CPF entrou no Fundo"
  }

  dimension: ano_mes_obs {
    type: number
    sql: ${TABLE}."ANO_MES_OBS" ;;
    value_format: "0"
    group_label: "Dados do PDD"
    group_item_label: "Mês de observação"
    description: "Indica 1 mes após o mes de referencia"
  }

  dimension: data_visao {
    type: date
    sql: ${TABLE}."DATA_VISAO" ;;
    group_label: "Dados do PDD"
    group_item_label: "Data Visão"
    description: "Data do Fechamento"
  }

  dimension: dias_atraso_fundo  {
    type: number
    sql: ${TABLE}."DIAS_ATRASO_FUNDO" ;;
    group_label: "Dados do PDD"
    group_item_label: "Dias em atraso no fundo"
    description: "Quantidade de Dias de Atraso do menor vencimento do CPF no Fundo"
  }

  dimension: fundo {
    type: number
    sql: ${TABLE}."FUNDO" ;;
    group_label: "Dados do PDD"
    group_item_label: ""
    description: "Indica o fundo de investimento referente ao contrato"
  }
  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "ID Instituição"
    description: "Indica o ID da Instituição"
  }
  dimension: maturidade_cessao {
    type: number
    sql: ${TABLE}."MATURIDADE_CESSAO" ;;
    group_label: "Dados do PDD"
    group_item_label: "Maturidade Cessão"
    description: "Maturidade da cessão que o CPF entrou no Fundo"
  }
  dimension: maturidade_fundo {
    type: number
    sql: ${TABLE}."MATURIDADE_FUNDO" ;;
    group_label: "Dados do PDD"
    group_item_label: "Maturidade Fundo"
    description: "Maturidade do CPF no Fundo"
  }
  dimension: maturidade_visao {
    type: number
    sql: ${TABLE}."MATURIDADE_VISAO" ;;
    group_label: "Dados do PDD"
    group_item_label: "Maturidade Visão"
    description: "Maturidade da Visão "
  }
  dimension: min_data_vencimento {
    type: date
    sql: ${TABLE}."MIN_DATA_VENCIMENTO" ;;
    group_label: "Dados do PDD"
    group_item_label: "Menor data Vencimento"
    description: "Menor data de um título não pago pelo CPF"
  }
  dimension: min_maturidade_cessao {
    type: number
    sql: ${TABLE}."MIN_MATURIDADE_CESSAO" ;;
    group_label: "Dados do PDD"
    group_item_label: "Maturidade Minima Cessão"
    description: "Menor maturidade que o CPF entrou no Pravaler"
  }
  dimension: porc_provisao_cpf {
    type: number
    sql: ${TABLE}."PORC_PROVISAO_CPF" ;;
    group_label: "Dados do PDD"
    group_item_label: "Provisão CPF %"
    description: "Percentual a ser provisionado de acordo com o Rating no Pravaler"
  }
  dimension: provisao_cpf {
    type: number
    sql: ${TABLE}."PROVISAO_CPF" ;;
    group_label: "Dados do PDD"
    group_item_label: "Provisão CPF"
    description: "É o valor presente multiplicado por provisao cpf"
  }
  dimension: provisao_fundo {
    type: number
    sql: ${TABLE}."PROVISAO_FUNDO" ;;
    group_label: "Dados do PDD"
    group_item_label: "Provisão Fundo"
    description: ""
  }
  dimension: rating_cpf {
    type: string
    sql: ${TABLE}."RATING_CPF" ;;
    group_label: "Dados do PDD"
    group_item_label: "Rating CPF"
    description: "Rating do CPF no Pravaler"
  }
  dimension: rating_fundo {
    type: string
    sql: ${TABLE}."RATING_FUNDO" ;;
    group_label: "Dados do PDD"
    group_item_label: "Rating Fundo"
    description: "Rating do CPF no Fundo"
  }
  dimension: safra_cessao_cpf {
    type: number
    sql: ${TABLE}."SAFRA_CESSAO_CPF" ;;
    group_label: "Dados do PDD"
    group_item_label: "Safra Cessão CPF"
    description: "Ano e Mês da cessão que o CPF entrou no Pravaler"
  }
  dimension: safra_cessao_fundo {
    type: number
    sql: ${TABLE}."SAFRA_CESSAO_FUNDO" ;;
    value_format: "0"
    group_label: "Dados do PDD"
    group_item_label: "Safra Cessão Fundo"
    description: "Ano e Mês da cessão que o CPF entrou no Fundo"
  }
  dimension: safra_cessao_semestre {
    type: string
    sql: ${TABLE}."SAFRA_CESSAO_SEMESTRE" ;;
    group_label: "Dados do PDD"
    group_item_label: "Safra Cessão Semestre"
    description: "Ano e e Semestre que o CPF entrou no Pravaler"
  }
  dimension: semestre_visao {
    type: number
    sql: ${TABLE}."SEMESTRE_VISAO" ;;
    group_label: "Dados do PDD"
    group_item_label: "Semestre Visão"
    description: "Semestre do Fechamento"
  }
  dimension: vl_presente {
    type: number
    sql: ${TABLE}."VL_PRESENTE" ;;
    group_label: "Dados do PDD"
    group_item_label: "Valor Presente"
    description: "Valor da dívida trazida ao presente"
  }

  dimension: tx_pdd_nova {
    type: number
    sql: ${TABLE}."TX_PDD_NOVA" ;;
    group_label: "Dados do PDD"
    group_item_label: "Taxa de PDD Nova"
    description: "Percentual de provisão pela nova tabela"
  }
  dimension: provisao_cpf_tx_pdd_nova {
    type: number
    sql: ${TABLE}."PROVISAO_CPF_TX_PDD_NOVA" ;;
    group_label: "Dados do PDD"
    group_item_label: "Provisão CPF - Taxa Nova"
    description: "Provisão total pela nova tabela de pdd"
  }


  set: detail {
    fields: [
      id_cpf,
      ano_mes,
      ano_cessao_cpf  ,
      ano_cessao_fundo  ,
      ano_mes_obs ,
      data_visao  ,
      dias_atraso_fundo ,
      fundo ,
      id_instituicao  ,
      maturidade_cessao ,
      maturidade_fundo  ,
      maturidade_visao  ,
      min_data_vencimento ,
      min_maturidade_cessao ,
      porc_provisao_cpf ,
      provisao_cpf  ,
      provisao_fundo  ,
      rating_cpf  ,
      rating_fundo  ,
      safra_cessao_cpf  ,
      safra_cessao_fundo  ,
      safra_cessao_semestre ,
      semestre_visao  ,
      vl_presente ,
      tx_pdd_nova ,
      provisao_cpf_tx_pdd_nova
    ]
  }
}
