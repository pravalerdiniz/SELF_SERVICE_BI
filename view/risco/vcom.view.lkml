view: vcom_erros {
  sql_table_name:"POS_GRADUADO"."CCR"."VCOM_OPERACOES"
    ;;

 ## DIMENSÕES ##

  dimension: id_mdw {
    type: string
    label: "ID Middleware"
    group_label: "Dados do Middleware"
    description: "ID DO REGISTRO NO MIDDLEWARE"
    sql: ${TABLE}."ID_MDW" ;;
    primary_key: yes
  }

  dimension: id_cpf {
    type: number
    label: "ID CPF"
    group_label: "Dados do Aluno"
    description: "NÚMERO ATRIBUÍDO COMO MÁSCARA DO CPF DO ALUNO"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: cpf {
    type: string
    label: "CPF"
    group_label: "Dados do Aluno"
    description: "CPF DO ALUNO'"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: flg_cpf_enviado {
    type: yesno
    label: "CPF Enviado"
    group_label: "Dados de Fluxo"
    description: "INDICA SE O CPF JÁ FOI ENVIADO PELO MIDDLEWARE"
    sql: ${TABLE}."FLG_CPF_ENVIADO" ;;
  }

  dimension: etapa {
    type: number
    label: "Etapa"
    group_label: "Dados de Fluxo"
    description: "ETAPA NO FLUXO"
    sql: ${TABLE}."ETAPA" ;;
  }

  dimension: fluxo {
    type: string
    label: "Fluxo"
    group_label: "Dados de Fluxo"
    description: "FLUXO UTILIZADO PARA ENVIO'"
    sql: ${TABLE}."FLUXO" ;;
  }

  dimension: layoutatual {
    type: string
    label: "Layout Atual"
    group_label: "Dados de Fluxo"
    description: "LAYOUT UTILIZADO PARA ENVIO"
    sql: ${TABLE}."LAYOUTATUAL" ;;
  }

  dimension: mensagem_erro {
    type: string
    label: "Mensagem de Erro"
    group_label: "Dados de Fluxo"
    description: "MENSSAGEM DE ERRO PARA OS REGISTROS QUE FOREM REJEITADOS PARA VCOM"
    sql: ${TABLE}."MENSAGEM_ERRO" ;;
  }

  dimension: classificacao_erro {
    type: string
    label: "Classificação Erro"
    group_label: "Dados de Fluxo"
    description: "INDICA A CAUSA RAIZ DA MENSAGEM DE ERRO"
    sql: ${TABLE}."CLASSIFICACAO_ERRO" ;;
  }

  dimension: flg_ultima_op {
    type: yesno
    label: "Titulo Enviado"
    group_label: "Dados de Fluxo"
    description: "INDICA SE O TITULO ESTÁ NO MIDDLEWARE"
    sql: ${TABLE}."FLG_ULTIMA_OP" ;;
  }

  ## DATAS ##

  dimension_group: dt_cricao_mdw {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    label: "Data Criação"
    description: "INDICA A DATA DE CRIAÇÃO DO REGISTRO DO MIDDLEWARE"
    sql: ${TABLE}."DT_CRICAO_MDW" ;;
  }

  dimension_group: dt_atualizao_mdw {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    label: "Data Atualização"
    description: "INDICA A DATA DE ATUALIZAÇÃO DO REGISTRO DO MIDDLEWARE"
    sql: ${TABLE}."DT_ATUALIZAO_MDW" ;;
  }

}
