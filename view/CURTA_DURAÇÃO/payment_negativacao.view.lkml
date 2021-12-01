view: payment_negativacao {
  derived_table: {
    sql: select key KEY,
        py.chave_contrato,
       f.value:EXTERNAL_NUMBER::int as ID_EXTERNO_BOLETO_NEGATIVACAO,
       F.VALUE:INSERTED_AT::timestamp AS DATA_INSERCAO,
       F.VALUE:INSTALLMENT_KEY::VARCHAR AS ID_BOLETO,
       F.VALUE:INTERNAL_NUMBER::INT AS ID_INTERNO_BOLETO_NEGATIVACAO,
       F.VALUE:STATUS::VARCHAR AS STATUS_NEGATIVACAO,
       F.VALUE:UPDATED_AT::timestamp AS DATA_ATUALIZACAO
       from "VETERANO"."CURTA"."PAYMENT" py,
lateral flatten (input=>negativacao) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: key {
    type: string
    primary_key: yes
    label: "Linha Digitavel"
    sql: ${TABLE}."KEY" ;;
  }

  dimension: chave_contrato {
    type: string
    hidden: yes
    sql: ${TABLE}."CHAVE_CONTRATO" ;;
  }

  dimension: id_externo_boleto_negativacao {
    type: number
    label: "ID Externo do Boleto de Negativação"
    group_label: "Dados do Boleto"
    description: "Indica o numero de identificação do boleto dentro da carteira na QI TECH."
    sql: ${TABLE}."ID_EXTERNO_BOLETO_NEGATIVACAO" ;;
  }

  dimension_group: data_insercao {
    type: time
    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    label: "Negativação - Inserção"
    description: "Indica a data que o boleto do aluno foi inserido na tabela de negativação "
    sql: ${TABLE}."DATA_INSERCAO" ;;
  }



  dimension: id_boleto {
    type: string
    label: "ID do Boleto"
    group_label: "Dados do Boleto"
    description: "Indica o código do boleto do aluno"
    sql: ${TABLE}."ID_BOLETO" ;;
  }

  dimension: id_interno_boleto_negativacao {
    type: number
    label: "ID Interno - Boleto de Negativação"
    group_label: "Dados do Boleto"
    sql: ${TABLE}."ID_INTERNO_BOLETO_NEGATIVACAO" ;;
  }

  dimension: status_negativacao {
    type: string
    label: "Status de Negativação"
    description: "Indica o status do boleto do aluno em relação a negativação. Ex: "
    sql: ${TABLE}."STATUS_NEGATIVACAO" ;;
  }

  dimension_group: data_atualizacao {
    type: time
    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    label: "Negativação - Atualização"
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  set: detail {
    fields: [
      key,
      chave_contrato,
      id_externo_boleto_negativacao,
      data_insercao_raw,
      id_boleto,
      id_interno_boleto_negativacao,
      status_negativacao,
      data_atualizacao_raw
    ]
  }
}
