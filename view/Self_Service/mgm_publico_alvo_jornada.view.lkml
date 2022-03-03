view: mgm_publico_alvo_jornada {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.MGM_PUBLICO_ALVO
      ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    group_label: "Dados Lead"
    label: "ID CPF"
    description: "Id CPF do indicado"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_lead {
    type: string
    primary_key: yes
    group_label: "Dados Lead"
    label: "ID Lead"
    description: "Codigo criado para o indicado"
    sql: ${TABLE}."ID_LEAD" ;;
  }

  dimension: dias_diferenca {
    type: number
    hidden: yes
    sql: ${TABLE}."DIAS_DIFERENCA" ;;
  }

  dimension_group: data_adesao_lead {
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
    group_label: "Data Adesão Lead"
    label: "Data Adesão Lead"
    description: "Indica a data de adesão do aluno - lead"
    sql: ${TABLE}."DATA_ADESAO_LEAD" ;;
  }

  dimension: infos_jornada {
    type: string
    hidden: yes
    sql: ${TABLE}."INFOS_JORNADA" ;;
  }

  dimension: premiacao {
    type: string
    label: "Premiação"
    description: "Indicador se o aluno formalizaou em até 120 dias depois da indicação"
    sql: ${TABLE}."PREMIACAO" ;;
  }

  dimension: validation_code {
    type: string
    group_label: "Dados Lead"
    label: "Código de validação"
    description: "Codigo criado para validação"
    sql: ${TABLE}."VALIDATION_CODE" ;;
  }

  dimension: nome_lead {
    type: string
    group_label: "Dados Lead"
    label: "Nome Lead"
    description: "Indica o nome do aluno - Lead"
    sql: ${TABLE}."NOME_LEAD" ;;
  }

  dimension: cidade_lead {
    type: string
    group_label: "Dados Lead"
    label: "Cidade Lead"
    description: "Indica o nome da cidade do aluno - Lead"
    sql: ${TABLE}."CIDADE_LEAD" ;;
  }

  dimension: estado_lead {
    type: string
    group_label: "Dados Lead"
    label: "Estado Lead"
    description: "Indica o nome do estado do aluno - Lead"
    sql: ${TABLE}."ESTADO_LEAD" ;;
  }

  dimension: cpf_lead {
    type: number
    group_label: "Dados Lead"
    label: "CPF Lead"
    description: "Indica o CPF do aluno - Lead"
    sql: ${TABLE}."CPF_LEAD" ;;
  }

  dimension: email_lead {
    type: string
    group_label: "Dados Lead"
    label: "Email Lead"
    description: "Indica o email do aluno - Lead"
    sql: ${TABLE}."EMAIL_LEAD" ;;
  }

  dimension: telefone_lead {
    type: string
    group_label: "Dados Lead"
    label: "Telefone Lead"
    description: "Indica o telefone do aluno - Lead"
    sql: ${TABLE}."TELEFONE_LEAD" ;;
  }

  dimension: id_action_lead {
    type: string
    group_label: "Dados Lead"
    label: "ID conversão"
    description: "Indica o ID de conversão"
    sql: ${TABLE}."ID_ACTION_LEAD" ;;
  }

  dimension: id_player {
    type: string
    group_label: "Dados Player"
    label: "ID Player"
    description: "Indica o ID do Player"
    sql: ${TABLE}."ID_PLAYER" ;;
  }

  dimension: nome_player {
    type: string
    group_label: "Dados Player"
    label: "Nome Player"
    description: "Indica o nome do atendente (player)"
    sql: ${TABLE}."NOME_PLAYER" ;;
  }

  dimension: cpf_player {
    type: number
    label: "CPF Player"
    group_label: "Dados Player"
    description: "Indica o CPF do atendente (player)"
    sql: ${TABLE}."CPF_PLAYER" ;;
  }

  dimension_group: data_adesao_player {
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
    group_label: "Data Adesão Player"
    label: "Data Adesão Player"
    description: "Indica a data de adesão do player"
    sql: ${TABLE}."DATA_ADESAO_PLAYER" ;;
  }

  dimension: email_player {
    type: string
    group_label: "Dados Player"
    label: "Email Player"
    description: "Indica o email do atendente (player)"
    sql: ${TABLE}."EMAIL_PLAYER" ;;
  }

  dimension: telefone_player {
    type: string
    group_label: "Dados Player"
    label: "Telefone Player"
    description: "Indica o telefone do atendente (player)"
    sql: ${TABLE}."TELEFONE_PLAYER" ;;
  }

  dimension: regional_player {
    type: string
    group_label: "Dados Player"
    label: "Regional Player"
    description: "Indica a Regional do atendente (player)"
    sql: ${TABLE}."REGIONAL_PLAYER" ;;
  }

  dimension: lead_cancelado {
    type: string
    group_label: "Dados Lead"
    label: "Lead cancelado"
    description: "Indica se o lead foi cancelado"
    sql: ${TABLE}."LEAD_CANCELADO" ;;
  }

  dimension: unidade_player {
    type: string
    group_label: "Dados Player"
    label: "Unidade Player"
    description: "Indica a Unidade do atendente (player)"
    sql: ${TABLE}."UNIDADE_PLAYER" ;;
  }

  dimension: step_lead {
    type: number
    group_label: "Dados Lead"
    label: "Step Lead"
    description: "Indica a etapa do Lead"
    sql: ${TABLE}."STEP_LEAD" ;;
  }

  dimension_group: dt_carga {
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
    group_label: "Data Carga"
    label: "Data Carga"
    description: "Indica a data que foi realizado a carga dos dados"
    sql: ${TABLE}."DT_CARGA" ;;
  }

  set: detail {
    fields: [
      id_cpf,
      id_lead,
      dias_diferenca,
      data_adesao_lead_time,
      infos_jornada,
      premiacao,
      validation_code,
      nome_lead,
      cidade_lead,
      estado_lead,
      cpf_lead,
      email_lead,
      telefone_lead,
      id_action_lead,
      id_player,
      nome_player,
      cpf_player,
      data_adesao_player_time,
      email_player,
      telefone_player,
      regional_player,
      lead_cancelado,
      unidade_player,
      step_lead,
      dt_carga_time
    ]
  }
}
