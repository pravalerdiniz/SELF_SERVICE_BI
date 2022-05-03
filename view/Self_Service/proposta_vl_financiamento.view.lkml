view: proposta_vl_financiamento {
  derived_table: {
  sql: select prop1.id_proposta as id_proposta,
      sum(prop1.vl_financiamento + prop2.vl_financiamento) as vl_financiamento
      from "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA" PROP1
      left join "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA" PROP2 on prop1.id_proposta = prop2.id_contrato_conjunto
      where prop1.id_contrato_conjunto = 'BOF-0'
      and prop1.tipo_proposta = 'NOVO'
      group by 1;;
      }

  dimension: id_proposta {
    type: string
    group_label: "Dados da Proposta"
    label: "ID Proposta"
    description: "Indica o ID da proposta do aluno"
    primary_key: yes
    sql: ${TABLE}."ID_PROPOSTA" ;;
    value_format: "0"
  }

  dimension: vl_mat_contr {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor do Financiamento"
    value_format: "$ #,###.00"
    description: "Indica o valor total do financiamento do contrato"
    sql: ${TABLE}."VL_FINANCIAMENTO" ;;
    hidden:  yes
  }

  dimension: vl_financiamento {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor do Financiamento"
    value_format: "$ #,###.00"
    description: "Indica o valor total do financiamento do contrato"
    sql: ${proposta.vl_financiamento} ;;
    hidden:  yes
  }

  dimension: vl_financiamento_final {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor do Financiamento"
    value_format: "$ #,###.00"
    description: "Indica o valor total do financiamento do contrato"
    sql: coalesce(${vl_mat_contr},${vl_financiamento}) ;;
    hidden:  yes
  }

  measure: sum_vl_mat_contr {
    type: sum
    group_label: "Financiamento (Matrícula + Contrato)"
    value_format: "$ #,###.00"
    group_item_label: "Soma"
    sql:${vl_financiamento_final} ;;
    description: "Soma do valor total do financiamento do contrato"
  }

}
