#view criada para levar os campos de conversão histórica para a consulta de envio da base da konecta através
#do join desta view com o explore da jornada
#Racional de cálculo do campo conversão histórica conforme cálculo realizado no dashboard 1418

#DASH:: https://pravaler.sa.looker.com/dashboards/1418
#BASE KONECTA:: https://pravaler.sa.looker.com/looks/3329
#BASE KONECTA:: https://pravaler.sa.looker.com/looks/3330

view: konecta_conv_hist {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."BASE_KONECTA" ;;

  dimension: grupo {
    type: string
    label: "Grupo IES"
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: conv_hist {
    type: number
    label: "Conversão Histórica"
    description: "Indica a conversão histórica por abertura de GRUPO e CURSO de acordo com o racional do dashboard 1418"
    value_format: "0.00%"
    sql: ${TABLE}."CONV_HIST" ;;
  }

}
