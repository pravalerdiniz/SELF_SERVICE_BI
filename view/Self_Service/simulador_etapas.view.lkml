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
    group_label: "Metas"
    group_item_label: "Aguardando Assinatura"
  }

  measure: meta_agg_doc {
    type: sum
    sql: ${meta_agg_doc} ;;
    group_label: "Metas"
    group_item_label: "Aguardando Documento"
  }

  measure: meta_aprov_ies {
    type: sum
    sql: ${meta_aprov_ies} ;;
    group_label: "Metas"
    group_item_label: "Aprovado Instituição"
  }

  measure: meta_aprov_risco {
    type: sum
    sql: ${meta_aprov_risco} ;;
    group_label: "Metas"
    group_item_label: "Aprovado Risco"
  }

  measure: meta_finalizados {
    type: sum
    sql: ${meta_finalizados} ;;
    group_label: "Metas"
    group_item_label: "Finalizado"
  }

  measure: meta_iniciados {
    type: sum
    sql: ${meta_iniciados} ;;
    group_label: "Metas"
    group_item_label: "Iniciado"
  }

  measure: meta_formalizados {
    type: sum
    sql: ${meta_formalizados} ;;
    group_label: "Metas"
    group_item_label: "Formalizado"
  }

}
