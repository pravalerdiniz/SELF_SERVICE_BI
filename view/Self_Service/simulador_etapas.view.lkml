# The name of this view in Looker is "Simulador Etapas"
view: simulador_etapas {

  sql_table_name: "COMERCIAL"."SIMULADOR_ETAPAS"
    ;;

  dimension: ano_mes {
    type: string
    label: "ANO MES"
    description: "Ano mês da meta"
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: gerente {
    type: string
    label: "Gerente"
    description: "Gerente da carteira"
    sql: ${TABLE}."GERENTE" ;;
  }

  dimension: grupo {
    type: string
    label: "Grupo da Instituição"
    description: "Grupo da Instituição de Ensino"
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: meta_agg_ass {
    type: number
    label: "Meta Aguardando Assinatura"
    description: "Meta Aguardando Assinatura"
    hidden: yes
    sql: ${TABLE}."META_AGG_ASS" ;;
  }

  measure: total_meta_agg_ass {
    type: sum
    group_label: "Metas"
    group_item_label: "Aguardando Documento"
    sql: ${meta_agg_ass} ;;
  }

  dimension: meta_agg_doc {
    type: number
    label: "Meta Aguardando Documento"
    description: "Meta Aguardando Documento"
    hidden: yes
    sql: ${TABLE}."META_AGG_DOC" ;;
  }

  measure: total_meta_agg_doc {
    type: sum
    group_label: "Metas"
    group_item_label: "Aguardando Documento"
    sql: ${meta_agg_doc} ;;
  }

  dimension: meta_aprov_ies {
    type: number
    label: "Meta Aprovado IES"
    description: "Meta Aprovado IES"
    hidden: yes
    sql: ${TABLE}."META_APROV_IES" ;;
  }

  measure: total_meta_aprov_ies {
    type: sum
    group_label: "Metas"
    group_item_label: "Aprovado Instituição"
    sql: ${meta_aprov_ies} ;;
  }

  dimension: meta_aprov_risco {
    type: number
    label: "Meta Aprovado Risco"
    description: "Meta Aprovado Risco"
    hidden: yes
    sql: ${TABLE}."META_APROV_RISCO" ;;
  }

  measure: total_meta_aprov_risco {
    type: sum
    group_label: "Metas"
    group_item_label: "Aprovado Risco"
    sql: ${meta_aprov_risco} ;;
  }

  dimension: meta_finalizados {
    type: number
    label: "Meta Finalizado"
    description: "Meta Finalizado"
    hidden: yes
    sql: ${TABLE}."META_FINALIZADOS" ;;
  }

  measure: total_meta_finalizados {
    type: sum
    group_label: "Metas"
    group_item_label: "Finalizado"
    sql: ${meta_finalizados} ;;
  }

  dimension: meta_formalizados {
    type: number
    label: "Meta Formalizado"
    description: "Meta Formalizado"
    hidden: yes
    sql: ${TABLE}."META_FORMALIZADOS" ;;
  }

  measure: total_meta_formalizados {
    type: sum
    group_label: "Metas"
    group_item_label: "Formalizado"
    sql: ${meta_formalizados} ;;
  }

  dimension: meta_iniciados {
    type: number
    label: "Meta Iniciado"
    description: "Meta Iniciado"
    hidden: yes
    sql: ${TABLE}."META_INICIADOS" ;;
  }

  measure: total_meta_iniciados {
    type: sum
    group_label: "Metas"
    group_item_label: "Iniciado"
    sql: ${meta_iniciados} ;;
  }

}
