view: alunos_acordo {
  derived_table: {
    persist_for: "1 hour"
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
      day_of_month,
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
    group_label: "Valores"
    group_item_label: "Valor da Divida Atual"
    value_format: "$ ,.00"
    description: "Indica a divida atual do aluno com o Pravaler"
    sql: ${TABLE}."VL_DIVIDA_ATUAL" ;;
  }

  dimension: vl_promessa {
    type: number
    group_label: "Valores"
    group_item_label: "Valor da Promessa"
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


  dimension: dias_atraso_regra {
    type: number
    label: "Dias de atraso"
    sql: datediff('day',${data_acordo},${data_vencimento_promessa}) ;;
    hidden: yes
    description: "Indica os dias de atraso em relação ao acordo realizado pelo aluno e a data de vencimento da promessa de pagamento"
  }





  dimension: dias_atraso {
    type: number
    group_item_label: "Dias de após vencimento"
    sql: CASE WHEN ${dias_atraso_regra} < 0 then 0 ELSE ${dias_atraso_regra} END ;;
    description: "Indica os dias de atraso em relação ao acordo realizado pelo aluno e a data de vencimento da promessa de pagamento"
  }


  dimension: faixa_atraso {
    type: string
    label: "Faixa de Atraso"
    sql: CASE
          WHEN ${dias_atraso} = 0 THEN "Em dia"
          WHEN ${dias_atraso} BETWEEN 1 AND 14 THEN "01 a 14"
          WHEN ${dias_atraso} BETWEEN 15 AND 30 THEN "15 a 30"
          WHEN ${dias_atraso} BETWEEN 31 AND 60 THEN "31 a 60"
          WHEN ${dias_atraso} BETWEEN 61 AND 90 THEN "61 a 90"
          WHEN ${dias_atraso} BETWEEN 91 AND 120 THEN "91 a 120"
          WHEN ${dias_atraso} BETWEEN 121 AND 150 THEN "121 a 150"
          WHEN ${dias_atraso} BETWEEN 151 AND 180 THEN "151 a 180"
          ELSE "Acima de 180" END
          ;;
    description: "Indica a faixa de atraso do aluno em relação ao acordo realizado e a data de vencimento da promessa de pagamento"
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

  dimension: flg_acordo_pago {
    type: number
    label: "Acordo Pago?"
    sql: CASE WHEN ${data_pagamento} is null THEN 0
    ELSE 1 END ;;
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


  measure: count_acordo_pagos {
    type: count_distinct
    sql: ${id_acordo} ;;
    label: "Quantidade de acordos Pagos"
    description: "Contagem de ID Acordos únicos"
    filters: [flg_acordo_pago: "1"]
    drill_fields: [detail*]
  }

  measure: count_status_acordo{
    type: count_distinct
    sql: ${id_acordo} ;;
    sql_distinct_key: ${descricao_acordo} ;;
    label: "Quantidade de Acordos por Status"
    description: "Indica o status do acordo"
  }


  measure: sum_valor_divida {
    type: sum
    sql: ${vl_divida_atual} ;;
    group_label: "Valor Divida"
    label: "Soma"
    description: ""
  }

  measure: avg_valor_divida {
    type: average
    sql: ${vl_divida_atual} ;;
    group_label: "Valor Divida"
    label: "Média"
    description: ""
  }

  measure: min_valor_divida {
    type: min
    sql: ${vl_divida_atual} ;;
    group_label: "Valor Divida"
    label: "Minimo"
    description: ""
  }

  measure: max_valor_divida {
    type: max
    sql: ${vl_divida_atual} ;;
    group_label: "Valor Divida"
    label: "Máximo"
    description: ""
  }

  measure: sum_valor_promessa {
    type: sum
    sql: ${vl_promessa} ;;
    label: "Valor Promessa"
    description: ""
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
    ]
  }
}
