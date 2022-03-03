# The name of this view in Looker is "Depara Respondentes Ies"
view: depara_respondentes_ies {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."DEPARA_RESPONDENTES_IES"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Aprovador Ies" in Explore.

  dimension: aprovador_ies {
    type: string
    sql: ${TABLE}."APROVADOR_IES" ;;
    hidden: yes
  }

  dimension: area {
    type: string
    sql: ${TABLE}."AREA" ;;
    group_label: "Dados do Respondente - IES"
    label: "Área"
    hidden: no
  }

  dimension: cargo {
    type: string
    sql: ${TABLE}."CARGO" ;;
    hidden: no
    group_label: "Dados do Respondente - IES"
    label: "Cargo"
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
    hidden: yes
  }

  dimension: engajada_nao_engajada {
    type: string
    sql: ${TABLE}."ENGAJADA_NAO_ENGAJADA" ;;
    group_label: "Dados do Respondente - IES"
    label: "Engajada / Não Engajada"
    hidden: no
  }

  dimension: gerente {
    type: string
    sql: ${TABLE}."GERENTE" ;;
    group_label: "Dados do Respondente - IES"
    label: "Gerente - Pravaler"
    hidden: no
  }

  dimension: grupo {
    type: string
    sql: ${TABLE}."GRUPO" ;;
    group_label: "Dados do Respondente - IES"
    label: "Grupo"
    hidden: no
  }

  dimension: ies {
    type: string
    sql: ${TABLE}."IES" ;;
    group_label: "Dados do Respondente - IES"
    label: "IES"
    hidden: no
  }

  dimension: nome_contato {
    type: string
    sql: ${TABLE}."NOME_CONTATO" ;;
    group_label: "Dados do Respondente - IES"
    label: "Nome"
    hidden: no
  }

  dimension: telefone {
    type: string
    sql: ${TABLE}."TELEFONE" ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
