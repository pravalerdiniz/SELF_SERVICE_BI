# Se utilizar esta view, o resultado duplicará com a quantidade de titulos que o aluno tem a ser gerado
view: financeiro_parcelas_futuro {
  derived_table: {
    sql: select
          p.value:CONTRATO::varchar as contrato,
          p.value:CONTRATO_RELEASE::int as contrato_release,
          p.value:DATA_VENCIMENTO::date as data_vencimento,
          p.value:DIGITO_VERIFICADOR::int as digito_verificador,
          p.value:VALOR::float as valor,
          ID_CPF
        from GRADUADO.SELF_SERVICE_BI.FINANCEIRO,
             lateral flatten( input => PARCELAS ) p
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: contrato {
    type: string
    label: "Contrato"
    description: "Boletos Futuros"
    group_label: "Dados do Boleto Futuro"
    sql: ${TABLE}."CONTRATO" ;;
  }

  dimension: contrato_release {
    type: number
    label: "Release Contrato"
    description: "Release do Contrato"
    group_label: "Dados do Boleto Futuro"
    sql: ${TABLE}."CONTRATO_RELEASE" ;;
  }

  dimension_group: data_vencimento {
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
    label: "Vencimento"
    description: "Indica a data de vencimento do boleto futuro"
    group_label: "Data de Vencimento do Boleto Futuro"
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  dimension: digito_verificador {
    type: number
    label: "Digito Verificador"
    description: "Digito Verificador do Contrato"
    group_label: "Dados do Boleto Futuro"
    sql: ${TABLE}."DIGITO_VERIFICADOR" ;;
  }

  dimension: valor {
    type: string
    label: "Valor do Boleto"
    description: "Valor do Boleto Futuro"
    group_label: "Dados do Boleto Futuro"
    sql: ${TABLE}."VALOR" ;;
  }

  dimension: id_cpf {
    type: string
    label: "ID CPF"
    description: "ID do CPF do Aluno"
    group_label: "Dados do Boleto Futuro"
    sql: ${TABLE}."ID_CPF" ;;
  }

  measure: soma_valor {
    type: sum
    label: "Valor do Boleto"
    sql: ${valor} ;;

  }


  set: detail {
    fields: [contrato, contrato_release, digito_verificador, valor,id_cpf]
  }
}
