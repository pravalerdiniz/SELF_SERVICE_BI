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
    hidden: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: tdt_ano_mes {
    type: number
    value_format: "0"
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: produtos {
    type: string
    group_item_label: "Tipo de Produto"
    sql: ${TABLE}."PRODUTOS" ;;
  }

  dimension: fundo {
    type:  string
    group_item_label:"Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  measure: pdd_atual {
    type: sum
    group_item_label:"PDD Atual"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."PDD_ATUAL" ;;
  }

  measure: pdd_anterior {
    type: sum
    group_item_label:"PDD Anterior"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."PDD_ANTERIOR" ;;
  }

  measure: soma_vp {
    type: sum
    group_item_label: "Soma do Valor Presente"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."SOMA_VP" ;;
  }

  dimension: qtd {
    type: number
    hidden:  yes
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
