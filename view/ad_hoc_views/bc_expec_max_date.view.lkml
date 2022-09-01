view: bc_expec_max_date {
    # Or, you could make this view a derived table, like this:
    derived_table: {
      sql:
          SELECT MAX(DATA) DATA, DATAREFERENCIA, true as flg_max
          FROM  "GRADUADO"."AD_HOC"."BC_EXPECTATIVAS_MERCADO" AS bc_expec_max_date
          GROUP BY bc_expec_max_date.DATAREFERENCIA
       ;;
    }

    # Define your dimensions and measures here, like this:
    dimension: bc_max_date {
      description: "Data mais recente da pesquisa de expectativas para a taxa IPCA."
      type: date
      sql: ${TABLE}."DATA" ;;
      hidden: yes
    }

  dimension: datareferencia {
    type: date_month
    label: "Data Referência"
    description: "Data de referência para qual a estatística é esperada"
    sql: date_from_parts (substr(${TABLE}."DATAREFERENCIA", 4,5),substr(${TABLE}."DATAREFERENCIA", 1, 2),1) ;;
    hidden: yes
  }

  dimension: flg_max {
    description: "Flag para data mais recente da pesquisa."
    type: yesno
    sql: flg_max ;;
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
