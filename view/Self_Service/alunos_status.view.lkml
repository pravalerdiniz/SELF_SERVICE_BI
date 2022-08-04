view: alunos_status {
  sql_table_name: "BO"."PRV_ALUNOS"
    ;;

  dimension: cd_rnv_status {
    type: number
    sql: ${TABLE}."cd_rnv_status" ;;
    group_label: "Status BO"
  }

  dimension: cd_rnv_status_detalhe {
    type: number
    sql: ${TABLE}."cd_rnv_status_detalhe" ;;
    group_label: "Status BO"
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
    hidden:  yes
  }

  dimension: sl_status {
    type: number
    sql: ${TABLE}."sl_status" ;;
    group_label: "Status BO"
  }

  dimension: sl_status_detalhe {
    type: number
    sql: ${TABLE}."sl_status_detalhe" ;;
    group_label: "Status BO"
  }

  dimension: sl_status_full {
    type:  number
    sql: concat(${sl_status},${sl_status_detalhe}) ;;
    group_label: "Status BO"
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."cpf" ;;
    hidden:  yes
  }
  }
