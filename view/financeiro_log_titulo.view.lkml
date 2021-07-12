view: financeiro_log_titulo {
  derived_table: {
    persist_for: "1 hour"
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
    description: "Indica o ID Único do Titulo. Referência a tabela 'Financeiro'."
    value_format: "#"
  }

  dimension: id_log_titulo {
    type: string
    sql: ${TABLE}."ID_LOG_TITULO" ;;
    label: "ID Log Título"
    description: "Indica o ID do LOG de dowload do boleto."
    value_format: "#"
  }

  dimension_group: data_log_titulo {
    type: time
    sql: ${TABLE}."DATA_LOG_TITULO" ;;
    label: "Data Log Título"
    description: "Indica a data de download do boleto."
  }

  dimension: tipo_usuario {
    type: string
    sql: ${TABLE}."TIPO_USUARIO" ;;
    description: "Indica o tipo de usuário que realizou o download do boleto"
    label: "Tipo de Usuário"
  }

  dimension: origem_arquivo {
    type: string
    sql: ${TABLE}."ORIGEM_ARQUIVO" ;;
    description: "Indica a url de origem do download do boleto"
    label: "Origem do Arquivo"
  }

  dimension: dias_para_pagamento {
    type: number
    label: "Numero de dias para pagamento"
    description: "Diferença de dias entre o dowload do boleto até o pagamento"
    sql: DATEDIFF(day,${data_log_titulo_date},${financeiro.data_pagamento_date})   ;;
  }

  dimension: faixa_dias_para_pagamento {
    type: tier
    tiers: [1,2,3,4]
    style: integer
    sql: ${dias_para_pagamento} ;;
    label: "Faixa de dias para pagamento"
    description: "Indica a faixa de dias para pagamento"
  }

  dimension: dias_para_vencimento {
    type: number
    label: "Numero de dias para vencimento"
    description: "Diferença de dias entre o dowload do boleto até o vencimento"
    sql: DATEDIFF(day,${data_log_titulo_date},${financeiro.data_vencimento_date})   ;;
  }

  dimension: range_dias_para_vencimento {
    type: string
    label: "Range de dias para vencimento"
    description: "Diferença de dias entre o dowload do boleto até o vencimento"
    sql: case when ${dias_para_vencimento}<0 then 'BOLETO VENCIDO'
              when ${dias_para_vencimento}=0 then 'VENCIMENTO NO MESMO DIA'
              when ${dias_para_vencimento} between 1 and 7 then 'VENCIMENTO EM ATÉ 1 SEMANA'
              else 'VENCIMENTO ACIMA DE 1 SEMANA' end ;;
  }

  dimension: faixa_dias_para_vencimento {
    type: tier
    tiers: [1,7,15,30]
    style: integer
    sql: ${dias_para_vencimento} ;;
    label: "Faixa de dias para vencimento"
    description: "Indica a faixa de dias para vencimento"
  }

  dimension: flg_ultimo_acesso {
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_ACESSO" ;;
    description: "Indica se foi o último acesso realizado do aluno."
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
