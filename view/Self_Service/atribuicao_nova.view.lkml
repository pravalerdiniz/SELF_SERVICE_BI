# The name of this view in Looker is "Atribuicao"
view: atribuicao_nova {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "SELF_SERVICE_BI"."ATRIBUICAO"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Brandformance" in Explore.

  dimension: brandformance {
    type: number
    sql: ${TABLE}."BRANDFORMANCE" ;;
    group_label: "Quantidade de Iterações por Canal"
    group_item_label: "Brandformance"
  }

  measure: total_brandformance {
    type: sum
    sql: ${brandformance} ;;
  }

  dimension: call_center {
    type: number
    sql: ${TABLE}."CALL_CENTER" ;;
    group_label: "Quantidade de Iterações por Canal"
    group_item_label: "Call Center"
  }

  dimension: canal_descoberta {
    type: string
    sql: ${TABLE}."CANAL_DESCOBERTA" ;;
    label: "Canal de Descoberta (First Click)"
  }

  dimension: canal_finalizacao {
    type: string
    sql: ${TABLE}."CANAL_FINALIZACAO" ;;
    label: "Canal de Finalização (Last Click)"
  }

  dimension_group: data_descoberta {
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
    sql: ${TABLE}."DATA_DESCOBERTA" ;;
    label: "Data de Descoberta"
    description: "Data da primeira interação do aluno (first click) com o Pravaler"
  }

  dimension_group: data_finalizacao {
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
    sql: ${TABLE}."DATA_FINALIZACAO" ;;
    label: "Data de Finalização"
    description: "Data da interação do aluno referente à finalização da proposta (last click) com o Pravaler"
  }

  dimension_group: data_primeira_proposta {
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
    sql: ${TABLE}."DATA_PRIMEIRA_PROPOSTA" ;;
    label: "Data da Primeira Proposta"
    description: "Data da primeira proposta do aluno com o Pravaler"
  }


  dimension_group: data_ultima_proposta {
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
    sql: ${TABLE}."DATA_ULTIMA_PROPOSTA" ;;
    label: "Data da Última Proposta"
    description: "Data da última proposta do aluno com o Pravaler"
  }

  dimension: faculdade {
    type: number
    sql: ${TABLE}."FACULDADE" ;;
    group_label: "Quantidade de Iterações por Canal"
    group_item_label: "Faculdade"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    hidden: yes
  }

  dimension: itau {
    type: number
    sql: ${TABLE}."ITAU" ;;
    group_label: "Quantidade de Iterações por Canal"
    group_item_label: "Itaú"
  }

  dimension: mgm {
    type: number
    sql: ${TABLE}."MGM" ;;
    group_label: "Quantidade de Iterações por Canal"
    group_item_label: "MGM"
  }

  dimension: organico {
    type: number
    sql: ${TABLE}."ORGANICO" ;;
    group_label: "Quantidade de Iterações por Canal"
    group_item_label: "Orgânico"
  }

  dimension: outros {
    type: number
    sql: ${TABLE}."OUTROS" ;;
    group_label: "Quantidade de Iterações por Canal"
    group_item_label: "Outros"
  }

  dimension: pago {
    type: number
    sql: ${TABLE}."PAGO" ;;
    group_label: "Quantidade de Iterações por Canal"
    group_item_label: "Pago"
  }

  dimension: qtd_canais_distintos {
    type: number
    sql: ${TABLE}."QTD_CANAIS_DISTINTOS" ;;
    label: "Quantidade de Canais Distintos"
  }

  dimension: qtd_total_iteracoes {
    type: number
    sql: ${TABLE}."QTD_TOTAL_ITERACOES" ;;
    label: "Quantidade Total de Iterações"
  }

  }