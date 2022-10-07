view: atribuicao_urls {
  derived_table: {
    persist_for: "1 hour"
    sql: select
            id_cpf,
            A.DS_URL_DCO_L100 AS URL_DESCOBERTA_100D,
            A.CANAL AS CANAL_100D,
            A.UTM_SOURCE AS SOURCE_100D,
            A.UTM_MEDIUM AS MEDIUM_100D,
            A.UTM_CAMPAIGN AS UTM_CAMPAIGN_100D,
            A.UTM_TERM AS UTM_TERM_100D,
            A.ORIGIN AS ORIGIN_100D,
            B.DS_URL AS URL_DESCOBERTA,
            B.CANAL AS CANAL_DESCOBERTA,
            B.UTM_SOURCE AS SOURCE_DESCOBERTA,
            B.UTM_MEDIUM AS MEDIUM_DESCOBERTA,
            B.UTM_CAMPAIGN AS UTM_CAMPAIGN_DESCOBERTA,
            B.UTM_TERM AS UTM_TERM_DESCOBERTA,
            B.ORIGIN AS ORIGIN_DESCOBERTA,
            C.DS_URL AS URL_FINALIZACAO,
            C.CANAL AS CANAL_FINALIZACAO,
            C.UTM_SOURCE AS SOURCE_FINALIZACAO,
            C.UTM_MEDIUM AS MEDIUM_FINALIZACAO,
            C.UTM_CAMPAIGN AS UTM_CAMPAIGN_FINALIZACAO,
            C.UTM_TERM AS UTM_TERM_FINALIZACAO,
            C.ORIGIN AS ORIGIN_FINALIZACAO
            FROM GRADUADO.SELF_SERVICE_BI.ATRIBUICAO A
            LEFT JOIN "VETERANO"."DIMENSAO"."DIM_URL" B ON A.ID_URL_DESCOBERTA = B.ID_URL
            LEFT JOIN "VETERANO"."DIMENSAO"."DIM_URL" C ON A.ID_URL_FINALIZACAO = C.ID_URL
            LEFT JOIN "VETERANO"."DIMENSAO"."DIM_URL" D ON A.ID_URL_DCO_L100 = D.ID_URL;;
  }

  dimension: url_descoberta {
    type: string
    label: "URL de Descoberta"
    description: "Indica a URL de Descoberta do aluno."
    sql: ${TABLE}."URL_DESCOBERTA" ;;
    group_label: "Dados de Descoberta"
  }

  dimension: utm_source_descoberta {
    type: string
    label: "Source de Descoberta"
    description: "Indica a Source de Descoberta do aluno."
    sql: ${TABLE}."UTM_SOURCE_DESCOBERTA" ;;
    group_label: "Dados de Descoberta"
  }

  dimension: utm_medium_descoberta {
    type: string
    label: "Medium de Descoberta"
    description: "Indica a Medium de Descoberta do aluno."
    sql: ${TABLE}."UTM_MEDIUM_DESCOBERTA" ;;
    group_label: "Dados de Descoberta"
  }

  dimension: utm_campaign_descoberta {
    type: string
    label: "Campanha de Descoberta"
    description: "Indica a Campanha de Descoberta do aluno."
    sql: ${TABLE}."UTM_CAMPAIGN_DESCOBERTA" ;;
    group_label: "Dados de Descoberta"
  }

  dimension: utm_term_descoberta {
    type: string
    label: "Term de Descoberta"
    description: "Indica a Term de Descoberta do aluno."
    sql: ${TABLE}."UTM_TERM_DESCOBERTA" ;;
    group_label: "Dados de Descoberta"
  }

  dimension: origin_descoberta {
    type: string
    label: "Origin de Descoberta"
    description: "Indica a Origin de Descoberta do aluno."
    sql: ${TABLE}."ORIGIN_DESCOBERTA" ;;
    group_label: "Dados de Descoberta"
  }

  dimension: url_descoberta_100d {
    type: string
    label: "URL de Descoberta - 100 Dias"
    description: "Indica a URL de Descoberta do aluno."
    sql: ${TABLE}."URL_DESCOBERTA_100D" ;;
    group_label: "Dados de Descoberta - 100 Dias"
  }

  dimension: utm_source_descoberta_100d {
    type: string
    label: "Source de Descoberta - 100 Dias"
    description: "Indica a Source de Descoberta do aluno."
    sql: ${TABLE}."UTM_SOURCE_DESCOBERTA_100D" ;;
    group_label: "Dados de Descoberta - 100 Dias"
  }

  dimension: utm_medium_descoberta_100d {
    type: string
    label: "Medium de Descoberta - 100 Dias"
    description: "Indica a Medium de Descoberta do aluno."
    sql: ${TABLE}."UTM_MEDIUM_DESCOBERTA_100D" ;;
    group_label: "Dados de Descoberta - 100 Dias"
  }

  dimension: utm_campaign_descoberta_100d {
    type: string
    label: "Campanha de Descoberta - 100 Dias"
    description: "Indica a Campanha de Descoberta do aluno."
    sql: ${TABLE}."UTM_CAMPAIGN_DESCOBERTA_100D" ;;
    group_label: "Dados de Descoberta - 100 Dias"
  }

  dimension: utm_term_descoberta_100d {
    type: string
    label: "Term de Descoberta - 100 Dias"
    description: "Indica a Term de Descoberta do aluno."
    sql: ${TABLE}."UTM_TERM_DESCOBERTA_100D" ;;
    group_label: "Dados de Descoberta - 100 Dias"
  }

  dimension: origin_descoberta_100d {
    type: string
    label: "Origin de Descoberta - 100 Dias"
    description: "Indica a Origin de Descoberta do aluno."
    sql: ${TABLE}."ORIGIN_DESCOBERTA_100D" ;;
    group_label: "Dados de Descoberta - 100 Dias"
  }

  dimension: url_finalizacao {
    type: string
    label: "URL de Finalização"
    description: "Indica a URL de Finalização do aluno."
    sql: ${TABLE}."URL_FINALIZACAO" ;;
    group_label: "Dados de Finalização"
  }

  dimension: utm_source_finalizacao {
    type: string
    label: "Source de Finalização"
    description: "Indica a Source de Finalização do aluno."
    sql: ${TABLE}."UTM_SOURCE_FINALIZACAO" ;;
    group_label: "Dados de Finalização"
  }

  dimension: utm_medium_finalizacao {
    type: string
    label: "Medium de Finalização"
    description: "Indica a Medium de Finalização do aluno."
    sql: ${TABLE}."UTM_MEDIUM_FINALIZACAO" ;;
    group_label: "Dados de Finalização"
  }

  dimension: utm_campaign_finalizacao {
    type: string
    label: "Campanha de Finalização"
    description: "Indica a Campanha de Finalização do aluno."
    sql: ${TABLE}."UTM_CAMPAIGN_FINALIZACAO" ;;
    group_label: "Dados de Finalização"
  }

  dimension: utm_term_finalizacao {
    type: string
    label: "Term de Finalização"
    description: "Indica a Term de Finalização do aluno."
    sql: ${TABLE}."UTM_TERM_FINALIZACAO" ;;
    group_label: "Dados de Finalização"
  }

  dimension: origin_finalizacao {
    type: string
    label: "Origin de Finalização"
    description: "Indica a Origin de Finalização do aluno."
    sql: ${TABLE}."ORIGIN_FINALIZACAO" ;;
    group_label: "Dados de Finalização"
  }

  dimension: id_cpf {
    sql: ${TABLE}."ID_CPF" ;;
    hidden:  yes
  }
}
