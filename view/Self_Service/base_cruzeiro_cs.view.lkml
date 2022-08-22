# The name of this view in Looker is "Base Cruzeiro Cs"
view: base_cruzeiro_cs {

  sql_table_name: "GRADUADO"."AD_HOC"."BASE_CRUZEIRO_CS"
    ;;

  dimension: agrupador {
    type: string
    description: "Indica o Semestre Agrupado do Aluno"
    sql: ${TABLE}."AGRUPADOR" ;;
  }

  dimension: ano_leti {
    type: string
    description: "Indica o Ano Letivo do Aluno"
    sql: ${TABLE}."ANO_LETI" ;;
  }

  dimension: arquivo_origem {
    type: string
    description: "Nome do Arquivo origem da tabela - sharepoint"
    sql: ${TABLE}."ARQUIVO_ORIGEM" ;;
  }

  dimension: atraso {
    type: number
    description: "Indica o Atraso do Aluno"
    sql: ${TABLE}."ATRASO" ;;
  }

  dimension: celular {
    type: string
    description: "Indica o Celular do Aluno"
    sql: ${TABLE}."CELULAR" ;;
  }

  dimension: cep {
    type: string
    description: "Indica o Cep do Aluno"
    sql: ${TABLE}."CEP" ;;
  }

  dimension: cidade {
    type: string
    description: "Indica o Cidade do Aluno"
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: classificacao {
    type: string
    description: "Indica e classifica o status de adimplência e do tipo de proposta se é calouro ou veterano pelas nomenclaturas 'VIS', 'VII', 'CIS' e 'CII'"
    sql: ${TABLE}."CLASSIFICACAO" ;;
  }

  dimension: cod_curso {
    type: string
    description: "Indica o Codigo do Curso do Aluno"
    sql: ${TABLE}."COD_CURSO" ;;
  }

  dimension: cpf {
    type: string
    description: "Indica o CPF do Aluno"
    sql: ${TABLE}."CPF" ;;
  }

  dimension_group: data_cadastro {
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
    description: "Indica o Data de Cadastro do Aluno"
    sql: ${TABLE}."DATA_CADASTRO" ;;
  }

  dimension: desc_curs {
    type: string
    description: "Descrição do Curso do Aluno"
    sql: ${TABLE}."DESC_CURS" ;;
  }

  dimension: e_mail {
    type: string
    description: "Indica o E-Mail do Aluno"
    sql: ${TABLE}."E_MAIL" ;;
  }

  dimension: estado {
    type: string
    description: "Indica o Estado do Aluno"
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: fone_com {
    type: string
    description: "Indica o Telefone Comercial do Aluno"
    sql: ${TABLE}."FONE_COM" ;;
  }

  dimension: fone_res {
    type: string
    description: "Indica o Telefone Residencial do Aluno"
    sql: ${TABLE}."FONE_RES" ;;
  }

  dimension: id_cpf {
    type: number
    description: "Indica o ID CPF do aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_polo {
    type: string
    description: "Indica o Id do Polo do da IES"
    sql: ${TABLE}."ID_POLO" ;;
  }

  dimension: nome {
    type: string
    description: "Indica o Nome do Aluno"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: nome_campus {
    type: string
    description: "Indica o Nome do Campus do Aluno"
    sql: ${TABLE}."NOME_CAMPUS" ;;
  }

  dimension: nome_polo {
    type: string
    description: "Indica o Nome do Polo da IES"
    sql: ${TABLE}."NOME_POLO" ;;
  }

  dimension: prioridade {
    type: string
    description: "Indica o Prioridade do Aluno"
    sql: ${TABLE}."PRIORIDADE" ;;
  }

  dimension: sem_leti {
    type: string
    description: "Indica o Semesetre Letivo do Aluno"
    sql: ${TABLE}."SEM_LETI" ;;
  }

  dimension: serie {
    type: number
    description: "Indica o Serie do Aluno"
    sql: ${TABLE}."SERIE" ;;
  }

  dimension: sit_financ {
    type: string
    description: "Indica o Situção Financeira do Aluno"
    sql: ${TABLE}."SIT_FINANC" ;;
  }

  dimension: sit_matric {
    type: string
    description: "Indica o Situação de Matrícula do Aluno"
    sql: ${TABLE}."SIT_MATRIC" ;;
  }

  dimension: situacao {
    type: string
    description: "Indica o Situacao do Aluno"
    sql: ${TABLE}."SITUACAO" ;;
  }

  dimension: tipo_campanha {
    type: string
    description: "Indica o Tipo de Campanha do Aluno"
    sql: ${TABLE}."TIPO_CAMPANHA" ;;
  }

  dimension: tipo_ensino {
    type: string
    description: "Indica o Tipo de Ensino do Aluno"
    sql: ${TABLE}."TIPO_ENSINO" ;;
  }

  dimension: titulos_vencidos {
    type: number
    description: "Indica a quantidade de boletos não pagos pelo Aluno"
    sql: ${TABLE}."TITULOS_VENCIDOS" ;;
  }

  dimension: url_atendimento {
    type: string
    description: "Indica o Url de Atendimento do Aluno"
    sql: ${TABLE}."URL_ATENDIMENTO" ;;
  }

  measure: valor_divida {
    type: sum
    description: "Indica o Valor da Divida do Aluno"
    sql: ${TABLE}."VALOR_DIVIDA" ;;
  }

}
