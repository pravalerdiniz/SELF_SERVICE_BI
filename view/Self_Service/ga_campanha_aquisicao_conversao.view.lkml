view: ga_campanha_aquisicao_conversao {
  derived_table: {
    persist_for: "1 hour"
    sql: select a.date,
          f.key as chave,
          f.value:CAMPANHA::varchar as CAMPANHA,
          f.value:GOALCOMPLETE::int as GOALCOMPLETE,
          f.value:ID_CAMPANHA::varchar as ID_CAMPANHA,
          f.value:NEWUSERS::int as NEWUSERS,
          f.value:SESSIONS::int as SESSIONS,
          f.value:USERS::int as USERS
          from GRADUADO.SELF_SERVICE_BI.GOOGLE_ANALYTICS a,
          lateral flatten (input => CANAL_AQUISICAO_CONVERSAO) f
       ;;
  }

  dimension: chave {
    type: string
    sql: ${TABLE}."chave" ;;
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

  dimension: campanha {
    type: string
    sql: ${TABLE}."CAMPANHA" ;;
    label: "Campanha"
    description: "É o valor do parâmetro de rastreamento de campanha"
  }

  dimension: id_campanha {
    type: number
    sql: ${TABLE}."ID_CAMPANHA" ;;
    label: "ID Campanha"
    description: "ID da Campanha"
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
