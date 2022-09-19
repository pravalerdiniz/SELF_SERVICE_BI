# The name of this view in Looker is "Zoho Reports"
view: zoho_reports {

  sql_table_name: "POS_GRADUADO"."MARKETING"."LEADS_TRADE"
    ;;

  dimension: chave {
    type: string
    label: "Chave"
    primary_key: yes
    hidden: yes
    sql: concat(${data_evento_date},${analista},${email},${nome_evento}) ;;
  }

  dimension_group: data_evento {
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
    label: "Data do evento"
    description: "Indica a data que ocorreu o evento"
    sql: ${TABLE}."DATA_EVENTO" ;;
  }

  dimension: cpf {
    type: number
    label: "CPF lead"
    description: "Indica o CPF do lead capturado no evento"
    sql: ${TABLE}."CPF" ;;
  }


  dimension: email {
    type: string
    label: "Email do lead"
    description: "Indica o email do lead capturado no evento"
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: nome_evento {
    type: string
    label: "Nome Evento"
    description: "Indica o nome do Evento"
    sql: ${TABLE}."NOME_EVENTO" ;;
  }

  dimension: nome_sobrenome {
    type: string
    label: "Nome lead"
    description: "Indica o nome do lead capturado no evento"
    sql: ${TABLE}."NOME_SOBRENOME" ;;
  }

  dimension: ies {
    type: string
    label: "Nome da Instituição"
    description: "Indica o nome da Instituição de Ensino"
    sql: ${TABLE}."IES" ;;
  }

  dimension: grupo_ies {
    type: string
    label: "Grupo da Instituição"
    description: "Indica o nome do Grupo da Instituição de Ensino"
    sql: ${TABLE}."GRUPO_IES" ;;
  }

  dimension: analista {
    type: string
    label: "Analista responsável"
    description: "Indica o nome da analista responsável pelo evento"
    sql: ${TABLE}."ANALISTA" ;;
  }

  dimension: telefone {
    type: number
    label: "Telefone lead"
    description: "Indica o telefone do lead capturado no evento"
    sql: ${TABLE}."TELEFONE" ;;
  }

  measure: total_email {
    type: count_distinct
    label: "Qtd de leads"
    description: "Quantidade de leads por evento"
    sql: ${email} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
