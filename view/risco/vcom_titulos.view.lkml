view: vcom_titulos {
  sql_table_name: "CCR"."VCOM_TITULOS"
    ;;

  ## DIMENSÕES ##

  dimension: id_boleto {
    type: string
    label: "ID BOLETO"
    group_label: "Dados Boleto"
    description: "IDENTIFICADOR DO BOLETO"
    sql: ${TABLE}."ID_BOLETO" ;;
    primary_key: yes
  }

  dimension: id_mdw {
    type: string
    label: "ID MIDDLEWARE"
    group_label: "Fluxo de Envio"
    description: "ID DO REGISTRO NO MIDDLEWARE"
    sql: ${TABLE}."ID_MDW" ;;
  }

  dimension: id_cpf {
    type: number
    label: "ID CPF"
    group_label: "Dados Aluno"
    description: "NÚMERO ATRIBUÍDO COMO MÁSCARA DO CPF DO ALUNO"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: cpf {
    type: string
    label: "CPF"
    group_label: "Dados Aluno"
    description: "CPF DO ALUNO"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: id_seunum {
    type: number
    label: "ID SEUNUM"
    group_label: "Dados Boleto"
    description: "NUMERO DO SEUNUM DO BOLETO"
    sql: ${TABLE}."ID_SEUNUM" ;;
  }

  dimension: id_nossonum {
    type: number
    label: "ID NOSSONUM"
    group_label: "Dados Boleto"
    description: "IDENTIFICADOR DO NUMERO DA ENTIDADE QUE GEROU A COBRANÇA"
    sql: ${TABLE}."ID_NOSSONUM" ;;
  }

  dimension: id_tit_vcom {
    type: number
    label: "ID Título Vcom"
    group_label: "Dados Boleto"
    description: "ID DO TITULO NA VCOM"
    sql: ${TABLE}."ID_TIT_VCOM" ;;
  }

  dimension: id_par_vcom {
    type: number
    label: "ID Parcela Vcom"
    group_label: "Dados Boleto"
    description: ""
    sql: ${TABLE}."ID_PAR_VCOM" ;;
  }

  dimension: num_parcela {
    type: number
    label: "Número Parcela"
    group_label: "Dados Boleto"
    description: "NÚMERO DA PARCELA DO CONTRATO DO ALUNO"
    sql: ${TABLE}."NUM_PARCELA" ;;
  }

  dimension: contrato {
    type: string
    label: "ID Contrato"
    group_label: "Dados Aluno"
    description: "PRIMARY KEY DA TABELA VETERANO.FATO.FATO_PROPOSTA. ID DO CONTRATO DO ALUNO"
    sql: ${TABLE}."CONTRATO" ;;
  }

  dimension: etapa {
    type: number
    label: "Etapa"
    group_label: "Fluxo de Envio"
    description: "ETAPA NO FLUXO"
    sql: ${TABLE}."ETAPA" ;;
  }

  dimension: fluxo {
    type: string
    label: "Fluxo"
    group_label: "Fluxo de Envio"
    description: "FLUXO UTILIZADO PARA ENVIO"
    sql: ${TABLE}."FLUXO" ;;
  }

  dimension: layoutatual {
    type: string
    label: "Layout Atual"
    group_label: "Fluxo de Envio"
    description: "LAYOUT UTILIZADO PARA ENVIO"
    sql: ${TABLE}."LAYOUTATUAL" ;;
  }

  dimension: mensagem_erro {
    type: string
    label: "Mensagem de Erro"
    group_label: "Fluxo de Envio"
    description: "MENSSAGEM DE ERRO PARA OS REGISTROS QUE FOREM REJEITADOS PARA VCOM"
    sql: ${TABLE}."MENSAGEM_ERRO" ;;
  }

  dimension: flg_cpf_enviado {
    type: yesno
    label: "CPF Enviado Flag"
    group_label: "Fluxo de Envio"
    description: "INDICA SE O CPF JÁ FOI ENVIADO PELO MIDDLEWARE"
    sql: ${TABLE}."FLG_CPF_ENVIADO" ;;
  }

  dimension: flg_titulo_enviado {
    type: yesno
    label: "Titulo Enviado Flag"
    group_label: "Fluxo de Envio"
    description: "INDICA SE O TITULO ESTÁ NO MIDDLEWARE"
    sql: ${TABLE}."FLG_TITULO_ENVIADO" ;;
  }

  dimension: flg_em_aberto {
    type: yesno
    label: "Titulo Aberto Flag"
    group_label: "Fluxo de Envio"
    description: "INDICA SE O TIULO ESTÁ EM ABERTO (SEM DATA BAIXA/PAGAMENTO)"
    sql: ${TABLE}."FLG_EM_ABERTO" ;;
  }

  dimension: flg_cpf_quitado {
    type: yesno
    label: "CPF Quitado Flag"
    group_label: "Fluxo de Envio"
    description: "INDICA SE O CPF NÃO PÓSSUI BOLETOS EM ABERTO"
    sql: ${TABLE}."FLG_CPF_QUITADO" ;;
  }

  dimension: flg_recebido {
    type: yesno
    label: "Título Recebido Flag"
    group_label: "Fluxo de Envio"
    description: "INDICA SE O TITULO ESTÁ NA VCOM"
    sql: ${TABLE}."FLG_RECEBIDO" ;;
  }

  dimension: classificacao_erro {
    type: string
    label: "Classificação Erro"
    group_label: "Fluxo de Envio"
    description: "INDICA A CAUSA RAIZ DO ERRO APRESENTADO NAS MENSAGENS DE ERR"
    sql: ${TABLE}."CLASSIFICACAO_ERRO" ;;
  }

  ## DATAS ##

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
    sql: ${TABLE}."DT_ATUALIZAO_MDW" ;;
    label: "Data Atualização"
  }

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
    sql: ${TABLE}."DT_CRICAO_MDW" ;;
    label: "Data Criação"
  }

}
