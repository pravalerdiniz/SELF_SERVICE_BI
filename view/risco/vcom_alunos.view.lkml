view: vcom_alunos {
  sql_table_name: "POS_GRADUADO"."CCR"."VCOM_ALUNOS"
  ;;

  ## DIMENSÕES ##

  dimension: id_cpf {
    type: number
    label: "ID CPF"
    group_label: "Dados do Aluno"
    description: "INDICA DO ID CPF DO ALUNO"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: cpf {
    type: number
    label: "CPF"
    group_label: "Dados do Aluno"
    description: "NÚMERO DE CPF DO ALUNO (DEVEDOR)"
    sql: ${TABLE}."CPF" ;;
    primary_key: yes
  }

  dimension: qtd_tel {
    type: number
    label: "Telefone Envio"
    group_label: "Validação de Dados"
    description: "QUANTIDADE DE TELEFONES ENVIADOS"
    sql: ${TABLE}."QTD_TEL" ;;
  }

  dimension: qtd_tel_rb {
    type: number
    label: "Telefone Recebimento"
    group_label: "Validação de Dados"
    description: "QUANTIDADE DE TELEFONES RECEBIDOS"
    sql: ${TABLE}."QTD_TEL_RB" ;;
  }

  dimension: qtd_tel_ne {
    type: number
    label: "Telefone Não Envio"
    group_label: "Validação de Dados"
    description: "QUANTIDADE DE TELEFONES NÃO ENVIADOS"
    sql: ${TABLE}."QTD_TEL_NE" ;;
  }

  dimension: flg_tel_vld {
    type: yesno
    label: "Telefone Flag Validação"
    group_label: "Validação de Dados"
    description: "INDICA SE TODOS OS TELEFONES FORAM ENVIADOS"
    sql: ${TABLE}."FLG_TEL_VLD" ;;
  }

  dimension: qtd_email {
    type: number
    label: "Email Envio"
    group_label: "Validação de Dados"
    description: "QUANTIDADE DE EMAILS ENVIADOS"
    sql: ${TABLE}."QTD_EMAIL" ;;
  }

  dimension: qtd_email_rb {
    type: number
    label: "Email Recebimento"
    group_label: "Validação de Dados"
    description: "QUANTIDADE DE EMAILS RECEBIDOS"
    sql: ${TABLE}."QTD_EMAIL_RB" ;;
  }

  dimension: qtd_email_ne {
    type: number
    label: "Email Não Envio"
    group_label: "Validação de Dados"
    description: "QUANTIDADE DE EMAILS NÃO ENVIADOS"
    sql: ${TABLE}."QTD_EMAIL_NE" ;;
  }

  dimension: flg_email_vld {
    type: yesno
    label: "Email Flag Validação"
    group_label: "Validação de Dados"
    description: "INDICA SE TODOS OS EMAILS FORAM ENVIADOS"
    sql: ${TABLE}."FLG_EMAIL_VLD" ;;
  }

  dimension: qtd_end {
    type: number
    label: "Endereço Envio"
    group_label: "Validação de Dados"
    description: "QUANTIDADE DE ENDEREÇOS ENVIADOS"
    sql: ${TABLE}."QTD_END" ;;
  }

  dimension: qtd_end_rb {
    type: number
    label: "Endereço Recebimento"
    group_label: "Validação de Dados"
    description: "QUANTIDADE DE ENDEREÇOS RECEBIDOS"
    sql: ${TABLE}."QTD_END_RB" ;;
  }

  dimension: qtd_end_ne {
    type: number
    label: "Endereço Não Envio"
    group_label: "Validação de Dados"
    description: "QUANTIDADE DE ENDEREÇOS NÃO ENVIADOS"
    sql: ${TABLE}."QTD_END_NE" ;;
  }

  dimension: flg_end_vld {
    type: yesno
    label: "Endereço Flag Validação"
    group_label: "Validação de Dados"
    description: "INDICA SE TODOS OS ENDEREÇOS FORAM ENVIADOS"
    sql: ${TABLE}."FLG_END_VLD" ;;
  }

  dimension: flg_cad_vcom {
    type: yesno
    label: "Flag CPF Vcom"
    group_label: "Validação de Dados"
    description: "INDICA SE O CPF ESTÁ REGISTRADO OU NÃO NA VCOM"
    sql: ${TABLE}."FLG_CAD_VCOM" ;;
  }


  ## MEDIDAS ##

  measure: count_cpf {
    type: count
    label: "Contagem de CPF"
    description: "Contagem de CPF (Não é uma contagem distinta)"
  }



}
