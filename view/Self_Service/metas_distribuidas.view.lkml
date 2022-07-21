# The name of this view in Looker is "Metas Distribuidas"
view: metas_distribuidas {
  sql_table_name: "COMERCIAL"."METAS_DISTRIBUIDAS"
    ;;

  dimension: chave {
    type: string
    hidden: yes
    primary_key: yes
    sql: concat(${data_meta_date},${gerente}, ${grupo}, ${id_instituicao}, ${id_campus}) ;;
  }

  dimension: ano_mes {
    type: string
    label: "Ano mês"
    description: "Indica o ano mês da meta"
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension_group: data_meta {
    type: time
    timeframes: [
    raw,
    time,
    date,
    week,
    day_of_month,
    month,
    month_name,
    quarter,
    year
    ]
    convert_tz: no
    datatype: date
    label: "Data Meta"
    description: "Indica a data da meta"
    sql: ${TABLE}."DATA_META" ;;
  }

  dimension: gerente {
    type: string
    label: "Gerente"
    description: "Indica o gerente da carteira"
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: grupo {
    type: string
    label: "Grupo instituição"
    description: "Indica o grupo da instituição"
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: id_campus {
    type: string
    label: "ID Campus"
    description: "Indica ID do Campus"
    sql: ${TABLE}."ID_CAMPUS" ;;
  }

  dimension: id_instituicao {
    type: string
    label: "ID Instituição"
    description: "Indica ID da Instituição"
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  measure: m_final {
    type: sum
    sql: ${TABLE}."M_FINAL" ;;
    group_label: "Metas"
    group_item_label: "Finalizado"
  }

  measure: m_form {
    type: sum
    sql: ${TABLE}."M_FORM" ;;
    group_label: "Metas"
    group_item_label: "Formalizado"
  }

  measure: m_inic {
    type: sum
    sql: ${TABLE}."M_INIC" ;;
    group_label: "Metas"
    group_item_label: "Iniciado"
  }
}
