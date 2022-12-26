view: payment_boletos_menor_vencimento {
  derived_table: {
    sql: select
        py.chave_contrato,
        py.cpf,
       --f.value:COUNT_OVERDUE_NOTIFICATION::int as DIAS_VENCIDO,
       MIN(F.VALUE:DUE_DATE)::DATE AS DATA_VENCIMENTO
       --F.VALUE:INSTALLMENT_NUMBER::INT AS NUM_PARCELA,
       --F.VALUE:STATUS::VARCHAR AS SITUACAO,
       --F.VALUE:VALUE::FLOAT AS VL_BOLETO,
       --F.VALUE:UPDATED_AT::DATETIME AS DATA_ATUALIZACAO,
       --F.VALUE:PAID_AT::DATE AS DATA_PAGAMENTO,
       --F.VALUE:PAID_AMOUNT::FLOAT AS VL_PAGO
       from "VETERANO"."CURTA"."PAYMENT" py,
lateral flatten (input=>boletos) f
where F.VALUE:STATUS::VARCHAR  in ('opened','overdue','waiting_payment')
group by py.cpf,py.chave_contrato,
py.chave_contrato
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: chave_contrato {
    type: string
    primary_key: yes
    sql: ${TABLE}."CHAVE_CONTRATO" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
  }

  dimension: data_vencimento {
    type: date
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  set: detail {
    fields: [chave_contrato, cpf, data_vencimento]
  }
}
