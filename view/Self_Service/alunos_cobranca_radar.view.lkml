view: alunos_cobranca_radar {
  derived_table: {
    sql: select *  from stage.public.radar_cobranca
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cpf {
    type: number
    group_label: "Dados do Aluno"
    label: "CPF"
    primary_key: yes
    sql: ${TABLE}."cpf" ;;
  }

  dimension: contrato {
    type: string
    label: "Contrato"
    sql: ${TABLE}."CONTRATO" ;;
  }

  measure: qtd_contrato {
    type: sum
    label: "Quantidade de Contrato"
    sql: ${TABLE}."QTD_CONTRATO" ;;
  }

  dimension: sexo {
    type: string
    group_label: "Dados do Aluno"
    label: "Sexo"
    hidden: yes
    sql: ${TABLE}."SEXO" ;;
  }

  dimension: fpd {
    type: number
    label: "FPD"
    sql: ${TABLE}."FPD" ;;
  }

  dimension: lpd {
    type: number
    label: "LPD"
    sql: ${TABLE}."LPD" ;;
  }

  measure: vlr_em_atraso {
    type: sum
    label: "Valor em atraso"
    sql: ${TABLE}."VLR_EM_ATRASO" ;;
  }

  measure: vlr_total {
    type: sum
    label: "Valor Total"
    sql: ${TABLE}."VLR_TOTAL" ;;
  }

  measure: atraso {
    type: sum
    label: "Atraso"
    sql: ${TABLE}."ATRASO" ;;
  }

  dimension: flag_inibidos {
    type: string
    label: "Flag Inibidos"
    sql: ${TABLE}."FLAG_INIBIDOS" ;;
  }

  dimension: flag_promessa {
    type: string
    label: "Flag Promessa"
    sql: ${TABLE}."FLAG_PROMESSA" ;;
  }

  dimension: escritorio {
    type: string
    label: "Escritorio"
    sql: ${TABLE}."ESCRITORIO" ;;
  }

  dimension: fundo {
    type: number
    label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: behavior {
    type: string
    label: "Bahavior"
    sql: ${TABLE}."BEHAVIOR" ;;
  }

  dimension: cidade {
    type: string
    group_label: "Dados do Aluno"
    label: "Cidade"
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: estado {
    type: string
    group_label: "Dados do Aluno"
    label: "Estado"
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: regiao {
    type: string
    group_label: "Dados do Aluno"
    label: "Região"
    sql: ${TABLE}."REGIAO" ;;
  }

  dimension: faixa_atraso {
    type: string
    label: "Faixa de Atraso"
    sql: ${TABLE}."FAIXA_ATRASO" ;;
  }

  dimension: faixa_ano {
    type: string
    label: "Faixa Ano"
    sql: ${TABLE}."FAIXA_ANO" ;;
  }

  dimension: faixa_idade {
    type: string
    label: "Faixa Idade"
    sql: ${TABLE}."FAIXA_IDADE" ;;
  }

  dimension: faixa_idade_geracao {
    type: string
    label: "Faixa Idade Geração"
    sql: ${TABLE}."FAIXA_IDADE_GERACAO" ;;
  }

  dimension: faixa_valor {
    type: string
    label: "Faixa Valor"
    sql: ${TABLE}."FAIXA_VALOR" ;;
  }

  dimension: faixa_valor_enquadramento {
    type: string
    label: "Faixa Valor Enquadramento"
    sql: ${TABLE}."FAIXA_VALOR_ENQUADRAMENTO" ;;
  }

  dimension: aluno_classe_renda {
    type: string
    group_label: "Dados do Aluno"
    label: "Aluno Classe Renda"
    sql: ${TABLE}."ALUNO_CLASSE_RENDA" ;;
  }

  dimension: garantidor_classe_renda {
    type: string
    group_label: "Dados do Garantidor"
    label: "Garantidor Classe Renda"
    sql: ${TABLE}."GARANTIDOR_CLASSE_RENDA" ;;
  }

  dimension: aluno_possui_endereco {
    type: number
    group_label: "Dados do Aluno"
    label: "Possui endereço?"
    sql: ${TABLE}."ALUNO_POSSUI_ENDERECO" ;;
  }

  dimension: aluno_possui_email {
    type: number
    group_label: "Dados do Aluno"
    label: "Aluno possui e-mail?"
    sql: ${TABLE}."ALUNO_POSSUI_EMAIL" ;;
  }

  dimension: aluno_possui_telefone_fixo {
    type: number
    group_label: "Dados do Aluno"
    label: "Aluno possui telefone fixo?"
    sql: ${TABLE}."ALUNO_POSSUI_TELEFONE_FIXO" ;;
  }

  dimension: aluno_possui_telefone_celular {
    type: number
    group_label: "Dados do Aluno"
    label: "Aluno possui celular?"
    sql: ${TABLE}."ALUNO_POSSUI_TELEFONE_CELULAR" ;;
  }

  dimension: aluno_possui_telefone_comercial {
    type: number
    group_label: "Dados do Aluno"
    label: "Aluno possui telefone comercial?"
    sql: ${TABLE}."ALUNO_POSSUI_TELEFONE_COMERCIAL" ;;
  }

  dimension: garantidor_possui_endereco {
    type: number
    group_label: "Dados do Garantidor"
    label: "Garantidor possui endereço?"
    sql: ${TABLE}."GARANTIDOR_POSSUI_ENDERECO" ;;
  }

  dimension: garantidor_possui_email {
    type: number
    group_label: "Dados do Garantidor"
    label: "Garantidor possui e-mail"
    sql: ${TABLE}."GARANTIDOR_POSSUI_EMAIL" ;;
  }

  dimension: garantidor_possui_telefone_fixo {
    type: number
    group_label: "Dados do Garantidor"
    label: "Garantidor possui telefone fixo?"
    sql: ${TABLE}."GARANTIDOR_POSSUI_TELEFONE_FIXO" ;;
  }

  dimension: garantidor_possui_telefone_celular {
    type: number
    group_label: "Dados do Garantidor"
    label: "Garantidor possui celular?"
    sql: ${TABLE}."GARANTIDOR_POSSUI_TELEFONE_CELULAR" ;;
  }

  dimension: garantidor_possui_telefone_comercial {
    type: number
    group_label: "Dados do Garantidor"
    label: "Garantidor possui telefone comercial?"
    sql: ${TABLE}."GARANTIDOR_POSSUI_TELEFONE_COMERCIAL" ;;
  }

  set: detail {
    fields: [
      cpf,
      contrato,
      qtd_contrato,
      sexo,
      fpd,
      lpd,
      vlr_em_atraso,
      vlr_total,
      atraso,
      flag_inibidos,
      flag_promessa,
      escritorio,
      fundo,
      behavior,
      cidade,
      estado,
      regiao,
      faixa_atraso,
      faixa_ano,
      faixa_idade,
      faixa_idade_geracao,
      faixa_valor,
      faixa_valor_enquadramento,
      aluno_classe_renda,
      garantidor_classe_renda,
      aluno_possui_endereco,
      aluno_possui_email,
      aluno_possui_telefone_fixo,
      aluno_possui_telefone_celular,
      aluno_possui_telefone_comercial,
      garantidor_possui_endereco,
      garantidor_possui_email,
      garantidor_possui_telefone_fixo,
      garantidor_possui_telefone_celular,
      garantidor_possui_telefone_comercial
    ]
  }
}
