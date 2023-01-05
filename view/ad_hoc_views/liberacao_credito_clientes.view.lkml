view: liberacao_credito_clientes {
  sql_table_name: "POS_GRADUADO"."FINANCEIRO"."LIBERACAO_CREDITO_CLIENTES"
    ;;
  drill_fields: [id]

  ## DIMENSÕES ##

  dimension: id {
    primary_key: yes
    type: string
    label: "ID"
    group_label: ""
    description: "Identificado único do aluno"
    sql: ${TABLE}."ID" ;;
  }

  dimension: nome {
    type: string
    label: "Nome do aluno"
    group_label: ""
    description: "Nome do aluno"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: cpf {
    type: number
    label: "CPF"
    group_label: ""
    description: "numero do cadastro de pessoa física do aluno"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: rg {
    type: number
    label: "RG"
    group_label: ""
    description: "numero do registro geral do aluno"
    sql: ${TABLE}."RG" ;;
  }

  dimension: cep {
    type: number
    label: "CEP"
    group_label: ""
    description: "cep do endereço do aluno"
    sql: ${TABLE}."CEP" ;;
  }

  dimension: endereco {
    type: string
    label: "Endereço"
    group_label: ""
    description: "Rua do endereço do aluno"
    sql: ${TABLE}."ENDERECO" ;;
  }

  dimension: cidade {
    type: string
    label: "Cidade"
    group_label: ""
    description: "Cidade do endereço do aluno"
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: uf {
    type: string
    label: "Estado"
    group_label: ""
    description: "Estado do endereço do aluno"
    sql: ${TABLE}."UF" ;;
  }

  dimension: bairro {
    type: string
    label: "Bairro"
    group_label: ""
    description: "Bairro do endereço do aluno"
    sql: ${TABLE}."BAIRRO" ;;
  }

  dimension: origem_rg {
    type: string
    label: "Origem RG"
    group_label: ""
    description: "Origem do RG do aluno"
    sql: ${TABLE}."ORIGEM_RG" ;;
  }

  dimension: numero {
    type: number
    label: "Número Endereço"
    group_label: ""
    description: "Número do endereço do aluno"
    sql: ${TABLE}."NUMERO" ;;
  }

  ## DATA ##

  dimension_group: data_criacao {
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
    label: "Data Criação"
    description: "Data e hora da criação do registro"
    sql: ${TABLE}."DATA_CRIACAO" ;;
  }

  dimension_group: data_atualizacao {
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
    label: "Data Atualização"
    description: "Data e hora da ultima atualização do registro"
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension_group: data_exclusao {
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
    label: "Data Exclusão"
    description: "Data e hora que o registro foi excluído, apenas preenchido caso o registro tenha sido excluído"
    sql: ${TABLE}."DATA_EXCLUSAO" ;;
  }

  dimension_group: data_rg {
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
    label: "Data RG"
    description: "Data que RG do aluno foi criado"
    sql: ${TABLE}."DATA_RG" ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [id]
  }
}
