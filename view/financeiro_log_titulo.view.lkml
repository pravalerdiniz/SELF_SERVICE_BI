view: financeiro_log_titulo {
  derived_table: {
    sql: select
      id_titulo,
      f.key as id_log_titulo,
      f.value:data_log_titulo::datetime as data_log_titulo,
      f.value:tipo_usuario::varchar as tipo_usuario,
      f.value:origem_arquivo::varchar as origem_arquivo,
      f.value:ultimo_acesso::boolean as flg_ultimo_acesso
      from GRADUADO.SELF_SERVICE_BI.FINANCEIRO a,
      lateral flatten (input => id_log_titulo_info) f
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    label: "Quantidade"
  }

  dimension: id_titulo {
    type: number
    sql: ${TABLE}."ID_TITULO" ;;
    label: "ID Título"
    value_format: "#"
  }

  dimension: id_log_titulo {
    type: string
    sql: ${TABLE}."ID_LOG_TITULO" ;;
    label: "ID Log Título"
    value_format: "#"
  }

  dimension_group: data_log_titulo {
    type: time
    sql: ${TABLE}."DATA_LOG_TITULO" ;;
    label: "Data Log Título"
  }

  dimension: tipo_usuario {
    type: string
    sql: ${TABLE}."TIPO_USUARIO" ;;
    label: "Tipo de Usuário"
  }

  dimension: origem_arquivo {
    type: string
    sql: ${TABLE}."ORIGEM_ARQUIVO" ;;
    label: "Origem do Arquivo"
  }

  dimension: dias_para_pagamento {
    type: number
    label: "Numero de dias para pagamento"
    description: "Diferença de dias entre o dowload do boleto até o pagamento"
    sql: DATEDIFF(day,${data_log_titulo_date},${financeiro.data_pagamento_date})   ;;
  }



  dimension: flg_ultimo_acesso {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_ACESSO" ;;
    label: "Último Acesso?"
  }

  set: detail {
    fields: [
      id_titulo,
      id_log_titulo,
      data_log_titulo_time,
      tipo_usuario,
      origem_arquivo,
      flg_ultimo_acesso
    ]
  }
}
