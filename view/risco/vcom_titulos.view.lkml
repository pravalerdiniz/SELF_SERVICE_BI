view: vcom_titulos {
  sql_table_name: "POS_GRADUADO"."CCR"."VCOM_TITULOS"
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
    value_format: "0"
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
    hidden: yes
  }

  dimension: fluxo {
    type: string
    label: "Fluxo"
    group_label: "Fluxo de Envio"
    description: "FLUXO UTILIZADO PARA ENVIO"
    sql: ${TABLE}."FLUXO" ;;
    hidden: yes
  }

  dimension: layoutatual {
    type: string
    label: "Layout Atual"
    group_label: "Fluxo de Envio"
    description: "LAYOUT UTILIZADO PARA ENVIO"
    sql: ${TABLE}."LAYOUTATUAL" ;;
    hidden: yes
  }

  dimension: flg_titulo_enviado {
    type: yesno
    label: "Titulo Enviado Flag"
    group_label: "Fluxo de Envio"
    description: "INDICA SE O TITULO ESTÁ NO MIDDLEWARE"
    sql: ${TABLE}."FLG_TITULO_ENVIADO" ;;
  }

  dimension: flg_recebido {
    type: yesno
    label: "Título Recebido Flag"
    group_label: "Fluxo de Envio"
    description: "INDICA SE O TITULO ESTÁ NA VCOM"
    sql: ${TABLE}."FLG_RECEBIDO" ;;
  }

  dimension: num_diff_pgto {
    type: number
    label: "Dias Diferentes de Pagamento"
    group_label: "Fluxo de Envio"
    description: "INDICA O NÚMERO DE DIAS DE DIFERENÇA ENTRE A DATA DE PAGAMENTO DA VCOM E DO BO"
    sql: ${TABLE}."NUM_DIFF_PGTO" ;;
    drill_fields: [id_seunum,cpf,dt_pgto_vcom_date,flg_recebido,flg_titulo_enviado]
  }

  dimension: flg_diff_vecto {
    type: yesno
    label: "Diferença Vencimento Flag"
    group_label: "Fluxo de Envio"
    description: "INDICA SE A DATA DE VENCIMENTO DA VCOM E DO BO SÃO DIFERENTES"
    sql: ${TABLE}."FLG_DIFF_VECTO" ;;
  }

  dimension: vl_parc_vcom {
    type: number
    value_format: "$0.00"
    label: "Valor Parcela Vcom"
    group_label: "Dados Boleto"
    sql: ${TABLE}."VL_PARC_VCOM"  ;;
  }

  dimension: vl_orig_parc_vcom {
    type: number
    value_format: "$0.00"
    label: "Valor Original Parcela Vcom"
    group_label: "Dados Boleto"
    sql: ${TABLE}."VL_ORIG_PARC_VCOM"  ;;
  }

  dimension: diff_valor {
    type: number
    label: "Diferença Valor Boleto"
    group_label: "Fluxo de Envio"
    description: "Validação entre o Valor do boleto na Vcom e no BO. (1 tem diferença - 0 Não tem diferença)."
    sql: case when ${vl_parc_vcom} = ${financeiro.vl_boleto} then 0
    else 1 end;;
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

  dimension_group: dt_vencimento_vcom {
    type: time
    timeframes: [
      raw,
      date,
      month,
      year
    ]
    sql: ${TABLE}."DT_VENCIMENTO_VCOM"  ;;
    label: "Data Vencimento Vcom"
  }

  dimension_group: dt_pgto_vcom {
    type: time
    timeframes: [
      raw,
      date,
      month,
      year
    ]
    sql: ${TABLE}."DT_PGTO_VCOM"  ;;
    label: "Data Pagamento Vcom"
  }

}
