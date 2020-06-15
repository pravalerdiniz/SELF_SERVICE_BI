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
    label: "Agência - IE"
    group_label: "Dados Bancários da IE"
    sql: ${TABLE}."AGENCIA" ;;
  }

  dimension: ano_nota_enade {
    type: number
    group_label: "ENADE"
    label: "Ano de Referência - Nota ENADE"
    sql: ${TABLE}."ANO_NOTA_ENADE" ;;
  }

  dimension: bairro_sede_ie {
    type: string
    group_label: "Dados IE"
    label: "Sede - Bairro"
    sql: ${TABLE}."BAIRRO_SEDE_IE" ;;
  }

  dimension: banco {
    type: string
    label: "Nome do Banco"
    group_label: "Dados Bancários da IE"
    description: "Indica o Banco correspondente a IES"
    sql: ${TABLE}."BANCO" ;;
  }

  dimension: campus_ativo {
    type: yesno
    sql: ${TABLE}."CAMPUS_ATIVO" ;;
    group_label: "Dados de Campus - IE"
    label: "Flag - Campus Ativo?"
    description: "Indica se o campo está ativo."
  }

  dimension: campus_capacidade_alunos {
    type: number
    group_label: "Dados de Campus - IE"
    label: "Qtd de Alunos - Capacidade Campus"
    sql: ${TABLE}."CAMPUS_CAPACIDADE_ALUNOS" ;;
  }

  dimension: campus_possui_ead {
    type: yesno
    group_label: "Dados de Campus - IE"
    label: "Flag - Possui EAD?"
    description: "Indica se o Campus tem cursos de Ensino à Distância"
    sql: ${TABLE}."CAMPUS_POSSUI_EAD" ;;
  }

  dimension: campus_tem_estacionamento {
    type: yesno
    group_label: "Dados de Campus - IE"
    label: "Flag - Possui Estacionamento?"
    description: "Indica se o Campus tem estacionamento em suas depêndencias"
    sql: ${TABLE}."CAMPUS_TEM_ESTACIONAMENTO" ;;
  }

  dimension: campus_tem_estacionamento_gratuito {
    type: yesno
    group_label: "Dados de Campus - IE"
    label: "Flag - Possui Estacionamento GRATUITO?"
    description: "Indica se o Campus tem estacionamento GRATUITO em suas depêndencias"
    sql: ${TABLE}."CAMPUS_TEM_ESTACIONAMENTO_GRATUITO" ;;
  }

  dimension: cargo {
    type: string
    group_label: "Dados do Gerente Regional - IE"
    label: "Cargo"
    description: "Nome do cargo do representante Comercial na IES"
    sql: ${TABLE}."CARGO" ;;
  }

  dimension: carteira_regional {
    type: string
    group_label: "Dados da Regional - IE"
    label: "Carteira Regional"
    sql: ${TABLE}."CARTEIRA_REGIONAL" ;;
  }

  dimension: cep_campus {
    type: string
    group_label: "Dados de Campus - IE"
    label: "Endereço - CEP"
    description: "Informação relacionado ao endereço. Indica o número do CEP do Campus"
    sql: ${TABLE}."CEP_CAMPUS" ;;
  }

  dimension: cep_sede_ie {
    type: string
    group_label: "Dados IE"
    label: "Sede - CEP"
    description: "Informação relacionada ao endereço. Indica o número do CEP da Sede"
    sql: ${TABLE}."CEP_SEDE_IE" ;;
  }

  dimension: cidade_campus {
    type: string
    group_label: "Dados de Campus - IE"
    label: "Endereço - CEP"
    description: "Informação relacionado ao endereço. Indica o número do CEP do Campus"
    sql: ${TABLE}."CIDADE_CAMPUS" ;;
  }

  dimension: cidade_sede_ie {
    type: string
    group_label: "Dados IE"
    label: "Sede - Cidade"
    description: "Indica a cidade que está localizada a Sede da IES"
    sql: ${TABLE}."CIDADE_SEDE_IE" ;;
  }

  dimension: classificacao_curso {
    type: string
    group_label: "Dados do Curso - IE"
    label: "Nivel Acadêmico do Curso"
    description: "Informação relacionada ao curso. Indica a classificação dp curso. Ex: Graduação, Pós-Graduação, Técnico "
    sql: ${TABLE}."CLASSIFICACAO_CURSO" ;;
  }

  dimension: cnpj_ie {
    type: number
    group_label: "Dados IE"
    label: "CNPJ"
    sql: ${TABLE}."CNPJ_IE" ;;
  }

  dimension: conta {
    type: string
    label: "Número da Conta"
    group_label: "Dados Bancários da IE"
    description: "Indica o número da conta correspondente a IES"
    sql: ${TABLE}."CONTA" ;;
  }

  dimension: contrato_ie {
    type: number
    label: "Número do Contrato"
    group_label: "Dados Contratuais da IE/Originador"
    description: "Indica o número do contrato da IES com Originador"
    sql: ${TABLE}."CONTRATO_IE" ;;
  }

  dimension: conversao_regional {
    type: string
    group_label: "Dados da Regional - IE"
    label: "Nome - Responsável pela Conversão Regional"
    sql: ${TABLE}."CONVERSAO_REGIONAL" ;;
  }

  dimension: cp {
    type: string
    group_label: "Dados da Regional - IE"
    label: "CP"
    sql: ${TABLE}."CP" ;;
  }

  dimension: curso_ativo {
    type: number
    group_label: "Dados do Curso - IE"
    label: "Flag -  Curso Ativo?"

    sql: ${TABLE}."CURSO_ATIVO" ;;
  }

  dimension: descricao_originadores_ativos {
    type: string
    label: "Descrição - Originadores Ativos"
    group_label: "Dados Contratuais da IES/Originador"
    sql: UNNEST ${TABLE}."DESCRICAO_ORIGINADORES_ATIVOS";;
  }

  dimension: descricao_originadores_inativos {
    type: string
    label: "Descrição - Originadores Inativos"
    group_label: "Dados Contratuais da IE/Originador"
    sql: UNNEST ${TABLE}."DESCRICAO_ORIGINADORES_INATIVOS";;
  }

  dimension: dia_vencimento {
    type: number
    label: "Dia de Vencimento"
    group_label: "Dados Contratuais da IE/Originador"
    sql: ${TABLE}."DIA_VENCIMENTO" ;;
  }

  dimension: ds_area_conhecimento {
    type: string
    label: "Área de Conhecimento do Curso"
    group_label: "Dados do Curso - IE"
    sql: ${TABLE}."DS_AREA_CONHECIMENTO" ;;
  }

  dimension: ds_campus {
    type: string
    group_label: "Dados de Campus - IE"
    label: "Nome do Campus"
    description: "Indica o nome do Campus da IES"
    sql: ${TABLE}."DS_CAMPUS" ;;
  }

  dimension: ds_mantenedor {
    type: string
    group_label: "Dados IE"
    label: "Nome da Mantenedora"
    description: "Indica o nome da Mantenedora da IE"
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
    group_label: "Dados IES"
    label: "Data de Cadastro"
    description: "Data de Cadastro da IE no Sistema"
    sql: ${TABLE}."DT_CADASTRO" ;;
  }

  dimension: duracao_curso_meses {
    type: number
    group_label: "Dados do Curso - IE"
    label: "Duração do Curso - Meses"
    sql: ${TABLE}."DURACAO_CURSO_MESES" ;;
  }

  dimension: endereco_campus {
    type: string
    group_label: "Dados de Campus - IE"
    label: "Endereço - Campus"
    description: "Indica o Endereço do Campus"
    sql: ${TABLE}."ENDERECO_CAMPUS" ;;
  }

  dimension: endereco_sede_ie {
    type: string
    group_label: "Dados IE"
    label: "Sede - Endereço"
    description: "Indica o Endereço da Sede da IE"
    sql: ${TABLE}."ENDERECO_SEDE_IE" ;;
  }

  dimension: enfase {
    type: string
    group_label: "Dados do Curso - IE"
    label: "Enfâse do Curso"
    sql: ${TABLE}."ENFASE" ;;
  }

  dimension: estado_sede_ie {
    type: string
    group_label: "Dados IE"
    label: "Sede - Estado"
    sql: ${TABLE}."ESTADO_SEDE_IE" ;;
  }

  dimension: flg_bolsa {
    type: yesno
    group_label: "Dados do Curso - IE"
    label: "Flag - Bolsa?"
    description: "Indica se o IE possui Bolsa para o curso"
    sql: ${TABLE}."FLG_BOLSA" ;;
  }

  dimension: flg_descadastrada {
    type: yesno
    group_label: "Dados do Curso - IE"
    label: "Flag - Descadastrada?"
    description: "Indica se o curso está descadastrada no PRAVALER"
    sql: ${TABLE}."FLG_DESCADASTRADA" ;;
  }

  dimension: flg_financia_matricula {
    type: yesno
    group_label: "Dados do Curso - IE"
    label: "Flag - Financia Matricula?"
    description: "Indica se o curso também financia a matricula"
    sql: ${TABLE}."FLG_FINANCIA_MATRICULA" ;;
  }

  dimension: flg_matriucla_expressa {
    type: yesno
    label: "Flag - Matricula Expressa?"
    description: "Indica se o curso possui Matricula Expressa"
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
