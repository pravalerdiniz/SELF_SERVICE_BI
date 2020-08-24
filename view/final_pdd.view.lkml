view: final_pdd {
  derived_table: {
    sql: select
  id_cpf
  ,f.key as ano_mes
  ,f.value:ANO_CESSAO_CPF:varchar as ano_cessao_cpf
  ,f.value:ANO_CESSAO_FUNDO:varchar as  ano_cessao_fundo
  ,f.value:ANO_MES_OBS:varchar as ano_mes_obs
  ,f.value:DATA_VISAO::date as data_visao
  ,f.value:DIAS_ATRASO_FUNDO:int as dias_atraso_fundo
  ,f.value:FUNDO:int as fundo
  ,f.value:ID_INSTITUICAO:varchar as id_instituicao
  ,f.value:MATURIDADE_CESSAO:int as maturidade_cessao
  ,f.value:MATURIDADE_FUNDO:int as maturidade_fundo
  ,f.value:MATURIDADE_VISAO::int as maturidade_visao
  ,f.value:MIN_DATA_VENCIMENTO:date as min_data_vencimento
  ,f.value:MIN_MATURIDADE_CESSAO:int as min_maturidade_cessao
  ,f.value:PORC_PROVISAO_CPF:float as porc_provisao_cpf
  ,f.value:PROVISAO_CPF:int as provisao_cpf
  ,f.value:PROVISAO_FUNDO:float as provisao_fundo
  ,f.value:RATING_CPF:varchar as rating_cpf
  ,f.value:RATING_FUNDO:varchar as rating_fundo
  ,f.value:SAFRA_CESSAO_CPF:varchar as safra_cessao_cpf
  ,f.value:SAFRA_CESSAO_FUNDO:varchar as safra_cessao_fundo
  ,f.value:SAFRA_CESSAO_SEMESTRE:varchar as safra_cessao_semestre
  ,f.value:SEMESTRE_VISAO::varchar as semestre_visao
  ,f.value:VL_PRESENTE:number as vl_presente
  ,f.value:TX_PDD_NOVA:number as tx_pdd_nova
  ,f.value:PROVISAO_CPF_TX_PDD_NOVA:number as provisao_cpf_tx_pdd_nova
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
    description: "Indica o ID do CPF do Aluno"
  }

  dimension: ano_mes {
    type: string
    sql: ${TABLE}."ANO_MES" ;;
    description: "Mês de observação"
  }

  dimension: ano_cessao_cpf {
    type: number
    sql: ${TABLE}."ANO_CESSAO_CPF" ;;
  }

  dimension: ano_cessao_fundo {
    type: number
    sql: ${TABLE}."ANO_CESSAO_FUNDO" ;;
  }
  dimension: ano_mes_obs {
    type: number
    sql: ${TABLE}."ANO_MES_OBS" ;;
  }
  dimension: data_visao {
    type: date
    sql: ${TABLE}."DATA_VISAO" ;;
  }
  dimension: dias_atraso_fundo  {
    type: number
    sql: ${TABLE}."DIAS_ATRASO_FUNDO" ;;
  }
  dimension: fundo {
    type: number
    sql: ${TABLE}."FUNDO" ;;
  }
  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }
  dimension: maturidade_cessao {
    type: number
    sql: ${TABLE}."MATURIDADE_CESSAO" ;;
  }
  dimension: maturidade_fundo {
    type: number
    sql: ${TABLE}."MATURIDADE_FUNDO" ;;
  }
  dimension: maturidade_visao {
    type: number
    sql: ${TABLE}."MATURIDADE_VISAO" ;;
  }
  dimension: min_data_vencimento {
    type: date
    sql: ${TABLE}."MIN_DATA_VENCIMENTO" ;;
  }
  dimension: min_maturidade_cessao {
    type: number
    sql: ${TABLE}."MIN_MATURIDADE_CESSAO" ;;
  }
  dimension: porc_provisao_cpf {
    type: number
    sql: ${TABLE}."PORC_PROVISAO_CPF" ;;
  }
  dimension: provisao_cpf {
    type: number
    sql: ${TABLE}."PROVISAO_CPF" ;;
  }
  dimension: provisao_fundo {
    type: number
    sql: ${TABLE}."PROVISAO_FUNDO" ;;
  }
  dimension: rating_cpf {
    type: string
    sql: ${TABLE}."RATING_CPF" ;;
  }
  dimension: rating_fundo {
    type: string
    sql: ${TABLE}."ANO_CESSAO_CPF" ;;
  }
  dimension: safra_cessao_cpf {
    type: number
    sql: ${TABLE}."SAFRA_CESSAO_CPF" ;;
  }
  dimension: safra_cessao_fundo {
    type: number
    sql: ${TABLE}."SAFRA_CESSAO_FUNDO" ;;
  }
  dimension: safra_cessao_semestre {
    type: string
    sql: ${TABLE}."SAFRA_CESSAO_SEMESTRE" ;;
  }
  dimension: semestre_visao {
    type: number
    sql: ${TABLE}."SEMESTRE_VISAO" ;;
  }
  dimension: vl_presente {
    type: number
    sql: ${TABLE}."VL_PRESENTE" ;;
  }

  dimension: tx_pdd_nova {
    type: number
    sql: ${TABLE}."TX_PDD_NOVA" ;;
  }
  dimension: provisao_cpf_tx_pdd_nova {
    type: number
    sql: ${TABLE}."PROVISAO_CPF_TX_PDD_NOVA" ;;
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
