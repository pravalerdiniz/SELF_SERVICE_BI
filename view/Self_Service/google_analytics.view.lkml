# The name of this view in Looker is "Google Analytics"
view: google_analytics {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SELF_SERVICE_BI"."GOOGLE_ANALYTICS"
    ;;
    label: "Google Analytics"

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ads Conversao Hora" in Explore.

  dimension: ads_conversao_hora {
    type: string
    sql: ${TABLE}."ADS_CONVERSAO_HORA" ;;
    hidden: yes
  }

  dimension: campanha_ads_cost {
    type: string
    sql: ${TABLE}."CAMPANHA_ADS_COST" ;;
    hidden: yes
  }

  dimension: campanha_ads_etapas {
    type: string
    sql: ${TABLE}."CAMPANHA_ADS_ETAPAS" ;;
    hidden: yes
  }

  dimension: campanha_aquisicao_conv {
    type: string
    sql: ${TABLE}."CAMPANHA_AQUISICAO_CONV" ;;
    hidden: yes
  }

  dimension: canal_aquisicao_conversao {
    type: string
    sql: ${TABLE}."CANAL_AQUISICAO_CONVERSAO" ;;
    hidden: yes
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [ week_of_year,
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no

    sql: ${TABLE}."DATE" ;;
    label: "Data da sessão"
    description: "Data considerada para análise do site"
  }

  dimension: etapas {
    type: string
    sql: ${TABLE}."ETAPAS" ;;
    hidden: yes
  }

  dimension: midia_aquisicao_conversao {
    type: string
    sql: ${TABLE}."MIDIA_AQUISICAO_CONVERSAO" ;;
    hidden: yes
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}."NEW_USERS" ;;
    hidden: yes
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_new_users {
    type: sum
    sql: ${new_users} ;;
    label: "Soma"
    description: "Soma total de novos usuarios no site"
    group_label: "Novos Usuarios"
  }

  measure: average_new_users {
    type: average
    sql: ${new_users} ;;
    label: "Média"
    description: "Média de novos usuarios"
    group_label: "Novos Usuarios"
  }

  dimension: origem_aquisicao_conversao {
    type: string
    sql: ${TABLE}."ORIGEM_AQUISICAO_CONVERSAO" ;;
    hidden: yes
  }

  dimension: origem_midia_aquisicao_conversao {
    type: string
    sql: ${TABLE}."ORIGEM_MIDIA_AQUISICAO_CONVERSAO" ;;
    hidden: yes
  }

  dimension: overview_campanha {
    type: string
    sql: ${TABLE}."OVERVIEW_CAMPANHA" ;;
    hidden: yes
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}."SESSIONS" ;;

  }

  measure: total_sessions{
    type: sum
    sql: ${sessions} ;;
    label: "Soma"
    description: "Soma das sessões no site"
    group_label: "Sessões"
  }

  measure: average_sessions {
    type: average
    sql: ${sessions} ;;
    label: "Média"
    description: "Média das sessões no site"
    group_label: "Sessões"
  }

  dimension: urldestino_aquisicao {
    type: string
    sql: ${TABLE}."URLDESTINO_AQUISICAO" ;;
    hidden: yes
  }

  dimension: users {
    type: number
    sql: ${TABLE}."USERS" ;;
  }

  measure: total_users {
  type: sum
  sql: ${users} ;;
  label: "Soma"
  description: "Soma total dos usuários do site"
  group_label: "Usuários"
}

  measure: average_users {
  type: average
  sql: ${users} ;;
  label: "Média"
  description: "Média dos usuários do site"
  group_label: "Usuários"
}


  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

}
