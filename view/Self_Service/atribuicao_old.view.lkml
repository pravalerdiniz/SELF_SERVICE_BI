view: atribuicao_old {
  sql_table_name: veterano."FATO"."ATRIBUICAO"
    ;;

  dimension: canal {
    type: string
    sql: ${TABLE}."CANAL" ;;
    description: "Este campo é uma regra de negócio*. Indica o canal atribuido a partir da URL de acesso. São eles: PAGO, ITAU, ORGANICO, MGM, FACULDADE E BRANDFORMANCE."
  }

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA" ;;
    description: "Data de acesso"
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
    hidden: yes
    description: "Indica o e-mail"
  }

  dimension: etapa {
    type: string
    sql: ${TABLE}."FASE_STATUS" ;;
    description: "Indica a atribuição referente a cada etapa: Lead, Iniciado e Finalizado."
  }

  dimension: fonte {
    type: string
    sql: ${TABLE}."FONTE" ;;
    description: "Indica se o dado é proveniente do BackOffice ou da RV."
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
    hidden: yes
  }

  dimension: url {
    type: string
    sql: ${TABLE}."URL" ;;
    description: "Indica a URL para atribuição do canal."
  }

  measure: quantidade {
    type: count
    drill_fields: []
  }

  measure: conta_email {
    type: count
    hidden: yes
  }

  measure: percentual {
    type: percent_of_total
    sql: ${conta_email} ;;


  }
}
