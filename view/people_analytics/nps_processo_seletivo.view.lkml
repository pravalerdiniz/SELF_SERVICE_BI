# The name of this view in Looker is "Nps Processo Seletivo"
view: nps_processo_seletivo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."NPS_PROCESSO_SELETIVO"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    group_label: "Informações da Pesquisa"
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Area Candidatura" in Explore.

  dimension: area_candidatura {
    group_label: "Informações Candidatura/Candidato"
    label: "Área candidatura"
    type: string
    sql: ${TABLE}."AREA_CANDIDATURA" ;;
  }

  dimension: avaliacao_tempo_total_processo {
    group_label: "Informações da Pesquisa"
    label: "Avaliação do tempo total do processo seletivo"
    type: string
    sql: ${TABLE}."AVALIACAO_TEMPO_TOTAL_PROCESSO" ;;
  }

  dimension: consideracoes_gerais {
    group_label: "Informações da Pesquisa"
    label: "Considerações gerais"
    type: string
    sql: ${TABLE}."CONSIDERACOES_GERAIS" ;;
  }

  dimension_group: data_conclusao {
    group_label: "Informações da Pesquisa"
    label: "Data de conclusão"
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
    sql: ${TABLE}."DATA_CONCLUSAO" ;;
  }

  dimension_group: data_inicio {
    group_label: "Informações da Pesquisa"
    label: "Data de início"
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
    sql: ${TABLE}."DATA_INICIO" ;;
  }

  dimension: email {
    group_label: "Informações Candidatura/Candidato"
    label: "E-mail"
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: nome_candidato {
    group_label: "Informações Candidatura/Candidato"
    label: "Nome do candidato"
    type: string
    sql: ${TABLE}."NOME_CANDIDATO" ;;
  }

  dimension: nota_processo_seletivo {
    group_label: "Informações da Pesquisa"
    label: "Nota de 0 à 10 para o processo"
    type: number
    sql: ${TABLE}."NOTA_PROCESSO_SELETIVO" ;;
  }

  dimension: vaga_candidatura {
    group_label: "Informações Candidatura/Candidato"
    label: "Vaga candidatura"
    type: string
    sql: ${TABLE}."VAGA_CANDIDATURA" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
