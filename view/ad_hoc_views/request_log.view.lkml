view: request_log {
  sql_table_name: "AD_HOC"."REQUEST_LOG";;
  drill_fields: [id]

## DIMENSIONS ##

  dimension: id {
    primary_key: yes
    type: number
    label: "ID"
    description: ""
    group_label: ""
    sql: ${TABLE}."ID" ;;
    hidden: yes
  }

  dimension: acp_valor {
    type: number
    label: "ACP Valor"
    description: ""
    group_label: ""
    sql: ${TABLE}."ACP_VALOR" ;;
    hidden: yes
  }

  dimension: alu_contrato {
    type: number
    label: "Contrato do Aluno"
    description: ""
    group_label: "Dados do Aluno"
    sql: ${TABLE}."ALU_CONTRATO" ;;
    value_format: "0"
  }

  dimension: bairro {
    type: string
    label: "Bairro"
    description: ""
    group_label: "Dados do Aluno"
    sql: ${TABLE}."BAIRRO" ;;
  }

  dimension: cep {
    type: number
    label: "CEP"
    description: ""
    group_label: "Dados do Aluno"
    sql: ${TABLE}."CEP" ;;
  }

  dimension: cidade {
    type: string
    label: "Cidade"
    description: ""
    group_label: "Dados do Aluno"
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: codigo_banco {
    type: number
    label: "Código Banco"
    description: ""
    group_label: "Dados Financeiros"
    sql: ${TABLE}."CODIGO_BANCO" ;;
  }

  dimension: codigo_empresa {
    type: number
    label: "Código Empresa"
    description: ""
    group_label: "Dados Financeiros"
    sql: ${TABLE}."CODIGO_EMPRESA" ;;
  }

  dimension: cpf {
    type: number
    value_format: "0"
    label: "CPF"
    description: ""
    group_label: "Dados do Aluno"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: digito_verificador {
    type: number
    label: "Digito Verificador"
    description: ""
    group_label: "Dados Financeiros"
    sql: ${TABLE}."DIGITO_VERIFICADOR" ;;
  }

  dimension: endereco {
    type: string
    label: "Endereço"
    description: ""
    group_label: "Dados do Aluno"
    sql: ${TABLE}."ENDERECO" ;;
  }

  dimension: estado {
    type: string
    label: "Estado"
    description: ""
    group_label: "Dados do Aluno"
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: mensagens {
    type: string
    label: "Mensagem de Erro"
    description: ""
    group_label: "Filter Validation"
    sql: ${TABLE}."MENSAGENS" ;;
  }

  dimension: nome {
    type: string
    label: "Nome do Aluno"
    description: ""
    group_label: "Dados do Aluno"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: origin {
    type: string
    label: "Origem"
    description: ""
    group_label: "Filter Validation"
    sql: ${TABLE}."ORIGIN" ;;
  }

  dimension: quantidade_parcelas {
    type: number
    label: "Qtd Parcelas"
    description: ""
    group_label: "Dados do Contrato"
    sql: ${TABLE}."QUANTIDADE_PARCELAS" ;;
  }

  dimension: release_contrato {
    type: number
    label: "Release Contrato"
    description: ""
    group_label: "Dados do Contrato"
    sql: ${TABLE}."RELEASE_CONTRATO" ;;
  }

  dimension: rg {
    type: string
    label: "RG"
    description: ""
    group_label: "Dados do Aluno"
    sql: ${TABLE}."RG" ;;
  }

  dimension: rg_emissor {
    type: string
    label: "RG Emissor"
    description: ""
    group_label: "Dados do Aluno"
    sql: ${TABLE}."RG_EMISSOR" ;;
  }

  dimension: sucesso {
    type: yesno
    label: "Sucesso"
    description: ""
    group_label: "Filter Validation"
    sql: ${TABLE}."SUCESSO" ;;
  }

  dimension: tx_comissao {
    type: number
    label: "Taxa Comissão"
    description: ""
    group_label: "Dados Financeiros"
    sql: ${TABLE}."TX_COMISSAO" ;;
  }

  dimension: user_name {
    type: string
    label: "Ferramenta Name"
    description: ""
    group_label: "Filter Validation"
    sql: ${TABLE}."USER_NAME" ;;
  }

  dimension: valor_mensalidade {
    type: number
    label: "Valor Mensalidade"
    description: ""
    group_label: "Dados do Contrato"
    sql: ${TABLE}."VALOR_MENSALIDADE" ;;
  }

## MEASURES ##

  measure: count {
    type: count
    drill_fields: [id, user_name]
    hidden: yes
  }

## DATAS ##

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
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
    label: "Atualização"
  }

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
    sql: ${TABLE}."DATA_CRIACAO" ;;
    label: "Criação"
  }

  dimension_group: rg_data_emissao {
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
    sql: ${TABLE}."RG_DATA_EMISSAO" ;;
    label: "RG Emissão"
  }

  ## REGRAS DE NEGÓCIO ##

  dimension: filter {
    type: string
    sql: CASE
    WHEN ${user_name} = 'NiFi' THEN 'DATA FILTER'
    WHEN ${user_name} = 'credit-release' THEN 'BUSINESS FILTER'
    ELSE ' '
    END;;
    label: "Tipo de Filtro"
    group_label: "Filter Validation"
    description: "Indica se a validação é de Business ou Data"
  }

  dimension: erro_validacao {
    type: string
    sql: CASE
          WHEN ${sucesso} = 'false' THEN 'Com Erro'
          WHEN ${sucesso} = 'true' THEN 'Sem Erro'
        ELSE 'Vazio'
        END;;
    label: "Validação de Erro"
    group_label: "Filter Validation"
    description: "Indica se o contrato está com algum erro ou não"
  }

}
