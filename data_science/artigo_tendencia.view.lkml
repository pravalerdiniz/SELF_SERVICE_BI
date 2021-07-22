view: artigo_tendencia {
  sql_table_name: "GRADUADO"."DATA_SCIENCE"."ARTIGO_TENDENCIA"
    ;;

  dimension_group: artigo_data_publicacao {
    group_item_label: "Data Publicação"
    description: "Data Publicação do Artigo"
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
    sql: ${TABLE}."ARTIGO_DATA_PUBLICACAO" ;;
  }

  dimension: artigo_id {
    group_item_label: "ID Artigo"
    description: "Identificação do Artigo"
    type: string
    sql: ${TABLE}."ARTIGO_ID" ;;
  }

  dimension: artigo_link {
    group_item_label: "Link Artigo"
    description: "Link do Artigo"
    type: string
    sql: ${TABLE}."ARTIGO_LINK" ;;
  }

  dimension: artigo_texto {
    group_item_label: "Texto Artigo"
    description: "Texto do Artigo"
    type: string
    sql: ${TABLE}."ARTIGO_TEXTO" ;;
  }

  dimension: artigo_texto2 {
    group_item_label: "Texto Artigo2"
    description: "Texto do Artigo"
    type: string
    sql: ${TABLE}."ARTIGO_TEXTO" ;;
  }

  dimension: artigo_texto3 {
    group_item_label: "Texto Artigo3"
    description: "Texto do Artigo"
    type: string
    sql: ${TABLE}."ARTIGO_TEXTO" ;;
  }

  dimension: artigo_titulo {
    group_item_label: "Título Artigo"
    description: "Título do Artigo"
    type: string
    sql: ${TABLE}."ARTIGO_TITULO" ;;
  }

  measure: tendencia {
    group_item_label: "Valor Tendência"
    description: "Valor da Tendência"
    type: sum
    sql: ${TABLE}."TENDENCIA" ;;
  }

  dimension: tendencia_ano_semana {
    group_item_label: "Ano e Semana do Ano"
    description: "Ano e Semana do Ano da Tendência"
    type: string
    sql: ${TABLE}."TENDENCIA_ANO_SEMANA" ;;
  }

  dimension_group: tendencia_data {
    group_item_label: "Data"
    description: "Data da Tendência"
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
    sql: ${TABLE}."TENDENCIA_DATA" ;;
  }

  dimension: tendencia_semana {
    group_item_label: "Semana do Ano"
    description: "Semana no Ano da Tendência"
    type: number
    sql: ${TABLE}."TENDENCIA_SEMANA" ;;
  }

  dimension: topico {
    group_item_label: "Tópico"
    description: "Tópico"
    type: string
    sql: ${TABLE}."TOPICO" ;;
  }

  measure: topico_contagem {
    group_item_label: "Contagem Tópicos"
    description: "Contagem dos Tópicos"
    type: sum
    sql: ${TABLE}."TOPICO_CONTAGEM" ;;
  }

  dimension: topico_id {
    group_item_label: "ID Tópico"
    description: "Identificação do Tópico"
    type: string
    sql: ${TABLE}."TOPICO_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
