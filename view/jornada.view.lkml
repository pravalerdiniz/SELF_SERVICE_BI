view: jornada {
  sql_table_name: "SELF_SERVICE_BI"."JORNADA"
    ;;

  dimension: ds_ult_status_detalhado {
    type: string
    sql: ${TABLE}."DS_ULT_STATUS_DETALHADO" ;;
    label: "Último Status Detalhado - Descrição"
    description: "Descrição do último status detalhado"
  }

  dimension: ds_ult_status_geral {
    type: string
    sql: ${TABLE}."DS_ULT_STATUS_GERAL" ;;
  label: "Último Status Geral - Descrição"
    description: "Descrição do último status geral"
  }

  dimension_group: dt_status {
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
    sql: ${TABLE}."DT_STATUS" ;;
    label: "Status"
    description: "Indica a data do status"
  }

  dimension_group: dt_ultimo_status {
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
    sql: ${TABLE}."DT_ULTIMO_STATUS" ;;
    label: "Último Status"
    description: "Indica a data do último status"
  }

  dimension: etapa {
    type: string
    sql: ${TABLE}."ETAPA" ;;
    label: "Etapa"
    description: "Etapa do último status do aluno"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    label: "ID CPF"
    description: "Indica o ID do CPF"
  }

  dimension: id_elegivel {
    type: number
    sql: ${TABLE}."ID_ELEGIVEL" ;;
    label: "ID Elegível"
    description: "Indica o código de elegibilidade"
  }

  dimension: id_proposta {
    type: number
    sql: ${TABLE}."ID_PROPOSTA" ;;
    label: "ID Proposta"
    description: "Número de identificação da proposta"
  }

  dimension: proposta_ativa {
    type: string
    sql: ${TABLE}."PROPOSTA_ATIVA" ;;
    label: "Proposta Ativa?"
    description: "Indica se a proposta está ativa (Sim - Não)"
  }

  dimension: semestre_financiamento {
    type: string
    sql: ${TABLE}."SEMESTRE_FINANCIAMENTO" ;;
    label: "Semestre Financiado"
    description: "Indica o semestre financiado"
  }

  dimension: status_etapa {
    type: number
    sql: ${TABLE}."STATUS_ETAPA" ;;
    label: "Status Etapa"
    description: "Indica se o status está ativo(1) ou não (0)"
  }

  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
    label: "Tipo de Proposta"
    description: "Indica o tipo da proposta (ex. Novo, Renovação)"
  }

  dimension: ult_status_detalhado {
    type: string
    sql: ${TABLE}."ULT_STATUS_DETALHADO" ;;
    label: "Último Status Detalhado"
    description: "Indica o último status detalhado"
  }

  dimension: ult_status_geral {
    type: number
    sql: ${TABLE}."ULT_STATUS_GERAL" ;;
    label: "Último Status Geral"
    description: "Indica o último status geral"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
