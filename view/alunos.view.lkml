view: alunos {
  sql_table_name: "SELF_SERVICE_BI"."ALUNOS"
    ;;
  drill_fields: [aluno_idade]

  dimension: aluno_idade {
    primary_key: yes
    type: number
    sql: ${TABLE}."ALUNO_IDADE" ;;
  }

  dimension: aluno_genero {
    type: string
    sql: ${TABLE}."ALUNO_GENERO" ;;
  }

  dimension: aluno_nome {
    type: string
    sql: ${TABLE}."ALUNO_NOME" ;;
  }

  dimension: ano_termino_ensino_medio {
    type: number
    sql: ${TABLE}."ANO_TERMINO_ENSINO_MEDIO" ;;
  }

  dimension: area_conhecimento_curso {
    type: string
    sql: ${TABLE}."AREA_CONHECIMENTO_CURSO" ;;
  }

  dimension: bairro {
    type: string
    sql: ${TABLE}."BAIRRO" ;;
  }

  dimension: cargo_atual {
    type: string
    sql: ${TABLE}."CARGO_ATUAL" ;;
  }

  dimension: carteira_atual {
    type: string
    sql: ${TABLE}."CARTEIRA_ATUAL" ;;
  }

  dimension: celular {
    type: string
    sql: ${TABLE}."CELULAR" ;;
  }

  dimension: cep {
    type: string
    sql: ${TABLE}."CEP" ;;
  }

  dimension: cidade {
    type: string
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: cidade_campus {
    type: string
    sql: ${TABLE}."CIDADE_CAMPUS" ;;
  }

  dimension: cidade_instituicao {
    type: string
    sql: ${TABLE}."CIDADE_INSTITUICAO" ;;
  }

  dimension: conversao_atual {
    type: string
    sql: ${TABLE}."CONVERSAO_ATUAL" ;;
  }

  dimension: cp_atual {
    type: string
    sql: ${TABLE}."CP_ATUAL" ;;
  }

  dimension_group: data_matricula {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_MATRICULA" ;;
  }

  dimension_group: data_primeira_cessao {
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
    sql: ${TABLE}."DATA_PRIMEIRA_CESSAO" ;;
  }

  dimension_group: data_ultima_cessao {
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
    sql: ${TABLE}."DATA_ULTIMA_CESSAO" ;;
  }

  dimension: ds_cal_vet {
    type: string
    sql: ${TABLE}."DS_CAL_VET" ;;
  }

  dimension: ds_campus {
    type: string
    sql: ${TABLE}."DS_CAMPUS" ;;
  }

  dimension: ds_curso {
    type: string
    sql: ${TABLE}."DS_CURSO" ;;
  }

  dimension: ds_fundo_investimento {
    type: string
    sql: ${TABLE}."DS_FUNDO_INVESTIMENTO" ;;
  }

  dimension: ds_instituicao {
    type: string
    sql: ${TABLE}."DS_INSTITUICAO" ;;
  }

  dimension: ds_trabalha {
    type: string
    sql: ${TABLE}."DS_TRABALHA" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: endereco {
    type: string
    sql: ${TABLE}."ENDERECO" ;;
  }

  dimension: enfase_curso {
    type: string
    sql: ${TABLE}."ENFASE_CURSO" ;;
  }

  dimension: escolaridade {
    type: string
    sql: ${TABLE}."ESCOLARIDADE" ;;
  }

  dimension: estado_civil {
    type: string
    sql: ${TABLE}."ESTADO_CIVIL" ;;
  }

  dimension: fia_bairro {
    type: string
    sql: ${TABLE}."FIA_BAIRRO" ;;
  }

  dimension: fia_celular {
    type: string
    sql: ${TABLE}."FIA_CELULAR" ;;
  }

  dimension: fia_cep {
    type: string
    sql: ${TABLE}."FIA_CEP" ;;
  }

  dimension: fia_cidade {
    type: string
    sql: ${TABLE}."FIA_CIDADE" ;;
  }

  dimension: fia_email {
    type: string
    sql: ${TABLE}."FIA_EMAIL" ;;
  }

  dimension: fia_endereco {
    type: string
    sql: ${TABLE}."FIA_ENDERECO" ;;
  }

  dimension: fia_escolaridade {
    type: string
    sql: ${TABLE}."FIA_ESCOLARIDADE" ;;
  }

  dimension: fia_estado_civil {
    type: string
    sql: ${TABLE}."FIA_ESTADO_CIVIL" ;;
  }

  dimension: fia_nacionalidade {
    type: string
    sql: ${TABLE}."FIA_NACIONALIDADE" ;;
  }

  dimension: fia_natureza_ocupacao {
    type: string
    sql: ${TABLE}."FIA_NATUREZA_OCUPACAO" ;;
  }

  dimension: fia_nome {
    type: string
    sql: ${TABLE}."FIA_NOME" ;;
  }

  dimension: fia_numero_dependentes {
    type: number
    sql: ${TABLE}."FIA_NUMERO_DEPENDENTES" ;;
  }

  dimension: fia_profissao {
    type: string
    sql: ${TABLE}."FIA_PROFISSAO" ;;
  }

  dimension: fia_renda_mensal {
    type: number
    sql: ${TABLE}."FIA_RENDA_MENSAL" ;;
  }

  dimension: fia_tempo_empresa {
    type: string
    sql: ${TABLE}."FIA_TEMPO_EMPRESA" ;;
  }

  dimension: fia_tipo_residencia {
    type: string
    sql: ${TABLE}."FIA_TIPO_RESIDENCIA" ;;
  }

  dimension: fia_uf {
    type: string
    sql: ${TABLE}."FIA_UF" ;;
  }

  dimension: flg_aluno_ativo {
    type: yesno
    sql: ${TABLE}."FLG_ALUNO_ATIVO" ;;
  }

  dimension: flg_campus_ativo {
    type: yesno
    sql: ${TABLE}."FLG_CAMPUS_ATIVO" ;;
  }

  dimension: flg_curso_ativo {
    type: yesno
    sql: ${TABLE}."FLG_CURSO_ATIVO" ;;
  }

  dimension: flg_instituicao_ativa {
    type: yesno
    sql: ${TABLE}."FLG_INSTITUICAO_ATIVA" ;;
  }

  dimension: flg_mae_falecida {
    type: yesno
    sql: ${TABLE}."FLG_MAE_FALECIDA" ;;
  }

  dimension: flg_pai_falecido {
    type: yesno
    sql: ${TABLE}."FLG_PAI_FALECIDO" ;;
  }

  dimension: flg_produto_ativo {
    type: yesno
    sql: ${TABLE}."FLG_PRODUTO_ATIVO" ;;
  }

  dimension: flg_renegociacao {
    type: yesno
    sql: ${TABLE}."FLG_RENEGOCIACAO" ;;
  }

  dimension: gerente_atual {
    type: string
    sql: ${TABLE}."GERENTE_ATUAL" ;;
  }

  dimension: gh {
    type: string
    sql: ${TABLE}."GH" ;;
  }

  dimension: grupo_instituicao {
    type: string
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
  }

  dimension: id_campus {
    type: number
    sql: ${TABLE}."ID_CAMPUS" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_curso {
    type: number
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_fia_cpf_atual {
    type: number
    sql: ${TABLE}."ID_FIA_CPF_ATUAL" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: id_instituicao {
    type: number
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_produto {
    type: number
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: id_produtos_contratados {
    type: string
    sql: ${TABLE}."ID_PRODUTOS_CONTRATADOS" ;;
  }

  dimension: id_proposta_atual {
    type: number
    sql: ${TABLE}."ID_PROPOSTA_ATUAL" ;;
  }

  dimension: id_propostas_enviadas {
    type: string
    sql: ${TABLE}."ID_PROPOSTAS_ENVIADAS" ;;
  }

  dimension: maturidade_info {
    type: string
    sql: ${TABLE}."MATURIDADE_INFO" ;;
  }

  dimension: nacionalidade {
    type: string
    sql: ${TABLE}."NACIONALIDADE" ;;
  }

  dimension: natureza_ocupacao {
    type: string
    sql: ${TABLE}."NATUREZA_OCUPACAO" ;;
  }

  dimension: nivel_curso {
    type: string
    sql: ${TABLE}."NIVEL_CURSO" ;;
  }

  dimension: nm_modalidade_produto {
    type: string
    sql: ${TABLE}."NM_MODALIDADE_PRODUTO" ;;
  }

  dimension: nm_originador {
    type: string
    sql: ${TABLE}."NM_ORIGINADOR" ;;
  }

  dimension: nm_produto {
    type: string
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: num_da_renovacao {
    type: number
    sql: ${TABLE}."NUM_DA_RENOVACAO" ;;
  }

  dimension: numero_dependentes {
    type: number
    sql: ${TABLE}."NUMERO_DEPENDENTES" ;;
  }

  dimension: periodo_curso {
    type: string
    sql: ${TABLE}."PERIODO_CURSO" ;;
  }

  dimension_group: previsao_formatura {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."PREVISAO_FORMATURA" ;;
  }

  dimension: profissao {
    type: string
    sql: ${TABLE}."PROFISSAO" ;;
  }

  dimension: qtd_campus_procurados {
    type: number
    sql: ${TABLE}."QTD_CAMPUS_PROCURADOS" ;;
  }

  dimension: qtd_contratos_cedidos {
    type: number
    sql: ${TABLE}."QTD_CONTRATOS_CEDIDOS" ;;
  }

  dimension: qtd_cursos_procurados {
    type: number
    sql: ${TABLE}."QTD_CURSOS_PROCURADOS" ;;
  }

  dimension: qtd_garantidores_diferentes {
    type: number
    sql: ${TABLE}."QTD_GARANTIDORES_DIFERENTES" ;;
  }

  dimension: qtd_mensalidade_total {
    type: number
    sql: ${TABLE}."QTD_MENSALIDADE_TOTAL" ;;
  }

  dimension: qtd_parcelas_semestre {
    type: number
    sql: ${TABLE}."QTD_PARCELAS_SEMESTRE" ;;
  }

  dimension: qtd_propostas_enviadas {
    type: number
    sql: ${TABLE}."QTD_PROPOSTAS_ENVIADAS" ;;
  }

  dimension: qtd_semestre_curso {
    type: number
    sql: ${TABLE}."QTD_SEMESTRE_CURSO" ;;
  }

  dimension: regional_atual {
    type: string
    sql: ${TABLE}."REGIONAL_ATUAL" ;;
  }

  dimension: renda_fam_mensal {
    type: number
    sql: ${TABLE}."RENDA_FAM_MENSAL" ;;
  }

  dimension: renda_mensal {
    type: number
    sql: ${TABLE}."RENDA_MENSAL" ;;
  }

  dimension: representante_atual {
    type: string
    sql: ${TABLE}."REPRESENTANTE_ATUAL" ;;
  }

  dimension: safra_cessao_semestre {
    type: string
    sql: ${TABLE}."SAFRA_CESSAO_SEMESTRE" ;;
  }

  dimension: tempo_empresa {
    type: string
    sql: ${TABLE}."TEMPO_EMPRESA" ;;
  }

  dimension: tipo_atual {
    type: string
    sql: ${TABLE}."TIPO_ATUAL" ;;
  }

  dimension: tipo_produto {
    type: string
    sql: ${TABLE}."TIPO_PRODUTO" ;;
  }

  dimension: tipo_renovacao {
    type: string
    sql: ${TABLE}."TIPO_RENOVACAO" ;;
  }

  dimension: tipo_residencia {
    type: string
    sql: ${TABLE}."TIPO_RESIDENCIA" ;;
  }

  dimension: uf {
    type: string
    sql: ${TABLE}."UF" ;;
  }

  dimension: uf_campus {
    type: string
    sql: ${TABLE}."UF_CAMPUS" ;;
  }

  dimension: uf_instituicao {
    type: string
    sql: ${TABLE}."UF_INSTITUICAO" ;;
  }

  dimension: vl_boleto {
    type: number
    sql: ${TABLE}."VL_BOLETO" ;;
  }

  dimension: vl_mensalidade_atual {
    type: number
    sql: ${TABLE}."VL_MENSALIDADE_ATUAL" ;;
  }

  dimension: vl_presente {
    type: number
    sql: ${TABLE}."VL_PRESENTE" ;;
  }

  dimension: vl_score {
    type: number
    sql: ${TABLE}."VL_SCORE" ;;
  }

  dimension: vl_total_financiado {
    type: number
    sql: ${TABLE}."VL_TOTAL_FINANCIADO" ;;
  }

  dimension: vl_total_financiamento_aluno {
    type: number
    sql: ${TABLE}."VL_TOTAL_FINANCIAMENTO_ALUNO" ;;
  }

  measure: count {
    type: count
    drill_fields: [aluno_idade]
  }
}
