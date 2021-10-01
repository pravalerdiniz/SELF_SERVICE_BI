view: custo_bv {
  derived_table: {
    sql: select * from STAGE.PUBLIC.CUSTO_BV
      ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
    primary_key: yes
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ano_mes {
    type: string
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: tipo_contrato {
    type: string
    sql: ${TABLE}."TIPO_CONTRATO" ;;
  }

  dimension: fundo {
    type: string
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: faixa_atraso {
    type: string
    sql: ${TABLE}."FAIXA_ATRASO" ;;
  }

  dimension: bkt {
    type: string
    sql: ${TABLE}."BKT" ;;
  }

  dimension: qtd {
    type: number
    sql: ${TABLE}."QTD" ;;
  }

  dimension: saldo {
    type: number
    sql: ${TABLE}."SALDO" ;;
  }

  dimension: provisao {
    type: number
    sql: ${TABLE}."PROVISAO" ;;
  }

  set: detail {
    fields: [
      cpf,
      ano_mes,
      tipo_contrato,
      fundo,
      faixa_atraso,
      bkt,
      qtd,
      saldo,
      provisao
    ]
  }
}
