 view: reprov_risco_biometria {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT ID_ALUNO, TIPO_EVENTO
          FROM  VETERANO.CURTA.STATUS s
          where s.TIPO_EVENTO IN ('STUDENT.RISK.DISAPPROVED', 'STUDENT.IDENTIFICATION.REPROVED')
            AND ID_ALUNO NOT IN (SELECT ID_ALUNO
                                  FROM  VETERANO.CURTA.STATUS aux
                                  where aux.TIPO_EVENTO IN ('STUDENT.RISK.APPROVED')
                                  )
       ;;
   }

   # Define your dimensions and measures here, like this:
   dimension: aluno_id {
     description: "ID do aluno que foi reprovado na análise de risco ou biometria."
     type: number
     sql: ${TABLE}."ID_ALUNO" ;;
    hidden: yes
   }

   dimension: reprov_risk_biometry {
     description: "Aluno (ID) foi reprovado na análise de risco ou na biometria."
     type: string
     sql: ${TABLE}."TIPO_EVENTO" ;;
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
