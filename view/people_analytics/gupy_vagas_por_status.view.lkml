view: gupy_vagas_por_status {
  view_label: "Gupy vagas por status"

  derived_table: {
    sql:
      select
        DATA_APROVACAO::DATE as "DATA_REFERENCIA", codigo, 'APROVADA' AS "STATUS", NOME AS VAGA, HEADCOUNT
        , qtd_inscritos, qtd_em_processo, qtd_reprovados, qtd_desistencias, qtd_contratados, qtd_inscricoes_internas
        , prazo_candidatura, prazo_contratacao, sla_dias_corridos
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_APROVACAO IS NOT NULL AND NOT FLG_EXCLUIDA

      UNION ALL

      select
        DATA_CANCELAMENTO::DATE, codigo, 'CANCELADA', NOME, HEADCOUNT
        , qtd_inscritos, qtd_em_processo, qtd_reprovados, qtd_desistencias, qtd_contratados, qtd_inscricoes_internas
        , prazo_candidatura, prazo_contratacao, sla_dias_corridos
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_CANCELAMENTO IS NOT NULL AND NOT FLG_EXCLUIDA

      UNION ALL

      select
        DATA_ENCERRAMENTO::DATE, codigo, 'ENCERRADA', NOME, HEADCOUNT
        , qtd_inscritos, qtd_em_processo, qtd_reprovados, qtd_desistencias, qtd_contratados, qtd_inscricoes_internas
        , prazo_candidatura, prazo_contratacao, sla_dias_corridos
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_ENCERRAMENTO IS NOT NULL AND NOT FLG_EXCLUIDA

      UNION ALL

      select
        DATA_CONGELAMENTO::DATE, codigo, 'CONGELADA', NOME, HEADCOUNT
        , qtd_inscritos, qtd_em_processo, qtd_reprovados, qtd_desistencias, qtd_contratados, qtd_inscricoes_internas
        , prazo_candidatura, prazo_contratacao, sla_dias_corridos
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_CONGELAMENTO IS NOT NULL AND NOT FLG_EXCLUIDA

      UNION ALL

      select
        DATA_PUBLICACAO::DATE, codigo, 'PUBLICADA', NOME, HEADCOUNT
        , qtd_inscritos, qtd_em_processo, qtd_reprovados, qtd_desistencias, qtd_contratados, qtd_inscricoes_internas
        , prazo_candidatura, prazo_contratacao, sla_dias_corridos
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_PUBLICACAO IS NOT NULL AND NOT FLG_EXCLUIDA

      UNION ALL

      select
        DATA_REPROVACAO::DATE, codigo, 'REPROVADA', NOME, HEADCOUNT
        , qtd_inscritos, qtd_em_processo, qtd_reprovados, qtd_desistencias, qtd_contratados, qtd_inscricoes_internas
        , prazo_candidatura, prazo_contratacao, sla_dias_corridos
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_REPROVACAO IS NOT NULL AND NOT FLG_EXCLUIDA

      UNION ALL

      select
        DATA_CRIACAO::DATE, codigo, 'CADASTRADA', NOME, HEADCOUNT
        , qtd_inscritos, qtd_em_processo, qtd_reprovados, qtd_desistencias, qtd_contratados, qtd_inscricoes_internas
        , prazo_candidatura, prazo_contratacao, sla_dias_corridos
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_CRIACAO IS NOT NULL AND NOT FLG_EXCLUIDA
    ;;
    }

  dimension: codigo {
    label: "Código da Vaga"
    type: number
    primary_key: yes
    sql: ${TABLE}."CODIGO" ;;
  }

  dimension: nome {
    label: "Vaga"
    type: string
    sql: ${TABLE}."VAGA" ;;
  }

  dimension: status {
    label: "Status na Data"
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension_group: data_referencia {
    label: "Data de Referência"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      year,
      quarter
    ]
    datatype: date
    sql: ${TABLE}."DATA_REFERENCIA";;
  }

  dimension_group: prazo_contratacao {
    label: "Data de contratação"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      year,
      quarter
    ]
    datatype: date
    sql: ${TABLE}."PRAZO_CONTRATACAO";;
  }

  dimension_group: prazo_candidatura {
    label: "Data de candidatura"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      year,
      quarter
    ]
    datatype: date
    sql: ${TABLE}."PRAZO_CANDIDATURA";;
  }

  dimension: headcount {
    label: "Headount"
    type: number
    sql: ${TABLE}."HEADCOUNT" ;;
    hidden: yes
  }

  dimension: qtd_inscritos {
    label: "Qtd. inscritos"
    type: number
    sql: ${TABLE}."QTD_INSCRITOS" ;;
  }

  dimension: qtd_em_processo {
    label: "Qtd. em processo"
    type: number
    sql: ${TABLE}."QTD_EM_PROCESSO" ;;
  }

  dimension: qtd_reprovados {
    label: "Qtd. reprovados"
    type: number
    sql: ${TABLE}."QTD_REPROVADOS" ;;
  }

  dimension: qtd_desistencias {
    label: "Qtd. desistências"
    type: number
    sql: ${TABLE}."QTD_DESISTENCIAS" ;;
  }

  dimension: qtd_contratados {
    label: "Qtd. contratados"
    type: number
    sql: ${TABLE}."QTD_CONTRATADOS" ;;
  }

  dimension: qtd_inscricoes_internas {
    label: "Qtd. inscrições internas"
    type: number
    sql: ${TABLE}."QTD_INSCRICOES_INTERNAS" ;;
  }

  dimension: sla_dias_corridos {
    label: "SLA"
    type: number
    sql: ${TABLE}."SLA_DIAS_CORRIDOS" ;;
  }

  measure: count_aprovadas {
    type: count_distinct
    sql: ${codigo} ;;
    filters: [status: "APROVADA"]
    label: "Qtde. Aprovadas"
    value_format: "0"
    drill_fields: [detail*]
  }

  measure: count_canceladas {
    type: count_distinct
    sql: ${codigo} ;;
    filters: [status: "CANCELADA"]
    label: "Qtde. Canceladas"
    value_format: "0"
    drill_fields: [detail*]
  }

  measure: count_fechadas {
    type: count_distinct
    sql: ${codigo} ;;
    filters: [status: "ENCERRADA"]
    label: "Qtde. Encerradas"
    value_format: "0"
    drill_fields: [detail*]
  }

  measure: sum_posicoes_fechadas {
    type: sum_distinct
    sql: ${headcount} ;;
    filters: [status: "ENCERRADA"]
    label: "Qtde. posições encerradas"
    value_format: "0"
    drill_fields: [detail*]
  }

  measure: count_congeladas {
    type: count_distinct
    sql: ${codigo} ;;
    filters: [status: "CONGELADA"]
    label: "Qtde. Congeladas"
    value_format: "0"
    drill_fields: [detail*]
  }

  measure: count_publicadas {
    type: count_distinct
    sql: ${codigo} ;;
    filters: [status: "PUBLICADA"]
    label: "Qtde. Publicadas"
    value_format: "0"
    drill_fields: [detail*]
  }

  measure: sum_posicoes_publicadas {
    type: sum_distinct
    sql: ${headcount} ;;
    filters: [status: "PUBLICADA"]
    label: "Qtde. posições publicadas"
    value_format: "0"
    drill_fields: [detail*]
  }

  measure: count_reprovadas {
    type: count_distinct
    sql: ${codigo} ;;
    filters: [status: "REPROVADA"]
    label: "Qtde. Reprovadas"
    value_format: "0"
    drill_fields: [detail*]
  }

  measure: count_cadastradas{
    type: count_distinct
    sql: ${codigo} ;;
    filters: [status: "CADASTRADA"]
    label: "Qtde. Cadastradas"
    value_format: "0"
    drill_fields: [detail*]
  }

  measure: sum_vagas{
    type: sum
    sql: ${headcount} ;;
    label: "Total Headcount"
    value_format: "0"
    drill_fields: [detail*]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sla_medio {
    type: average
    sql: ${TABLE}."SLA_DIAS_CORRIDOS" ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      codigo,
      nome,
      sla_dias_corridos,
      data_referencia_date,
      prazo_candidatura_date, prazo_contratacao_date
      , qtd_inscritos, qtd_em_processo, qtd_contratados, qtd_desistencias
      , qtd_inscricoes_internas, qtd_reprovados
    ]
  }

}
