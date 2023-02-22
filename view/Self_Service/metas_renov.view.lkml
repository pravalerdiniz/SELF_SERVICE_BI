view: metas_renov {
  derived_table: {
    sql: select cast('2023-01-01' as date) as MesAno,'5844.7010960452' as MetaForm
    union select cast('2023-02-01' as date) ,'8710.8510655169'
    union select cast('2023-03-01' as date) ,'7502.95486833846'
    union select cast('2023-04-01' as date) ,'4045.05241596457'
    union select cast('2023-05-01' as date) ,'2324.95096481316'
   union select cast('2023-06-01' as date) ,'3669.28958932171'
    union select cast('2023-07-01' as date) ,'8899.47662527032'
    union select cast('2023-08-01' as date) ,'14275.0999149036'
    union select cast('2023-09-01' as date),'9049.21543556651'
    union select cast('2023-10-01' as date),'4746.72028638927'
   union select cast('2023-11-01' as date) ,'4750.46375664668'
   union select cast('2023-12-01' as date) ,'3354.40210202899'
    ;;
    }

  dimension_group: date {
    type: time
    timeframes: [
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."MesAno" ;;
  }

  measure: meta_formalizados {
    type: sum
    sql: ${TABLE}."MetaForm" ;;
    value_format: "0"
    label: "Meta de Formalizados (Renov)"
  }

  dimension: mes_ano {
    type:  string
    sql: ${TABLE}."MesAno" ;;
  }


    }
