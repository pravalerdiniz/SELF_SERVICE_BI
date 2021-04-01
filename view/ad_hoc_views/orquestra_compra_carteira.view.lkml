view: orquestra_compra_carteira {
  sql_table_name: "AD_HOC"."ORQUESTRA_COMPRA_CARTEIRA"
    ;;

  dimension: classificacao {
    type: string
    label: "Classificação"
    sql: ${TABLE}."CLASSIFICACAO" ;;
  }

  dimension: cpf_aluno {
    type: number
    label: "CPF"
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  dimension_group: data_encaminhamento {
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
    label: "Encaminhamento"
    sql: ${TABLE}."DATA_ENCAMINHAMENTO" ;;
  }

  dimension_group: data_resolucao {
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
    label: "Resolução"
    sql: ${TABLE}."DATA_RESOLUCAO" ;;
  }

  dimension: descricao {
    type: string
    label: "Descrição"
    sql: ${TABLE}."DESCRICAO" ;;
  }

  dimension: ies {
    type: string
    label: "Nome da IES"
    sql: ${TABLE}."IES" ;;
  }

  dimension: nome {
    type: string
    label: "Nome do Aluno"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: numero {
    type: string
    label: "Nº do Chamado"
    sql: ${TABLE}."NUMERO" ;;
  }

  dimension: status {
    type: string
    label: "Status do Chamado"
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: tempo_resolucao {
    type: number
    label: "Tempo de Resolução - em horas"

    sql: ${TABLE}."TEMPO_RESOLUCAO" ;;
  }

  dimension_group: ultimo_status {
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
    label: "Ultimo Status"
    sql: ${TABLE}."ULTIMO_STATUS" ;;
  }

  dimension: zendesk {
    type: string
    label: "Código - Zendesk"
    sql: ${TABLE}."ZENDESK" ;;
  }

  measure: count {
    type: count
    label: "Quantidade de Chamados"
    drill_fields: []
  }

  measure: sum_tempo_resolucao {
    type: sum
    group_label: "Tempo de Resolução - em horas"
    label: "Soma"
    drill_fields: []
    sql: ${tempo_resolucao} ;;
  }


  measure: min_tempo_resolucao {
    type: min
    group_label: "Tempo de Resolução - em horas"
    label: "Mínimo"
    drill_fields: []
    sql: ${tempo_resolucao} ;;
  }

  measure: max_tempo_resolucao {
    type: max
    group_label: "Tempo de Resolução - em horas"
    label: "Máximo"
    drill_fields: []
    sql: ${tempo_resolucao} ;;
  }


  measure: avg_tempo_resolucao {
    type: average
    group_label: "Tempo de Resolução - em horas"
    label: "Média"
    value_format: "0"
    drill_fields: []
    sql: ${tempo_resolucao} ;;
  }

}
