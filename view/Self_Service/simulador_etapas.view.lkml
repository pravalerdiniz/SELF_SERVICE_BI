# The name of this view in Looker is "Simulador Etapas"
view: simulador_etapas {

  sql_table_name: "COMERCIAL"."SIMULADOR_ETAPAS"
    ;;

  dimension: ano_mes {
    type: string
    label: "ANO MES"
    description: "Ano e mês da meta"
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: gerente {
    type: string
    label: "Gerente"
    description: "Nome do gerente da carteira"
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: grupo {
    type: string
    label: "Grupo Instituição"
    description: "Nome do grupo da instituição"
    sql: ${TABLE}."GRUPO" ;;
  }

  measure: meta_agg_ass {
    type: sum
    sql: ${meta_agg_ass} ;;
    group_label: "Métricas"
    group_item_label: "Meta Aguardando Assinatura"
    description: "Meta Aguardando Assinatura gerada pelo Simulador"
  }

  measure: meta_agg_doc {
    type: sum
    sql: ${meta_agg_doc} ;;
    group_label: "Métricas"
    group_item_label: "Meta Aguardando Documento"
    description: "Meta Aguardando Documento gerada pelo Simulador"
  }

  measure: meta_aprov_ies {
    type: sum
    sql: ${meta_aprov_ies} ;;
    group_label: "Métricas"
    group_item_label: "Meta Aprovado Instituição"
    description: "Meta Aprovado Instituição gerada pelo Simulador"
  }

  measure: meta_aprov_risco {
    type: sum
    sql: ${meta_aprov_risco} ;;
    group_label: "Métricas"
    group_item_label: "Meta Aprovado Risco"
    description: "Meta Aprovado Risco gerada pelo Simulador"
  }

  measure: meta_finalizados {
    type: sum
    sql: ${meta_finalizados} ;;
    group_label: "Métricas"
    group_item_label: "Meta Finalizado"
    description: "Meta Finalizado gerada pelo Simulador"
  }

  measure: meta_iniciados {
    type: sum
    sql: ${meta_iniciados} ;;
    group_label: "Métricas"
    group_item_label: "Meta Iniciado"
    description: "Meta Iniciado gerada pelo Simulador"
  }

  measure: meta_formalizados {
    type: sum
    sql: ${meta_formalizados} ;;
    group_label: "Métricas"
    group_item_label: "Meta Formalizado"
    description: "Meta Formalizado gerada pela área Inteligência Comercial"
  }

}
