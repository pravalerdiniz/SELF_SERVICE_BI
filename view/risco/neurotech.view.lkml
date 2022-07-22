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
    label: "ID"
    sql: ${TABLE}."ID" ;;
  }


  dimension_group: created_at {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Data Criação"
    sql: ${TABLE}."CREATED_AT" ;;
  }


  dimension: proposal_id {
    type: number
    label: "Proposal ID"
    sql: ${TABLE}."PROPOSAL_ID" ;;
  }

  dimension: politica {
    type: string
    label: "Politica"
    sql: ${TABLE}."POLITICA" ;;
  }

  dimension: result_var {
    type: string
    label: "Resultado Var"
    sql: ${TABLE}."RESULT_VAR" ;;
  }

  dimension: prop_cpf_aluno {
    type: number
    label: "CPF Aluno"
    primary_key: yes
    sql: ${TABLE}."PROP_CPF_ALUNO" ;;
  }

  dimension: prop_cpf_garantidor {
    type: number
    label: "CPF Garantidor"
    sql: ${TABLE}."PROP_CPF_GARANTIDOR" ;;
  }

  dimension: prop_renda_aluno {
    type: number
    sql: ${TABLE}."PROP_RENDA_ALUNO" ;;
    hidden: yes
  }

  measure: renda_aluno {
    type: sum
    label: "Renda Aluno"
    sql: ${prop_renda_aluno} ;;
  }

  dimension: prop_renda_garantidor {
    type: number
    hidden: yes
    sql: ${TABLE}."PROP_RENDA_GARANTIDOR" ;;
  }

  measure: renda_garantidor {
    type: sum
    label: "Renda Garantidor"
    sql: ${prop_renda_garantidor} ;;
  }

  dimension: prop_ies {
    type: string
    label: "IES"
    sql: ${TABLE}."PROP_IES" ;;
  }

  dimension: prop_curso {
    type: string
    label: "Curso"
    sql: ${TABLE}."PROP_CURSO" ;;
  }

  dimension: prop_mensalidade {
    type: number
    hidden: yes
    sql: ${TABLE}."PROP_MENSALIDADE" ;;
  }

  measure: mensalidade {
    type: sum
    label: "Mensalidade"
    sql: ${prop_mensalidade} ;;
  }

  dimension: prop_data_nasc_aluno {
    type: date
    label: "Data Nascimento Aluno"
    sql: ${TABLE}."PROP_DATA_NASC_ALUNO" ;;
  }

  dimension: prop_data_nasc_garantidor {
    type: date
    label: "Data Nascimento Garantidor"
    sql: ${TABLE}."PROP_DATA_NASC_GARANTIDOR" ;;
  }

  dimension: prop_uf_aluno {
    type: string
    label: "UF Aluno"
    sql: ${TABLE}."PROP_UF_ALUNO" ;;
  }

  dimension: prop_grau_parentesco {
    type: number
    label: "Grau Parentesco"
    sql: ${TABLE}."PROP_GRAU_PARENTESCO" ;;
  }

  dimension: prop_ocupacao_garantidor {
    type: number
    label: "Ocupação Garantidor"
    sql: ${TABLE}."PROP_OCUPACAO_GARANTIDOR" ;;
  }

  dimension: prop_estado_civil_garantidor {
    type: number
    label: "Estado Civil Garantidor"
    sql: ${TABLE}."PROP_ESTADO_CIVIL_GARANTIDOR" ;;
  }

  dimension: prop_boleto_ativo_aluno {
    type: string
    label: "Boleto Ativo Aluno"
    sql: ${TABLE}."PROP_BOLETO_ATIVO_ALUNO" ;;
  }

  dimension: prop_boleto_ativo_garantidor {
    type: string
    label: "Boleto Ativo Garantidor"
    sql: ${TABLE}."PROP_BOLETO_ATIVO_GARANTIDOR" ;;
  }

  dimension: prop_processo_contratacao {
    type: string
    label: "Processo Contratação"
    sql: ${TABLE}."PROP_PROCESSO_CONTRATACAO" ;;
  }

  dimension: prop_garantidor_wo {
    type: string
    label: "Garantidor WO"
    sql: ${TABLE}."PROP_GARANTIDOR_WO" ;;
  }

  dimension: prop_aluno_titulo_ativo {
    type: string
    label: "Aluno Titulo Ativo"
    sql: ${TABLE}."PROP_ALUNO_TITULO_ATIVO" ;;
  }

  dimension: prop_aluno_wo {
    type: string
    label: "Aluno WO"
    sql: ${TABLE}."PROP_ALUNO_WO" ;;
  }

  dimension: prop_mensalidade_ativa_ies {
    type: number
    label: "Mensalidade Ativa IES"
    sql: ${TABLE}."PROP_MENSALIDADE_ATIVA_IES" ;;
  }


  dimension_group: prop_data_contrato {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Data Contrato"
    sql: ${TABLE}."PROP_DATA_CONTRATO" ;;
  }


  dimension: prop_escore_whorty_credit {
    type: number
    label: "Score Whorty Credit"
    sql: ${TABLE}."PROP_ESCORE_WHORTY_CREDIT" ;;
  }

  dimension: prop_analise_credito_decisao_ia {
    type: string
    label: "Decisão Credito IA"
    sql: ${TABLE}."PROP_ANALISE_CREDITO_DECISAO_IA" ;;
  }

  dimension: prop_ponto_corte {
    type: string
    label: "Ponto Corte"
    sql: ${TABLE}."PROP_PONTO_CORTE" ;;
  }

  dimension: resultado {
    type: string
    label: "Resultado"
    sql: ${TABLE}."RESULTADO" ;;
  }

  dimension: operation_code {
    type: number
    label: "Operação CODE"
    sql: ${TABLE}."OPERATION_CODE" ;;
  }

  dimension: calc_score_interno {
    type: number
    label: "Score Interno"
    sql: ${TABLE}."CALC_SCORE_INTERNO" ;;
  }

  dimension: calc_bvs_score_positivo_aluno_score {
    type: number
    label: "Aluno Score"
    sql: ${TABLE}."CALC_BVS_SCORE_POSITIVO_ALUNO_SCORE" ;;
  }

  dimension: calc_bvs_score_positivo_garantidor_score {
    type: number
    label: "Garantidor Score"
    sql: ${TABLE}."CALC_BVS_SCORE_POSITIVO_GARANTIDOR_SCORE" ;;
  }

  dimension: calc_score_final {
    type: number
    label: "Score Final"
    sql: ${TABLE}."CALC_SCORE_FINAL" ;;
  }

  dimension: calc_score_cp {
    type: number
    label: "Score CP"
    sql: ${TABLE}."CALC_SCORE_CP" ;;
  }

  dimension: calc_bvs_situacao_regular_aluno {
    type: string
    label: "Situação Regular Aluno"
    sql: ${TABLE}."CALC_BVS_SITUACAO_REGULAR_ALUNO" ;;
  }

  dimension: calc_bvs_situacao_regular_garantidor {
    type: string
    label: "Situação Regular Garantidor"
    sql: ${TABLE}."CALC_BVS_SITUACAO_REGULAR_GARANTIDOR" ;;
  }

  dimension: calc_aluno_is_pep {
    type: string
    label: "Aluno IS PEP"
    sql: ${TABLE}."CALC_ALUNO_IS_PEP" ;;
  }

  dimension: calc_garantidor_is_pep {
    type: string
    label: "Aluno Garantidor IS PEP"
    sql: ${TABLE}."CALC_GARANTIDOR_IS_PEP" ;;
  }

  dimension: calc_motivo_ressubmissao {
    type: string
    label: "Motivo Ressubmissão"
    sql: ${TABLE}."CALC_MOTIVO_RESSUBMISSAO" ;;
  }

  dimension: calc_idade_aluno {
    type: number
    label: "Cidade Aluno"
    sql: ${TABLE}."CALC_IDADE_ALUNO" ;;
  }

  dimension: calc_chamada_fluxo {
    type: string
    label: "Chamada Fluxo"
    sql: ${TABLE}."CALC_CHAMADA_FLUXO" ;;
  }

  dimension: calc_antecipacao {
    type: string
    label: "Antecipação"
    sql: ${TABLE}."CALC_ANTECIPACAO" ;;
  }

  dimension: calc_gestao {
    type: string
    label: "Gestão"
    sql: ${TABLE}."CALC_GESTAO" ;;
  }

  dimension: calc_complementar {
    type: string
    label: "Complementar"
    sql: ${TABLE}."CALC_COMPLEMENTAR" ;;
  }

  dimension: calc_modalidade_ies {
    type: string
    label: "Modalidade IES"
    sql: ${TABLE}."CALC_MODALIDADE_IES" ;;
  }

  dimension: calc_analise_credito_decisao {
    type: string
    label: "Analise Credito Decisão"
    sql: ${TABLE}."CALC_ANALISE_CREDITO_DECISAO" ;;
  }

  dimension: calc_motivo_recusa {
    type: string
    label: "Motivo Recusa"
    sql: ${TABLE}."CALC_MOTIVO_RECUSA" ;;
  }

  dimension: calc_coficiente_estado {
    type: number
    label: "Coeficiente Estado"
    sql: ${TABLE}."CALC_COFICIENTE_ESTADO" ;;
  }

  dimension: calc_coeficiente_ocupacao {
    type: number
    label: "Coeficiente Ocupação"
    sql: ${TABLE}."CALC_COEFICIENTE_OCUPACAO" ;;
  }

  dimension: calc_coeficiente_idade {
    type: number
    label: "Coeficiente Idade"
    sql: ${TABLE}."CALC_COEFICIENTE_IDADE" ;;
  }

  dimension: calc_coeficiente_parentesco {
    type: number
    label: "Coeficiente Parentesco"
    sql: ${TABLE}."CALC_COEFICIENTE_PARENTESCO" ;;
  }

  dimension: calc_coeficiente_estado_civil {
    type: number
    label: "Coeficiente Estado Civil"
    sql: ${TABLE}."CALC_COEFICIENTE_ESTADO_CIVIL" ;;
  }

  dimension: calc_antecipacao_aprov {
    type: string
    label: "Aprovado Antecipação"
    sql: ${TABLE}."CALC_ANTECIPACAO_APROV" ;;
  }

  dimension: calc_gestao_aprov {
    type: string
    label: "Aprovado Gestão"
    sql: ${TABLE}."CALC_GESTAO_APROV" ;;
  }

  dimension: calc_complementar_aprov {
    type: string
    label: "Aprovado Complementar"
    sql: ${TABLE}."CALC_COMPLEMENTAR_APROV" ;;
  }

  dimension: calc_repasse_garantido {
    type: string
    label: "Repasse Garantido"
    sql: ${TABLE}."CALC_REPASSE_GARANTIDO" ;;
  }

  dimension: calc_gestao_garantido {
    type: string
    label: "Gestão Garantido"
    sql: ${TABLE}."CALC_GESTAO_GARANTIDO" ;;
  }

  set: detail {
    fields: [
      id,
      created_at_date,
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
      prop_data_contrato_date,
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
