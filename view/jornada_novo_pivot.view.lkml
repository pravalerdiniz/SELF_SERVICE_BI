view: jornada_novo_pivot {
  derived_table: {
    sql: select
          id_proposta,
          ULT_STATUS_DETALHADO,
          DT_ULTIMO_STATUS,
          "'Lead'" as data_lead,
          "'Iniciado'" as data_iniciado,
          "'Finalizado'" as data_finalizado,
          "'Aprovado Risco'" as data_apr_risco,
          "'Aprovado Instituicao'" as data_apr_ies,
          "'Contrato Gerado'" as data_cont_ger,
          "'Contrato Assinado'" as data_cont_ass,
          "'Formalizado'" as data_form,
          "'Cedido'" as data_cedido

      from "GRADUADO"."SELF_SERVICE_BI"."JORNADA"


      pivot(max(DT_STATUS) for ETAPA in ('Lead','Iniciado','Finalizado','Aprovado Risco','Aprovado Instituicao','Contrato Gerado',
                                           'Contrato Assinado','Formalizado','Cedido')) as p

      where id_proposta is not null

      qualify row_number() over(partition by id_proposta order by data_iniciado) = 1

      order by id_proposta
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_proposta {
    type: number
    sql: ${TABLE}."ID_PROPOSTA" ;;
    hidden: yes
  }

  dimension: ult_status_detalhado {
    type: string
    sql: ${TABLE}."ULT_STATUS_DETALHADO" ;;
    hidden: yes
  }

  dimension_group: dt_ultimo_status {
    type: time
    sql: ${TABLE}."DT_ULTIMO_STATUS" ;;
    hidden: yes
  }

  dimension_group: data_lead {
    type: time
    sql: ${TABLE}."DATA_LEAD" ;;
    hidden: yes
  }

  dimension_group: data_iniciado {
    type: time
    sql: ${TABLE}."DATA_INICIADO" ;;
    hidden: yes
  }

  dimension_group: data_finalizado {
    type: time
    sql: ${TABLE}."DATA_FINALIZADO" ;;
    hidden: yes
  }

  dimension_group: data_apr_risco {
    type: time
    sql: ${TABLE}."DATA_APR_RISCO" ;;
    hidden: yes
  }

  dimension_group: data_apr_ies {
    type: time
    sql: ${TABLE}."DATA_APR_IES" ;;
    hidden: yes
  }

  dimension_group: data_cont_ger {
    type: time
    sql: ${TABLE}."DATA_CONT_GER" ;;
    hidden: yes
  }

  dimension_group: data_cont_ass {
    type: time
    sql: ${TABLE}."DATA_CONT_ASS" ;;
    hidden: yes
  }

  dimension_group: data_form {
    type: time
    sql: ${TABLE}."DATA_FORM" ;;
    hidden: yes
  }

  dimension_group: data_cedido {
    type: time
    sql: ${TABLE}."DATA_CEDIDO" ;;
    hidden: yes
  }

  set: detail {
    fields: [
      id_proposta,
      ult_status_detalhado,
      dt_ultimo_status_time,
      data_lead_time,
      data_iniciado_time,
      data_finalizado_time,
      data_apr_risco_time,
      data_apr_ies_time,
      data_cont_ger_time,
      data_cont_ass_time,
      data_form_time,
      data_cedido_time
    ]
  }
}
