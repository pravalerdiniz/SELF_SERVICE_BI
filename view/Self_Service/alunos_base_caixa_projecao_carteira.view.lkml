view: base_caixa_projecao_carteira {
  derived_table: {
    sql: select * from stage.public.base_caixa_projecao_carteira
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cpf {
    type: number
    hidden:  yes
    primary_key: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: tdt_ano_mes {
    type: number
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: dt_ref {
    type: date
    group_item_label:"Data de Referência"
    hidden: yes
    sql: ${TABLE}."DT_REF" ;;
  }

  dimension: ultimo_dia_mes {
    type:date
    label: "Ultimo Dia do Mês"
    hidden: yes
    sql:last_day(${data_ref_date}::DATE) ;;
  }

  dimension: flg_ultimo_dia_mes {
    type:yesno
    label: "Ultimo Dia do Mês?"
    sql:case when ${ultimo_dia_mes} = ${data_ref_date} then true
    else false end ;;
  }



  dimension_group: data_ref
  {
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      week,
      month,
      quarter,
      year,
      time
    ]
    convert_tz: no
    label: "Referência"
    datatype:date
    sql:${dt_ref} ;;
  }

  dimension: anomes_ref {
    type: string
    group_item_label:"Ano e Mês de Referência"
    sql: ${TABLE}."ANOMES_REF" ;;
  }

  dimension: fx_atraso {
    type: string
    group_item_label:"Faixa de Atraso"
    sql: ${TABLE}."FX_ATRASO" ;;
  }

  dimension: fundo {
    type: string
    group_item_label:"Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: dia {
    type: number
    group_item_label: "Dia do Mês"
    sql: ${TABLE}."DIA" ;;
  }

  measure: qtde_cpf {
    type: number
    group_item_label: "Quantidade de CPFs"
    hidden: yes
    sql: ${TABLE}."QTDE_CPF" ;;
  }

  measure: saldo_carteira {
    type: sum
    group_item_label: "Saldo da Carteira"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."SALDO_CARTEIRA" ;;
  }

 dimension: caixa_acum {
    type: number
    label: "Caixa Acumulado"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."CAIXA_ACUM" ;;
  }

  measure: sum_caixa_acum {
    type: sum
    group_label: "Caixa Acumulado"
    label: "Soma"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."CAIXA_ACUM" ;;
  }

  measure: max_caixa_acum {
    type: max
    group_label: "Caixa Acumulado"
    label: "Máximo"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."CAIXA_ACUM" ;;
  }

  measure: boleto_acum {
    type: sum
    group_item_label: "Valor de Boleto Acumulado"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."BOLETO_ACUM" ;;
  }

  measure: qtde_acum {
    type: sum
    group_item_label: "Quantidade de Acumulados"
    sql: ${TABLE}."QTDE_ACUM" ;;
  }

  set: detail {
    fields: [
      cpf,
      tdt_ano_mes,
      dt_ref,
      anomes_ref,
      fx_atraso,
      fundo,
      dia,
      qtde_cpf,
      saldo_carteira,
      caixa_acum,
      boleto_acum,
      qtde_acum
    ]
  }
}
