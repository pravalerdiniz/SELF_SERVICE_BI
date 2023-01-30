# The name of this view in Looker is "Processo Wo"
view: processo_wo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FINANCEIRO"."PROCESSO_WO"
    ;;

  dimension: cpf {
    description: "CPF do  aluno."
    type: number
    sql: ${TABLE}."CPF" ;;
  }

  dimension_group: data_menor_vencimento {
    description: "Data de vencimento do boleto mais atrasado do CPF."
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
    sql: ${TABLE}."DATA_MENOR_VENCIMENTO" ;;
  }

  dimension_group: data_vencimento {
    description: "Data de vencimento do título."
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
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  dimension_group: data_referencia_OT {
    description: "Data de referência da base OT."
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
    sql: ${TABLE}."DATA_REFERENCIA_OT" ;;
  }

  dimension: id_fundo {
    description: "ID do fundo de investimento, sendo 2,4,1,41 os fundos BV, FIDC I, FIDC II e FIDC III respectivamente."
    type: number
    sql: ${TABLE}."ID_FUNDO" ;;
  }

  dimension: originador {
    description: "Originador (banco) de acordo com a base OT."
    type: string
    sql: ${TABLE}."ORIGINADOR" ;;
  }

  dimension: qtd_dias_arrasto {
    description: "Maior atraso do CPF, por fundo, em dias."
    type: number
    sql: ${TABLE}."QTD_DIAS_ARRASTO" ;;
  }

  dimension: seunum {
    description: "Identificador (seunum) do título."
    type: number
    sql: ${TABLE}."SEUNUM" ;;
  }

  dimension: valor_face {
    description: "Valor de face do boleto."
    type: number
    value_format_name: usd
    sql: ${TABLE}."VALOR_FACE" ;;
  }

  dimension: valor_presente {
    description: "Valor presente do título na base OT mais recente."
    type: number
    value_format_name: usd
    sql: ${TABLE}."VALOR_PRESENTE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
