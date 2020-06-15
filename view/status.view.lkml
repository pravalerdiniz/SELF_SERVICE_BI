view: status {
  sql_table_name: "SELF_SERVICE_BI"."STATUS"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: ciclo {
    type: number
    sql: ${TABLE}."CICLO" ;;
  }

  dimension_group: dt_status {
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
    sql: ${TABLE}."DT_STATUS" ;;
  }

  dimension: flg_proposta_ativa {
    type: yesno
    sql: ${TABLE}."FLG_PROPOSTA_ATIVA" ;;
  }

  dimension: flg_status_atual {
    type: yesno
    sql: ${TABLE}."FLG_STATUS_ATUAL" ;;
  }

  dimension: flg_usuario_bloqueado {
    type: yesno
    sql: ${TABLE}."FLG_USUARIO_BLOQUEADO" ;;
  }

  dimension: fonte {
    type: string
    sql: ${TABLE}."FONTE" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_elegivel {
    type: number
    sql: ${TABLE}."ID_ELEGIVEL" ;;
  }

  dimension: id_proposta {
    type: number
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: id_usuario {
    type: number
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension: motivo_alteracao {
    type: string
    sql: ${TABLE}."MOTIVO_ALTERACAO" ;;
  }

  dimension: nm_usuario {
    type: string
    sql: ${TABLE}."NM_USUARIO" ;;
  }

  dimension: perfil_usuario {
    type: string
    sql: ${TABLE}."PERFIL_USUARIO" ;;
  }

  dimension: status_destino_detalhado {
    type: string
    sql: ${TABLE}."STATUS_DESTINO_DETALHADO" ;;
  }

  dimension: status_destino_detalhado_descricao {
    type: string
    sql: ${TABLE}."STATUS_DESTINO_DETALHADO_DESCRICAO" ;;
  }

  dimension: status_destino_geral {
    type: number
    sql: ${TABLE}."STATUS_DESTINO_GERAL" ;;
  }

  dimension: status_destino_geral_descricao {
    type: string
    sql: ${TABLE}."STATUS_DESTINO_GERAL_DESCRICAO" ;;
  }

  dimension: status_origem_detalhado {
    type: string
    sql: ${TABLE}."STATUS_ORIGEM_DETALHADO" ;;
  }

  dimension: status_origem_detalhado_descricao {
    type: string
    sql: ${TABLE}."STATUS_ORIGEM_DETALHADO_DESCRICAO" ;;
  }

  dimension: status_origem_geral {
    type: number
    sql: ${TABLE}."STATUS_ORIGEM_GERAL" ;;
  }

  dimension: status_origem_geral_descricao {
    type: string
    sql: ${TABLE}."STATUS_ORIGEM_GERAL_DESCRICAO" ;;
  }

  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
  }

  dimension: tp_usuario {
    type: string
    sql: ${TABLE}."TP_USUARIO" ;;
  }

  dimension: vl_vezes_proposta_no_status {
    type: number
    sql: ${TABLE}."VL_VEZES_PROPOSTA_NO_STATUS" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
