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
            f.value:ID_INSTITUICAO::varchar as ID_INSTITUICAO,
            f.value:CANAL::varchar as CANAL,
            f.value:TIPO_CANAL::varchar as TIPO_CANAL,
            f.value:DIAS_ATRASO::int as DIAS_ATRASO,
            f.value:ORDEM_FAIXA_ATRASO::varchar as ORDEM_FAIXA_ATRASO,
            f.value:FAIXA_ATRASO::varchar as FAIXA_ATRASO,
            f.value:CARTEIRA::varchar as CARTEIRA,
            f.value:FUNDO::int as FUNDO,
            f.value:TIPO_INVESTIMENTO::varchar as TIPO_INVESTIMENTO,
            f.value:HORA_ACORDO::int as HORA_ACORDO,
            f.value:DESCRICAO::varchar as DESCRICAO,
            f.value:FLG_PAGAMENTO::boolean as FLG_PAGAMENTO,
            f.value:SALDO_SOLUCIONADO::float as SALDO_SOLUCIONADO,
            f.value:FLG_VENCENDO::boolean as FLG_VENCENDO,
            f.value:VL_VENCENDO::float as VL_VENCENDO,
            f.value:CLASSIFICACAO_FAIXA_ATRASO::varchar as CLASSIFICACAO_FAIXA_ATRASO,
            f.value:VL_PAGO::float as VL_PAGO,
            f.value:FAIXA_DE_DESCONTO::number as FAIXA_DE_DESCONTO
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
            lateral flatten (input => acordo) f
 ;;
  }
  ##f.value:CANAL::varchar as CANAL,
  ##f.value:TIPO_CANAL::varchar as TIPO_CANAL,
  ##f.value:DIAS_ATRASO::int as DIAS_ATRASO,
  ##f.value:ORDEM_FAIXA_ATRASO::varchar as ORDEM_FAIXA_ATRASO,
  ##f.value:FAIXA_ATRASO::varchar as FAIXA_ATRASO,
  ##f.value:CARTEIRA::varchar as CARTEIRA,
  ##f.value:FUNDO::int as FUNDO,
  ##f.value:TIPO_INVESTIMENTO::varchar as TIPO_INVESTIMENTO,
  ##f.value:HORA_ACORDO::time as HORA_ACORDO,
  ##f.value:DESCRICAO::varchar as DESCRICAO,
  ##f..value:FLG_PAGAMENTO::boolean as FLG_PAGAMENTO,
  #f.value:SALDO_SOLUCIONADO::float as SALDO_SOLUCIONADO,
  ##f.value:FLG_VENCENDO::boolean as FLG_VENCENDO,
  #f.value:VL_VENCENDO::float as VL_VENCENDO,
  ##f.value:CLASSIFICACAO_FAIXA_ATRASO::varchar as CLASSIFICACAO_FAIXA_ATRASO,
  #f.value:VL_PAGO::float as VL_PAGO

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



  dimension: mtd_only {
    group_label: "Filtros para Análise de Períodos"
    label: "Month to Date - Data do Acordo"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${data_acordo_grupo_raw}) < EXTRACT(DAY FROM GETDATE())
                OR
          (EXTRACT(DAY FROM ${data_acordo_grupo_raw}) = EXTRACT(DAY FROM GETDATE())))  ;;
    description: "Use esse campo em conjunto com o campo de Etapa, para realizar análises entre meses diferentes usando como base o dia do mês da data corrente."
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

  dimension: canal {
    type: string
    label: "Canal"
    sql: ${TABLE}."CANAL" ;;
  }

  dimension: tipo_canal {
    type: string
    label: "Tipo de Canal"
    sql: ${TABLE}."TIPO_CANAL" ;;
  }

  dimension_group: data_vencimento_promessa_grupo {
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
    label: "Vencimento do Acordo"
    description: "Indica a data de vencimento da promessa"
    sql: ${TABLE}."DATA_VENCIMENTO_PROMESSA" ;;
  }





  dimension: data_vencimento_promessa {
    type: date
    label: "Data Vencimento Promessa"
    description: "Indica a data de vencimento da promessa"
    hidden: yes
    sql: ${TABLE}."DATA_VENCIMENTO_PROMESSA" ;;
  }


  dimension: dias_atraso {
    type: number
    group_item_label: "Dias de após vencimento"
    sql:${TABLE}."DIAS_ATRASO" ;;
    description: "Indica os dias de atraso em relação ao acordo realizado pelo aluno e a data de vencimento da promessa de pagamento"
  }


  dimension: faixa_atraso {
    type: string
    label: "Faixa de Atraso"
    sql:${TABLE}."FAIXA_ATRASO" ;;
    order_by_field: "ordem_faixa_atraso"
    description: "Indica a faixa de atraso do aluno em relação ao acordo realizado e a data de vencimento da promessa de pagamento"
  }

  dimension: ordem_faixa_atraso {
    type: number
    label: "Ordem da faixa de atraso"
    sql:${TABLE}."ORDEM_FAIXA_ATRASO" ;;
    hidden:  yes
    description: "Indica a ordem da faixa de atraso do aluno em relação ao acordo realizado e a data de vencimento da promessa de pagamento"
  }


  dimension: classificacao_faixa_atraso {
    type: string
    label: "Classificação da faixa de atraso"
    sql:${TABLE}."CLASSIFICACAO_FAIXA_ATRASO" ;;
    description: "Indica a classificação da faixa de atraso do aluno em relação ao acordo realizado e a data de vencimento da promessa de pagamento"
  }

dimension: faixa_atraso_ordenada {
  type:  string
  label: "Faixa de Atraso Ordenada"
  hidden:  yes
  sql: CONCAT(${ordem_faixa_atraso},'. ',${faixa_atraso}) ;;
  description: "Faixa de atraso ordenada"
}

  dimension: data_pagamento {
    type: date
    label: "Data Pagamento Promessa"
    description: "Indica a data de pagamento da promessa"
    sql: ${TABLE}."DATA_PAGAMENTO" ;;
  }

  dimension_group: data_pagamento_grupo {
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
    label: "Pagamento do Acordo"
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

  dimension: descricao {
    type: string
    label: "Status do Acordo - Título "
    description: "Indica o status do título do acordo"
    sql: ${TABLE}."DESCRICAO" ;;
}

  dimension: id_instituicao {
    type: string
    label: "ID da Instituição"
    description: "Indica o código da instituição do Pravaler"
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: flg_pagamento {
    type: yesno
    label: "Acordo Pago?"
    sql: ${TABLE}."FLG_PAGAMENTO" ;;
  }

  dimension: flg_vencendo {
    type: yesno
    label: "Acordo Vencendo?"
    sql: ${TABLE}."FLG_VENCENDO" ;;
  }



dimension: tipo_investimento {
  type: string
  label: "Tipo de Investimento"
  sql: ${TABLE}."TIPO_INVESTIMENTO" ;;
}

  dimension: carteira {
    type: string
    label: "Carteira"
    sql: ${TABLE}."CARTEIRA" ;;
  }

  dimension: fundo {
    type: number
    label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: hora_acordo {
    type: number
    label: "Hora do acordo"
    sql: ${TABLE}."HORA_ACORDO" ;;
  }

  dimension: faixa_de_desconto {
    type: number
    label: "Desconto"
    sql: ${TABLE}."FAIXA_DE_DESCONTO" ;;
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
    filters: [flg_pagamento: "1"]
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
    value_format: "$ #,##0.00"
    description: ""
  }

  measure: avg_valor_divida {
    type: average
    sql: ${vl_divida_atual} ;;
    group_label: "Valor Divida"
    label: "Média"
    value_format: "$ #,##0.00"
    description: ""
  }

  measure: min_valor_divida {
    type: min
    sql: ${vl_divida_atual} ;;
    group_label: "Valor Divida"
    label: "Minimo"
    value_format: "$ #,##0.00"
    description: ""
  }

  measure: max_valor_divida {
    type: max
    sql: ${vl_divida_atual} ;;
    group_label: "Valor Divida"
    label: "Máximo"
    value_format: "$ #,##0.00"
    description: ""
  }

  measure: sum_valor_promessa {
    type: sum
    sql: ${vl_promessa} ;;
    label: "Valor Promessa"
    value_format: "$ #,##0.00"
    description: ""
  }

  measure: saldo_solucionado {
    type: sum
    sql: ${TABLE}."SALDO_SOLUCIONADO" ;;
    label: "Saldo Solucionado"
    value_format: "$ #,##0.00"
    description: ""
  }

  measure: vl_pago {
    type: sum
    sql: ${TABLE}."VL_PAGO" ;;
    label: "Valor Pago"
    value_format: "$ #,##0.00"
    description: ""
  }

  measure: vl_vencendo {
    type: sum
    sql: ${TABLE}."VL_VENCENDO" ;;
    label: "Valor Vencendo"
    value_format: "$ #,##0.00"
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
