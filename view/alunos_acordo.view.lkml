view: alunos_acordo {
  derived_table: {
    sql: select
            id_cpf,
            f.key as id_acordo,
            f.value:DATA_ACORDO::DATE as DATA_ACORDO,
            f.value:VL_DIVIDA_ATUAL::float as VL_DIVIDA_ATUAL,
            f.value:VL_PROMESSA::float as VL_PROMESSA,
            f.value:TIR_TITULOS::int as TIR_TITULOS,
            f.value:LOGIN::varchar as LOGIN,
            f.value:DATA_VENCIMENTO_PROMESSA::date as DATA_VENCIMENTO_PROMESSA,
            f.value:DATA_PAGAMENTO::date as DATA_PAGAMENTO,
            f.value:COD_TIPO_USUARIO::int as COD_TIPO_USUARIO,
            f.value:DESCRICAO_ACORDO::varchar as DESCRICAO_ACORDO,
            f.value:ID_INSTITUICAO::varchar as ID_INSTITUICAO
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
            lateral flatten (input => acordo) f
 ;;
  }

  measure: count_id_cpf {
    type: count_distinct
    sql: ${id_cpf} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Valor"
    description: "Contagem de ID CPFs únicos"
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    label: "ID CPF"
    description: "Indica o ID do CPF do aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_acordo {
    type: string
    label: "ID do Acordo"
    description: "Indica o código do acordo solicitado pelo aluno"
    sql: ${TABLE}."ID_ACORDO" ;;
  }

  dimension: data_acordo {
    type: date
    label: "Data do Acordo"
    description: "Indica a data que o acordo foi realizado"
    sql: ${TABLE}."DATA_ACORDO" ;;
    hidden: yes
  }

  dimension_group: data_acordo_grupo {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Data do Acordo"
    description: "Indica a data que o acordo foi realizadO"
    sql: ${TABLE}."DATA_ACORDO" ;;
  }

  dimension: vl_divida_atual {
    type: number
    label: "Valor da Divida Atual"
    value_format: "$ ,.00"
    description: "Indica a divida atual do aluno com o Pravaler"
    sql: ${TABLE}."VL_DIVIDA_ATUAL" ;;
  }

  dimension: vl_promessa {
    type: number
    label: "Valor da Promessa"
    value_format: "$ ,.00"
    description: "Indica o valor da divida do aluno após o acordo"
    sql: ${TABLE}."VL_PROMESSA" ;;
  }

  dimension: tir_titulos {
    type: number
    label: "Quantidade de Titulos"
    description: "Indica a quantidade de títulos gerados no acordo"
    sql: ${TABLE}."TIR_TITULOS" ;;
  }

  dimension: login {
    type: string
    label: "Login Agente"
    description: "Indica o login do responsável pelo acordo"
    sql: ${TABLE}."LOGIN" ;;
  }

  dimension: data_vencimento_promessa {
    type: date
    label: "Data Vencimento Promessa"
    description: "Indica a data de vencimento da promessa"
    sql: ${TABLE}."DATA_VENCIMENTO_PROMESSA" ;;
  }

  dimension: data_pagamento {
    type: date
    label: "Data Pagamento Promessa"
    description: "Indica a data de pagamento da promessa"
    sql: ${TABLE}."DATA_PAGAMENTO" ;;
  }

  dimension: cod_tipo_usuario {
    type: number
    label: "Tipo de Login"
    description: "Indica o tipo de login responsável pelo acordo"
    sql: ${TABLE}."COD_TIPO_USUARIO" ;;
  }

  dimension: descricao_acordo {
    type: string
    label: "Status do Acordo "
    description: "Indica o status do acordo"
    sql: ${TABLE}."DESCRICAO_ACORDO" ;;
  }

  dimension: id_instituicao {
    type: string
    label: "ID da Instituição"
    description: "Indica o código da instituição do Pravaler"
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  set: detail {
    fields: [
      id_cpf,
      id_acordo,
      data_acordo,
      vl_divida_atual,
      vl_promessa,
      tir_titulos,
      login,
      data_vencimento_promessa,
      data_pagamento,
      cod_tipo_usuario,
      descricao_acordo,
      id_instituicao,
      proposta.data_concessao
    ]
  }
}
