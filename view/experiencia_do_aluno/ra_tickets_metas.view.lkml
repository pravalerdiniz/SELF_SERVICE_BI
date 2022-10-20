view: ra_tickets_metas {
  sql_table_name: "SELF_SERVICE_BI"."RA_TICKETS_METAS"
    ;;

  dimension: ano_mes_criacao {
    type: string
    group_label: "Dados da Reclamação"
    group_item_label: "Ano/Mês - Criação da Reclamação"
    description: "Ano e mês em que a reclamação foi criada."
    sql: ${TABLE}."ANO_MES_CRIACAO" ;;
  }



  measure: total_qtd_avaliadas_validas {
    type: sum
    group_label: "Dados da Avaliação"
    group_item_label: "Qtd Avaliações Válidas"
    description: "Número de avaliações válidas."
    sql: ${TABLE}."TOTAL_QTD_AVALIADA_VALIDAS" ;;
  }

  measure: total_reclamacoes {
    type: sum
    group_label: "Dados da Reclamação"
    group_item_label: "Qtd Reclamações"
    description: "Número de reclamações."
    sql: ${TABLE}."TOTAL_RECLAMACOES" ;;
  }

  measure: qtd_reclamacoes_validas {
    type: sum
    group_label: "Dados da Reclamação"
    group_item_label: "Qtd Reclamações Válidas"
    description: "Número de reclamações válidas."
    sql: ${TABLE}."QTD_RECLAMACOES_VALIDAS" ;;
  }



  measure: qtd_problema_resolvido {
    type: sum
    group_label: "Dados da Avaliação"
    group_item_label: "Qtd Problemas Resolvidos"
    description: "Número de avaliações válidas que tiveram seu problema resolvido."
    sql: ${TABLE}."QTD_PROBLEMA_RESOLVIDO" ;;
  }

  measure: qtd_voltaria_fazer_negocio {
    type: sum
    group_label: "Dados da Avaliação"
    group_item_label: "Qtd Voltaria Fazer Negócio"
    description: "Número de avaliações válidas onde o aluno voltaria a fazer negócio."
    sql: ${TABLE}."QTD_VOLTARIA_FAZER_NEGOCIO" ;;
  }



  measure: spfr_atual {
    type: sum
    group_label: "Dados da Meta | Problema Resolvido"
    group_item_label: "% Avaliações"
    description: "Percentual de quantas avaliações tiveram seu problema resolvido."
    sql: ${TABLE}."SPFR_ATUAL" ;;
  }

  measure: spfr_meta {
    type: sum
    group_label: "Dados da Meta | Problema Resolvido"
    group_item_label: "Avaliações Faltantes"
    description: "Quantas avaliações faltam para bater a meta de 91%."
    sql: ${TABLE}."SPFR_META" ;;
  }

  measure: vfn_atual {
    type: sum
    group_label: "Dados da Meta | Voltaria fazer Negócio"
    group_item_label: "% Avaliações"
    description: "Percentual de quantas avaliações voltariam fazer negócio."
    sql: ${TABLE}."VFN_ATUAL" ;;
  }

  measure: vfn_meta {
    type: sum
    group_label: "Dados da Meta | Voltaria fazer Negócio"
    group_item_label: "Avaliações Faltantes"
    description: "Quantas avaliações faltam para bater a meta de 73%."
    sql: ${TABLE}."VFN_META" ;;
  }

}
