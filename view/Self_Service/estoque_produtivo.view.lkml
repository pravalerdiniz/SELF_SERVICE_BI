view: estoque_produtivo {
  derived_table: {
    sql: SELECT * FROM "GRADUADO"."AD_HOC"."CURVA_VELOCIDADE"
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: data_id_proposta {
    type: string
    primary_key: yes
    hidden: yes
    sql:concat(${dt_insercao},${id_proposta}) ;;
  }

  dimension: dt_insercao {
    type: date
    label: "Data Inclusão Sistema"
    sql: ${TABLE}."DT_INSERCAO" ;;
  }

  dimension_group: dt_insercao_group {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."DT_INSERCAO" ;;
    label: "Grupo Data Inserção"
  }


  dimension_group: dt_status {
    type: time
    label: "Data Status"
    sql: ${TABLE}."DT_STATUS" ;;
  }

  dimension: id_proposta {
    type: string
    label: "ID Proposta"
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: status_destino_detalhado {
    type: string
    label: "Status Destino Detalhado"
    sql: ${TABLE}."STATUS_DESTINO_DETALHADO" ;;
  }

  dimension: dias_primeira_vez_ultimo_status {
    type: string
    label: "Qtd de Dias no Status"
    sql: ${TABLE}."DIAS_PRIMEIRA_VEZ_ULTIMO_STATUS" ;;
  }

  dimension: grupo_status_destino {
    type: string
    label: "Grupo Status Destino"
    sql: ${TABLE}."GRUPO_STATUS_DESTINO" ;;
  }

  dimension: estoque_prod {
    type: string
    label: "Status Estoque Produtivo"
    sql: ${TABLE}."ESTOQUE_PROD" ;;
  }

  dimension: inic_form {
    type: string
    label: "Tempo Médio Iniciados até Formalizados"
    sql: ${TABLE}."INIC_FORM" ;;
  }

  dimension: ies_form {
    type: string
    label: "Tempo Médio Tela IES até Formalizados"
    sql: ${TABLE}."IES_FORM" ;;
  }

  dimension: doc_form {
    type: string
    label: "Tempo Médio Ag Doc até Formalizados"
    sql: ${TABLE}."DOC_FORM" ;;
  }

  dimension: ass_form {
    type: string
    label: "Tempo Médio Ag Ass até Formalizados"
    sql: ${TABLE}."ASS_FORM" ;;
  }

  dimension: dt_prevista_form {
    type: date
    label: "Data Prevista Formalização"
    sql: ${TABLE}."DT_PREVISTA_FORM" ;;
  }

  dimension_group: dt_prevista_form_group {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."DT_PREVISTA_FORM" ;;
    label: "Grupo Data Prevista"
  }
  set: detail {
    fields: [
      dt_insercao,
      dt_status_time,
      id_proposta,
      status_destino_detalhado,
      dias_primeira_vez_ultimo_status,
      grupo_status_destino,
      estoque_prod,
      inic_form,
      ies_form,
      doc_form,
      ass_form,
      dt_prevista_form
    ]
  }
}
