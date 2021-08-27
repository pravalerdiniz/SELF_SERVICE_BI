view: base_carteira_atraso_produto {
  derived_table: {
    sql: select * from STAGE.PUBLIC.BASE_CARTEIRA_ATRASO_PRODUTO
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

  dimension: produtos {
    type: string
    sql: ${TABLE}."PRODUTOS" ;;
  }

  dimension: fundo {
    type: number
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: pdd_atual {
    type: number
    sql: ${TABLE}."PDD_ATUAL" ;;
  }

  dimension: pdd_anterior {
    type: number
    sql: ${TABLE}."PDD_ANTERIOR" ;;
  }

  dimension: soma_vp {
    type: number
    sql: ${TABLE}."SOMA_VP" ;;
  }

  dimension: qtd {
    type: number
    sql: ${TABLE}."QTD" ;;
  }

  set: detail {
    fields: [
      cpf,
      tdt_ano_mes,
      produtos,
      fundo,
      pdd_atual,
      pdd_anterior,
      soma_vp,
      qtd
    ]
  }
}
