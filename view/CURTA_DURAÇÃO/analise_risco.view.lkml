view: analise_risco {
  derived_table: {
    sql: select
          f.value:ALUNO_ID::varchar as id_aluno,
          f.value:APROVADO::boolean as FLG_APROVADO,
          f.value:CURSO_ID::varchar as ID_CURSO,
          f.value:DATA_ATUALIZACAO_RISCO::DATETIME AS DT_ATUALIZACAO,
          f.value:DATA_INSERCAO_RISCO::DATETIME AS DATA_INSERCAO,
          f.value:ESCOLA_ID::VARCHAR AS ID_INSTITUICAO,
          f.value:EVENTO_ID::VARCHAR AS ID_EVENTO,
          f.value:POLITICA_RISCO::VARCHAR AS POLITICA_RISCO
             from "VETERANO"."CURTA"."RISK" py,
      lateral flatten (input=>ANALISE_RISCO) f
       ;;
  }

  measure: count {
    type: count
    group_item_label: "Total de Analises"
    drill_fields: [detail*]
  }

  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;
    hidden: yes
  }

  dimension: flg_aprovado {
    type: yesno
    sql: ${TABLE}."FLG_APROVADO" ;;
    group_item_label: "Aprovado na Politica de Risco"
    description: "INDICA SE O ALUNO PASSOU NA POLÍTICA DE RISCO ESPECÍFICA"
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
    hidden: yes
  }

  dimension_group: dt_atualizacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Atualização"
    sql: ${TABLE}."DT_ATUALIZACAO" ;;
    description: "DATA DA ULTIMA ATUALIZAÇÃO DO REGISTRO"
  }

  dimension_group: data_insercao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}."DATA_INSERCAO" ;;
    label: "Criação"
    description: "DATA DE CRIAÇÃO DO REGISTRO"
  }

  dimension: id_instituicao {
    type: string
    hidden: yes
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_evento {
    type: string
    hidden: yes
    sql: ${TABLE}."ID_EVENTO" ;;
  }

  dimension: politica_risco {
    type: string
    sql: ${TABLE}."POLITICA_RISCO" ;;
    group_item_label: "Politica de Risco"
    description: "INDICA EM QUAL POLÍTICA ELE FOI APROVADO OU NEGADO"
  }

  set: detail {
    fields: [
      id_aluno,
      flg_aprovado,
      id_curso,
      dt_atualizacao_date,
      data_insercao_date,
      id_instituicao,
      id_evento,
      politica_risco
    ]
  }
}
