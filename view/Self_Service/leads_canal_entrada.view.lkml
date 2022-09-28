# The name of this view in Looker is "Leads Canal Entrada"
view: leads_canal_entrada {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: VETERANO.AFILIADOS.TB_LEADS_CANAL_ENTRADA
    ;;

  dimension: cd_canal {
    type: number
    label: "Código Canal"
    sql: ${TABLE}."ID_CANAL" ;;
    group_label: "Dados Leads Afiliados"
  }

#  measure: total_cd_canal {
#    type: sum
#    sql: ${cd_canal} ;;
#    group_label: "Dados Leads Afiliados"
#  }

#  measure: average_cd_canal {
#    type: average
#    sql: ${cd_canal} ;;
#    group_label: "Dados Leads Afiliados"
#  }

  dimension: cd_cpf_lead {
    type: number
    label: "CPF Lead"
    sql: ${TABLE}."CPF_LEAD" ;;
    group_label: "Dados Leads Afiliados"
  }

  measure: count_cpf {
    type: count_distinct
    sql: ${cd_cpf_lead} ;;
    label: "Quantidade leads afiliados"
    group_label: "Dados Leads Afiliados"
  }

  dimension: cd_lead_canal_origem {
    type: string
    label: "Código Canal Origem"
    sql: ${TABLE}."ID_LEAD_CANAL_ORIGEM" ;;
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

  dimension: FLG_VERIFICACAO_PRV_PROPOSTA {
    type: yesno
    label: "Flag verificação proposta"
    sql: ${TABLE}."FLG_VERIFICACAO_PRV_PROPOSTA" ;;
    group_label: "Dados Leads Afiliados"
  }

  dimension: nr_gerado_prv_proposta {
    type: number
    label: "Número gerado Proposta"
    sql: ${TABLE}."NR_GERADO_PRV_PROPOSTA" ;;
    group_label: "Dados Leads Afiliados"
  }

  dimension: nr_proposta_canal_origem {
    type: number
    label: "Número Proposta Canal Origem"
    sql: ${TABLE}."NR_PROPOSTA_CANAL_ORIGEM" ;;
    group_label: "Dados Leads Afiliados"
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: []
    group_label: "Dados Leads Afiliados"
  }
}
