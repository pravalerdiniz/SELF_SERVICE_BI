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
    group_label: "Quantidade de Interações por Canal"
    group_item_label: "Brandformance"
  }

  measure: total_brandformance {
    type: sum
    group_label: "Quantidade de Interações por Canal"
    sql: ${brandformance} ;;
  }

  measure: average_brandformance {
    type: average
    group_label: "Quantidade de Interações por Canal"
    sql: ${brandformance} ;;
  }

  measure: median_brandformance {
    type: median
    group_label: "Quantidade de Interações por Canal"
    sql: ${brandformance} ;;
  }


  dimension: call_center {
    type: number
    sql: ${TABLE}."CALL_CENTER" ;;
    group_label: "Quantidade de Interações por Canal"
    group_item_label: "Call Center"
  }

  measure: total_call_center {
    type: sum
    group_label: "Quantidade de Interações por Canal"
    sql: ${call_center} ;;
  }

  measure: average_call_center {
    type: average
    group_label: "Quantidade de Interações por Canal"
    sql: ${call_center} ;;
  }

  measure: median_call_center {
    type: median
    group_label: "Quantidade de Interações por Canal"
    sql: ${call_center} ;;
  }

  dimension: canal_descoberta {
    type: string
    sql: ${TABLE}."CANAL_DESCOBERTA" ;;
    label: "Canal de Descoberta (First Click)"
    group_label: "Dados de Atribuição"
  }


  dimension: canal_finalizacao {
    type: string
    sql: ${TABLE}."CANAL_FINALIZACAO" ;;
    label: "Canal de Finalização (Last Click)"
    group_label: "Dados de Atribuição"
  }

  dimension: descoberta_final {
    type: string
    sql: concat(${canal_descoberta},'-',${canal_finalizacao}) ;;
    label: "Canal Descoberta + Finalização"
    group_label: "Dados de Atribuição"
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
    group_label: "Dados de Atribuição"
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
    group_label: "Dados de Atribuição"
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
    group_label: "Dados de Atribuição"
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
    group_label: "Quantidade de Interações por Canal"
    group_item_label: "Faculdade"
  }

  measure: total_faculdade {
    type: sum
    group_label: "Quantidade de Interações por Canal"
    sql: ${faculdade} ;;
  }

  measure: average_faculdade {
    type: average
    group_label: "Quantidade de Interações por Canal"
    sql: ${brandformance} ;;
  }

  measure: median_faculdade {
    type: median
    group_label: "Quantidade de Interações por Canal"
    sql: ${brandformance} ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    hidden: yes
  }

  dimension: itau {
    type: number
    sql: ${TABLE}."ITAU" ;;
    group_label: "Quantidade de Interações por Canal"
    group_item_label: "Itaú"
  }

  measure: total_itau {
    type: sum
    group_label: "Quantidade de Interações por Canal"
    sql: ${itau} ;;
  }

  measure: average_itau {
    type: average
    group_label: "Quantidade de Interações por Canal"
    sql: ${itau} ;;
  }

  measure: median_itau {
    type: median
    group_label: "Quantidade de Interações por Canal"
    sql: ${itau} ;;
}

  dimension: mgm {
    type: number
    sql: ${TABLE}."MGM" ;;
    group_label: "Quantidade de Interações por Canal"
    group_item_label: "MGM"
  }

  measure: total_mgm {
    type: sum
    group_label: "Quantidade de Interações por Canal"
    sql: ${mgm} ;;
  }

    measure: average_mgm {
      type: average
      group_label: "Quantidade de Interações por Canal"
      sql: ${mgm} ;;
    }

    measure: median_mgm {
      type: median
      group_label: "Quantidade de Interações por Canal"
      sql: ${mgm} ;;
      }

  dimension: organico {
    type: number
    sql: ${TABLE}."ORGANICO" ;;
    group_label: "Quantidade de Interações por Canal"
    group_item_label: "Orgânico"
  }

  measure: total_organico {
    type: sum
    group_label: "Quantidade de Interações por Canal"
    sql: ${organico} ;;
  }

  measure: average_organico {
    type: average
    group_label: "Quantidade de Interações por Canal"
    sql: ${organico} ;;
  }

  measure: median_organico {
    type: median
    group_label: "Quantidade de Interações por Canal"
    sql: ${organico} ;;
  }

  dimension: outros {
    type: number
    sql: ${TABLE}."OUTROS" ;;
    group_label: "Quantidade de Interações por Canal"
    group_item_label: "Outros"
  }

  measure: total_outros {
    type: sum
    group_label: "Quantidade de Interações por Canal"
    sql: ${outros} ;;
  }

  measure: average_outros {
    type: average
    group_label: "Quantidade de Interações por Canal"
    sql: ${outros} ;;
  }

  measure: median_outros {
    type: median
    group_label: "Quantidade de Interações por Canal"
    sql: ${outros} ;;
}

  dimension: pago {
    type: number
    sql: ${TABLE}."PAGO" ;;
    group_label: "Quantidade de Interações por Canal"
    group_item_label: "Pago"
  }

  measure: total_pago {
    type: sum
    group_label: "Quantidade de Interações por Canal"
    sql: ${pago} ;;
  }

  measure: average_pago {
    type: average
    group_label: "Quantidade de Interações por Canal"
    sql: ${pago} ;;
  }

  measure: median_pago {
    type: median
    group_label: "Quantidade de Interações por Canal"
    sql: ${pago} ;;
  }

  dimension: qtd_canais_distintos {
    type: number
    sql: ${TABLE}."QTD_CANAIS_DISTINTOS" ;;
    group_label: "Quantidade de Canais Distintos"
  }

  measure: total_qtde_canais_distintos {
    type: sum
    sql: ${qtd_canais_distintos} ;;
    group_label: "Quantidade de Canais Distintos"
    label: "Total"
  }

  measure: average_qtde_canais_distintos {
    type: average
    sql: ${qtd_canais_distintos} ;;
    group_label: "Quantidade de Canais Distintos"
    label: "Média"
  }

  measure: median_qtde_canais_distintos {
    type: median
    sql: ${qtd_canais_distintos} ;;
    group_label: "Quantidade de Canais Distintos"
    label: "Mediana"
  }

  dimension: qtd_total_iteracoes {
    type: number
    sql: ${TABLE}."QTD_TOTAL_ITERACOES" ;;
    label: "Quantidade Total de Interações"
  }

 measure: total_qtde_iteracoes {
    type: sum
    group_label: "Quantidade de Interações por Canal"
    sql: ${qtd_total_iteracoes} ;;
  }

  measure: average_qtde_iteracoes {
    type: average
    group_label: "Quantidade de Interações por Canal"
    sql: ${qtd_total_iteracoes} ;;
  }

  measure: median_qtde_iteracoes {
    type: median
    group_label: "Quantidade de Interações por Canal"
    sql: ${qtd_total_iteracoes} ;;
  }

  measure: count_id_cpf {
    type: count_distinct
    sql: ${id_cpf} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Valor"
    description: "Contagem de ID CPFs únicos"
    value_format: "0"
  }

  measure: perc_cpf {
    type: percent_of_total
    sql: ${count_id_cpf} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Porcentagem"
    description: "Porcentagem do total de ID CPFs únicos"
    value_format: "0%"
  }

  }
