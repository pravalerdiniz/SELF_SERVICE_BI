view: gupy_vagas_por_status {
  view_label: "Gupy vagas por status"

  derived_table: {
    sql:
      select
        DATA_APROVACAO::DATE as "DATA_REFERENCIA", codigo, 'APROVADA' AS "STATUS", NOME AS VAGA
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_APROVACAO IS NOT NULL

      UNION ALL

      select
        DATA_CANCELAMENTO::DATE, codigo, 'CANCELADA', NOME
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_CANCELAMENTO IS NOT NULL

      UNION ALL

      select
        DATA_ENCERRAMENTO::DATE, codigo, 'FECHADA', NOME
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_ENCERRAMENTO IS NOT NULL

      UNION ALL

      select
        DATA_CONGELAMENTO::DATE, codigo, 'CONGELADA', NOME
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_CONGELAMENTO IS NOT NULL

      UNION ALL

      select
        DATA_PUBLICACAO::DATE, codigo, 'PUBLICADA', NOME
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_PUBLICACAO IS NOT NULL

      UNION ALL

      select
        DATA_REPROVACAO::DATE, codigo, 'REPROVADA', NOME
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_REPROVACAO IS NOT NULL

      UNION ALL

      select
        DATA_CRIACAO::DATE, codigo, 'CADASTRADA', NOME
      FROM "GRADUADO"."GENTE_GESTAO"."GUPY_VAGAS"
      WHERE DATA_CRIACAO IS NOT NULL
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
    filters: [status: "FECHADA"]
    label: "Qtde. Fechadas"
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

  set: detail {
    fields: [
      codigo,
      nome,
      data_referencia_date
    ]
  }

}
