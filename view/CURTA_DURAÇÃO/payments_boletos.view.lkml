view: payments_boletos {
  derived_table: {
    sql: select key KEY,
        py.chave_contrato,
       f.value:COUNT_OVERDUE_NOTIFICATION::int as DIAS_VENCIDO,
       F.VALUE:DUE_DATE::DATE AS DATA_VENCIMENTO,
       F.VALUE:INSTALLMENT_NUMBER::INT AS NUM_PARCELA,
       F.VALUE:STATUS::VARCHAR AS SITUACAO,
       F.VALUE:VALUE::FLOAT AS VL_BOLETO,
       F.VALUE:UPDATED_AT::DATETIME AS DATA_ATUALIZACAO,
       F.VALUE:PAID_AT::DATE AS DATA_PAGAMENTO,
       F.VALUE:PAID_AMOUNT::FLOAT AS VL_PAGO,
       F.VALUE:FLG_MENOR_VENCIMENTO::BOOLEAN AS FLG_MENOR_VENCIMENTO,
       F.VALUE:FAIXA_ATRASO::VARCHAR AS FAIXA_ATRASO
       from "VETERANO"."CURTA"."PAYMENT" py,
lateral flatten (input=>boletos) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_distinct {
    type: count_distinct
    label: "Quantidade de Boletos"
    sql: ${key} ;;
    drill_fields: [detail*]
  }

  dimension: key {
    type: string
    group_item_label: "Linha Digitável"
    sql: ${TABLE}."KEY" ;;
    description: "CODIGO DO BOLETO, LINHA DIGITÁVEL"
    primary_key: yes
  }

  dimension: chave_contrato {
    type: string
    sql: ${TABLE}."CHAVE_CONTRATO" ;;
    hidden: yes
  }

  dimension: dias_vencido {
    type: number
    group_item_label: "Dias Apos o Vencimento"
    sql: ${TABLE}."DIAS_VENCIDO" ;;
    hidden: yes
    description: "QUANTIDADE DE DIAS FORA DA VALIDADE"
  }


  dimension: data_vencimento {
    type: date
    group_item_label: "Data de Vencimento"
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
    hidden: yes
    description: "DATA DE VENCIMENTO DO BOLETO"
  }

  dimension_group: data_vencimento_group {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    label: "Vencimento"
    sql: ${TABLE}."DATA_VENCIMENTO";;
    description: "DATA DE VENCIMENTO DO BOLETO"
  }


  dimension: data_pagamento {
    type: date
    label: "Pagamento"
    sql: ${TABLE}."DATA_PAGAMENTO" ;;
    hidden: yes
    description: "DATA DE PAGAMENTO DO BOLETO"
  }

  dimension_group: data_pagamento_group {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    label: "Pagamento"
    sql: ${TABLE}."DATA_PAGAMENTO";;
    description: "DATA DE PAGAMENTO DO BOLETO"
  }



  dimension: dias_atraso_regra {
    type: number
    group_item_label: "Dias de após vencimento"
    sql: datediff('day',${data_vencimento}, '2021-07-30');;
    hidden: yes
    description: "QUANTIDADE DE DIAS FORA DA VALIDADE"
  }

  dimension: dias_atraso {
    type: number
    group_item_label: "Dias de após vencimento"
    sql: CASE WHEN ${dias_atraso_regra} < 0 then 0 ELSE ${dias_atraso_regra} END ;;
    description: "QUANTIDADE DE DIAS FORA DA VALIDADE"
  }





  dimension: faixa_atraso {
    type: string
    group_item_label: "Faixa de Atraso"
    sql: ${TABLE}."FAIXA_ATRASO" ;;
    description: "FAIXA DE ATRASO DOS ALUNOS INADIMPLENTES"
    order_by_field: ordem_faixa_atraso
  }

  dimension: ordem_faixa_atraso {
    type: number
    label: "Ordem - Faixa de Atraso"
    description: "Indica a ordem correta por etapa do funil. "
    hidden: yes
    sql: CAST(${ordem_faixa_atraso_regra} AS INT) ;;

  }

  dimension: ordem_faixa_atraso_regra {
    type: string
    hidden: yes
    case: {
      when: {
        sql: ${faixa_atraso} = 'Em Aberto' ;;
        label: "0"
      }
      when: {
        sql: ${faixa_atraso} = 'Em Dia' ;;
        label: "1"
      }

      when: {
        sql: ${faixa_atraso} = '1 - 14'  ;;
        label: "2"
      }
      when: {
        sql: ${faixa_atraso} = '15 - 30'  ;;
        label: "3"
      }

      when: {
        sql: ${faixa_atraso} = '31 - 60' ;;
        label: "4"
      }

      when: {
        sql: ${faixa_atraso} = '61 - 90' ;;
        label: "5"
      }
      when: {
        sql: ${faixa_atraso} = '91 - 120' ;;
        label: "6"
      }

      when: {
        sql: ${faixa_atraso} = '121 - 150';;
        label: "7"
      }

      when: {
        sql: ${faixa_atraso} = '151 - 180';;
        label: "9"
      }

      when: {
        sql: ${faixa_atraso} = '181 - 360' ;;
        label: "10"
      }
      }
      }





  dimension: num_parcela {
    type: number
    group_item_label: "Numero da Parcela"
    sql: ${TABLE}."NUM_PARCELA" ;;
    description: "NUMERO DA PARCELA"
  }

  dimension: situacao {
    type: string
    group_item_label: "Situacao do Boleto"
    sql: ${TABLE}."SITUACAO" ;;
    description: "INDICA SE O BOLETO ESTÁ PAGO, ABERTO, VENCIDO, PAGO EM ATRASO, ETC"
  }

  dimension: taxa_juros_diaria_prefixada {
    type:  number
    group_item_label: "Taxa DIARIA Prefixada"
    sql: ${contracts.taxa_juros_diaria_prefixada} ;;
    description: "TAXA DIARIA PREFIXADA"
  }

  dimension: taxa_juros_mensal_prefixada {
    type:  number
    group_item_label: "Taxa Mensal Prefixada"
    sql: ${contracts.taxa_juros_mensal_prefixada} ;;
    description: "TAXA MENSAL PREFIXADA"
    hidden: yes
  }


  dimension: taxa_juros_mensal_dia_dia {
    type:  number
    group_item_label: "Taxa Mensal Prefixada - Dia a Dia"
    sql: power((1+${taxa_juros_mensal_prefixada}),(1/30))-1;;
    description: "TAXA MENSAL PREFIXADA"
    value_format: "0.00%"

  }



##((1+Juros mensal)^(1/30))-1 - Juros mensal dia a dia

  dimension: flg_menor_vencimento {
  type: yesno
  sql:${TABLE}."FLG_MENOR_VENCIMENTO";;
  group_item_label: "Menor Vencimento?"
  description: "Indica se a data menor vencimento do aluno"
  }


  measure: vl_boleto {
    type: sum
    group_item_label: "Soma Valor da Parcela"
    sql: ${TABLE}."VL_BOLETO" ;;
    value_format: "$ #,##0.00"
    description: "SOMA DOS VALORES DOS BOLETOS"
  }

  measure: avg_vl_boleto {
    type: average
    group_item_label: "Média Valor da Parcela"
    sql: ${TABLE}."VL_BOLETO" ;;
    value_format: "$ #,##0.00"
    description: "MÉDIA DOS VALORES DOS BOLETOS"
  }

  measure: max_vl_boleto {
    type: max
    group_item_label: "Máximo Valor da Parcela"
    sql: ${TABLE}."VL_BOLETO" ;;
    value_format: "$ #,##0.00"
    description: "MÁXIMO DOS VALORES DOS BOLETOS"
  }

  measure: min_vl_boleto {
    type: min
    group_item_label: "Mínimo Valor da Parcela"
    sql: ${TABLE}."VL_BOLETO" ;;
    value_format: "$ #,##0.00"
    description: "MÍNIMO DOS VALORES DOS BOLETOS"
  }

  measure: sum_vl_pago {
    type: sum
    group_item_label: "Soma do Valor Pago"
    sql: ${TABLE}."VL_PAGO" ;;
    value_format: "$ #,##0.00"
    description: "SOMA DO VALOR PAGO"
  }

  dimension_group: data_atualizacao {
    type: time    timeframes: [      raw,      date,      week,      month,      quarter,      year    ]    convert_tz: no
    datatype: date
    group_item_label: "Data de Atualizacao"
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
    description: "DATA DA ULTIMA ATUALIZAÇÃO DO REGISTRO"
  }

  measure: avg_dias_vencido {
    type: average
    group_item_label: "Média de dias Fora da Validade"
    sql: ${dias_vencido} ;;
    description: "MÉDIA DE DIAS FORA DA VALIDADE"
  }

  measure: menor_data_vencimento_atrasado {
    type: date
    group_item_label: "Menor Data de Vencimento"
    sql: min(${data_vencimento}) ;;
    description: "MENOR DATA DE VENCIMENTO DO BOLETO DO ALUNO"
  }

  measure: sum_vl_presente {
    type:  number
    group_label: "Valor Presente"
    group_item_label: "Anual"
    value_format: "$ #,##0.00"
    sql: ${vl_boleto}/power(1+${taxa_juros_diaria_prefixada},(datediff('day',${data_vencimento},current_date)/30)) ;;
    description: "Indica a soma do valor presente referente ao calculo da taxa de juros diária em função do ano"
  }




  measure: sum_vl_presente_mensal {
    type:  number
    group_label: "Valor Presente"
    group_item_label: "Mensal"
    value_format: "$ #,##0.00"
    sql: ${vl_boleto}/power(1+${taxa_juros_mensal_dia_dia},(datediff('day',${data_vencimento},current_date)/30)) ;;
    description: "Indica a soma do valor presente referente ao calculo da taxa de juros diária em função do mês"
  }





  ##((1+Juros mensal)^(1/30))-1 - Juros mensal dia a dia

#Valor presente é: VP = Valor da Parcela /
#(1 + taxa de juros mensal) ^ ((data de vencimento - data atual)/30)

  set: detail {
    fields: [
      chave_contrato,
      key,
      dias_vencido,
      data_vencimento,
      data_pagamento,
      num_parcela,
      situacao,
      vl_boleto
    ]
  }
}
