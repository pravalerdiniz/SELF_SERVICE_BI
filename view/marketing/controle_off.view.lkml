view: controle_off {

  sql_table_name: "POS_GRADUADO"."MARKETING"."CONTROLE_OFF"
    ;;

  dimension: areas_comuns {
    type: string
    sql: ${TABLE}."AREAS_COMUNS_" ;;
    group_label: "Tipos de Positivação"
    label: "Áreas Comuns? (Possui/Não Possui)"
  }

  dimension: areas_especiais {
    type: string
    sql: ${TABLE}."AREAS_ESPECIAIS" ;;
    group_label: "Tipos de Positivação"
    label: "Áreas Especiaos? (Possui/Não Possui)"
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

  dimension: call_center {
    type: string
    sql: ${TABLE}."CALL_CENTER" ;;
    group_label: "Tipos de Positivação"
    label: "Call Center? (Possui/Não Possui)"
  }

  dimension: campus {
    type: string
    sql: ${TABLE}."CAMPUS" ;;
    group_label: "Dados da IES"
    label: "Campus"
  }

  dimension: canais {
    type: string
    sql: ${TABLE}."CANAIS" ;;
    group_label: "Tipos de Positivação"
    label: "Call Center? (Possui/Não Possui)"
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
    label: "Grupo da IES"
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

  dimension: periodicidade {
    type: string
    sql: ${TABLE}."PERIODICIDADE" ;;
    label: "Periodicidade"
  }

  dimension: resultado {
    type: string
    sql: ${TABLE}."RESULTADO" ;;
    label: "Resultado"
  }

  dimension: sala {
    type: string
    sql: ${TABLE}."SALA" ;;
    group_label: "Tipos de Positivação"
    label: "Sala? (Possui/Não Possui)"
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
    label: "Status das Positivações"
  }

  dimension: status_1 {
    type: string
    sql: ${TABLE}."STATUS_1" ;;
    hidden: yes
  }

  dimension: visibilidade {
    type: string
    sql: ${TABLE}."VISIBILIDADE" ;;
    label: "Visibilidade das Positivações"
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
