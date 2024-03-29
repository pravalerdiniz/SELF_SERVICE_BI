view: proposta_datas_interfile {
  derived_table: {
    persist_for: "24 hours"
    sql: select
      id_cpf,
      id_proposta,
      f.value:RELEASE_CONTRATO::int as RELEASE_CONTRATO,
      f.value:data_abertura_processo::timestamp as DT_ABERTURA_PROCESSO,
      f.value:data_envio_documentacao_completa_aluno::timestamp as DT_ENVIO_DOCUMENTACAO,
      f.value:data_ultima_resposta_analise_interfile::timestamp as DT_ULTIMA_RESPOSTA_INTERFILE

      from GRADUADO.SELF_SERVICE_BI.PROPOSTA a,
      lateral flatten (input => DATAS_TELEMETRIA_INTEFILE) f
       ;;
  }


  dimension_group: dt_abertura_processo{
  type: time
  timeframes: [
      raw,
      time,
      hour_of_day,
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
    sql: ${TABLE}.DT_ABERTURA_PROCESSO ;;
    label: "Data de Abertura do Processo"
  }

  dimension_group: dt_envio_documentacao{
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
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
    sql: ${TABLE}.DT_ENVIO_DOCUMENTACAO ;;
    label: "Data de Envio da Documentação Completa"
  }

  dimension_group: dt_ultima_resposta_interfile{
    type: time
    timeframes: [
      raw,
      time,
      hour_of_day,
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
    sql: ${TABLE}.DT_ULTIMA_RESPOSTA_INTERFILE ;;
    label: "Data da Última Resposta da Análise"
  }

  dimension: tempo_abertura_envio{
    type: number
    sql: datediff('day',${dt_abertura_processo_raw},${dt_envio_documentacao_raw}) ;;
    value_format: "0.0"
    hidden:  yes
    label: "Tempo entre Abertura do Processo e Envio da Documentação Completa"
  }

  measure: average_tempo_abertura_envio {
    type: average
    sql:  ${tempo_abertura_envio};;
    value_format: "0.0"
    group_label: "Tempo entre Abertura do Processo e Envio da Documentação Completa"
    group_item_label: "Média"
  }

  measure: sum_tempo_abertura_envio {
    type: sum
    sql:  ${tempo_abertura_envio};;
    value_format: "0.0"
    group_label: "Tempo entre Abertura do Processo e Envio da Documentação Completa"
    group_item_label: "Soma"
  }

  dimension: tempo_envio_analise{
    type: number
    sql: datediff('day',${dt_envio_documentacao_raw},${dt_ultima_resposta_interfile_raw}) ;;
    value_format: "0.0"
    hidden:  yes
    label: "Tempo entre Envio da Documentação Completa e Última Análise Interfile"
  }

  measure: average_tempo_envio_analise {
    type: average
    sql:  ${tempo_envio_analise};;
    value_format: "0.0"
    group_label: "Tempo entre Envio da Documentação Completa e Última Análise Interfile"
    group_item_label: "Média"
  }

  measure: sum_tempo_envio_analise {
    type: sum
    sql:  ${tempo_envio_analise};;
    value_format: "0.0"
    group_label: "Tempo entre Envio da Documentação Completa e Última Análise Interfile"
    group_item_label: "Soma"
  }

  dimension: release_contrato {
    type: string
    sql: ${TABLE}."RELEASE_CONTRATO" ;;
    label: "Release do Contrato"
  }

  dimension: id_proposta {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: id_cpf {
    type: string
    hidden: yes
    sql: ${TABLE}."ID_CPF" ;;
  }

}
