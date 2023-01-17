view: view_solucx_ajustado_meta {

  sql_table_name: "SELF_SERVICE_BI"."VIEW_SOLUCX_AJUSTADO_META"
    ;;

  dimension: ano_pesquisa {
    type: number
    group_item_label: "Ano Pesquisa"
    description: "Ano referente a base de alunos ativos"
    value_format: "0"
    sql: ${TABLE}."ANO_PESQUISA" ;;
  }

  dimension: mes_num {

    type: number
    group_item_label: "Mês Num"
    description: "Mês referente a base de alunos ativos em formato numérico"
    sql: ${TABLE}."MES_NUM" ;;
  }

  dimension: mes {
    type: string
    group_item_label: "Mês"
    description: "Mês referente a base de alunos ativos"
    sql: ${TABLE}."MES" ;;
  }

  measure: qtd_avaliacoes {
    type: sum
    group_item_label: "Quantidade de Avaliações"
    description: "Quantidade de Avaliações Respondidas referente ao mês de disparo"
    sql: ${TABLE}."QTD_AVALIACOES" ;;
  }

  measure: nps {
    type: sum
    group_item_label: "NPS"
    description: "(% de promotores) - (% de detratores)"
    sql: ${TABLE}."NPS" ;;
  }
}
