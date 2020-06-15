view: instituicao {
  sql_table_name: "SELF_SERVICE_BI"."INSTITUICAO"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  dimension: agencia {
    type: string
    sql: ${TABLE}."AGENCIA" ;;
  }

  dimension: ano_nota_enade {
    type: number
    sql: ${TABLE}."ANO_NOTA_ENADE" ;;
  }

  dimension: bairro_sede_ie {
    type: string
    sql: ${TABLE}."BAIRRO_SEDE_IE" ;;
  }

  dimension: banco {
    type: string
    sql: ${TABLE}."BANCO" ;;
  }

  dimension: campus_ativo {
    type: yesno
    sql: ${TABLE}."CAMPUS_ATIVO" ;;
  }

  dimension: campus_capacidade_alunos {
    type: number
    sql: ${TABLE}."CAMPUS_CAPACIDADE_ALUNOS" ;;
  }

  dimension: campus_possui_ead {
    type: yesno
    sql: ${TABLE}."CAMPUS_POSSUI_EAD" ;;
  }

  dimension: campus_tem_estacionamento {
    type: yesno
    sql: ${TABLE}."CAMPUS_TEM_ESTACIONAMENTO" ;;
  }

  dimension: campus_tem_estacionamento_gratuito {
    type: yesno
    sql: ${TABLE}."CAMPUS_TEM_ESTACIONAMENTO_GRATUITO" ;;
  }

  dimension: cargo {
    type: string
    sql: ${TABLE}."CARGO" ;;
  }

  dimension: carteira_regional {
    type: string
    sql: ${TABLE}."CARTEIRA_REGIONAL" ;;
  }

  dimension: cep_campus {
    type: string
    sql: ${TABLE}."CEP_CAMPUS" ;;
  }

  dimension: cep_sede_ie {
    type: string
    sql: ${TABLE}."CEP_SEDE_IE" ;;
  }

  dimension: cidade_campus {
    type: string
    sql: ${TABLE}."CIDADE_CAMPUS" ;;
  }

  dimension: cidade_sede_ie {
    type: string
    sql: ${TABLE}."CIDADE_SEDE_IE" ;;
  }

  dimension: classificacao_curso {
    type: string
    sql: ${TABLE}."CLASSIFICACAO_CURSO" ;;
  }

  dimension: cnpj_ie {
    type: number
    sql: ${TABLE}."CNPJ_IE" ;;
  }

  dimension: conta {
    type: string
    sql: ${TABLE}."CONTA" ;;
  }

  dimension: contrato_ie {
    type: number
    sql: ${TABLE}."CONTRATO_IE" ;;
  }

  dimension: conversao_regional {
    type: string
    sql: ${TABLE}."CONVERSAO_REGIONAL" ;;
  }

  dimension: cp {
    type: string
    sql: ${TABLE}."CP" ;;
  }

  dimension: curso_ativo {
    type: number
    sql: ${TABLE}."CURSO_ATIVO" ;;
  }

  dimension: descricao_originadores_ativos {
    type: string
    sql: ${TABLE}."DESCRICAO_ORIGINADORES_ATIVOS" ;;
  }

  dimension: descricao_originadores_inativos {
    type: string
    sql: ${TABLE}."DESCRICAO_ORIGINADORES_INATIVOS" ;;
  }

  dimension: dia_vencimento {
    type: number
    sql: ${TABLE}."DIA_VENCIMENTO" ;;
  }

  dimension: ds_area_conhecimento {
    type: string
    sql: ${TABLE}."DS_AREA_CONHECIMENTO" ;;
  }

  dimension: ds_campus {
    type: string
    sql: ${TABLE}."DS_CAMPUS" ;;
  }

  dimension: ds_mantenedor {
    type: string
    sql: ${TABLE}."DS_MANTENEDOR" ;;
  }

  dimension_group: dt_cadastro {
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
    sql: ${TABLE}."DT_CADASTRO" ;;
  }

  dimension: duracao_curso_meses {
    type: number
    sql: ${TABLE}."DURACAO_CURSO_MESES" ;;
  }

  dimension: endereco_campus {
    type: string
    sql: ${TABLE}."ENDERECO_CAMPUS" ;;
  }

  dimension: endereco_sede_ie {
    type: string
    sql: ${TABLE}."ENDERECO_SEDE_IE" ;;
  }

  dimension: enfase {
    type: string
    sql: ${TABLE}."ENFASE" ;;
  }

  dimension: estado_sede_ie {
    type: string
    sql: ${TABLE}."ESTADO_SEDE_IE" ;;
  }

  dimension: flg_bolsa {
    type: yesno
    sql: ${TABLE}."FLG_BOLSA" ;;
  }

  dimension: flg_descadastrada {
    type: yesno
    sql: ${TABLE}."FLG_DESCADASTRADA" ;;
  }

  dimension: flg_financia_matricula {
    type: yesno
    sql: ${TABLE}."FLG_FINANCIA_MATRICULA" ;;
  }

  dimension: flg_matriucla_expressa {
    type: yesno
    sql: ${TABLE}."FLG_MATRIUCLA_EXPRESSA" ;;
  }

  dimension: flg_matriz {
    type: yesno
    sql: ${TABLE}."FLG_MATRIZ" ;;
  }

  dimension: flg_possi_pdv {
    type: yesno
    sql: ${TABLE}."FLG_POSSI_PDV" ;;
  }

  dimension: flg_recebe_contrato {
    type: yesno
    sql: ${TABLE}."FLG_RECEBE_CONTRATO" ;;
  }

  dimension: flg_wo {
    type: yesno
    sql: ${TABLE}."FLG_WO" ;;
  }

  dimension: gerente_regional {
    type: string
    sql: ${TABLE}."GERENTE_REGIONAL" ;;
  }

  dimension: grupo {
    type: string
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: id_campus {
    type: number
    sql: ${TABLE}."ID_CAMPUS" ;;
  }

  dimension: id_curso {
    type: number
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_instituicao {
    type: number
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_originadores_ativos {
    type: string
    sql: ${TABLE}."ID_ORIGINADORES_ATIVOS" ;;
  }

  dimension: id_originadores_inativos {
    type: string
    sql: ${TABLE}."ID_ORIGINADORES_INATIVOS" ;;
  }

  dimension: ie_ativa {
    type: number
    sql: ${TABLE}."IE_ATIVA" ;;
  }

  dimension: ie_super_pravaler {
    type: number
    sql: ${TABLE}."IE_SUPER_PRAVALER" ;;
  }

  dimension: modelo_contrato {
    type: string
    sql: ${TABLE}."MODELO_CONTRATO" ;;
  }

  dimension: nm_produto {
    type: string
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: nome_curso {
    type: string
    sql: ${TABLE}."NOME_CURSO" ;;
  }

  dimension: nome_fantasia {
    type: string
    sql: ${TABLE}."NOME_FANTASIA" ;;
  }

  dimension: nota_enade {
    type: number
    sql: ${TABLE}."NOTA_ENADE" ;;
  }

  dimension: perc_comissao {
    type: number
    sql: ${TABLE}."PERC_COMISSAO" ;;
  }

  dimension: perc_desagio {
    type: number
    sql: ${TABLE}."PERC_DESAGIO" ;;
  }

  dimension: periodo {
    type: string
    sql: ${TABLE}."PERIODO" ;;
  }

  dimension: porc_matricula_expressa {
    type: number
    sql: ${TABLE}."PORC_MATRICULA_EXPRESSA" ;;
  }

  dimension: qtd_alunos_ie {
    type: number
    sql: ${TABLE}."QTD_ALUNOS_IE" ;;
  }

  dimension: qtd_mensalidades {
    type: number
    sql: ${TABLE}."QTD_MENSALIDADES" ;;
  }

  dimension: qtd_semestre {
    type: number
    sql: ${TABLE}."QTD_SEMESTRE" ;;
  }

  dimension: razao_social {
    type: string
    sql: ${TABLE}."RAZAO_SOCIAL" ;;
  }

  dimension: regional_regiao {
    type: string
    sql: ${TABLE}."REGIONAL_REGIAO" ;;
  }

  dimension: representante_regional {
    type: string
    sql: ${TABLE}."REPRESENTANTE_REGIONAL" ;;
  }

  dimension: reprova_por_score {
    type: string
    sql: ${TABLE}."REPROVA_POR_SCORE" ;;
  }

  dimension: tipo_dia_vencimento {
    type: string
    sql: ${TABLE}."TIPO_DIA_VENCIMENTO" ;;
  }

  dimension: tipo_regional {
    type: string
    sql: ${TABLE}."TIPO_REGIONAL" ;;
  }

  dimension: uf_campus {
    type: string
    sql: ${TABLE}."UF_CAMPUS" ;;
  }

  dimension: valor_mensalidade {
    type: number
    sql: ${TABLE}."VALOR_MENSALIDADE" ;;
  }

  dimension: vl_dias_wo {
    type: number
    sql: ${TABLE}."VL_DIAS_WO" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
