##tabela referente aos acordos de renegociação retirados da tabela: "bicho"."cobranca"."prv_aco_acordo"

view: alunos_acordo_renegociacao {
  derived_table: {
    persist_for: "1 hour"
    sql: select
  id_cpf,
  f.key as id_acordo,
  f.value:DATA::timestamp as data_acordo,
  CONCAT('BOF-'||f.value:PROPOSTA::int)::varchar as proposta,
  f.value:VP_DIVIDA::float as vp_divida,
  f.value:VALOR_ACORDO::float as valor_acordo,
  f.value:QTD_PRESTACOES::int as qtd_prestacoes,
  f.value:TOTAL_ACORDO::float as total_acordo,
  f.value:PRI_VECT::timestamp as pri_vecto,
  f.value:ULT_VECTO::timestamp as ult_vecto,
  f.value:CD_TIPO_ACORDO::int as cd_tipo_acordo,
  f.value:DT_CONCESSAO::date as dt_concessao,
  f.value:ID_ACO_ACORDO_DIF as id_aco_acordo_dif,
  l.value:DATA::date as data_status,
  l.value:STATUS_ORIGEM::varchar as  status_origem,
  l.value:STATUS_DESTINO::varchar as status_destino,
  l.value:FUNDO_INVESTIMENTO::int as fundo_investimento
  from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
  lateral flatten (input => RENEGOCIACAO) f ,
  lateral flatten (input => ACORDO_LOG) l;;
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
    label: "Acordo"
    description: "Indica a data que o acordo foi realizado"
    sql: ${TABLE}."DATA_ACORDO" ;;
  }



  dimension: id_proposta_acordo {
    type: string
    label: "ID Proposta"
    description: "Indica o ID do novo contrato gerado pelo acordo"
    sql: ${TABLE}."PROPOSTA" ;;
  }


  dimension: vl_presente_divida {
    type: number
    group_label: "Valores"
    group_item_label:  "Valor Presente Dívida"
    value_format: "###,###.00"
    description: "Indica o valor total da dívida do aluno trazendo as parcelas futuras ao valor presente"
    sql: ${TABLE}."VP_DIVIDA" ;;

  }

  dimension: valor_acordo {
    type: number
    group_label: "Valores"
    group_item_label: "Valor Acordo"
    description: "Indica o valor do acordo do aluno"
    sql: ${TABLE}."VALOR_ACORDO" ;;
    value_format: "###,###.00"
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
    hidden: yes
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
    label: "Concessão Acordo"
    description: "Indica a data de concessão do contrato do acordo"
    sql: ${TABLE}."DT_CONCESSAO" ;;
  }

  dimension: id_acordo_dif {
    type: string
    label: "ID do Acordo Dif"
    description: "Indica o ID Dif do acordo de renegociação"
    sql: ${TABLE}."ID_ACO_ACORDO_DIF" ;;
    hidden: yes
  }

  dimension: status_origem {
    type: string
    label: "Status Origem"
    description: "Indica o status anterior do contrato de acordo"
    sql: ${TABLE}."STATUS_ORIGEM" ;;
    hidden: no
  }

  dimension: status_destino {
    type: string
    label: "Status Destino"
    description: "Indica o status atual do contrato de acordo"
    sql: ${TABLE}."STATUS_DESTINO" ;;
    hidden: no
  }

  dimension: flg_contrato_cedido {
    type: string
    case: {
      when: {
        sql: ${TABLE}."PROPOSTA" = ${proposta.id_proposta}
          AND ${proposta.flg_contrato_cedido} = true;;
        label: "yes"
      }
      else: "no"
    }
    label: "Contrato Cedido"
    description: "Indica se os contratos de acordo foram ou não cedidos "
    drill_fields: [detail*]
  }

  dimension_group: status_log {
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
    label: "Status Log"
    description: "Indica a data de alteração de status do contrato do acordo"
    sql: ${TABLE}."DATA_STATUS" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    group_label: "Dados do Fundo de Investimento"
    label: "ID Fundo de Investimento"
    description: "Indica o ID do Fundo de Investimento."
    sql: ${TABLE}."FUNDO_INVESTIMENTO" ;;
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


  measure: sum_valor_pdd {
    type: sum
    sql: ${alunos.vl_pdd} ;;
    group_label: "Valor PDD"
    group_item_label: "Soma"
    description: ""
    value_format: "###,###.00"
  }

  measure: avg_valor_pdd {
    type: average
    sql: ${alunos.vl_pdd} ;;
    group_label: "Valor PDD"
    group_item_label: "Média"
    description: ""
    value_format: "###,###.00"
  }

  measure: min_valor_pdd {
    type: min
    sql: ${alunos.vl_pdd} ;;
    group_label: "Valor PDD"
    group_item_label: "Mínimo"
    description: ""
    value_format: "###,###.00"
  }

  measure: max_valor_pdd {
    type: max
    sql: ${alunos.vl_pdd} ;;
    group_label: "Valor PDD"
    group_item_label: "Máximo"
    description: ""
    value_format: "###,###.00"
  }

  dimension: duracao_acordo {
    type: number
    sql: datediff('day',${primeiro_vecto_date},${ultimo_vecto_date}) ;;
    group_item_label: "Duração do Acordo"
    description: "Indica em dias a duração total do acordo"
    drill_fields: [detail*]
  }

  measure: count_duracao_acordo {
    type: number
    sql: ${duracao_acordo} ;;
    label: "Duração do Acordo"
    description: "Indica em dias a duração total do acordo"
    drill_fields: [detail*]
  }

  measure: avg_duracao_acordo {
    type: average
    sql: ${duracao_acordo} ;;
    label: "Duração do Acordo Média"
    description: "Indica em dias a duração total do acordo"
    drill_fields: [detail*]
  }

  measure: sum_valor_presente_divida {
    type: sum
    group_label: "Valores"
    group_item_label: "Valor Presente Dívida"
    description: "Indica o valor total da dívida do aluno trazendo as parcelas futuras ao valor presente"
    sql: ${vl_presente_divida} ;;
    value_format: "###,###.00"
  }

  measure: sum_valor_presente_aluno {
    type: sum
    group_label: "Valores"
    group_item_label: "Valor Presente "
    description: "Indica o valor total da dívida do aluno trazendo as parcelas futuras ao valor presente"
    sql: ${alunos.val_presente} ;;
    value_format: "###,###.00"
  }

  measure: sum_total_acordo {
    type: sum
    group_label: "Valores"
    group_item_label: "Total Acordo"
    description: "Indica a soma do valor total do acordo do aluno"
    sql: ${total_acordo} ;;
    value_format: "###,###.00"
  }

  measure: sum_valor_acordo {
    type: number
    group_label: "Valores"
    group_item_label: "Valor Acordo"
    description: "Indica a soma dos valores do acordo do aluno"
    sql: ${valor_acordo} ;;
    value_format: "###,###.00"
  }

  measure: count_contratos_cedidos  {
    type: count_distinct
    sql: ${id_proposta_acordo} ;;
    filters: [flg_contrato_cedido: "yes"]
    label: "Contrato Cedido"
    description: "Contagem dos contratos de acordo cedidos"

  }

  set: detail {
    fields: [
        id_cpf,
        id_acordo,
        data_acordo_date,
        id_proposta_acordo,
        vl_presente_divida,
        sum_valor_presente_aluno,
        valor_acordo,
        qtd_prestacoes_acordo,
        total_acordo,
        primeiro_vecto_date,
        ultimo_vecto_date,
        concessao_acordo_date,
        flg_contrato_cedido,
        proposta.id_fundo_investimento,
        duracao_acordo
    ]
  }



    }
