view: itau {
  derived_table: {
    sql: select
      cpfa.nome NOME_ALUNO,
      cpfa.cpf CPF_ALUNO,
      cpfa.CEP CEP_ALUNO,
      bprop."endereco" ENDERECO_ALUNO,
      bprop."endereco_numero" ENDERECO_NUMERO_ALUNO,
      bprop."endereco_complemento" ENDERECO_COMPLEMENTO_ALUNO,
      cpfa.UF UF_ALUNO,
      cpfa.cidade CIDADE_ALUNO,
      cpfa.bairro BAIRRO_ALUNO,
      cpfa.profissao OCUPACAO_ALUNO,
      cpfa.renda_mensal RENDA_ALUNO,
      cpfa.renda_fam_mensal RENDA_FAMILIAR_ALUNO,
      CPFA.DATA_NASCIMENTO DATA_NASCIENTO_ALUNO,
      CPFA.ESCOLARIDADE ESCOLARIDADE_ALUNO,
      CPFA.GENERO GENERO_ALUNO,
      bprop."email" EMAIL_ALUNO,
      CPFA.ESTADO_CIVIL ESTADO_CIVIL_ALUNO,
      CPFA.NACIONALIDADE NACIONALIDADE_ALUNO,
      INST.NOME_FANTASIA FACULDADE,
      INST.CIDADE_CONTRATO CIDADE_FACULDADE,
      TCUR.DS_TIT_CURSO NIVEL_CURSO,
      cur.desc_prog DS_cURSO,
      PROP.SEMESTRE_CURSANDO,
      PROP.VL_MENSALIDADE,
      PROD.NM_PRODUTO_COMERCIAL PLANO_CONTRATADO,
      PROP.TIPO_PROPOSTA,
      DATA_PREENCHIMENTO DATA_CONTRATACAO,
      cpff.nome NOME_FIADOR,
      CPFF.CPF CPF_FIADOR,
      BPROP."fia_endereco" endereco_fiador,
      bprop."fia_endereco_numero" ENDERECO_NUMERO_FIADOR,
      bprop."fia_endereco_complemento" ENDERECO_COMPLEMENTO_FIADOR,
      cpfF.UF UF_FIADOR,
      cpfF.cidade CIDADE_FIADOR,
      cpfF.bairro BAIRRO_FIADOR,
      CPFF.RENDA_mensal RENDA_FIADOR,
      CPFF.DATA_NASCIMENTO DATA_NASCIMENTO_FIADOR,
      PAR.DS_PARENTESCO PARENTESCO,
      CPFF.GENERO GENERO_FIADOR,
      BPROP."fia_email" EMAIL_FIADOR,
      CPFF.ESTADO_CIVIL ESTADO_CIVIL_FIADOR,
      cpfF.profissao OCUPACAO_FIADOR,
      CPFF.NACIONALIDADE NACIONALIDADE_FIADOR,
      duc.ds_url as URL,
      duc.canal,
      jor.ETAPA,
      jor.dt_status



      from "VETERANO"."FATO"."FATO_PROPOSTA" prop
      inner join "VETERANO"."DIMENSAO"."DIM_CPF" cpfa
      on prop.id_cpf = cpfa.id_cpf
      left join "VETERANO"."DIMENSAO"."DIM_CPF" cpff
      on cpff.id_cpf = prop.id_fia_cpf
      inner join "VETERANO"."FATO"."FATO_ALUNO_CONTRATO" ctt
      on ctt.id_contrato = prop.id_proposta
      and ctt.ativo = 1
      and CONTRATO_CONCEDIDO = 1
      LEFT join "VETERANO"."DIMENSAO"."DIM_INSTITUICAO"inst
      on inst.id_instituicao = prop.id_instituicao
      LEFT join "VETERANO"."DIMENSAO"."DIM_CURSO" cur
      on cur.id_curso = prop.id_curso
      LEFT JOIN "VETERANO"."DIMENSAO"."DIM_TIT_CURSO" TCUR
      ON TCUR.ID_TIT_CURSO = CUR.ID_TIT_CURSO
      inner join "VETERANO"."DIMENSAO"."DIM_PRODUTO" prod
      on prod.id_produto = prop.id_produto
      left join "BICHO"."BO"."PRV_PROPOSTA" bprop
      on bprop."id"::varchar = substring(prop.id_proposta,5)
      LEFT JOIN "VETERANO"."DIMENSAO"."DIM_PARENTESCO" PAR
      ON PAR.ID_PARENTESCO = PROP.ID_FIA_PARENTESCO
      inner join graduado.self_service_bi.jornada jor
      on jor.id_proposta= prop.id_proposta
      and status_etapa = 1
      left join VETERANO.DIMENSAO.DIM_URL_CANAL duc on duc.id_url = prop.id_url_origem
      where duc.ds_url ilike '%itau%' ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: nome_aluno {
    type: string
    sql: ${TABLE}."NOME_ALUNO" ;;
    label: "Nome do Aluno"
  }

  dimension: cpf_aluno {
    type: number
    sql: ${TABLE}."CPF_ALUNO" ;;
    label: "CPF do Aluno"
  }

  dimension: cep_aluno {
    type: string
    sql: ${TABLE}."CEP_ALUNO" ;;
    label: "CEP do Aluno"
  }

  dimension: endereco_aluno {
    type: string
    sql: ${TABLE}."ENDERECO_ALUNO" ;;
    label: "Endereço do Aluno"
  }

  dimension: endereco_numero_aluno {
    type: string
    sql: ${TABLE}."ENDERECO_NUMERO_ALUNO" ;;
    label: "Numero do Endereço do Aluno"
  }

  dimension: endereco_complemento_aluno {
    type: string
    sql: ${TABLE}."ENDERECO_COMPLEMENTO_ALUNO" ;;
    label: "Complemento do ENdereço do Aluno"
  }

  dimension: uf_aluno {
    type: string
    sql: ${TABLE}."UF_ALUNO" ;;
    label: "UF do Aluno"
  }

  dimension: cidade_aluno {
    type: string
    sql: ${TABLE}."CIDADE_ALUNO" ;;
    label: "Cidade do Aluno"
  }

  dimension: bairro_aluno {
    type: string
    sql: ${TABLE}."BAIRRO_ALUNO" ;;
    label: "Bairro do Aluno"
  }

  dimension: ocupacao_aluno {
    type: string
    sql: ${TABLE}."OCUPACAO_ALUNO" ;;
    label: "Ocupação do Aluno"
  }

  dimension: renda_aluno {
    type: string
    sql: ${TABLE}."RENDA_ALUNO" ;;
    label: "Renda do Aluno"
  }

  dimension: renda_familiar_aluno {
    type: string
    sql: ${TABLE}."RENDA_FAMILIAR_ALUNO" ;;
    label: "Renda Familiar do Aluno"
  }

  dimension: data_nasciento_aluno {
    type: date
    sql: ${TABLE}."DATA_NASCIENTO_ALUNO" ;;
    label: "Data de Nascimento do Aluno"
  }

  dimension: escolaridade_aluno {
    type: string
    sql: ${TABLE}."ESCOLARIDADE_ALUNO" ;;
    label: "Escolaridade do Aluno"
  }

  dimension: genero_aluno {
    type: string
    sql: ${TABLE}."GENERO_ALUNO" ;;
    label: "Genero do Aluno"
  }

  dimension: email_aluno {
    type: string
    sql: ${TABLE}."EMAIL_ALUNO" ;;
    label: "E-mail do Aluno"
  }

  dimension: estado_civil_aluno {
    type: string
    sql: ${TABLE}."ESTADO_CIVIL_ALUNO" ;;
    label: "Estado Civil do Aluno"
  }

  dimension: nacionalidade_aluno {
    type: string
    sql: ${TABLE}."NACIONALIDADE_ALUNO" ;;
    label: "Nacionalidade do ALuno"
  }

  dimension: faculdade {
    type: string
    sql: ${TABLE}."FACULDADE" ;;
    label: "Faculdade"
  }

  dimension: cidade_faculdade {
    type: string
    sql: ${TABLE}."CIDADE_FACULDADE" ;;
    label: "Cidade da Faculdade"
  }

  dimension: nivel_curso {
    type: string
    sql: ${TABLE}."NIVEL_CURSO" ;;
    label: "Nivel do Curso"
  }

  dimension: ds_curso {
    type: string
    sql: ${TABLE}."DS_CURSO" ;;
    label: "Descrição do Curso"
  }

  dimension: semestre_cursando {
    type: number
    sql: ${TABLE}."SEMESTRE_CURSANDO" ;;
    label: "Semeste Cursando"
  }

  dimension: vl_mensalidade {
    type: number
    sql: ${TABLE}."VL_MENSALIDADE" ;;
    label: "Valor da Mensalidade"
  }

  dimension: plano_contratado {
    type: string
    sql: ${TABLE}."PLANO_CONTRATADO" ;;
    label: "Plano Contratado"
  }

  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
    label: "Tipo de Proposta"
  }

  dimension_group: data_contratacao {
    type: time
    sql: ${TABLE}."DATA_CONTRATACAO" ;;
    label: "Data de preenchimento da proposta"
  }

  dimension: nome_fiador {
    type: string
    sql: ${TABLE}."NOME_FIADOR" ;;
    label: "Nome do Fiador"
  }

  dimension: cpf_fiador {
    type: number
    sql: ${TABLE}."CPF_FIADOR" ;;
    label: "CPF do Fiador"
  }

  dimension: endereco_fiador {
    type: string
    sql: ${TABLE}."ENDERECO_FIADOR" ;;
    label: "Endereço do Fiador"
  }

  dimension: endereco_numero_fiador {
    type: string
    sql: ${TABLE}."ENDERECO_NUMERO_FIADOR" ;;
    label: "Numero do Endereço do Fiador"
  }

  dimension: endereco_complemento_fiador {
    type: string
    sql: ${TABLE}."ENDERECO_COMPLEMENTO_FIADOR" ;;
    label: "Complemente do Endereço do Fiador"
  }

  dimension: uf_fiador {
    type: string
    sql: ${TABLE}."UF_FIADOR" ;;
    label: "Estado do Fiador"
  }

  dimension: cidade_fiador {
    type: string
    sql: ${TABLE}."CIDADE_FIADOR" ;;
    label: "Cidade do Fiador"
  }

  dimension: bairro_fiador {
    type: string
    sql: ${TABLE}."BAIRRO_FIADOR" ;;
    label: "Bairro do Fiador"
  }

  dimension: renda_fiador {
    type: string
    sql: ${TABLE}."RENDA_FIADOR" ;;
    label: "Renda do Fiador"
  }

  dimension: data_nascimento_fiador {
    type: date
    sql: ${TABLE}."DATA_NASCIMENTO_FIADOR" ;;
    label: "Data de Nascimento do Fiador"
  }

  dimension: parentesco {
    type: string
    sql: ${TABLE}."PARENTESCO" ;;
    label: "Parentesco"
  }

  dimension: genero_fiador {
    type: string
    sql: ${TABLE}."GENERO_FIADOR" ;;
    label: "Genero do Fiador"
  }

  dimension: email_fiador {
    type: string
    sql: ${TABLE}."EMAIL_FIADOR" ;;
    label: "E-mail do Fiador"
  }

  dimension: estado_civil_fiador {
    type: string
    sql: ${TABLE}."ESTADO_CIVIL_FIADOR" ;;
    label: "Estado Civil do Fiador"
  }

  dimension: ocupacao_fiador {
    type: string
    sql: ${TABLE}."OCUPACAO_FIADOR" ;;
    label: "Ocupação do FIador"
  }

  dimension: nacionalidade_fiador {
    type: string
    sql: ${TABLE}."NACIONALIDADE_FIADOR" ;;
    label: "Nacionalidade do Fiador"
  }

  dimension: url {
    type: string
    sql: ${TABLE}."URL" ;;
    label: "URL de Descoberta"
  }

  dimension: canal {
    type: string
    sql: ${TABLE}."CANAL" ;;
    label: "Canal de Descoberta"
  }

  dimension: etapa {
    type: string
    sql: ${TABLE}."ETAPA" ;;
    label: "Etapa da Proposta"
  }

  dimension: dt_status {
    type: string
    sql: ${TABLE}."DT_STATUS" ;;
    label: "Data que a proposta passou pela etapa"
  }


  set: detail {
    fields: [
      nome_aluno,
      cpf_aluno,
      cep_aluno,
      endereco_aluno,
      endereco_numero_aluno,
      endereco_complemento_aluno,
      uf_aluno,
      cidade_aluno,
      bairro_aluno,
      ocupacao_aluno,
      renda_aluno,
      renda_familiar_aluno,
      data_nasciento_aluno,
      escolaridade_aluno,
      genero_aluno,
      email_aluno,
      estado_civil_aluno,
      nacionalidade_aluno,
      faculdade,
      cidade_faculdade,
      nivel_curso,
      ds_curso,
      semestre_cursando,
      vl_mensalidade,
      plano_contratado,
      tipo_proposta,
      data_contratacao_time,
      nome_fiador,
      cpf_fiador,
      endereco_fiador,
      endereco_numero_fiador,
      endereco_complemento_fiador,
      uf_fiador,
      cidade_fiador,
      bairro_fiador,
      renda_fiador,
      data_nascimento_fiador,
      parentesco,
      genero_fiador,
      email_fiador,
      estado_civil_fiador,
      ocupacao_fiador,
      nacionalidade_fiador,
      url,
      canal,
      etapa,
      dt_status
    ]
  }
}
