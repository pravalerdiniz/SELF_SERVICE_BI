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
    sql: ${TABLE}."CPF" ;;
  }

  dimension: tdt_ano_mes {
    type: number
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: dt_ref {
    type: date
    sql: ${TABLE}."DT_REF" ;;
  }

  dimension: anomes_ref {
    type: string
    sql: ${TABLE}."ANOMES_REF" ;;
  }

  dimension: fx_atraso {
    type: string
    sql: ${TABLE}."FX_ATRASO" ;;
  }

  dimension: fundo {
    type: number
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: dia {
    type: number
    sql: ${TABLE}."DIA" ;;
  }

  dimension: qtde_cpf {
    type: number
    sql: ${TABLE}."QTDE_CPF" ;;
  }

  dimension: saldo_carteira {
    type: number
    sql: ${TABLE}."SALDO_CARTEIRA" ;;
  }

  dimension: caixa_acum {
    type: number
    sql: ${TABLE}."CAIXA_ACUM" ;;
  }

  dimension: boleto_acum {
    type: number
    sql: ${TABLE}."BOLETO_ACUM" ;;
  }

  dimension: qtde_acum {
    type: number
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
