view: status {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."STATUS"
    ;;
  drill_fields: [id]

  dimension: id_usuario {
    type: number
    sql: ${TABLE}."ID_USUARIO" ;;
    group_label:"Dados do Usuário"
    group_item_label: "ID do Usuário"
    description: "Número de identificação do usuário"
  }

  dimension: nm_usuario {
    type: string
    sql: ${TABLE}."NM_USUARIO" ;;
    group_label: "Dados do Usuário"
    group_item_label: " Usuário"
    description: "Indica o nome ou código do usuário"
  }

  dimension: perfil_usuario {
    type: string
    sql: ${TABLE}."PERFIL_USUARIO" ;;
    group_label: "Dados do Usuário"
    group_item_label: "Perfil do Usuário"
    description: "Indica o perfil do usuário"
  }

  dimension: tp_usuario {
    type: string
    sql: ${TABLE}."TP_USUARIO" ;;
    group_label: "Dados do Usuário"
    group_item_label: "Tipo de Usuário"
    description: "Indica o Tipo de usuário (ex. Backoffice, Instituição)"
  }

  dimension: flg_usuario_bloqueado {
    type: yesno
    sql: ${TABLE}."FLG_USUARIO_BLOQUEADO" ;;
    group_label: "Dados do Usuário"
    group_item_label: "Usuário Bloqueado?"
    description: "Indica se o usuário está bloqueado - Sim ou Não"
  }

    dimension: id {
      primary_key: yes
      type: string
      sql: ${TABLE}."ID" ;;
      group_label: "Dados do Status"
      group_item_label: "ID"

      description: "Número de identificação do status"
    }

    dimension: ciclo {
      type: number
      sql: ${TABLE}."CICLO" ;;
      group_label:"Dados do Status"
      group_item_label: "Ciclo"
      description: "Indica o ciclo - Ano e Semestre (ex. 202002 se refere ao segundo semestre de 2020) "
    }

    dimension: flg_status_atual {
      type: yesno
      sql: ${TABLE}."FLG_STATUS_ATUAL" ;;
      group_label: "Dados do Status"
      group_item_label: "Status Atual"
      description: "Indica se esse é o status atual da proposta (Sim ou Não)"
    }

    dimension: motivo_alteracao {
      type: string
      sql: ${TABLE}."MOTIVO_ALTERACAO" ;;
      group_label: "Dados do Status"
      group_item_label: "Motivo de Alteração"
      description: "Indica o motivo da alteração do status"
    }

    dimension: status_destino_detalhado {
      type: string
      sql: ${TABLE}."STATUS_DESTINO_DETALHADO" ;;
      group_label: "Dados do Status"
      group_item_label: "Status Destino Detalhado"
      description: "Indica o status destino detalhado"
    }

    dimension: status_destino_detalhado_descricao {
      type: string
      sql: ${TABLE}."STATUS_DESTINO_DETALHADO_DESCRICAO" ;;
      group_label: "Dados do Status"
      group_item_label: "Descrição do Status Destino Detalhado"
      description: "Descreve o status destino detalhado"
    }

    dimension: status_destino_geral {
      type: number
      sql: ${TABLE}."STATUS_DESTINO_GERAL" ;;
      group_label: "Dados do Status"
      group_item_label: "Status Destino Geral"
      description: "Indica o status destino geral"
    }

    dimension: status_destino_geral_descricao {
      type: string
      sql: ${TABLE}."STATUS_DESTINO_GERAL_DESCRICAO" ;;
      group_label: "Dados do Status"
      group_item_label: "Descrição do Status Destino Geral"
      description: "Descreve o status destino geral"
      }

      dimension: status_origem_detalhado {
      type: string
      sql: ${TABLE}."STATUS_ORIGEM_DETALHADO" ;;
      group_label: "Dados do Status"
      group_item_label: "Status Origem Detalhado"
      description: "Indica o status origem detalhado"
    }

    dimension: status_origem_detalhado_descricao {
      type: string
      sql: ${TABLE}."STATUS_ORIGEM_DETALHADO_DESCRICAO" ;;
      group_label: "Dados do Status"
      group_item_label: "Descrição do Status Origem Detalhado "
      description:  "Descreve o status origem detalhado"
    }

    dimension: status_origem_geral {
      type: number
      sql: ${TABLE}."STATUS_ORIGEM_GERAL" ;;
      group_label: "Dados do Status"
      group_item_label: "Status Origem Geral"
      description:  "Indica o status origem geral"
    }

    dimension: status_origem_geral_descricao {
      type: string
      sql: ${TABLE}."STATUS_ORIGEM_GERAL_DESCRICAO" ;;
      group_label: "Dados do Status"
      group_item_label: "Descrição do Status Origem Geral"
      description:  "Descreve o status origem geral"
    }

    dimension: fonte {
      type: string
      sql: ${TABLE}."FONTE" ;;
      group_label: "Dados do Status"
      group_item_label: "Fonte"
      description: "Indica a fonte do status (RNV, LOG)"
    }

  dimension: flg_proposta_atual {
    type: yesno
    label: "Proposta Atual?"
    description: "Indica se é a proposta atual do aluno. Ou seja a última com alteração de status"
    sql: ${TABLE}."FLG_PROPOSTA_ATUAL" ;;
  }

      dimension: id_elegivel {
      type: number
      sql: ${TABLE}."ID_ELEGIVEL" ;;
      group_label: "Dados do Status"
      group_item_label: "ID Elegível"
      description: "Número de identificação de elegível"
    }


  dimension: tempo_no_status {
    type: number
    sql: datediff('day',${dt_status_date},current_date) ;;
    group_item_label: "Tempo no Status"
    description: "Indica a quantos dias o aluno está no mesmo status"
    drill_fields: [id_proposta,id_cpf]
  }


  dimension_group: dt_status {
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
    sql: ${TABLE}."DT_STATUS" ;;
    label: "Status"
    description: "Indica a data do status"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    label: "ID CPF"
    description: "Indica o ID do CPF do aluno"
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
    group_label: "Dados da Proposta"
    label: "ID Proposta"
    description: "Indica o ID da proposta"
  }

  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
    group_label: "Dados da Proposta"
    label: "Tipo de Proposta"
    description: "Indica o tipo da proposta"
  }

  dimension: vl_vezes_proposta_no_status {
    type: number
    sql: ${TABLE}."VL_VEZES_PROPOSTA_NO_STATUS" ;;
    group_label: "Dados do Status"
    label: "Número de Vezes no Status"
    description: "Indica o número de vezes em que a proposta passou por determinado status"
  }


  dimension: QTD_DIAS_STATUS {
    type: number
    sql: ${TABLE}."QTD_DIAS_STATUS" ;;
    group_label: "Dados do Status"
    label: "Quantidade de Dias - Status Anterior"
    description: "Indica a quantidade dias que o aluno ficou parado no status de origem"
  }



  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: cont_cpf {
    type: count_distinct
    sql: ${id_cpf} ;;
    value_format: "0"
    label: "Quantidade de CPFs"
    drill_fields: [id_cpf,id_proposta]
    description: "Contagem de CPFs únicos"
  }

  measure: cont_proposta {
    type: count_distinct
    sql: ${id_proposta} ;;
    value_format: "0"
    label: "Quantidade de Propostas"
    description: "Contagem de propostas únicas"
  }

  measure: sum_vl_vezes_proposta_no_status {
    type: sum
    sql: ${vl_vezes_proposta_no_status} ;;
    value_format: "0"
    label: "Soma de Vezes Proposta no Status"
    description: " Soma de vezes que a proposta passou pelo status"
  }

  measure: avg_vl_vezes_proposta_no_status {
    type: average
    sql: ${vl_vezes_proposta_no_status} ;;
    value_format: "$ #,###"
    label: "Média de Vezes Proposta no Status"
    description: " Média de vezes que a proposta passou pelo status"
  }


  measure: soma_dias_status {
    type: sum
    sql: ${tempo_no_status} ;;
    label:"Tempo no Status"
    description: "Soma de Dias da Proposta no Status"

  }

  measure: avg_dias_status {
    type: average
    sql: ${tempo_no_status} ;;
    label:"Tempo médio no Status"
    value_format: "0"
    description: "Média de dias parado no Status"

  }


  measure: avg_qtd_dias_status_anterior{
    type: average
    sql: ${TABLE}."QTD_DIAS_STATUS" ;;
    label: "Média de quantidade de Dias - Status Anterior"
    value_format: "0"
    description: "Indica a média de quantidade dias que o aluno ficou parado no status de origem"
  }

  measure: median_qtd_dias_status_anterior{
    type: median
    sql: ${TABLE}."QTD_DIAS_STATUS" ;;
    label: "Mediana de quantidade de Dias - Status Anterior"
    value_format: "0"
    description: "Indica a mediana de quantidade dias que o aluno ficou parado no status de origem"
  }






}
