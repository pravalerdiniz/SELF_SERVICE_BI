# The name of this view in Looker is "Treinamento Data Driven"
view: treinamento_data_driven {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."TREINAMENTO_DATA_DRIVEN"
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
  # This dimension will be called "Area" in Explore.

  dimension: area {
    type: string
    label: "Área"
    description: "Indica a área do funcionário que teve o treinamento"
    sql: ${TABLE}."AREA" ;;
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
    label: "Treinamento"
    description: "Indica a data em que o treinamento foi realizado"
    sql: ${TABLE}."DATA" ;;
  }

  dimension: diretoria {
    type: string
    label: "Diretoria"
    description: "Indica qual a diretoria do funcionário"
    sql: ${TABLE}."DIRETORIA" ;;
  }

  dimension: lider {
    type: string
    label: "Lider"
    description: "Indica qual o lider do funcionário na realização do treinamento"
    sql: ${TABLE}."LIDER" ;;
  }

  dimension: nivel {
    type: string
    label: "Nivel do Treinamento"
    description: "Indica qual o nível do treinamento realizado pelo funcionário"
    sql: ${TABLE}."NIVEL" ;;
  }

  dimension: nome {
    type: string
    label: "Nome do Funcionário"
    description: "Indica o nome do funcionário que realizou o treinamento"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: teste {
    type: number
    label: "Teste de Conhecimento?"
    description: "Indica se o funcionário realizou o teste de conhecimento. Ex: 1 = Sim | 0 = Não"
    sql: ${TABLE}."TESTE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.



  dimension: teste_resultado {
    type: number
    label: "% Teste de Conhecimento - Resultado"
    description: "Indica a porcentagem do resultado do teste de conhecimento aplicado"
    sql: ${TABLE}."TESTE_RESULTADO" ;;
  }

  dimension: treinamento {
    type: number
    label: "Teste de Conhecimento?"
    description: "Indica se o funcionário realizou o treinamento. Ex: 1 = Sim | 0 = Não"
    sql: ${TABLE}."TREINAMENTO" ;;
  }

  measure: count {
    type: count
    drill_fields: [id,
                   nome,
                  area,
                  lider,
                  diretoria,
                  treinamento,
                  teste,
                  teste_resultado,
                  data_raw]
  }


  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
    group_label: "Quantidade de Funcionários"
    label: "Valor"
    drill_fields: [id,
      nome,
      area,
      lider,
      diretoria,
      treinamento,
      teste,
      teste_resultado,
      data_raw]
  }


  measure: perc_count {
    type: percent_of_total
    sql: ${count_distinct} ;;
    group_label: "Quantidade de Funcionários"
    label: "Porcentagem"
    drill_fields: [id,
      nome,
      area,
      lider,
      diretoria,
      treinamento,
      teste,
      teste_resultado,
      data_raw]
  }


  measure: avg_teste_resultado {
    type: average
    sql: ${teste_resultado} ;;
    label: "Mèdia - Teste de Conhecimento"
    value_format: "%00.00"
  }






}
