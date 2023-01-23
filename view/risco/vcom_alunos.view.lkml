view: vcom_alunos {
  sql_table_name: "CCR"."VCOM_ALUNOS"
  ;;

  ## DIMENSÕES ##

  dimension: id_cpf {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: cpf {
    type: number
    label: "CPF"
    group_label: "Dados do Aluno"
    description: "NÚMERO DE CPF DO ALUNO"
    sql: ${TABLE}."CPF" ;;
    primary_key: yes
  }

  dimension: qtd_tel {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."QTD_TEL" ;;
  }

  dimension: qtd_tel_rb {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."QTD_TEL_RB" ;;
  }

  dimension: qtd_tel_ne {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."QTD_TEL_NE" ;;
  }

  dimension: flg_tel_vld {
    type: yesno
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."FLG_TEL_VLD" ;;
  }

  dimension: qtd_email {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."QTD_EMAIL" ;;
  }

  dimension: qtd_email_rb {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."QTD_EMAIL_RB" ;;
  }

  dimension: qtd_email_ne {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."QTD_EMAIL_NE" ;;
  }

  dimension: flg_email_vld {
    type: yesno
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."FLG_EMAIL_VLD" ;;
  }

  dimension: qtd_end {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."QTD_END" ;;
  }

  dimension: qtd_end_rb {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."QTD_END_RB" ;;
  }

  dimension: qtd_end_ne {
    type: number
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."QTD_END_NE" ;;
  }

  dimension: flg_end_vld {
    type: yesno
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."FLG_END_VLD" ;;
  }

  dimension: flg_cad_vcom {
    type: yesno
    label: ""
    group_label: ""
    description: ""
    sql: ${TABLE}."FLG_CAD_VCOM" ;;
  }


  ## MEDIDAS ##



}
