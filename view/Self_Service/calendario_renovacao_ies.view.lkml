# The name of this view in Looker is "Calendario Renovacao Ies"
view: calendario_renovacao_ies {
  derived_table: {
    sql: select * from graduado.ad_hoc.calendario_renovacao_ies
qualify row_number() over (partition by id_ies,flag_estacao order by dt_subida_alunos asc)=1
    ;;
    persist_for: "24 hours"
}
  dimension: aprovadores_tela_ies {
    type: string
    sql: ${TABLE}."APROVADORES_TELA_IES" ;;
  }

  dimension_group: dt_subida_alunos {
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
    convert_tz: no
    datatype: date
    label: "Data limite para escolha do calendário de renovação"
    description: "Indica a data de subida dos alunos para renovação"
    sql: ${TABLE}."DT_SUBIDA_ALUNOS" ;;
  }

  dimension: flg_ativo {
    type: yesno
    label: "Flag Instituição Ativa"
    description: "Indica se a Instituição está ativa"
    sql: ${TABLE}."FLG_ATIVO" ;;
  }

  dimension: gerente {
    type: string
    label: "Gerente comercial"
    description: "Indica o gerente comercial atrelado a Instituição"
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: grupo_ies {
    type: string
    label: "Grupo IES"
    description: "Indica o nome do Grupo da Instituição"
    sql: ${TABLE}."GRUPO_IES" ;;
  }

  dimension: id_ies {
    type: string
    label: "ID da Intituição"
    description: "Indica o ID identificar da IEs"
    sql: ${TABLE}."ID_IES" ;;
  }

  dimension: mes_renovacao {
    type: string
    label: "Mês Renovação"
    description: "Indica o mês renovação da IES"
    sql: ${TABLE}."MES_RENOVACAO" ;;
  }

  dimension: nome_ies {
    type: string
    label: "Nome Instituição"
    description: "Indica o nome da Instituição"
    sql: ${TABLE}."NOME_IES" ;;
  }

  dimension: flag_estacao {
    type: string
    label: "Flag Estação"
    description: "Indica se é a primeira data da estação"
    sql: ${TABLE}."FLAG_ESTACAO" ;;
  }

  dimension: flag_primeira_data {
    type: string
    sql: (select dt_subida_alunos from graduado.ad_hoc.calendario_renovacao_ies
          ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
