view: enps_flatten {
  derived_table: {
    sql: select
          a.id_resposta,
          a.id_frase,
          a.sentimento,
          a.magnitude,
          a.frase,
          f.key as palavra,
          f.value as quantidade
      from (
          select
              id_resposta,
              f.key as id_frase,
              f.value:"sentimento" as sentimento,
              f.value:"magnitude" as magnitude,
              f.value:"palavras" as palavras,
              f.value:"frase" as frase
          from graduado.gente_gestao.enps a,
          lateral flatten (input => analise) f
      ) a,
      lateral flatten (input => palavras) f
       ;;
  }

  dimension: pk {
    type: string
    sql: concat(${id_frase},'#',${palavra}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension: id_resposta {
    type: number
    sql: ${TABLE}."ID_RESPOSTA" ;;
  }

  dimension: id_frase {
    type: string
    sql: ${TABLE}."ID_FRASE" ;;
    hidden: yes
  }

  dimension: frase {
    type: string
    sql: ${TABLE}."FRASE" ;;
    label: "Frase"
    description: "Descrição das frases das respostas dos colaboradores."
  }

  dimension: sentimento_numero {
    type: string
    sql: ${TABLE}."SENTIMENTO" ;;
    label: "Sentimento - Valor"
    hidden: yes
  }

  dimension: magnitude_numero {
    type: string
    sql: ${TABLE}."MAGNITUDE" ;;
    label: "Magnitude - Valor"
    hidden: yes
  }

  dimension: sentimento {
    type: string
    sql: case when ${sentimento_numero} <= -0.2 then 'NEGATIVO'
              when ${sentimento_numero} <= 0.2 then 'NEUTRO'
              else 'POSITIVO'
         end;;
    label: "Sentimento"
    description: "Indica o sentimento da frase da resposta do colaborador."
  }

  dimension: palavra {
    type: string
    sql: ${TABLE}."PALAVRA" ;;
    label: "Palavra"
    description: "Palavras-chave da resposta do colaborador."
    link: {
      label: "Análise de Sentimento"
      url: "/dashboards-next/345?Palavra=
      {{ value }}&Objetivo da Pesquisa={{ _filters['enps.objetivo'] | url_encode }}
      &Mês da Pesquisa={{ _filters['enps.data_fim_pesquisa_month'] | url_encode }}
      &Área do Colaborador={{ _filters['enps.area'] | url_encode }}
      &Tempo de Casa={{ _filters['enps.tempo_casa'] | url_encode }}
      &Ano de Ingresso={{ _filters['enps.ano_ingresso'] | url_encode }}
      &Trimestre de Ingresso={{ _filters['enps.trimestre_ingresso'] | url_encode }}"
    }
  }

  dimension: quantidade {
    type: string
    sql: ${TABLE}."QUANTIDADE" ;;
    hidden: yes
  }

  measure: count {
    type: count
    label: "Quantidade de Linhas - Valor"
    description: "Indica a quantidade total de linhas da tabela."
  }

  measure: count_perc {
    type: percent_of_total
    sql: ${count} ;;
    label: "Quantidade de Linhas - Porcentagem"
    description: "Indica a quantidade total de linhas da tabela, em porcentagem."
  }

  measure: avg_sentimento {
    type: average_distinct
    sql: ${sentimento_numero} ;;
    sql_distinct_key: ${id_frase} ;;
    value_format: "0.##"
    label: "Sentimento Médio"
    description: "Indica a média do sentimento das frases analisadas. Valores abaixo de -0.2 indica maior sentimento negativo, Valores entre -0.2 e 0.2 indicam sentimento neutro. Valores acima de 0.2 indicam sentimento positivo."
  }

  measure: qtd_palavra {
    type: sum
    sql: ${quantidade} ;;
    label: "Quantidade das Palavras"
    description: "Soma do total de vezes em que a palavra apareceu nas respostas."
  }
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: enps_flatten {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
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
# }
