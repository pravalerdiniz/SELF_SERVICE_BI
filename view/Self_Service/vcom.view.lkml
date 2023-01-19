view: vcom_erros {
  sql_table_name:"POS_GRADUADO"."CCR"."VCOM_TITULOS"
    ;;

 ## DIMENSÕES ##

  dimension: id_boleto {
    type: string
    sql: ${TABLE}."ID_BOLETO" ;;
    label: "ID Boleto"
    group_label: "Dados do Boleto"
    description: "IDENTIFICADOR DO BOLETO"
    primary_key: yes
  }

  dimension: id_mdw {
    type: string
    label: "ID Middleware"
    group_label: "Dados do Middleware"
    description: "ID DO REGISTRO NO MIDDLEWARE"
    sql: ${TABLE}."ID_MDW" ;;
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

  dimension: id_seunum {
    type: number
    label: "ID SEUNUM"
    group_label: "Dados do Boleto"
    description: "NUMERO DO SEUNUM DO BOLETO"
    sql: ${TABLE}."ID_SEUNUM" ;;
  }

  dimension: id_nossonum {
    type: number
    label: "ID NOSSONUM"
    group_label: "Dados do Boleto"
    description: "IDENTIFICADOR DO NUMERO DA ENTIDADE QUE GEROU A COBRANÇA"
    sql: ${TABLE}."ID_NOSSONUM" ;;
  }

  dimension: id_tit_vcom {
    type: number
    label: "ID Titulo VCOM"
    group_label: "Dados VCOM"
    description: "ID DO TITULO NA VCOM"
    sql: ${TABLE}."ID_TIT_VCOM" ;;
  }

  dimension: num_parcela {
    type: number
    label: "Número Parcela"
    group_label: "Dados do Contrato"
    description: "NÚMERO DA PARCELA DO CONTRATO DO ALUNO"
    sql: ${TABLE}."NUM_PARCELA" ;;
  }

  dimension: contrato {
    type: string
    label: "ID Contrato"
    group_label: "Dados do Contrato"
    description: "PRIMARY KEY DA TABELA VETERANO.FATO.FATO_PROPOSTA. ID DO CONTRATO DO ALUNO"
    sql: ${TABLE}."CONTRATO" ;;
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

  dimension: flg_cpf_enviado {
    type: yesno
    label: "CPF Enviado"
    group_label: "Dados de Fluxo"
    description: "INDICA SE O CPF JÁ FOI ENVIADO PELO MIDDLEWARE"
    sql: ${TABLE}."FLG_CPF_ENVIADO" ;;
  }

  dimension: flg_titulo_enviado {
    type: yesno
    label: "Titulo Enviado"
    group_label: "Dados de Fluxo"
    description: "INDICA SE O TITULO ESTÁ NO MIDDLEWARE"
    sql: ${TABLE}."FLG_TITULO_ENVIADO" ;;
  }

  dimension: flg_em_aberto {
    type: yesno
    label: "Titulo em Aberto"
    group_label: "Dados do Boleto"
    description: "INDICA SE O TIULO ESTÁ EM ABERTO (SEM DATA BAIXA/PAGAMENTO)"
    sql: ${TABLE}."FLG_EM_ABERTO" ;;
  }

  dimension: flg_cpf_quitado {
    type: yesno
    label: "CPF Quitado"
    group_label: "Dados do Fluxo"
   description: "INDICA SE O CPF NÃO PÓSSUI BOLETOS EM ABERTO"
    sql: ${TABLE}."FLG_CPF_QUITADO" ;;
  }

  dimension: flg_recebido {
    type: yesno
    label: "Titulo Recebido"
    group_label: "Dados do Boleto"
    description: "INDICA SE O TITULO ESTÁ NA VCOM"
    sql: ${TABLE}."FLG_RECEBIDO" ;;
  }

  dimension: classificacao_err {
    type: string
    label: "Classificação Erro"
    group_label: "Dados de Fluxo"
    description: "INDICA A CAUSA RAIZ DA MENSAGEM DE ERRO"
    sql: ${TABLE}."CLASSIFICACAO_ERRO" ;;
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

  ## MEDIDAS ##

  measure: count_cpf {
    type: count
    label: "Contagem CPF"
    description: "Contagem absoluta do número de CPFs"
  }


}
