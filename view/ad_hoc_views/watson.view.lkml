# The name of this view in Looker is "Watson"
view: watson {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."WATSON"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Action" in Explore.

  dimension: action {
    type: string
    sql: ${TABLE}."ACTION" ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}."CHANNEL" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: datetime {
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
    sql: ${TABLE}."DATETIME" ;;
  }

  dimension: ducument {
    type: string
    sql: ${TABLE}."DUCUMENT" ;;
  }

  dimension: environment {
    type: string
    sql: ${TABLE}."ENVIRONMENT" ;;
  }

  dimension: last_bot_message {
    type: string
    sql: ${TABLE}."LAST_BOT_MESSAGE" ;;
  }

  dimension: last_customer_message {
    type: string
    sql: ${TABLE}."LAST_CUSTOMER_MESSAGE" ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}."PHONE_NUMBER" ;;
  }

  dimension: retention_tag {
    type: string
    sql: ${TABLE}."RETENTION_TAG" ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}."SESSION_ID" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are count, sum, and average
  # measures for numeric dimensions, but you can also add measures of many different types.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: count {
    type: count
    drill_fields: [id]
  }
}

# These sum and average measures are hidden by default.
# If you want them to show up in your explore, remove hidden: yes.
