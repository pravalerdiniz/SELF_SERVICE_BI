view: proposta_projeto_decola {
  derived_table: {
    sql: select
      id_cpf,
      id_proposta,
      f.key as id_acordo,
      f.value:DT_CRIACAO::date as DATA_CRIACAO,
      f.value:FLG_ACORDO::boolean as FLG_ACORDO,
      f.value:ID_PRODUTO::varchar as ID_PRODUTO,
      f.value:MES_ABERTURA::int as MES_ABERTURA,
      f.value:NOTA_ACADEMICA::float as NOTA_ACADEMICA,
      f.value:QTD_PARCELAS::int as QTD_PARCELAS,
      f.value:VL_ACORDO::float as VL_ACORDO,
      f.value:VL_PARCELAS::float as VL_PARCELAS
      from GRADUADO.SELF_SERVICE_BI.PROPOSTA a,
      lateral flatten (input => OBJ_DEBTS) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_proposta {
    type: string
    hidden: yes
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: id_acordo {
    type: string
    primary_key: yes
    label: "ID do Acordo"
    description: "Indica o ID do acordo do aluno"
    sql: ${TABLE}."ID_ACORDO" ;;
  }

  dimension: data_criacao {
    type: date
    hidden: yes
    sql: ${TABLE}."DATA_CRIACAO" ;;
  }

  dimension_group: data_criacao {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Criação do Acordo"
    description: "Indica a data da criação do acordo."
    sql: ${TABLE}."DATA_CRIACAO" ;;
  }

  dimension: flg_acordo {
    type: yesno
    label: "Acordo Ativo?"
    description: "Indica se o acordo está ativo ou não."
    sql: ${TABLE}."FLG_ACORDO" ;;
  }

  dimension: id_produto {
    type: string
    label: "ID do Produto"
    description: "Indica qual o ID do Produto PRAVALER no acordo."
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: mes_abertura {
    type: number
    label: "Mês"
    description: "Indica o mês de abertura do acordo."
    sql: ${TABLE}."MES_ABERTURA" ;;
  }

  dimension: nota_academica {
    type: number
    label: "Nota Acadêmica"
    description: "Indica a nota acadêmica do aluno."
    sql: ${TABLE}."NOTA_ACADEMICA" ;;
  }

  dimension: qtd_parcelas {
    type: number
    label: "Quantidade de Parcelas"
    description: "Indica a quantidade de parcelas do aluno no acordo."
    sql: ${TABLE}."QTD_PARCELAS" ;;
  }

  dimension: vl_acordo {
    type: number
    label: "Valor do Acordo"
    description: "Indica o valor do acordo."
    sql: ${TABLE}."VL_ACORDO" ;;
  }

  dimension: vl_parcelas {
    type: number
    label: "Valor das Parcelas"
    description: "Indica o valor das parcelas do acordo."
    sql: ${TABLE}."VL_PARCELAS" ;;
  }

 measure: sum_vl_acordo {
  type: sum
  group_label: "Valor do Acordo"
  label: "Soma"
  value_format: "$ #,##0.00"
  description: "Indica a soma dos valores de acordo do aluno"
  sql: ${vl_acordo} ;;

 }
  measure: avg_vl_acordo {
    type: average
    group_label: "Valor do Acordo"
    label: "Média"
    value_format: "$ #,##0.00"
    description: "Indica a média dos valores de acordo do aluno"
    sql: ${vl_acordo} ;;

  }


  measure: min_vl_acordo {
    type: min
    group_label: "Valor do Acordo"
    label: "Mínimo"
    value_format: "$ #,##0.00"
    description: "Indica a mínimo dos valores de acordo do aluno"
    sql: ${vl_acordo} ;;

  }

  measure: max_vl_acordo {
    type: max
    group_label: "Valor do Acordo"
    label: "Máximo"
    value_format: "$ #,##0.00"
    description: "Indica a máximo dos valores de acordo do aluno"
    sql: ${vl_acordo} ;;

  }


  measure: sum_vl_parcelas {
    type: sum
    group_label: "Valor das Parcelas"
    label: "Soma"
    value_format: "$ #,##0.00"
    description: "Indica a soma dos valores das parcelas do aluno"
    sql: ${vl_parcelas} ;;

  }
  measure: avg_vl_parcelas {
    type: average
    group_label: "Valor das Parcelas"
    label: "Média"
    value_format: "$ #,##0.00"
    description: "Indica a média dos valores das parcelas do aluno"
    sql: ${vl_parcelas} ;;

  }


  measure: min_vl_parcelas {
    type: min
    group_label: "Valor das Parcelas"
    label: "Mínimo"
    value_format: "$ #,##0.00"
    description: "Indica a mínimo dos valores das parcelas do aluno"
    sql: ${vl_parcelas} ;;
  }

  measure: max_vl_parcelas {
    type: max
    group_label: "Valor das Parcelas"
    label: "Máximo"
    value_format: "$ #,##0.00"
    description: "Indica a máximo dos valores das parcelas do aluno"
    sql: ${vl_parcelas} ;;

  }


  set: detail {
    fields: [
      id_cpf,
      id_proposta,
      id_acordo,
      data_criacao,
      flg_acordo,
      id_produto,
      mes_abertura,
      nota_academica,
      qtd_parcelas,
      vl_acordo,
      vl_parcelas
    ]
  }
}
