# The name of this view in Looker is "Pulse"
view: pulse {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."PULSE"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Data Pesquisa" in Explore.

  dimension: data_pesquisa {
    type: date
    sql: ${TABLE}."DATA_PESQUISA" ;;
  }

  dimension: diretoria {
    type: string
    sql: ${TABLE}."DIRETORIA" ;;
  }

  dimension: grau_concordancia {
    type: string
    sql: ${TABLE}."GRAU_CONCORDANCIA" ;;
  }

  dimension: grau_concordancia_objetivo {
    type: string
    sql: ${TABLE}."GRAU_CONCORDANCIA_OBJETIVO" ;;
  }

  dimension: sentimento {
    type: string
    sql: ${TABLE}."SENTIMENTO" ;;
  }

  dimension: sentimento_cat {
    type: number
    sql: ${TABLE}."SENTIMENTO_CAT" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sentimento_cat {
    type: sum
    sql: ${sentimento_cat} ;;
  }

  measure: average_sentimento_cat {
    type: average
    sql: ${sentimento_cat} ;;
  }

  dimension: tempo_casa {
    type: string
    sql: ${TABLE}."TEMPO_CASA" ;;
  }

  dimension: tempo_casa_sort {
    label: "Tempo de Casa (Ordenação)"
    type: number
    sql: CASE ${TABLE}."TEMPO_CASA"
      WHEN '3 meses ou menos' THEN 1
      WHEN 'Entre 4 e 6 meses' THEN 2
      WHEN 'Entre 7 e 11 meses' THEN 3
      WHEN 'Entre 1 ano e 1 ano e 11 meses' THEN 4
      WHEN '2 anos ou mais'  THEN 5
      ELSE 0
    END;;
    description: "Este campo é uma regra de negócio*. Indica a ordenadação de 1 à 5 a faixa de tempo do Pravalente. Então: 3 meses ou menos = 1; entre 4 e 6 meses = 2; entre 7 e 11 = 3; entre 1 ano e 1 ano e 11 meses = 4; 2 anos ou mais = 5; e caso contrário, não atender essas regras o valor será = 0"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
