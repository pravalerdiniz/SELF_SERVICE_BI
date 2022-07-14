# The name of this view in Looker is "Zoho Reports"
view: zoho_reports {

  sql_table_name: "AD_HOC"."ZOHO_REPORTS"
    ;;

  dimension: cpf_evento {
    type: string
    label: "Chave"
    primary_key: yes
    hidden: yes
    sql: concat(${cpf},${nome_evento_ies}) ;;
  }

  dimension_group: added {
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
    label: "Data que o registro foi adicionado"
    description: "Indica a data que o registro foi adicionado no banco"
    sql: ${TABLE}."ADDED_DATE" ;;
  }

  dimension: cpf {
    type: number
    label: "CPF lead"
    description: "Indica o CPF do lead capturado no evento"
    sql: ${TABLE}."CPF" ;;
  }

  measure: total_cpf {
    type: sum
    label: "Qtd de leads"
    description: "Quantidade de leads por evento"
    sql: ${cpf} ;;
  }

  dimension: email {
    type: string
    label: "Email do lead"
    description: "Indica o email do lead capturado no evento"
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: nome_evento_ies {
    type: string
    label: "Nome Evento"
    description: "Indica o nome do Evento"
    sql: ${TABLE}."NOME_EVENTO_IES" ;;
  }

  dimension: nome_sobrenome {
    type: string
    label: "Nome lead"
    description: "Indica o nome do lead capturado no evento"
    sql: ${TABLE}."NOME_SOBRENOME" ;;
  }

  dimension: telefone {
    type: number
    label: "Telefone lead"
    description: "Indica o telefone do lead capturado no evento"
    sql: ${TABLE}."TELEFONE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
