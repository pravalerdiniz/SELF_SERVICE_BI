view: controle_on {

  sql_table_name: "MARKETING"."CONTROLE_ON"
    ;;

  dimension: analists {
    type: string
    sql: ${TABLE}."ANALISTS" ;;
    label: "Analistas"
  }

  dimension: banner_area_logada {
    type: string
    sql: ${TABLE}."BANNER_AREA_LOGADA" ;;
    group_label: "Tipos de Positivação"
    label: "Banner Área Logada? (Possui/Não Possui)"
  }

  dimension: banner_na_home {
    type: string
    sql: ${TABLE}."BANNER_NA_HOME" ;;
    group_label: "Tipos de Positivação"
    label: "Banner na Home? (Possui/Não Possui)"
  }

  dimension: gerente_comercial {
    type: string
    sql: ${TABLE}."GERENTE_COMERCIAL" ;;
    group_label: "Dados da IES"
    label: "Gerente Comercial"
  }

  dimension: grupo {
    type: string
    sql: ${TABLE}."GRUPO" ;;
    group_label: "Dados da IES"
    label: "Grupo"
  }

  dimension: ies {
    type: string
    sql: ${TABLE}."IES" ;;
    group_label: "Dados da IES"
    label: "Nome da Instituição"
  }

  dimension: lp_atualizada {
    type: string
    sql: ${TABLE}."LP_ATUALIZADA" ;;
    group_label: "Tipos de Positivação"
    label: "LP Atualizada? (Possui/Não Possui)"
  }

  dimension: observacoes {
    type: string
    sql: ${TABLE}."OBSERVACOES" ;;
    label: "Observações"
  }

  dimension: pag_de_financiamento {
    type: string
    sql: ${TABLE}."PAG_DE_FINANCIAMENTO" ;;
    group_label: "Tipos de Positivação"
    label: "Página de Financiamento? (Possui/Não Possui)"
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
    label: "Status das Positivações"
  }

  dimension: visibilidade {
    type: string
    sql: ${TABLE}."VISIBILIDADE" ;;
    label: "Visibilidade"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
