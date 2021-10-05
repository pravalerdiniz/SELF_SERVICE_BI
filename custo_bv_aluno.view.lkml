view: custo_bv_aluno {
  derived_table: {
    sql: select * from stage.public.custo_bv_aluno
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: acao {
    type: string
    group_item_label: "Ação"
    sql: ${TABLE}."ACAO" ;;
  }

  dimension: fundo {
    type: number
    group_item_label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: provedor {
    type: string
    group_item_label: "Provedor"
    sql: ${TABLE}."PROVEDOR" ;;
  }

  dimension: papel {
    type: string
    group_item_label: "Papel"
    sql: ${TABLE}."PAPEL" ;;
  }

  measure: quantidade {
    type: sum
    group_item_label: "Quantidade"
    sql: ${TABLE}."QUANTIDADE" ;;
  }

  dimension_group: dt_usuario_upd {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      month_name,
      year,
      time,

    ]
    convert_tz: no
    label: "Data"
    datatype: date
    sql: ${TABLE}."DT_USUARIO_UPD" ;;
  }


  set: detail {
    fields: [
      acao,
      fundo,
      provedor,
      papel,
      quantidade,
      dt_usuario_upd_time
    ]
  }
}
