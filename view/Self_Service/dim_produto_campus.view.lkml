# The name of this view in Looker is "Dim Produto Campus"
view: dim_produto_campus {
  sql_table_name: "DIMENSAO"."DIM_PRODUTO_CAMPUS"
    ;;

  dimension_group: data_fim {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month
    ]
    convert_tz: no
    datatype: date
    label: "Data Fim"
    description: "Data fim da vigência do status do produto no campus"
    sql: ${TABLE}."DATA_FIM" ;;
  }

  dimension_group: data_inicio {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month
    ]
    convert_tz: no
    datatype: date
    label: "Data Início"
    description: "Data início da vigência do status do produto no campus"
    sql: ${TABLE}."DATA_INICIO" ;;
  }

  dimension: flag_produto_ativo {
    type: yesno
    label: "Flag Produto Ativo"
    description: "TRUE se o produto está ativo no campus e FALSE se o produto não está ativo"
    sql: ${TABLE}."FLAG_PRODUTO_ATIVO" ;;
  }

  dimension: id_campus {
    type: string
    label: "ID Campus"
    description: "ID de identificação do Campus"
    sql: ${TABLE}."ID_CAMPUS" ;;
  }

  dimension: nm_campus {
    type: string
    label: "Nome Campus"
    description: "Nome do Campus"
    sql: ${TABLE}."NM_CAMPUS" ;;
  }

  dimension: nm_produto {
    type: string
    label: "Nome Produto"
    description: "Nome do Produto"
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: id_produto {
    type: string
    label: "ID Produto"
    description: "ID de identificação do Produto"
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

}
