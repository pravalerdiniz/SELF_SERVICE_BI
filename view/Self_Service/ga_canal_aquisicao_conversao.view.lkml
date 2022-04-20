view: ga_canal_aquisicao_conversao {
  derived_table: {
    persist_for: "1 hour"
    sql: select a.date,
          f.key as chave,
          f.value:CANAL::varchar as CANAL,
          f.value:FINALIZADO::int as FINALIZADO,
          f.value:GOALCOMPLETE::int as GOALCOMPLETE,
          f.value:INICIADO::int as INICIADO,
          f.value:LEAD::int as LEAD,
          f.value:NEWUSERS::int as NEWUSERS,
          f.value:SESSIONS::int as SESSIONS,
          f.value:SIMULADO::int as SIMULADO,
          f.value:USERS::int as USERS
          from GRADUADO.SELF_SERVICE_BI.GOOGLE_ANALYTICS a,
          lateral flatten (input => CANAL_AQUISICAO_CONVERSAO) f
       ;;
  }

  dimension: chave {
    type: string
    sql: concat(${TABLE}."chave",${date_date}) ;;
    primary_key: yes
    hidden: yes
  }

  dimension_group: date {
    type: time
    timeframes: [ week_of_year,
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
    label: "Data da sessão"
    description: "Data considerada para análise do site"
    hidden: yes
  }

  dimension: canal {
    type: string
    sql: ${TABLE}."CANAL" ;;
    label: "Canal"
    description: "O grupo de canal associado à sessão de um usuário final"
  }

  measure: total_lead {
    type: sum
    label: "1. Soma Leads"
    description: "Soma da etapa Lead no site de acordo com a HORA."
    sql: ${TABLE}."LEAD" ;;
    group_label: "Etapas"
  }

  measure: total_simulado {
    type: sum
    label: "2. Soma Simulados"
    description: "Soma da etapa Simulado no site de acordo com a HORA."
    sql: ${TABLE}."SIMULADO" ;;
    group_label: "Etapas"
  }

  measure: total_iniciado {
    type: sum
    label: "3. Soma Iniciados"
    description: "Soma da etapa Iniciado no site de acordo com a HORA."
    sql: ${TABLE}."INICIADO" ;;
    group_label: "Etapas"
  }

  measure: total_finalizado {
    type: sum
    label: "4. Soma Finalizados"
    description: "Soma da etapa Finalizado no site de acordo com a HORA."
    sql: ${TABLE}."FINALIZADO" ;;
    group_label: "Etapas"
  }

  measure: total_goalcomplete {
    type: sum
    label: "5. Soma das etapas"
    description: "Soma das etapas de Lead, Simulado, Iniciado e Finalizado no site."
    sql: ${TABLE}."GOALCOMPLETE";;
    group_label: "Etapas"
  }

 measure: total_new_users {
  type: sum
  sql: ${TABLE}."NEWUSERS" ;;
  label: "Soma Novos usuários"
  description: "Soma total de novos usuarios no site de acordo com CANAL."
  group_label: "Aquisição"
}

measure: total_sessions{
  type: sum
  sql: ${TABLE}."SESSIONS" ;;
  label: "Soma das Sessões"
  description: "Soma das sessões no site de acordo com CANAL."
  group_label: "Aquisição"
}

measure: total_users {
  type: sum
  sql: ${TABLE}."USERS" ;;
  label: "Soma dos Usuários"
  description: "Soma total dos usuários do site de acordo com CANAL."
  group_label: "Aquisição"
}

  }
