view: neurotech {
  derived_table: {
    sql: select * from GRADUADO.RISCO.NEUROTECH
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension: proposal_id {
    type: number
    sql: ${TABLE}."PROPOSAL_ID" ;;
  }

  dimension: politica {
    type: string
    sql: ${TABLE}."POLITICA" ;;
  }

  dimension: result_var {
    type: string
    sql: ${TABLE}."RESULT_VAR" ;;
  }

  dimension: prop_cpf_aluno {
    type: number
    sql: ${TABLE}."PROP_CPF_ALUNO" ;;
  }

  dimension: prop_cpf_garantidor {
    type: number
    sql: ${TABLE}."PROP_CPF_GARANTIDOR" ;;
  }

  dimension: prop_renda_aluno {
    type: number
    sql: ${TABLE}."PROP_RENDA_ALUNO" ;;
  }

  dimension: prop_renda_garantidor {
    type: number
    sql: ${TABLE}."PROP_RENDA_GARANTIDOR" ;;
  }

  dimension: prop_ies {
    type: string
    sql: ${TABLE}."PROP_IES" ;;
  }

  dimension: prop_curso {
    type: string
    sql: ${TABLE}."PROP_CURSO" ;;
  }

  dimension: prop_mensalidade {
    type: number
    sql: ${TABLE}."PROP_MENSALIDADE" ;;
  }

  dimension: prop_data_nasc_aluno {
    type: date
    sql: ${TABLE}."PROP_DATA_NASC_ALUNO" ;;
  }

  dimension: prop_data_nasc_garantidor {
    type: date
    sql: ${TABLE}."PROP_DATA_NASC_GARANTIDOR" ;;
  }

  dimension: prop_uf_aluno {
    type: string
    sql: ${TABLE}."PROP_UF_ALUNO" ;;
  }

  dimension: prop_grau_parentesco {
    type: number
    sql: ${TABLE}."PROP_GRAU_PARENTESCO" ;;
  }

  dimension: prop_ocupacao_garantidor {
    type: number
    sql: ${TABLE}."PROP_OCUPACAO_GARANTIDOR" ;;
  }

  dimension: prop_estado_civil_garantidor {
    type: number
    sql: ${TABLE}."PROP_ESTADO_CIVIL_GARANTIDOR" ;;
  }

  dimension: prop_boleto_ativo_aluno {
    type: string
    sql: ${TABLE}."PROP_BOLETO_ATIVO_ALUNO" ;;
  }

  dimension: prop_boleto_ativo_garantidor {
    type: string
    sql: ${TABLE}."PROP_BOLETO_ATIVO_GARANTIDOR" ;;
  }

  dimension: prop_processo_contratacao {
    type: string
    sql: ${TABLE}."PROP_PROCESSO_CONTRATACAO" ;;
  }

  dimension: prop_garantidor_wo {
    type: string
    sql: ${TABLE}."PROP_GARANTIDOR_WO" ;;
  }

  dimension: prop_aluno_titulo_ativo {
    type: string
    sql: ${TABLE}."PROP_ALUNO_TITULO_ATIVO" ;;
  }

  dimension: prop_aluno_wo {
    type: string
    sql: ${TABLE}."PROP_ALUNO_WO" ;;
  }

  dimension: prop_mensalidade_ativa_ies {
    type: number
    sql: ${TABLE}."PROP_MENSALIDADE_ATIVA_IES" ;;
  }

  dimension: prop_data_contrato {
    type: date
    sql: ${TABLE}."PROP_DATA_CONTRATO" ;;
  }

  dimension: prop_escore_whorty_credit {
    type: number
    sql: ${TABLE}."PROP_ESCORE_WHORTY_CREDIT" ;;
  }

  dimension: prop_analise_credito_decisao_ia {
    type: string
    sql: ${TABLE}."PROP_ANALISE_CREDITO_DECISAO_IA" ;;
  }

  dimension: prop_ponto_corte {
    type: string
    sql: ${TABLE}."PROP_PONTO_CORTE" ;;
  }

  dimension: resultado {
    type: string
    sql: ${TABLE}."RESULTADO" ;;
  }

  dimension: operation_code {
    type: number
    sql: ${TABLE}."OPERATION_CODE" ;;
  }

  dimension: calc_score_interno {
    type: number
    sql: ${TABLE}."CALC_SCORE_INTERNO" ;;
  }

  dimension: calc_bvs_score_positivo_aluno_score {
    type: number
    sql: ${TABLE}."CALC_BVS_SCORE_POSITIVO_ALUNO_SCORE" ;;
  }

  dimension: calc_bvs_score_positivo_garantidor_score {
    type: number
    sql: ${TABLE}."CALC_BVS_SCORE_POSITIVO_GARANTIDOR_SCORE" ;;
  }

  dimension: calc_score_final {
    type: number
    sql: ${TABLE}."CALC_SCORE_FINAL" ;;
  }

  dimension: calc_score_cp {
    type: number
    sql: ${TABLE}."CALC_SCORE_CP" ;;
  }

  dimension: calc_bvs_situacao_regular_aluno {
    type: string
    sql: ${TABLE}."CALC_BVS_SITUACAO_REGULAR_ALUNO" ;;
  }

  dimension: calc_bvs_situacao_regular_garantidor {
    type: string
    sql: ${TABLE}."CALC_BVS_SITUACAO_REGULAR_GARANTIDOR" ;;
  }

  dimension: calc_aluno_is_pep {
    type: string
    sql: ${TABLE}."CALC_ALUNO_IS_PEP" ;;
  }

  dimension: calc_garantidor_is_pep {
    type: string
    sql: ${TABLE}."CALC_GARANTIDOR_IS_PEP" ;;
  }

  dimension: calc_motivo_ressubmissao {
    type: string
    sql: ${TABLE}."CALC_MOTIVO_RESSUBMISSAO" ;;
  }

  dimension: calc_idade_aluno {
    type: number
    sql: ${TABLE}."CALC_IDADE_ALUNO" ;;
  }

  dimension: calc_chamada_fluxo {
    type: string
    sql: ${TABLE}."CALC_CHAMADA_FLUXO" ;;
  }

  dimension: calc_antecipacao {
    type: string
    sql: ${TABLE}."CALC_ANTECIPACAO" ;;
  }

  dimension: calc_gestao {
    type: string
    sql: ${TABLE}."CALC_GESTAO" ;;
  }

  dimension: calc_complementar {
    type: string
    sql: ${TABLE}."CALC_COMPLEMENTAR" ;;
  }

  dimension: calc_modalidade_ies {
    type: string
    sql: ${TABLE}."CALC_MODALIDADE_IES" ;;
  }

  dimension: calc_analise_credito_decisao {
    type: string
    sql: ${TABLE}."CALC_ANALISE_CREDITO_DECISAO" ;;
  }

  dimension: calc_motivo_recusa {
    type: string
    sql: ${TABLE}."CALC_MOTIVO_RECUSA" ;;
  }

  dimension: calc_coficiente_estado {
    type: number
    sql: ${TABLE}."CALC_COFICIENTE_ESTADO" ;;
  }

  dimension: calc_coeficiente_ocupacao {
    type: number
    sql: ${TABLE}."CALC_COEFICIENTE_OCUPACAO" ;;
  }

  dimension: calc_coeficiente_idade {
    type: number
    sql: ${TABLE}."CALC_COEFICIENTE_IDADE" ;;
  }

  dimension: calc_coeficiente_parentesco {
    type: number
    sql: ${TABLE}."CALC_COEFICIENTE_PARENTESCO" ;;
  }

  dimension: calc_coeficiente_estado_civil {
    type: number
    sql: ${TABLE}."CALC_COEFICIENTE_ESTADO_CIVIL" ;;
  }

  dimension: calc_antecipacao_aprov {
    type: string
    sql: ${TABLE}."CALC_ANTECIPACAO_APROV" ;;
  }

  dimension: calc_gestao_aprov {
    type: string
    sql: ${TABLE}."CALC_GESTAO_APROV" ;;
  }

  dimension: calc_complementar_aprov {
    type: string
    sql: ${TABLE}."CALC_COMPLEMENTAR_APROV" ;;
  }

  dimension: calc_repasse_garantido {
    type: string
    sql: ${TABLE}."CALC_REPASSE_GARANTIDO" ;;
  }

  dimension: calc_gestao_garantido {
    type: string
    sql: ${TABLE}."CALC_GESTAO_GARANTIDO" ;;
  }

  set: detail {
    fields: [
      id,
      created_at_time,
      proposal_id,
      politica,
      result_var,
      prop_cpf_aluno,
      prop_cpf_garantidor,
      prop_renda_aluno,
      prop_renda_garantidor,
      prop_ies,
      prop_curso,
      prop_mensalidade,
      prop_data_nasc_aluno,
      prop_data_nasc_garantidor,
      prop_uf_aluno,
      prop_grau_parentesco,
      prop_ocupacao_garantidor,
      prop_estado_civil_garantidor,
      prop_boleto_ativo_aluno,
      prop_boleto_ativo_garantidor,
      prop_processo_contratacao,
      prop_garantidor_wo,
      prop_aluno_titulo_ativo,
      prop_aluno_wo,
      prop_mensalidade_ativa_ies,
      prop_data_contrato,
      prop_escore_whorty_credit,
      prop_analise_credito_decisao_ia,
      prop_ponto_corte,
      resultado,
      operation_code,
      calc_score_interno,
      calc_bvs_score_positivo_aluno_score,
      calc_bvs_score_positivo_garantidor_score,
      calc_score_final,
      calc_score_cp,
      calc_bvs_situacao_regular_aluno,
      calc_bvs_situacao_regular_garantidor,
      calc_aluno_is_pep,
      calc_garantidor_is_pep,
      calc_motivo_ressubmissao,
      calc_idade_aluno,
      calc_chamada_fluxo,
      calc_antecipacao,
      calc_gestao,
      calc_complementar,
      calc_modalidade_ies,
      calc_analise_credito_decisao,
      calc_motivo_recusa,
      calc_coficiente_estado,
      calc_coeficiente_ocupacao,
      calc_coeficiente_idade,
      calc_coeficiente_parentesco,
      calc_coeficiente_estado_civil,
      calc_antecipacao_aprov,
      calc_gestao_aprov,
      calc_complementar_aprov,
      calc_repasse_garantido,
      calc_gestao_garantido
    ]
  }
}
