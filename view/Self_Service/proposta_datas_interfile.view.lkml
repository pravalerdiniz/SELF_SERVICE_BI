view: proposta_datas_interfile {
  derived_table: {
    persist_for: "1 hour"
    sql: select
      id_cpf,
      id_proposta,
      f.value:RELEASE_CONTRATO::int as RELEASE_CONTRATO,
      f.value:data_abertura_processo::date as DT_ABERTURA_PROCESSO,
      f.value:data_envio_documentacao_completa_aluno::date as DT_ENVIO_DOCUMENTACAO,
      f.value:data_ultima_resposta_analise_interfile::date as DT_ULTIMA_RESPOSTA_INTERFILE

      from GRADUADO.SELF_SERVICE_BI.PROPOSTA a,
      lateral flatten (input => DATAS_TELEMETRIA_INTEFILE) f
       ;;
  }


  dimension: dt_abertura_processo{
    type: date_time
    sql: ${TABLE}.DT_ABERTURA_PROCESSO ;;
    label: "Data de Abertura do Processo"
  }

  dimension: dt_envio_documentacao{
    type: date_time
    sql: ${TABLE}.DT_ENVIO_DOCUMENTACAO ;;
    label: "Data de Envio da Documentação Completa"
  }

  dimension: dt_ultima_resposta_interfile{
    type: date_time
    sql: ${TABLE}.DT_ULTIMA_RESPOSTA_INTERFILE ;;
    label: "Data da Última Resposta da Análise"
  }

  dimension: tempo_abertura_envio{
    type: number
    sql: diffdays(${dt_envio_documentacao},${dt_abertura_processo}) ;;
    label: "Tempo entre Abertura do Processo e Envio da Documentação Completa"
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
