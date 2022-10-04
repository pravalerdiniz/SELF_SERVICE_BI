# The name of this view in Looker is "Vw Homolog Comissao"
view: vw_homolog_comissao {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "VETERANO"."AFILIADOS"."VW_HOMOLOG_COMISSAO"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cpf Atendente Ies" in Explore.

  dimension: cpf_atendente_ies {
    type: number
    group_label: "Dados Pessoais do Atendente IES"
    label: "CPF"
    description: "CPF do atendente que fica no balcão"
    sql: ${TABLE}."CPF_ATENDENTE_IES" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_nascimento {
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
    sql: ${TABLE}."DATA_NASCIMENTO" ;;
    label: "Nascimento Atendente"
    description: "Data de nascimento do atendente"
  }

  dimension: email {
    type: string
    group_label: "Dados Pessoais do Atendente IES"
    label: "Email"
    description: "Email do atendente que fica no balcão"
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: id_atendente_ies {
    type: number
    group_label: "Dados Pessoais do Atendente IES"
    label: "Código Atendente"
    description: "Código do atendente do atendente que fica no balcão"
    sql: ${TABLE}."ID_ATENDENTE_IES" ;;
  }

  dimension: id_grupo_instituicao {
    type: number
    group_label: "Dados da IES"
    label: "ID Grupo Instituição"
    description: "Indica o código do grupo da IES dentro do backoffice"
    sql: ${TABLE}."ID_GRUPO_INSTITUICAO" ;;
  }

  dimension: id_ies {
    type: number
    group_label: "Dados da IES"
    label: "ID IES"
    description: "Indica o código da IES dentro do backoffice"
    sql: ${TABLE}."ID_IES" ;;
  }

  dimension: info_comissao {
    type: string
    hidden: yes
    sql: ${TABLE}."INFO_COMISSAO" ;;
  }

  dimension: nome_atendente_ies {
    type: string
    group_label: "Dados Pessoais do Atendente IES"
    label: "Nome Atendente"
    description: "Nome do atendente que fica no balcão"
    sql: ${TABLE}."NOME_ATENDENTE_IES" ;;
  }

  dimension: nome_grupo_instituicao {
    type: string
    group_label: "Dados da IES"
    label: "Nome Grupo Instituição"
    description: "Indica o nome do grupo da IES dentro do backoffice"
    sql: ${TABLE}."NOME_GRUPO_INSTITUICAO" ;;
  }

  dimension: nome_ies {
    type: string
    group_label: "Dados da IES"
    label: "Nome IES"
    description: "Indica o nome da IES dentro do backoffice"
    sql: ${TABLE}."NOME_IES" ;;
  }

  dimension: telefone {
    type: string
    group_label: "Dados Pessoais do Atendente IES"
    label: "Telefone Atendente"
    description: "Telefone do atendente que fica no balcão"
    sql: ${TABLE}."TELEFONE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_cpf {
    type: count_distinct
    drill_fields: []
    sql: ${cpf_atendente_ies} ;;
    group_label: "Dados Pessoais do Atendente IES"
    label: "Quantidade de Atendentes"
    description: "Contagem de cfps únicos para atendentes"
  }
}
