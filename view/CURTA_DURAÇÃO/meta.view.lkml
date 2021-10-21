# The name of this view in Looker is "Meta"
view: meta {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name:"VETERANO"."CURTA"."META"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ano" in Explore.

  dimension: ano {
    type: number
    hidden: yes
    sql: ${TABLE}."ANO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.




  dimension_group: data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Meta"
    sql: ${TABLE}."DATA" ;;
  }

  dimension: mes {
    type: string
    hidden: yes
    sql: ${TABLE}."MES" ;;
  }

  dimension: meta {
    type: number
    label: "Meta"
    sql: ${TABLE}."META" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: []
  }

  # These sum and average measures are hidden by default.
  # If you want them to show up in your explore, remove hidden: yes.

  measure: total_ano {
    type: sum
    hidden: yes
    sql: ${ano} ;;
  }

  measure: average_ano {
    type: average
    hidden: yes
    sql: ${ano} ;;
  }

  measure: total_meta {
    type: sum
    sql: ${meta} ;;
  }

  measure: average_meta {
    type: average
    sql: ${meta} ;;
  }
}
