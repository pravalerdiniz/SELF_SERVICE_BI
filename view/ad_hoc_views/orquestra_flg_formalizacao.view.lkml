view: orquestra_flg_formalizacao {

   derived_table: {
     sql: SELECT DISTINCT NUMERO_CHAMADO, true as formalizacao
          FROM GRADUADO.AD_HOC.ORQUESTRA
          WHERE NOME_TASK IN ('T40 - Analisar Solicitação - Formalização', 'T21 - Formalização')

       ;;
   }

   # Define your dimensions and measures here, like this:
   dimension: numero_chamado {
     description: "id do chamado no orquestra"
     type: number
     sql: ${TABLE}.numero_chamado ;;
   }

   dimension: flg_formalizacao {
     description: "Flag para marcar chamados que passaram por formalização."
     type: yesno
     sql: ${TABLE}.formalizacao ;;
   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
 }
