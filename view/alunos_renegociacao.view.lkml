view: alunos_renegociacao {
  derived_table: {
    sql: select
  id_cpf,
  f.key as id_acordo,
  f.value:DATA::timestamp as data_acordo,
  f.value:PROPOSTA::int as proposta,
  f.value:VP_DIVIDA::float as vp_divida,
  f.value:VALOR_ACORDO::float as valor_acordo,
  f.value:QTD_PRESTACOES::int as qtd_prestacoes,
  f.value:TOTAL_ACORDO::float as total_acordo,
  f.value:PRI_VECT::timestamp as pri_vecto,
  f.value:ULT_VECTO::timestamp as ult_vecto,
  f.value:CD_TIPO_ACORDO::int as cd_tipo_acordo,
  f.value:DT_CONCESSAO::date as data_concessao_acordo,
  f.value:ID_ACO_ACORDO_DIF as id_aco_acordo_dif
  from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
  lateral flatten (input => RENEGOCIACAO) f ;;
    }

  dimension: id_cpf {
    type: number
    primary_key: yes
    label: "ID CPF"
    description: "Indica o ID do CPF do aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_acordo {
    type: string
    label: "ID do Acordo"
    description: "Indica o ID do acordo de renegociação"
    sql: ${TABLE}."ID_ACORDO" ;;
  }


  dimension_group: data_acordo {
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
    description: "Indica a data que o acordo foi realizado"
    sql: ${TABLE}."DATA_ACORDO" ;;
  }



  dimension: id_proposta_acordo {
    type: number
    label: "ID Proposta"
    description: "Indica o ID do novo contrato gerado pelo acordo"
    sql: ${TABLE}."PROPOSTA" ;;
  }


  dimension: vl_presente_divida {
    type: number
    group_label: "Valores"
    group_item_label:  "Valor Presente"
    value_format: "$ ,.00"
    description: "Indica o valor total da dívida do aluno trazendo as parcelas futuras ao valor presente"
    sql: ${TABLE}."VP_DIVIDA" ;;
  }

  dimension: valor_acordo {
    type: number
    group_label: "Valores"
    group_item_label: "Valor Acordo"
    description: "Indica o valor do acordo do aluno"
    sql: ${TABLE}."VALOR_ACORDO" ;;
  }


  dimension: qtd_prestacoes_acordo {
    type: string
    group_label: "Valores"
    group_item_label: "Quantidade Prestações"
    description: "Indica o a quantidade de prestações do acordo do aluno"
    sql: ${TABLE}."QTD_PRESTACOES" ;;
  }

  dimension: total_acordo {
    type: number
    group_label: "Valores"
    group_item_label: "Total Acordo"
    description: "Indica o valor total do acordo do aluno"
    sql: ${TABLE}."TOTAL_ACORDO" ;;
  }




  dimension_group: primeiro_vecto{
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
    datatype: timestamp
    label: "Primeiro Vencimento"
    description: "Indica a data do vencimento da primeira parcela do acordo"
    sql:${TABLE}."PRI_VECTO" ;;
  }

  dimension_group: ultimo_vecto {
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
    datatype: timestamp
    label: "Ultimo Vencimento"
    description: "Indica a data do vencimento da ultima parcela do acordo"
    sql: ${TABLE}."ULT_VECTO" ;;
  }

  dimension: cod_tipo_acordo {
    type: number
    label: "Tipo de Acordo"
    description: "Indica o código do tipo de acordo"
    sql: ${TABLE}."CD_TIPO_ACORDO" ;;
  }

  dimension_group: concessao_acordo {
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
    datatype: timestamp
    label: "Data Concessão Acordo"
    description: "Indica a data de concessão do contrato do acordo"
    sql: ${TABLE}."DT_CONCESSAO" ;;
  }

  dimension: id_acordo_dif {
    type: string
    label: "ID do Acordo"
    description: "Indica o ID do acordo de renegociação"
    sql: ${TABLE}."ID_ACO_ACORDO_DIF" ;;
  }


  measure: count_id_cpf {
    type: count_distinct
    sql: ${id_cpf} ;;
    label: "Quantidade de Alunos"
    description: "Contagem de ID CPFs únicos"
    drill_fields: [detail*]
  }

  measure: count {
    type: count
    #sql: ${id_cpf} ;;
    label: "Quantidade de Alunos"
    description: "Contagem de ID CPFs"
    drill_fields: [detail*]
  }

  measure: count_acordos {
    type: count_distinct
    sql: ${id_acordo} ;;
    label: "Quantidade de Acordos"
    description: "Contagem de ID Acordos únicos"
    drill_fields: [detail*]
  }

  measure: count_status_acordo{
    type: count_distinct
    sql: ${id_acordo} ;;
    sql_distinct_key: ${cod_tipo_acordo} ;;
    label: "Quantidade de Acordos por Tipo"
    description: "Indica a quantidade de acordos por tipo de acordo. "
  }


  measure: sum_valor_pdd {
    type: sum
    sql: ${alunos.vl_pdd} ;;
    group_label: "Valor PDD"
    group_item_label: "Soma"
    description: ""
  }

  measure: avg_valor_pdd {
    type: average
    sql: ${alunos.vl_pdd} ;;
    group_label: "Valor PDD"
    group_item_label: "Média"
    description: ""
  }

  measure: min_valor_pdd {
    type: min
    sql: ${alunos.vl_pdd} ;;
    group_label: "Valor PDD"
    group_item_label: "Mínimo"
    description: ""
  }

  measure: max_valor_pdd {
    type: max
    sql: ${alunos.vl_pdd} ;;
    group_label: "Valor PDD"
    group_item_label: "Máximo"
    description: ""
  }

  dimension: duracao_acordo {
    type: number
    sql: datediff('day',${primeiro_vecto_date},${ultimo_vecto_date}) ;;
    group_item_label: "Duração do Acordo"
    description: "Indica em dias a duração total do acordo"
    drill_fields: [detail*]
  }


  measure: valor_presente_divida {
    type: sum
    group_label: "Valores"
    group_item_label: "Valor Presente"
    description: "Indica o valor total da dívida do aluno trazendo as parcelas futuras ao valor presente"
    sql: ${vl_presente_divida} ;;
  }

  set: detail {
    fields: [
      id_cpf,
      id_acordo,
      data_acordo_date,
      vl_presente_divida
    ]
  }



    }
