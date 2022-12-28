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
    label: "Situação Do Aluno no Bureau de crédito - Boa Vista"
    sql: ${TABLE}."CALC_BVS_SITUACAO_REGULAR_ALUNO" ;;
  }

  dimension: calc_bvs_situacao_regular_garantidor {
    type: string
    label: "Situação Do Garantidor no Bureau de crédito - Boa Vista"
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

  dimension:  prop_ponto_corte_gtg {
    type: number
    label: "Ponto de Corte - Gestão Garantido"
    sql: ${TABLE}."PROP_PONTO_CORTE_GTG" ;;
  }

  dimension: prop_ponto_corte_rmg {
    type: number
    label: "Ponto de Corte - Repasse Garantido"
    sql: ${TABLE}."PROP_PONTO_CORTE_RMG" ;;
  }

  dimension: prop_cep {
    type: string
    label: "CEP do ALuno"
    sql: ${TABLE}."PROP_CEP" ;;
  }

  dimension: prop_ocupacao_aluno {
    type: string
    label: "Ocupação Profissional do Aluno"
    sql: ${TABLE}."PROP_OCUPACAO_ALUNO" ;;
  }

  dimension: calc_status_aluno {
    type: number
    label: "Status Atual do Aluno"
    sql: ${TABLE}."CALC_STATUS_ALUNO" ;;
  }

  dimension: calc_outbox_coeficiente_aluno {
    type: number
    label: "Cálculo de Coeficiente Outbox do Aluno"
    sql: ${TABLE}."CALC_OUTBOX_COEFICIENTE_ALUNO" ;;
  }

  dimension: calc_outbox_coeficiente_garantidor{
    type: number
    label: "Cálculo de Coeficiente Outbox do Garantidor"
    sql: ${TABLE}."CALC_OUTBOX_COEFICIENTE_GARANTIDOR";;
  }

  dimension: calc_outbox_cat_aluno{
    type: string
    label: "Cálculo de Coeficiente Outbox da Categoria do Aluno"
    sql: ${TABLE}."CALC_OUTBOX_CAT_ALUNO";;
  }

  dimension: calc_outbox_cat_garantidor{
    type: string
    label: "Cálculo de Coeficiente Outbox da categoria do Garantidor"
    sql: ${TABLE}."CALC_OUTBOX_CAT_GARANTIDOR";;
  }

  dimension: calc_prob_inferida_modelo_proposta{
    type: number
    label: "Cálculo de Probabilidade Inferida do modelo PROPOSTA"
    sql: ${TABLE}."CALC_PROB_INFERIDA_MODELO_PROPOSTA";;
  }

  dimension: calc_bvs_parcial_aluno{
    type: number
    label: "Cálculo de BVS Parcial do Aluno"
    sql: ${TABLE}."CALC_BVS_PARCIAL_ALUNO";;
  }

  dimension: calc_prob_inferida_modelo_aluno{
    type: number
    label: "Probabilidade Inferida do modelo ALUNO"
    sql: ${TABLE}."CALC_PROB_INFERIDA_MODELO_ALUNO";;
  }

  dimension: calc_outbox_xbeta_aluno{
    type: number
    label: "Cálculo de Outbox/Xbeta do Aluno"
    sql: ${TABLE}."CALC_OUTBOX_XBETA_ALUNO";;
  }

  dimension: calc_outbox_logistica_proposta{
    type: number
    label: "Cálculo de Outbox Logistica/Proposta"
    sql: ${TABLE}."CALC_OUTBOX_LOGISTICA_PROPOSTA";;
  }

  dimension: calc_bvs_parcial_garantidor{
    type: number
    label: "Cálculo de BVS Parcial do Garantidor"
    sql: ${TABLE}."CALC_BVS_PARCIAL_GARANTIDOR";;
  }

  dimension: calc_outbox_xbeta_garantidor{
    type: number
    label: "Cálculo de Outbox/Xbeta do Garantidor"
    sql: ${TABLE}."CALC_OUTBOX_XBETA_GARANTIDOR";;
  }

  dimension: calc_outbox_score_aluno{
    type: number
    label: "Cálculo de Outbox do Score do Aluno"
    sql: ${TABLE}."CALC_OUTBOX_SCORE_ALUNO";;
  }

  dimension: calc_outbox_score_garantidor{
    type: number
    label: "Cálculo de Outbox do Score do Garantidor"
    sql: ${TABLE}."CALC_OUTBOX_SCORE_GARANTIDOR";;
  }

  dimension: calc_prob_inferida_modelo_garantidor{
    type: number
    label: "Cálculo de Probabilidade Inferida do modelo GARANTIDOR"
    sql: ${TABLE}."CALC_PROB_INFERIDA_MODELO_GARANTIDOR";;
  }

  dimension: calc_prob_inferida_modelo{
    type: number
    label: "Cálculo de Probabilidade Inferida do MODELO"
    sql: ${TABLE}."CALC_PROB_INFERIDA_MODELO";;
  }

  dimension: calc_outbox_xbeta{
    type: number
    label: "Cálculo de OUTBOX/XBETA"
    sql: ${TABLE}."CALC_OUTBOX_XBETA";;
  }

  dimension: calc_outbox_xbeta_pa{
    type: number
    label: "Cálculo de OUTBOX/XBETA do modelo PA"
    sql: ${TABLE}."CALC_OUTBOX_XBETA_PA";;
  }

  dimension: calc_outbox_xbeta_paf{
    type: number
    label: "Cálculo de OUTBOX/XBETA  modelo PAF"
    sql: ${TABLE}."CALC_OUTBOX_XBETA_PAF";;
  }

  dimension: calc_recusado_credit_score{
    type: string
    label: "Recusado por Credit Score"
    sql: ${TABLE}."CALC_RECUSADO_CREDIT_SCORE";;
  }

  dimension: calc_debug{
    type: string
    label: "Debug"
    sql: ${TABLE}."CALC_DEBUG";;
  }

  dimension: calc_recusa_renda_insuficiente{
    type: string
    label: "Recusa por Renda Insuficiente"
    sql: ${TABLE}."CALC_RECUSA_RENDA_INSUFICIENTE";;
  }

  dimension: calc_comprometimento{
    type: number
    label: "Comprometimento de renda do aluno"
    sql: ${TABLE}."CALC_COMPROMETIMENTO";;
  }

  dimension: calc_outbox_logistica_aluno{
    type: number
    label: "Calculo de Outbox de Logistica/Aluno"
    sql: ${TABLE}."CALC_OUTBOX_LOGISTICA_ALUNO";;
  }

  dimension: calc_outbox_logistica_garantidor{
    type: number
    label: "Calculo de Outbox de Logistica/Garantidor"
    sql: ${TABLE}."CALC_OUTBOX_LOGISTICA_GARANTIDOR";;
  }

  dimension: calc_outbox_logistica{
    type: number
    label: "Calculo de Outbox de Logistica"
    sql: ${TABLE}."CALC_OUTBOX_LOGISTICA";;
  }

  dimension: calc_outbox_score_customizado_aluno{
    type: number
    label: "Score customizado do Aluno (modelos externos)"
    sql: ${TABLE}."CALC_OUTBOX_SCORE_CUSTOMIZADO_ALUNO";;
  }

  dimension: calc_outbox_score_customizado_garantidor{
    type: number
    label: "Score customizado do Garantidor (modelos externos)"
    sql: ${TABLE}."CALC_OUTBOX_SCORE_CUSTOMIZADO_GARANTIDOR";;
  }

  dimension: calc_outbox_score_proposta{
    type: number
    label: "Score da proposta"
    sql: ${TABLE}."CALC_OUTBOX_SCORE_PROPOSTA";;
  }

  dimension: calc_score_modelo_paf{
    type: number
    label: "Score do modelo PAF"
    sql: ${TABLE}."CALC_SCORE_MODELO_PAF";;
  }

  dimension: calc_score_modelo_pa{
    type: number
    label: "Score do modelo PA"
    sql: ${TABLE}."CALC_SCORE_MODELO_PA";;
  }

  dimension: calc_coeficiente_mensalidade_atraso{
    type: number
    label: "Coeficiente De Mensalidade em Atraso"
    sql: ${TABLE}."CALC_COEFICIENTE_MENSALIDADE_ATRASO";;
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
      calc_gestao_garantido,
      prop_ponto_corte_gtg,
      prop_ponto_corte_rmg,
      prop_cep,
      prop_ocupacao_aluno,
      calc_status_aluno,
      calc_outbox_coeficiente_aluno,
      calc_outbox_coeficiente_garantidor,
      calc_outbox_cat_aluno,
      calc_outbox_cat_garantidor,
      calc_prob_inferida_modelo_proposta,
      calc_bvs_parcial_aluno,
      calc_prob_inferida_modelo_aluno,
      calc_outbox_xbeta_aluno,
      calc_outbox_logistica_proposta,
      calc_bvs_parcial_garantidor,
      calc_outbox_xbeta_garantidor,
      calc_outbox_score_aluno,
      calc_outbox_score_garantidor,
      calc_prob_inferida_modelo_garantidor,
      calc_prob_inferida_modelo,
      calc_outbox_xbeta,
      calc_outbox_xbeta_pa,
      calc_outbox_xbeta_paf,
      calc_recusado_credit_score,
      calc_debug,
      calc_recusa_renda_insuficiente,
      calc_comprometimento,
      calc_outbox_logistica_aluno,
      calc_outbox_logistica_garantidor,
      calc_outbox_logistica,
      calc_outbox_score_customizado_aluno,
      calc_outbox_score_customizado_garantidor,
      calc_outbox_score_proposta,
      calc_score_modelo_paf,
      calc_score_modelo_pa,
      calc_coeficiente_mensalidade_atraso
    ]
  }
}
