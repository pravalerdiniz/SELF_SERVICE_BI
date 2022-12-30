view: neurotech {
    sql_table_name: "GRADUADO"."RISCO"."NEUROTECH"
      ;;


  measure: count {
    type: count
    ##drill_fields: [detail*]
    hidden: yes
  }

  dimension: id {
    type: string
    label: "ID"
    sql: ${TABLE}."ID" ;;
    hidden: yes
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

  dimension: prop_ies {
    type: string
    label: "IES"
    group_label: "Dados da IES"
    sql: ${TABLE}."PROP_IES" ;;
  }

  dimension: prop_curso {
    type: string
    label: "Curso"
    group_label: "Dados da IES"
    sql: ${TABLE}."PROP_CURSO" ;;
  }

  dimension_group: prop_data_nasc_aluno {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Data Nascimento Aluno"
    sql: ${TABLE}."PROP_DATA_NASC_ALUNO" ;;
  }

  dimension_group: prop_data_nasc_garantidor {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Data Nascimento Garantidor"
    sql: ${TABLE}."PROP_DATA_NASC_GARANTIDOR" ;;
  }

  dimension: prop_uf_aluno {
    type: string
    label: "UF Aluno"
    group_label: "Dados do Aluno"
    sql: ${TABLE}."PROP_UF_ALUNO" ;;
  }

  dimension: prop_boleto_ativo_aluno {
    type: string
    label: "Boleto Ativo Aluno"
    group_label: "Dados Financeiros Aluno"
    sql: ${TABLE}."PROP_BOLETO_ATIVO_ALUNO" ;;
  }

  dimension: prop_boleto_ativo_garantidor {
    type: string
    label: "Boleto Ativo Garantidor"
    group_label: "Dados Financeiros Garantidor"
    sql: ${TABLE}."PROP_BOLETO_ATIVO_GARANTIDOR" ;;
  }

  dimension: prop_processo_contratacao {
    type: string
    label: "Processo Contratação"
    sql: ${TABLE}."PROP_PROCESSO_CONTRATACAO" ;;
    hidden: yes
  }

  dimension: prop_garantidor_wo {
    type: string
    label: "Garantidor WO"
    group_label: "Dados Financeiros Garantidor"
    sql: ${TABLE}."PROP_GARANTIDOR_WO" ;;
  }

  dimension: prop_aluno_titulo_ativo {
    type: string
    label: "Aluno Titulo Ativo"
    group_label: "Dados Financeiros Aluno"
    sql: ${TABLE}."PROP_ALUNO_TITULO_ATIVO" ;;
  }

  dimension: prop_aluno_wo {
    type: string
    label: "Aluno WO"
    group_label: "Dados Financeiros Aluno"
    sql: ${TABLE}."PROP_ALUNO_WO" ;;
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

  dimension: prop_analise_credito_decisao_ia {
    type: string
    label: "Decisão Credito IA"
    group_label: "Resultado de Avaliação"
    sql: ${TABLE}."PROP_ANALISE_CREDITO_DECISAO_IA" ;;
  }

  dimension: prop_ponto_corte {
    type: string
    label: "Ponto Corte"
    group_label: "Resultado de Avaliação"
    sql: ${TABLE}."PROP_PONTO_CORTE" ;;
  }

  dimension: resultado {
    type: string
    label: "Resultado"
    group_label: "Resultado de Avaliação"
    sql: ${TABLE}."RESULTADO" ;;
  }

  dimension: calc_bvs_situacao_regular_aluno {
    type: string
    label: "Situação Do Aluno no Bureau de crédito - Boa Vista"
    group_label: "Dados de BVS"
    sql: ${TABLE}."CALC_BVS_SITUACAO_REGULAR_ALUNO" ;;
  }

  dimension: calc_bvs_situacao_regular_garantidor {
    type: string
    label: "Situação Do Garantidor no Bureau de crédito - Boa Vista"
    group_label: "Dados de BVS"
    sql: ${TABLE}."CALC_BVS_SITUACAO_REGULAR_GARANTIDOR" ;;
  }

  dimension: calc_aluno_is_pep {
    type: string
    label: "Aluno IS PEP"
    group_label: "Dados do Aluno"
    sql: ${TABLE}."CALC_ALUNO_IS_PEP" ;;
  }

  dimension: calc_garantidor_is_pep {
    type: string
    label: "Aluno Garantidor IS PEP"
    group_label: "Dados do Garantidor"
    sql: ${TABLE}."CALC_GARANTIDOR_IS_PEP" ;;
  }

  dimension: calc_motivo_ressubmissao {
    type: string
    label: "Motivo Ressubmissão"
    group_label: "Resultado de Avaliação"
    sql: ${TABLE}."CALC_MOTIVO_RESSUBMISSAO" ;;
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
    hidden: yes
  }

  dimension: calc_gestao {
    type: string
    label: "Gestão"
    sql: ${TABLE}."CALC_GESTAO" ;;
    hidden: yes
  }

  dimension: calc_complementar {
    type: string
    label: "Complementar"
    sql: ${TABLE}."CALC_COMPLEMENTAR" ;;
    hidden: yes
  }

  dimension: calc_modalidade_ies {
    type: string
    label: "Modalidade IES"
    group_label: "Dados da IES"
    sql: ${TABLE}."CALC_MODALIDADE_IES" ;;
  }

  dimension: calc_analise_credito_decisao {
    type: string
    label: "Analise Credito Decisão"
    group_label: "Resultado de Avaliação"
    sql: ${TABLE}."CALC_ANALISE_CREDITO_DECISAO" ;;
  }

  dimension: calc_motivo_recusa {
    type: string
    label: "Motivo Recusa"
    group_label: "Resultado de Avaliação"
    sql: ${TABLE}."CALC_MOTIVO_RECUSA" ;;
  }

  dimension: calc_antecipacao_aprov {
    type: string
    label: "Aprovado Antecipação"
    sql: ${TABLE}."CALC_ANTECIPACAO_APROV" ;;
    hidden: yes
  }

  dimension: calc_gestao_aprov {
    type: string
    label: "Aprovado Gestão"
    sql: ${TABLE}."CALC_GESTAO_APROV" ;;
    hidden: yes
  }

  dimension: calc_complementar_aprov {
    type: string
    label: "Aprovado Complementar"
    sql: ${TABLE}."CALC_COMPLEMENTAR_APROV" ;;
    hidden: yes
  }

  dimension: calc_repasse_garantido {
    type: string
    label: "Repasse Garantido"
    sql: ${TABLE}."CALC_REPASSE_GARANTIDO" ;;
    hidden: yes
  }

  dimension: calc_gestao_garantido {
    type: string
    label: "Gestão Garantido"
    sql: ${TABLE}."CALC_GESTAO_GARANTIDO" ;;
    hidden: yes
  }

  dimension: calc_outbox_cat_aluno{
    type: string
    label: "Cálculo de Coeficiente Outbox da Categoria do Aluno"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_CAT_ALUNO";;
  }

  dimension: calc_outbox_cat_garantidor{
    type: string
    label: "Cálculo de Coeficiente Outbox da categoria do Garantidor"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_CAT_GARANTIDOR";;
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
    hidden: yes
  }

  dimension: calc_recusa_renda_insuficiente{
    type: string
    label: "Recusa por Renda Insuficiente"
    group_label: "Resultado de Avaliação"
    sql: ${TABLE}."CALC_RECUSA_RENDA_INSUFICIENTE";;
  }

  dimension: modalidade_aprovada {
    type: string
    label: "Modalidade Aprovada"
    group_label: "Resultado de Avaliação"
    sql: ${TABLE}."MODALIDADE_APROVADA" ;;
  }

  dimension_group: ult_data_reprovado {
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
    label: "Data Reprovação"
    sql: ${TABLE}."ULT_DATA_REPROVADO" ;;
  }

  dimension: flg_cpf_teste {
    type: string
    label: "Flag CPF Teste"
    sql: ${TABLE}."FLG_CPF_TESTE" ;;
  }

  dimension: proposal_id {
    type: number
    label: "Proposal ID"
    group_label: "Dados do Aluno"
    sql: ${TABLE}."PROPOSAL_ID" ;;
  }

  dimension: prop_cpf_aluno {
    type: number
    label: "CPF Aluno"
    group_label: "Dados do Aluno"
    primary_key: yes
    sql: ${TABLE}."PROP_CPF_ALUNO" ;;
  }

  dimension: prop_cpf_garantidor {
    type: number
    label: "CPF Garantidor"
    group_label: "Dados do Garantidor"
    sql: ${TABLE}."PROP_CPF_GARANTIDOR" ;;
  }

  dimension: prop_renda_aluno {
    type: number
    group_label: "Dados do Aluno"
    sql: ${TABLE}."PROP_RENDA_ALUNO" ;;
    hidden: yes
  }

  dimension: prop_renda_garantidor {
    type: number
    hidden: yes
    sql: ${TABLE}."PROP_RENDA_GARANTIDOR" ;;
  }

  dimension: prop_mensalidade {
    type: number
    hidden: yes
    sql: ${TABLE}."PROP_MENSALIDADE" ;;
  }

  dimension: prop_grau_parentesco {
    type: number
    label: "Grau Parentesco"
    sql: ${TABLE}."PROP_GRAU_PARENTESCO" ;;
    hidden: yes
  }

  dimension: prop_ocupacao_garantidor {
    type: number
    label: "Ocupação Garantidor"
    group_label: "Dados do Garantidor"
    sql: ${TABLE}."PROP_OCUPACAO_GARANTIDOR" ;;
  }

  dimension: prop_estado_civil_garantidor {
    type: number
    label: "Estado Civil Garantidor"
    group_label: "Dados do Garantidor"
    sql: ${TABLE}."PROP_ESTADO_CIVIL_GARANTIDOR" ;;
  }

  dimension: prop_mensalidade_ativa_ies {
    type: number
    label: "Mensalidade Ativa IES"
    sql: ${TABLE}."PROP_MENSALIDADE_ATIVA_IES" ;;
  }

  dimension: prop_escore_whorty_credit {
    type: number
    label: "Score Whorty Credit"
    group_label: "Dados de Score"
    sql: ${TABLE}."PROP_ESCORE_WHORTY_CREDIT" ;;
  }

  dimension: operation_code {
    type: number
    label: "Operação CODE"
    sql: ${TABLE}."OPERATION_CODE" ;;
  }

  dimension: calc_score_interno {
    type: number
    label: "Score Interno"
    group_label: "Dados de Score"
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
    group_label: "Dados de Score"
    sql: ${TABLE}."CALC_SCORE_FINAL" ;;
  }

  dimension: calc_score_cp {
    type: number
    label: "Score CP"
    group_label: "Dados de Score"
    sql: ${TABLE}."CALC_SCORE_CP" ;;
  }

  dimension: calc_idade_aluno {
    type: number
    label: "Idade Aluno"
    group_label: "Dados do Aluno"
    sql: ${TABLE}."CALC_IDADE_ALUNO" ;;
  }

  dimension: calc_coeficiente_estado {
    type: number
    label: "Coeficiente Estado"
    group_label: "Dados de Coeficiente"
    sql: ${TABLE}."CALC_COFICIENTE_ESTADO" ;;
  }

  dimension: calc_coeficiente_ocupacao {
    type: number
    label: "Coeficiente Ocupação"
    group_label: "Dados de Coeficiente"
    sql: ${TABLE}."CALC_COEFICIENTE_OCUPACAO" ;;
  }

  dimension: calc_coeficiente_idade {
    type: number
    label: "Coeficiente Idade"
    group_label: "Dados de Coeficiente"
    sql: ${TABLE}."CALC_COEFICIENTE_IDADE" ;;
  }

  dimension: calc_coeficiente_parentesco {
    type: number
    label: "Coeficiente Parentesco"
    group_label: "Dados de Coeficiente"
    sql: ${TABLE}."CALC_COEFICIENTE_PARENTESCO" ;;
  }

  dimension: calc_coeficiente_estado_civil {
    type: number
    label: "Coeficiente Estado Civil"
    group_label: "Dados de Coeficiente"
    sql: ${TABLE}."CALC_COEFICIENTE_ESTADO_CIVIL" ;;
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
    group_label: "Dados do Aluno"
    sql: ${TABLE}."PROP_CEP" ;;
  }

  dimension: prop_ocupacao_aluno {
    type: string
    group_label: "Dados do Aluno"
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
    group_label: "Dados de Coeficiente"
    sql: ${TABLE}."CALC_OUTBOX_COEFICIENTE_ALUNO" ;;
  }

  dimension: calc_outbox_coeficiente_garantidor{
    type: number
    label: "Cálculo de Coeficiente Outbox do Garantidor"
    group_label: "Dados de Coeficiente"
    sql: ${TABLE}."CALC_OUTBOX_COEFICIENTE_GARANTIDOR";;
  }

  dimension: calc_prob_inferida_modelo_proposta{
    type: number
    label: "Cálculo de Probabilidade Inferida do modelo PROPOSTA"
    group_label: "Dados de Probabilidade"
    sql: ${TABLE}."CALC_PROB_INFERIDA_MODELO_PROPOSTA";;
  }

  dimension: calc_bvs_parcial_aluno{
    type: number
    label: "Cálculo de BVS Parcial do Aluno"
    group_label: "Dados de BVS"
    sql: ${TABLE}."CALC_BVS_PARCIAL_ALUNO";;
  }

  dimension: calc_prob_inferida_modelo_aluno{
    type: number
    label: "Probabilidade Inferida do modelo ALUNO"
    group_label: "Dados de Probabilidade"
    sql: ${TABLE}."CALC_PROB_INFERIDA_MODELO_ALUNO";;
  }

  dimension: calc_outbox_xbeta_aluno{
    type: number
    label: "Cálculo de Outbox/Xbeta do Aluno"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_XBETA_ALUNO";;
  }

  dimension: calc_outbox_logistica_proposta{
    type: number
    label: "Cálculo de Outbox Logistica/Proposta"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_LOGISTICA_PROPOSTA";;
  }

  dimension: calc_bvs_parcial_garantidor{
    type: number
    label: "Cálculo de BVS Parcial do Garantidor"
    group_label: "Dados de BVS"
    sql: ${TABLE}."CALC_BVS_PARCIAL_GARANTIDOR";;
  }

  dimension: calc_outbox_xbeta_garantidor{
    type: number
    label: "Cálculo de Outbox/Xbeta do Garantidor"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_XBETA_GARANTIDOR";;
  }

  dimension: calc_outbox_score_aluno{
    type: number
    label: "Cálculo de Outbox do Score do Aluno"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_SCORE_ALUNO";;
  }

  dimension: calc_outbox_score_garantidor{
    type: number
    label: "Cálculo de Outbox do Score do Garantidor"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_SCORE_GARANTIDOR";;
  }

  dimension: calc_prob_inferida_modelo_garantidor{
    type: number
    label: "Cálculo de Probabilidade Inferida do modelo GARANTIDOR"
    group_label: "Dados de Probabilidade"
    sql: ${TABLE}."CALC_PROB_INFERIDA_MODELO_GARANTIDOR";;
  }

  dimension: calc_prob_inferida_modelo{
    type: number
    label: "Cálculo de Probabilidade Inferida do MODELO"
    group_label: "Dados de Probabilidade"
    sql: ${TABLE}."CALC_PROB_INFERIDA_MODELO";;
  }

  dimension: calc_outbox_xbeta{
    type: number
    label: "Cálculo de OUTBOX/XBETA"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_XBETA";;
  }

  dimension: calc_outbox_xbeta_pa{
    type: number
    label: "Cálculo de OUTBOX/XBETA do modelo PA"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_XBETA_PA";;
  }

  dimension: calc_outbox_xbeta_paf{
    type: number
    label: "Cálculo de OUTBOX/XBETA  modelo PAF"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_XBETA_PAF";;
  }

  dimension: calc_comprometimento{
    type: number
    label: "Comprometimento de renda do aluno"
    group_label: "Dados Financeiros Aluno"
    sql: ${TABLE}."CALC_COMPROMETIMENTO";;
  }

  dimension: calc_outbox_logistica_aluno{
    type: number
    label: "Calculo de Outbox de Logistica/Aluno"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_LOGISTICA_ALUNO";;
  }

  dimension: calc_outbox_logistica_garantidor{
    type: number
    label: "Calculo de Outbox de Logistica/Garantidor"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_LOGISTICA_GARANTIDOR";;
  }

  dimension: calc_outbox_logistica{
    type: number
    label: "Calculo de Outbox de Logistica"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_LOGISTICA";;
  }

  dimension: calc_outbox_score_customizado_aluno{
    type: number
    label: "Score customizado do Aluno (modelos externos)"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_SCORE_CUSTOMIZADO_ALUNO";;
  }

  dimension: calc_outbox_score_customizado_garantidor{
    type: number
    label: "Score customizado do Garantidor (modelos externos)"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_SCORE_CUSTOMIZADO_GARANTIDOR";;
  }

  dimension: calc_outbox_score_proposta{
    type: number
    label: "Score da proposta"
    group_label: "Dados de Outbox"
    sql: ${TABLE}."CALC_OUTBOX_SCORE_PROPOSTA";;
  }

  dimension: calc_score_modelo_paf{
    type: number
    label: "Score do modelo PAF"
    group_label: "Dados de Score"
    sql: ${TABLE}."CALC_SCORE_MODELO_PAF";;
  }

  dimension: calc_score_modelo_pa{
    type: number
    label: "Score do modelo PA"
    group_label: "Dados de Score"
    sql: ${TABLE}."CALC_SCORE_MODELO_PA";;
  }

  dimension: calc_coeficiente_mensalidade_atraso{
    type: number
    label: "Coeficiente De Mensalidade em Atraso"
    group_label: "Dados de Coeficiente"
    sql: ${TABLE}."CALC_COEFICIENTE_MENSALIDADE_ATRASO";;
  }

  dimension: qtd_reenviado_30d{
    type: number
    label: "QTD Reenviado Reprovado"
    description: "Conta a quantidade de vezes que o mesmo aluno com a mesma proposta foi reenviado no prazo de 30 dias"
    group_label: "Dados de Avaliação"
    sql: ${TABLE}."CALC_COEFICIENTE_MENSALIDADE_ATRASO";;
  }


  ####################################



  measure: renda_aluno {
    type: sum
    label: "Renda Aluno"
    sql: ${prop_renda_aluno} ;;
  }

  measure: renda_garantidor {
    type: sum
    label: "Renda Garantidor"
    sql: ${prop_renda_garantidor} ;;
  }

  measure: mensalidade {
    type: sum
    label: "Mensalidade"
    sql: ${prop_mensalidade} ;;
  }


}
