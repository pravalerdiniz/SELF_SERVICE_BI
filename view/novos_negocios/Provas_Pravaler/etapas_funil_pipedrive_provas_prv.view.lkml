view: etapas_funil_pipedrive_provas_prv {
  derived_table: {
    sql: select
      ID_NEGOCIO,
      f.key as id_pipeline,
      f.value:DATA_MUDANCA_ETAPA::timestamp as date_etapa,
      f.value:DT_ATUALIZACAO_ETAPA::timestamp as date_atualizacao_etapa,
      f.value:NOME_ETAPA_FUNIL::varchar as nome_etapa_funil,
      f.value:FLG_ETAPA_ESTAGNADO::boolean as flg_etapa_atual,
      f.value:ID_ETAPA::int as id_etapa,
      f.value:ID_ETAPA_FUNIL::int as id_etapa_funil,
      f.value:ID_FUNIL::int as id_funil,
      f.value:NOME_FUNIL::varchar as nome_funil,
      f.value:SEGUNDOS_ESTAGNADO::int as segundos_na_etapa
      from "PIPEDRIVE"."NEGOCIOS_PROVAS_PRAVALER" a ,
      lateral flatten (input => INFOS_PIPELINE) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_negocio {
    type: number
    sql: ${TABLE}."ID_NEGOCIO" ;;
  }

  dimension: id_pipeline {
    type: string
    sql: ${TABLE}."ID_PIPELINE" ;;
  }

  dimension_group: date_etapa {
    type: time
    sql: ${TABLE}."DATE_ETAPA" ;;
  }

  dimension_group: date_atualizacao_etapa {
    type: time
    sql: ${TABLE}."DATE_ATUALIZACAO_ETAPA" ;;
  }

  dimension: nome_etapa_funil {
    type: string
    sql: ${TABLE}."NOME_ETAPA_FUNIL" ;;
  }

  dimension: etapa_depara {
    type: string
    description: "Indica a etapa do funil de vendas"
    sql: CASE WHEN ${nome_etapa_funil} = 'Novos Leads' or ${nome_etapa_funil} = '1 - Com contato' or ${nome_etapa_funil} = 'Novos Negócios' THEN '01 - Novos Negócios '
          WHEN ${nome_etapa_funil} = '2 - Reunião' THEN '02 - Agendados Equipe Provas'
          WHEN ${nome_etapa_funil} = '3 - Elaboração e Envio de Proposta' THEN '03 - Elaboração de Proposta'
          WHEN ${nome_etapa_funil} = '4 - Proposta em Análise' THEN '04 - Proposta Enviada'
          WHEN ${nome_etapa_funil} = '5 - Operações Internas' THEN '05 - Piloto/POC'
          WHEN ${nome_etapa_funil} = '7 - Contrato Assinado' THEN '08 - Negócio Fechado'
          WHEN ${nome_etapa_funil} = '6 - Envio de Contrato' THEN '07 - Aguardando Assinatura'
          WHEN ${nome_etapa_funil} = 'Não Engajada' THEN 'Não Classificada'
          WHEN ${nome_etapa_funil} = 'Médio Engajada' THEN 'Não Classificada'
          WHEN ${nome_etapa_funil} = 'Novos Leads' THEN 'Não Classificada'
          WHEN ${nome_etapa_funil} IS NULL THEN 'Não Classificada'
          WHEN ${nome_etapa_funil} = 'Não Classificada' THEN 'Não Classificada'
          ELSE ${nome_etapa_funil} END ;;
  }

  dimension: etapa_depara_checkpoint_v {
    type: string
    description: "Indica a etapa do funil de vendas no quadro apresentado no checkpoint, combinando o status do negócio com a etapa atual"
    sql: CASE WHEN ${etapa_depara} = '01 - Novos Negócios ' and ${negocios_provas_pravaler.status_negocio} = 'ABERTO' THEN '1. Leads'
          WHEN ${etapa_depara} = '02 - Agendados Equipe Provas' and ${negocios_provas_pravaler.status_negocio} = 'ABERTO' or ${etapa_depara} = '03 - Elaboração de Proposta' and ${negocios_provas_pravaler.status_negocio} = 'ABERTO' THEN '2. Reuniões Agendadas'
          WHEN ${etapa_depara} = '04 - Proposta Enviada' and ${negocios_provas_pravaler.status_negocio} = 'ABERTO' or ${etapa_depara} = '05 - Piloto/POC' and ${negocios_provas_pravaler.status_negocio} = 'ABERTO' THEN '3. Propostas Enviadas'
          WHEN ${etapa_depara} = '06 - Negociação / Fechamento' and ${negocios_provas_pravaler.status_negocio} = 'ABERTO' or ${etapa_depara} = '07 - Aguardando Assinatura' and ${negocios_provas_pravaler.status_negocio} = 'ABERTO' THEN '4. Negociações Finais'
          WHEN ${etapa_depara} = '08 - Negócio Fechado' and ${negocios_provas_pravaler.status_negocio} = 'GANHO' THEN '5. Contratos Fechados'
          WHEN ${etapa_depara} = 'On Hold (Retomar em 2023)' THEN '6. On Hold'
          WHEN ${etapa_depara} = '04 - Proposta Enviada' and ${negocios_provas_pravaler.status_negocio} = 'PERDIDO' or ${etapa_depara} = '05 - Piloto/POC' and ${negocios_provas_pravaler.status_negocio} = 'PERDIDO' or ${etapa_depara} = '06 - Negociação / Fechamento' and ${negocios_provas_pravaler.status_negocio} = 'PERDIDO' or ${etapa_depara} = '07 - Aguardando Assinatura' and ${negocios_provas_pravaler.status_negocio} = 'PERDIDO' THEN '7. Propostas Negadas'
          ELSE 'Não Classificada' END ;;
  }

  dimension: flg_etapa_atual {
    type: yesno
    sql: ${TABLE}."FLG_ETAPA_ATUAL" ;;
  }

  dimension: id_etapa {
    type: number
    sql: ${TABLE}."ID_ETAPA" ;;
  }

  dimension: id_etapa_funil {
    type: number
    sql: ${TABLE}."ID_ETAPA_FUNIL" ;;
  }

  dimension: id_funil {
    type: number
    sql: ${TABLE}."ID_FUNIL" ;;
  }

  dimension: nome_funil {
    type: string
    sql: ${TABLE}."NOME_FUNIL" ;;
  }

  measure: segundos_na_etapa {
    type: sum
    sql: ${TABLE}."SEGUNDOS_NA_ETAPA" ;;
  }

  set: detail {
    fields: [
      id_negocio,
      id_pipeline,
      date_etapa_time,
      date_atualizacao_etapa_time,
      nome_etapa_funil,
      flg_etapa_atual,
      id_etapa,
      id_etapa_funil,
      id_funil,
      nome_funil,
      segundos_na_etapa
    ]
  }
}
