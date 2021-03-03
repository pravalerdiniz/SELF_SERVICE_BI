view: curta_duracao {
  derived_table: {
    sql: select
      a.*,
      case when b."id" is null then false else true end FLG_ULTIMO_EVENTO
      from(
      SELECT distinct
      a."id" ID_LOG,
      a."event_type" TIPO_EVENTO,
      A."event_datetime" DATA_EVENTO,
      A."event_id" ID_EVENTO,
      A."student_id" ID_ALUNO,
      A."institution_id" ID_INSTITUICAO,
      A."inserted_at" DATA_INSERCAO,
      A."updated_at" DATA_ATUALIZACAO,
      T.THIs:"name"::varchar nome_aluno,
      t.this:"email"::varchar email_aluno,
      t.this:"course":"course_id"::varchar id_curso,
      t.this:"course":"value"::float vl_curso,
      t.this:"course":"installments"::int parcelas,
      t.this:"phone1"::varchar telefone,
      t.this:"document"::int documento,
      t.this:"guarantor":"name"::varchar garantidor
      from BICHO.CURTA."students_status" A,
      lateral flatten(input => parse_json("data")) T)a

      left join BICHO.CURTA."students_status_latest" b
      on b."student_id" = a.ID_ALUNO
      and b."event_type" = a.TIPO_EVENTO
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_log {
    type: string
    sql: ${TABLE}."ID_LOG" ;;
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}."TIPO_EVENTO" ;;
  }

  dimension_group: data_evento {
    type: time
    sql: ${TABLE}."DATA_EVENTO" ;;
  }

  dimension: id_evento {
    type: string
    sql: ${TABLE}."ID_EVENTO" ;;
  }

  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO" ;;
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension_group: data_insercao {
    type: time
    sql: ${TABLE}."DATA_INSERCAO" ;;
  }

  dimension_group: data_atualizacao {
    type: time
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension: nome_aluno {
    type: string
    sql: ${TABLE}."NOME_ALUNO" ;;
  }

  dimension: email_aluno {
    type: string
    sql: ${TABLE}."EMAIL_ALUNO" ;;
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: vl_curso {
    type: number
    sql: ${TABLE}."VL_CURSO" ;;
  }

  dimension: parcelas {
    type: number
    sql: ${TABLE}."PARCELAS" ;;
  }

  dimension: telefone {
    type: string
    sql: ${TABLE}."TELEFONE" ;;
  }

  dimension: documento {
    type: number
    sql: ${TABLE}."DOCUMENTO" ;;
  }

  dimension: garantidor {
    type: string
    sql: ${TABLE}."GARANTIDOR" ;;
  }

  dimension: flg_ultimo_evento {
    type: string
    sql: ${TABLE}."FLG_ULTIMO_EVENTO" ;;
  }

  set: detail {
    fields: [
      id_log,
      tipo_evento,
      data_evento_time,
      id_evento,
      id_aluno,
      id_instituicao,
      data_insercao_time,
      data_atualizacao_time,
      nome_aluno,
      email_aluno,
      id_curso,
      vl_curso,
      parcelas,
      telefone,
      documento,
      garantidor,
      flg_ultimo_evento
    ]
  }
}
