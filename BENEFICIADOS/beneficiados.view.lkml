view: beneficiados {
  sql_table_name: "SELF_SERVICE_BI"."BENEFICIADOS"
    ;;


  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    group_label: "Dados do Aluno"
    group_item_label: "ID_CPF"
    description: "Indica o ID do CPF do aluno"
  }

  dimension: renda_do_aluno {
    type: number
    sql: ${TABLE}."RENDA_DO_ALUNO" ;;
    value_format: "$ #,##0.00"
    group_label: "Dados do Aluno"
    group_item_label: "Renda"
    description: "Indica a renda do aluno"
  }

  dimension: sexo_do_aluno {
    type: string
    sql: ${TABLE}."SEXO_DO_ALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Sexo"
    description: "Indica o sexo do aluno"
  }

  dimension: uf_do_aluno {
    type: string
    sql: ${TABLE}."UF_DO_ALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "UF"
    description: "Indica a UF do aluno"
  }

  dimension: cidade_do_aluno {
    type: string
    sql: ${TABLE}."CIDADE_DO_ALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Cidade"
    description: "Indica a cidade do aluno"
  }

  dimension: idade_do_aluno {
    type: number
    sql: ${TABLE}."IDADE_DO_ALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Idade"
    description: "Indica a idade do aluno"
  }


  dimension: idade_do_garantidor {
    type: number
    sql: ${TABLE}."IDADE_DO_GARANTIDOR" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Idade do Garantidor"
    description: "Indica a idade do garantidor"
  }

  dimension: parentesco_do_garantidor {
    type: string
    sql: ${TABLE}."PARENTESCO_DO_GARANTIDOR" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Parentesco do Garantidor"
    description: "Indica o parentesco do garantidor"
  }

  dimension: renda_do_garantidor {
    type: number
    sql: ${TABLE}."RENDA_DO_GARANTIDOR" ;;
    value_format: "$ #,##0.00"
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Renda do Garantidor"
    description: "Indica a renda do garantidor"
  }

  dimension: renda_familiar {
    type: number
    sql: ${TABLE}."RENDA_FAMILIAR" ;;
    value_format: "$ #,##0.00"
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Renda Familiar"
    description: "Indica a renda da família do aluno"
  }

  dimension: sexo_do_garantidor {
    type: string
    sql: ${TABLE}."SEXO_DO_GARANTIDOR" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Sexo do Garantidor"
    description: "Indica o sexo do garantidor"
  }

  dimension: uf_do_garantidor {
    type: string
    sql: ${TABLE}."UF_DO_GARANTIDOR" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "UF do Garantidor"
    description: "Indica a UF do garantidor"
  }

  dimension: cidade_do_garantidor {
    type: string
    sql: ${TABLE}."CIDADE_DO_GARANTIDOR" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Cidade do Garantidor"
    description: "Indica a cidade do garantidor"
  }


  dimension: grupo_da_ie {
    type: string
    sql: ${TABLE}."GRUPO_DA_IE" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Grupo"
    description: "Indica a qual grupo a IE pertence"
  }

  dimension: campus {
    type: string
    sql: ${TABLE}."CAMPUS" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Campus"
    description: "Indica o campus da IE"
  }

  dimension: nome_da_ie {
    type: string
    sql: ${TABLE}."NOME_DA_IE" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Instituição"
    description: "Indica o nome da IE"
  }

  dimension: uf_da_ie {
    type: string
    sql: ${TABLE}."UF_DA_IE" ;;
    group_label: "Dados da Instituição"
    group_item_label: "UF"
    description: "Indica a UF da Instituição de Ensino"
  }

  dimension: cidade_da_ie {
    type: string
    sql: ${TABLE}."CIDADE_DA_IE" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Cidade"
    description: "Indica a cidade da Instituição de Ensino"
  }


  dimension: curso {
    type: string
    sql: ${TABLE}."CURSO" ;;
    group_label: "Dados do Curso"
    group_item_label: "Valor da Mensalidade"
    description: "Indica o valor da mensalidade do financiamento"
  }

  dimension: mensalidade {
    type: number
    sql: ${TABLE}."MENSALIDADE" ;;
    group_label: "Dados do Curso"
    group_item_label: "Valor da Mensalidade"
    description: "Indica o valor da mensalidade do financiamento"
  }

  dimension: periodo_do_curso {
    type: string
    sql: ${TABLE}."PERIODO_DO_CURSO" ;;
    group_label: "Dados do Curso"
    group_item_label: "Período"
    description: "Indica em que horário o aluno estuda"
  }

  dimension: tipo_de_curso {
    type: string
    sql: ${TABLE}."TIPO_DE_CURSO" ;;
    group_label: "Dados do Curso"
    group_item_label: "Tipo de Curso"
    description: "Indica o nível do curso (ex.: Graduação/ Pós-graduação / Intercâmbio, entre outros)"
  }

  dimension: modalidade_de_ensino {
    type: string
    sql: ${TABLE}."MODALIDADE_DE_ENSINO" ;;
    group_label: "Dados do Curso"
    group_item_label: "Modalidade de Ensino"
    description: "Indica a modalidade de ensino (ex.: Presencial/ EAD )"
  }


  dimension: id_proposta {
    type: number
    sql: ${TABLE}."ID_PROPOSTA" ;;
    primary_key: yes
    group_label: "Dados do Contrato"
    group_item_label: "ID do Contrato"
    description: "Indica o ID do Contrato"
  }

  dimension: originador {
    type: string
    sql: ${TABLE}."ORIGINADOR" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Originador"
    description: "Indica o banco originador do empréstimo/ financiamento"
  }

  dimension: tipo_de_contrato {
    type: string
    sql: ${TABLE}."TIPO_DE_CONTRATO" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Tipo de Contrato"
    description: "Indica o tipo de contrato"
  }

  dimension: valor_financiado {
    type: number
    sql: ${TABLE}."VALOR_FINANCIADO" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Valor Financiado"
    description: "Valor do contrato do aluno"
  }

  dimension: juros_mensais {
    type: number
    sql: ${TABLE}."JUROS_MENSAIS" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Juros Mensais"
    description: "Indica os juros totais do contrato do aluno"
  }

  dimension: quantidade_de_mensalidades {
    type: number
    sql: ${TABLE}."QUANTIDADE_DE_MENSALIDADES" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Quantidade de Mensalidades"
    description: "Quantidade de mensalidades do contrato do aluno"
  }


  dimension: produto {
    type: string
    sql: ${TABLE}."PRODUTO" ;;
    group_label: "Dados do Produto"
    group_item_label: "Produto"
    description: "Indica o  financimento contratado"
  }

  dimension: tipo_de_produto {
    type: string
    sql: ${TABLE}."TIPO_DE_PRODUTO" ;;
    group_label: "Dados do Produto"
    group_item_label: "Tipo de Produto"
    description: "Indica se o produto do aluno é Core Business ou produto de Squad"
  }

  dimension: modalidade_do_produto {
    type: string
    sql: ${TABLE}."MODALIDADE_DO_PRODUTO" ;;
    group_label: "Dados do Produto"
    group_item_label: "Modalidade"
    description: "Indica a modalidade do produto (Antecipação, Compartilhado, Gestão)"
  }


  dimension_group: data_concessao {
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
    sql: ${TABLE}."DATA_CONCESSAO" ;;
    label: "Concessão"
    description: "Indica a data do repasse para as Instituições"
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
