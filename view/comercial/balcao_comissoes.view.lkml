view: balcao_comissoes {
  derived_table: {
    sql: select
      f.key as id_comissao,
      f.value:CPF_AFILIADO::number as cpf_afiliado,
      f.value:DT_SOLICITACAO_COMISSAO::date as dt_solicitacao_comissao,
      f.value:ID_AFILIADO::number as id_afiliado,
      f.value:ID_CAMPANHA::number as id_campanha,
      f.value:NOME_CAMPANHA::varchar as nome_campanha,
      f.value:NOME_IES_PAYLOAD_SABER_REDE::varchar as nome_ies_payload_saber_rede,
      f.value:NOME_TIPO_COMISSAO::varchar as nome_tipo_comissao,
      f.value:QT_TIPO_COMISSAO::float as qt_tipo_comissao,
      f.value:STATUS_PAGAMENTO::varchar as status_pagamento
      from "GRADUADO"."BALCAO_AFILIADOS"."COMISSAO_AFILIADOS" a,
      lateral flatten (input => INFO_COMISSAO) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_comissao {
    type: string
    sql: ${TABLE}."ID_COMISSAO" ;;
  }

  dimension: cpf_afiliado {
    type: number
    sql: ${TABLE}."CPF_AFILIADO" ;;
  }

  # dimension: dt_solicitacao_comissao {
  #   type: date
  #   sql: ${TABLE}."DT_SOLICITACAO_COMISSAO" ;;
  # }

  dimension_group: dt_solicitacao_comissao {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DT_SOLICITACAO_COMISSAO" ;;
  }

  dimension: id_afiliado {
    type: number
    sql: ${TABLE}."ID_AFILIADO" ;;
  }

  dimension: id_campanha {
    type: number
    sql: ${TABLE}."ID_CAMPANHA" ;;
  }

  dimension: nome_campanha {
    type: string
    sql: ${TABLE}."NOME_CAMPANHA" ;;
  }

  dimension: nome_ies_payload_saber_rede {
    type: string
    sql: ${TABLE}."NOME_IES_PAYLOAD_SABER_REDE" ;;
  }

  dimension: nome_tipo_comissao {
    type: string
    sql: ${TABLE}."NOME_TIPO_COMISSAO" ;;
  }

  dimension: qt_tipo_comissao {
    type: number
    sql: ${TABLE}."QT_TIPO_COMISSAO" ;;
  }

  dimension: status_pagamento {
    type: string
    sql: ${TABLE}."STATUS_PAGAMENTO" ;;
  }

  measure: total_comissao {
    type: sum
    sql: ${qt_tipo_comissao} ;;
    description: "Soma das comissões"
  }

  set: detail {
    fields: [
      id_comissao,
      cpf_afiliado,
      id_afiliado,
      id_campanha,
      nome_campanha,
      nome_ies_payload_saber_rede,
      nome_tipo_comissao,
      qt_tipo_comissao,
      status_pagamento
    ]
  }
}
