
view: beneficiados {
  sql_table_name: "SELF_SERVICE_BI"."BENEFICIADOS"
    ;;

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    value_format: "0"
    group_label: "Dados do Aluno"
    group_item_label: "ID_CPF do Aluno"
    description: "Indica o ID do CPF do aluno"
  }

  dimension: renda_do_aluno {
    type: number
    sql: ${TABLE}."RENDA_DO_ALUNO" ;;
    value_format: "$ #,##0.00"
    group_label: "Dados do Aluno"
    group_item_label: "Renda do Aluno"
    description: "Indica a renda do aluno"
    required_access_grants: [grupo_renda]
  }

  dimension: sexo_do_aluno {
    type: string
    sql: ${TABLE}."SEXO_DO_ALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Sexo do Aluno"
    description: "Indica o sexo do aluno"
  }

  dimension: uf_do_aluno {
    type: string
    sql: ${TABLE}."UF_DO_ALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "UF do Aluno"
    description: "Indica a UF do aluno"
  }

  dimension: mapa_uf_aluno {
    sql: ${TABLE}."UF_DO_ALUNO" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados do Aluno"
    group_item_label: "UF do Aluno - Mapa"
    description: "Indica a UF do aluno, pode ser usado em gráficos de mapa"
  }


  dimension: cidade_do_aluno {
    type: string
    sql: ${TABLE}."CIDADE_DO_ALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Cidade do Aluno"
    description: "Indica a cidade do aluno"
  }

  dimension: idade_do_aluno {
    type: number
    sql: ${TABLE}."IDADE_DO_ALUNO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Idade do Aluno"
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
      required_access_grants: [grupo_renda]
    }

    dimension: renda_familiar {
      type: number
      sql: ${TABLE}."RENDA_FAMILIAR" ;;
      value_format: "$ #,##0.00"
      group_label: "Dados da Família e Garantidor"
      group_item_label: "Renda Familiar"
      description: "Indica a renda da família do aluno"
      required_access_grants: [grupo_renda]
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

  dimension: mapa_uf_garantidor {
    sql: ${TABLE}."UF_DO_GARANTIDOR" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados da Família e Garantidor"
    group_item_label: "UF - Mapa"
    description: "Indica a UF do garantidor, pode ser usado em gráficos de mapa"
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

  dimension: mapa_uf_ie {
    sql: ${TABLE}."UF_DA_IE" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados da Instituição"
    group_item_label: "UF - Mapa"
    description: "Indica a UF da Instituição de Ensino, pode ser usado em gráficos de mapa"
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
      group_item_label: "Curso"
      description: "Indica o nome do curso"
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
      type: string
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
      description: "Indica o tipo de contrato do aluno"
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
      description: "Indica o produto PRAVALER contratado do aluno."
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
        month_name,
        month_num,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      sql: ${TABLE}."DATA_CONCESSAO" ;;
      label: "Concessão"
      description: "Indica a data do repasse para as Instituições"
    }

  dimension: ytd_only {
    group_label: "Filtro To-Date"
    label: "YTD"
    type: yesno
    sql:  ${data_concessao_month_num} <= extract(month from current_date)  ;;
  }

   measure: count {
      type: count
      drill_fields: [id_proposta]
    }


    measure: count_cont {
      type: count
      value_format: "#,###"
      group_label: "Quantidade de Contratos"
      group_item_label: "Valor"
      description: "Contagem de Contratos"
    }

    measure: perc_cont {
      type: percent_of_total
      sql: ${count_cont} ;;
      value_format: "0.00\%"
      group_label: "Quantidade de Contratos"
      group_item_label: "Porcentagem"
      description:"Porcentagem do total de contratos"
    }

    measure: count_id_cpf {
      type: count_distinct
      sql: ${id_cpf} ;;
      value_format: "0"
      group_label: "Quantidade de Alunos"
      group_item_label: "Valor"
      description: "Contagem de CPFs únicos"
      drill_fields:[id_cpf,id_proposta,grupo_da_ie,nome_da_ie,produto,data_concessao_date]
    }

    measure: perc_cpf {
      type: percent_of_total
      sql: ${count_id_cpf} ;;
      group_label: "Quantidade de Alunos"
      group_item_label: "Porcentagem"
      description: "Porcentagem do total de CPFs únicos"
    }

    measure: idade_aluno {
      type: average
      sql: ${idade_do_aluno} ;;
      value_format: "#,###"
      group_label: "Idade"
      group_item_label: "Aluno"
      description: "Média de idade do aluno"
    }

    measure: idade_garantidor {
      type: average
      sql: ${idade_do_garantidor} ;;
      value_format: "#,###"
      group_label: "Idade"
      group_item_label: "Garantidor"
      description: "Média de idade do garantidor"
    }

    measure: juros {
      type: average
      sql: ${juros_mensais} ;;
      value_format: "0.00\%"
      group_label: "Taxa de Juros"
      group_item_label: "Média"
      description: "Valor médio da taxa de juros do contrato"
    }

    measure: juros_min {
      type: min
      sql: ${juros_mensais} ;;
      value_format: "0.00\%"
      group_label: "Taxa de Juros"
      group_item_label: "Mínimo"
    }

    measure: juros_max {
      type: max
      sql: ${juros_mensais} ;;
      value_format: "0.00\%"
      group_label: "Taxa de Juros"
      group_item_label: "Máximo"
      description: "Maior valor da taxa de juros do contrato"
    }

    measure: avg_mensalidade {
      type: average
      sql: ${mensalidade} ;;
      value_format: "$ #,###"
      group_label: "Valor da Mensalidade"
      group_item_label: "Média"
      description: "Valor médio de mensalidade"
    }

    measure: max_mensalidade {
      type: max
      sql: ${mensalidade} ;;
      value_format: "$ #,###"
      group_label: "Valor da Mensalidade"
      group_item_label: "Máximo"
      description: "Valor máximo de mensalidade"
    }

    measure: min_mensalidade {
      type: min
      sql: ${mensalidade} ;;
      value_format: "$ #,###"
      group_label: "Valor da Mensalidade"
      group_item_label: "Mínimo"
      description: "Valor mínimo de mensalidade"
    }

    measure: sum_qtd_mensalidade {
      type: sum
      sql: ${quantidade_de_mensalidades} ;;
      value_format: "#,###"
      group_label: "Quantidade de Mensalidades"
      group_item_label: "Soma"
      description: "Soma da quantidade de mensalidades que foram efetivamente financiadas pelo PRAVALER"
    }

    measure: avg_qtd_mensalidade {
      type: average
      sql: ${quantidade_de_mensalidades} ;;
      value_format: "#,###"
      group_label: "Quantidade de Mensalidades"
      group_item_label: "Média"
      description: "Média da quantidade de mensalidades que foram efetivamente financiadas pelo PRAVALER"
    }

    measure: sum_financiado {
      type: sum
      sql: ${valor_financiado} ;;
      value_format: "$ #,###"
      group_label: "Valor Financiado"
      group_item_label: "Soma"
      description: "Soma dos valores efetivamente financiados pelo PRAVALER"
    }

    measure: avg_financiado {
      type: average
      sql: ${valor_financiado} ;;
      value_format: "$ #,###"
      group_label: "Valor Financiado"
      group_item_label: "Média"
      description: "Média dos valores efetivamente financiados pelo PRAVALER"
    }

    measure: avg_renda_aluno {
      type: average
      sql: ${renda_do_aluno} ;;
      value_format: "#,###"
      group_label: "Valor da Renda"
      group_item_label: "Renda Média do Aluno"
      description: "Valor médio da renda do aluno"
      required_access_grants: [grupo_renda]
    }

    measure: avg_renda_garantidor {
      type: average
      sql: ${renda_do_garantidor} ;;
      value_format: "#,###"
      group_label: "Valor da Renda"
      group_item_label: "Renda Média do Garantidor"
      description: "Valor médio da renda do garantidor"
      required_access_grants: [grupo_renda]
    }

    measure: avg_renda_familiar   {
      type: average
      sql: ${renda_familiar} ;;
      value_format: "#,###"
      group_label: "Valor da Renda"
      group_item_label: "Renda Média da Família"
      description: "Valor médio da renda da família do aluno"
      required_access_grants: [grupo_renda]
    }
  }
