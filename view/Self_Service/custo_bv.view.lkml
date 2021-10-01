view: custo_bv {
  derived_table: {
    sql: select * from STAGE.PUBLIC.CUSTO_BV
      ;;
  }

  dimension: chave {
    sql: CONCAT(${ano_mes},${cpf});;
    primary_key: yes
    hidden: yes
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ano_mes {
    type: number
    group_item_label: "Ano - Mês"
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: tipo_contrato {
    type: string
    group_item_label: "Tipo Contrato"
    sql: ${TABLE}."TIPO_CONTRATO" ;;
  }

  dimension: fundo {
    type: string
    group_item_label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: faixa_atraso {
    type: string
    group_item_label: "Faixa de Atraso"
    sql: ${TABLE}."FAIXA_ATRASO" ;;
  }

  dimension: bkt {
    type: string
    group_item_label: "BKT"
    sql: ${TABLE}."BKT" ;;
  }

  measure: qtd {
    type: sum
    group_item_label: "Quantidade"
    sql: ${TABLE}."QTD" ;;
  }

  measure: saldo {
    type: sum
    group_item_label: "Saldo"
    sql: ${TABLE}."SALDO" ;;
  }

  measure: provisao {
    type: sum
    group_item_label: "Provisao"
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
