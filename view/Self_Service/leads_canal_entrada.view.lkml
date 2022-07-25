# The name of this view in Looker is "Leads Canal Entrada"
view: leads_canal_entrada {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "MGM"."LEADS_CANAL_ENTRADA"
    ;;

  dimension: cd_canal {
    type: number
    sql: ${TABLE}."CD_CANAL" ;;
    group_label: "Dados Leads Afiliados"
  }

  measure: total_cd_canal {
    type: sum
    sql: ${cd_canal} ;;
    group_label: "Dados Leads Afiliados"
  }

  measure: average_cd_canal {
    type: average
    sql: ${cd_canal} ;;
    group_label: "Dados Leads Afiliados"
  }

  dimension: cd_cpf_lead {
    type: number
    sql: ${TABLE}."CD_CPF_LEAD" ;;
    group_label: "Dados Leads Afiliados"
  }

  dimension: cd_lead_canal_origem {
    type: string
    sql: ${TABLE}."CD_LEAD_CANAL_ORIGEM" ;;
    group_label: "Dados Leads Afiliados"
  }

  dimension_group: dt_alteracao_registro {
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
    sql: ${TABLE}."DT_ALTERACAO_REGISTRO" ;;
    group_label: "Dados Leads Afiliados"
  }

  dimension_group: dt_carga {
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
    sql: ${TABLE}."DT_CARGA" ;;
    group_label: "Dados Leads Afiliados"
  }

  dimension_group: dt_inclusao_registro {
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
    sql: ${TABLE}."DT_INCLUSAO_REGISTRO" ;;
    group_label: "Dados Leads Afiliados"
  }

  dimension: in_verificacao_prv_proposta {
    type: yesno
    sql: ${TABLE}."IN_VERIFICACAO_PRV_PROPOSTA" ;;
    group_label: "Dados Leads Afiliados"
  }

  dimension: nr_gerado_prv_proposta {
    type: number
    sql: ${TABLE}."NR_GERADO_PRV_PROPOSTA" ;;
    group_label: "Dados Leads Afiliados"
  }

  dimension: nr_proposta_canal_origem {
    type: number
    sql: ${TABLE}."NR_PROPOSTA_CANAL_ORIGEM" ;;
    group_label: "Dados Leads Afiliados"
  }

  measure: count {
    type: count
    drill_fields: []
    group_label: "Dados Leads Afiliados"
  }
}
