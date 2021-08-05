view: jornada_pivot {
  derived_table: {
    persist_for: "1 hour"
    sql: select
          id_proposta,
          ULT_STATUS_DETALHADO,
          DT_ULTIMO_STATUS,
          upper(tipo_proposta) as tipo_proposta,
          "'Lead'" as data_lead,
          "'Iniciado'" as data_iniciado,
          "'Finalizado'" as data_finalizado,
          "'Elegivel'" as data_elegivel,
          "'Aprovado Risco'" as data_apr_risco,
          "'Aprovado Behavior'" as data_apr_behavior,
          "'Aprovado Instituicao'" as data_apr_ies,
          "'Aguardando Documento'" as data_agu_doc,
          "'Aguardando Assinatura'" as data_agu_ass,
          "'Contrato Gerado'" as data_cont_ger,
          "'Formalizado'" as data_form,
          "'Cedido'" as data_cedido

      from "GRADUADO"."SELF_SERVICE_BI"."JORNADA"


      pivot(max(DT_STATUS) for ETAPA in ('Lead','Iniciado','Elegivel','Finalizado','Aprovado Behavior','Aprovado Risco','Aprovado Instituicao',
                                         'Contrato Gerado','Aguardando Documento','Aguardando Assinatura','Formalizado','Cedido')) as p

      where upper(tipo_proposta) in ('NOVO','RENOVACAO')

      qualify row_number() over(partition by id_proposta order by data_iniciado) = 1

      order by id_proposta
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: id_proposta {
    type: string
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

  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
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

  dimension_group: data_elegivel {
    type: time
    sql: ${TABLE}."DATA_ELEGIVEL" ;;
    hidden: yes
  }

  dimension_group: data_apr_risco {
    type: time
    sql: ${TABLE}."DATA_APR_RISCO" ;;
    hidden: yes
  }

  dimension_group: data_apr_behavior {
    type: time
    sql: ${TABLE}."DATA_APR_BEHAVIOR" ;;
    hidden: yes
  }

  dimension_group: data_apr_ies {
    type: time
    sql: ${TABLE}."DATA_APR_IES" ;;
    hidden: yes
  }

  dimension_group: data_agu_doc {
    type: time
    sql: ${TABLE}."DATA_AGU_DOC" ;;
    hidden: yes
  }

  dimension_group: data_cont_ger {
    type: time
    sql: ${TABLE}."DATA_CONT_GER" ;;
    hidden: yes
  }

  dimension_group: data_agu_ass {
    type: time
    sql: ${TABLE}."DATA_AGU_ASS" ;;
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

  # Novos
  dimension: sla_ini_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND ((datediff(day,${data_lead_raw} , ${data_iniciado_raw}) < 0
                   or ${data_lead_raw} is null or ${data_iniciado_raw} is null))
              then null
              else datediff(day,${data_lead_raw} , ${data_iniciado_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_fin_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${data_iniciado_raw} , ${data_finalizado_raw}) < 0
                   or ${data_finalizado_raw} is null or ${data_finalizado_raw} is null)
              then null
              else datediff(day,${data_iniciado_raw} , ${data_finalizado_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_apr_risco_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${data_finalizado_raw} , ${data_apr_risco_raw}) < 0
                   or ${data_finalizado_raw} is null or ${data_apr_risco_raw} is null)
              then null
              else datediff(day,${data_finalizado_raw} , ${data_apr_risco_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_apr_ies_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${data_apr_risco_raw},${data_apr_ies_raw}) < 0
                   or ${data_apr_risco_raw} is null or ${data_apr_ies_raw} is null)
              then null
              else datediff(day,${data_apr_risco_raw},${data_apr_ies_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_agu_doc_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${data_apr_ies_raw},${data_agu_ass_raw}) < 0
                   or ${data_apr_ies_raw} is null or ${data_agu_ass_raw} is null)
              then null
              else datediff(day,${data_apr_ies_raw},${data_agu_ass_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_cont_ger_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${data_agu_doc_raw},${data_cont_ger_raw}) < 0
                   or ${data_agu_doc_raw} is null or ${data_cont_ger_raw} is null)
              then null
              else datediff(day,${data_agu_doc_raw},${data_cont_ger_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }


  dimension: sla_agu_ass_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${data_cont_ger_raw},${data_agu_ass_raw}) < 0
                   or ${data_cont_ger_raw} is null or ${data_agu_ass_raw} is null)
              then null
              else datediff(day,${data_cont_ger_raw},${data_agu_ass_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }




  dimension: sla_form_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${data_agu_ass_raw},${data_form_raw}) < 0
                   or ${data_agu_ass_raw} is null or ${data_form_raw} is null)
              then null
              else datediff(day,${data_agu_ass_raw},${data_form_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_ced_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${data_form_raw},${data_cedido_raw}) < 0
                   or ${data_form_raw} is null or ${data_cedido_raw} is null)
              then null
              else datediff(day,${data_form_raw},${data_cedido_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_total_novos {
    type: number
    sql: case when ${tipo_proposta} = 'NOVO' AND (datediff(day,${data_iniciado_raw},${data_cedido_raw}) < 0
                   or ${data_iniciado_raw} is null or ${data_cedido_raw} is null)
              then null
              else datediff(day,${data_iniciado_raw},${data_cedido_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

# Renovação
  dimension: sla_eleg_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${data_iniciado_raw} , ${data_elegivel_raw}) < 0
                   or ${data_iniciado_raw} is null or ${data_elegivel_raw} is null)
              then null
              else datediff(day,${data_iniciado_raw} , ${data_elegivel_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_beha_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${data_elegivel_raw} , ${data_apr_behavior_raw}) < 0
                   or ${data_elegivel_raw} is null or ${data_apr_behavior_raw} is null)
              then null
              else datediff(day,${data_elegivel_raw} , ${data_apr_behavior_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_apr_ies_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${data_apr_behavior_raw} , ${data_apr_ies_raw}) < 0
                   or ${data_apr_behavior_raw} is null or ${data_apr_ies_raw} is null)
              then null
              else datediff(day,${data_apr_behavior_raw} , ${data_apr_ies_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_agu_doc_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${data_apr_ies_raw},${data_agu_doc_raw}) < 0
                   or ${data_apr_ies_raw} is null or ${data_agu_doc_raw} is null)
              then null
              else datediff(day,${data_apr_ies_raw},${data_agu_doc_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_cont_ger_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${data_agu_doc_raw},${data_cont_ger_raw}) < 0
                   or ${data_agu_doc_raw} is null or ${data_cont_ger_raw} is null)
              then null
              else datediff(day,${data_agu_doc_raw},${data_cont_ger_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_agu_ass_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${data_cont_ger_raw},${data_agu_ass_raw}) < 0
                   or ${data_cont_ger_raw} is null or ${data_agu_ass_raw} is null)
              then null
              else datediff(day,${data_cont_ger_raw},${data_agu_ass_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_form_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${data_agu_ass_raw},${data_form_raw}) < 0
                   or ${data_agu_ass_raw} is null or ${data_form_raw} is null)
              then null
              else datediff(day,${data_agu_ass_raw},${data_form_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_ced_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${data_form_raw},${data_cedido_raw}) < 0
                   or ${data_form_raw} is null or ${data_cedido_raw} is null)
              then null
              else datediff(day,${data_form_raw},${data_cedido_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  dimension: sla_total_renov {
    type: number
    sql: case when ${tipo_proposta} = 'RENOVACAO' AND (datediff(day,${data_iniciado_raw},${data_cedido_raw}) < 0
                   or ${data_iniciado_raw} is null or ${data_cedido_raw} is null)
              then null
              else datediff(day,${data_iniciado_raw},${data_cedido_raw})
         end ;;
    value_format: "0"
    hidden: yes
  }

  set: detail {
    fields: [
      id_proposta,
      ult_status_detalhado,
      dt_ultimo_status_time,
      tipo_proposta,
      data_lead_time,
      data_iniciado_time,
      data_finalizado_time,
      data_elegivel_time,
      data_apr_risco_time,
      data_apr_behavior_time,
      data_apr_ies_time,
      data_agu_ass_time,
      data_cont_ger_time,
      data_agu_ass_time,
      data_form_time,
      data_cedido_time
    ]
  }
}
