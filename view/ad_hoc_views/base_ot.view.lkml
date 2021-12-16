# The name of this view in Looker is "Base Ot"
view: base_ot {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FATO"."BASE_OT"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Boleto" in Explore.

  dimension: boleto {
    type: number
    label: "Boleto -  Quantidade"
    sql: ${TABLE}."BOLETO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_boleto {
    type: sum
    group_label: "Boleto"
    label: "Soma - Quantidade"
    sql: ${boleto} ;;
  }

  measure: average_boleto {
    type: average
    group_label: "Boleto"
    label: "Média - Quantidade"
    sql: ${boleto} ;;
  }

  dimension: cnpj_entidade_pagadora {
    type: number
    group_label: "Dados da Instituição de Ensino"
    label: "CNPJ"
    sql: ${TABLE}."CNPJ_ENTIDADE_PAGADORA" ;;
  }

  dimension: cnpj_fundo {
    type: number
    group_label: "Dados do Fundo de Investimento"
    label: "CNPJ"
    sql: ${TABLE}."CNPJ_FUNDO" ;;
  }

  dimension: codigo_cedente {
    type: number
    group_label: "Dados Bancários"
    label: "Código Cedente"

    sql: ${TABLE}."CODIGO_CEDENTE" ;;
  }

  dimension: contrato {
    type: number
    label: "ID do Contrato"
    sql: ${TABLE}."CONTRATO" ;;
  }

  dimension: contrato_1 {
    type: string
    label: "Contrato 1"
    sql: ${TABLE}."CONTRATO_1" ;;
  }

  dimension: cpf_cliente {
    type: number
    group_label: "Dados do Aluno"
    label: "CPF do Aluno"
    sql: ${TABLE}."CPF_CLIENTE" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_emissao {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Emissão"
    sql: ${TABLE}."DATA_EMISSAO" ;;
  }

  dimension_group: data_entrada {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_ENTRADA" ;;
  }

  dimension_group: data_modificacao {
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
    label: "Modificação"
    description: "Indica a data de inclusão do arquivo no diretorio sftp"
    sql: ${TABLE}."DATA_MODIFICACAO" ;;
  }

  dimension_group: data_protesto {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Protesto"
    sql: ${TABLE}."DATA_PROTESTO" ;;
  }

  dimension_group: data_referencia {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Referência"

    sql: ${TABLE}."DATA_REFERENCIA" ;;
  }

  dimension_group: data_vencimento {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Vencimento"
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  dimension: flg_base_recente {
    type: yesno
    group_label: "Dados Base Oliveira Trust"
    label: "Mais Recente?"
    description: "Indica se a base é mais atual (última carga)"
    sql: ${TABLE}."FLG_BASE_RECENTE" ;;
  }

  dimension: id_liquidacao {
    type: string
    label: "ID de Liquidação"
    sql: ${TABLE}."ID_LIQUIDACAO" ;;
  }

  dimension: indice {
    type: number
    group_label: "Dados Base Oliveira Trust"
    label: "Indice"
    sql: ${TABLE}."INDICE" ;;
  }

  dimension: mensagem {
    type: string
    group_label: "Dados Base Oliveira Trust"
    label: "Mensagem de Importação?"
    description: "Indica mensagem e data de importação realizada do banco."
    sql: ${TABLE}."MENSAGEM" ;;
  }

  dimension: modelo {
    type: number
    group_label: "Dados Bancários"
    label: "Código de Modelo"
    sql: ${TABLE}."MODELO" ;;
  }

  dimension: nf {
    type: string
    group_label: "Dados Bancários"
    label: "Nota Fiscal"
    description: "Indica o número de nota fiscal gerado"
    sql: ${TABLE}."NF" ;;
  }

  dimension: nome_cedente {
    type: string
    group_label: "Dados Bancários"
    label: "Nome do Cedente - Banco"
    sql: ${TABLE}."NOME_CEDENTE" ;;
  }

  dimension: nome_cliente {
    type: string
    group_label: "Dados do Aluno"
    label: "Nome do Aluno"
    sql: ${TABLE}."NOME_CLIENTE" ;;
  }

  dimension: nome_entidade_pagadora {
    type: string
    group_label: "Dados da Instituição de Ensino"
    label: "Nome - Razão Social"
    description: "Indica o nome da entidade pagadora. Instituição de Ensino"
    sql: ${TABLE}."NOME_ENTIDADE_PAGADORA" ;;
  }

  dimension: nome_fundo {
    type: string
    group_label: "Dados do Fundo"
    label: "Nome do Fundo de Investimento"
    description: "Indica o nome do fundo de investimento"
    sql: ${TABLE}."NOME_FUNDO" ;;
  }

  dimension: numero_parcela {
    type: number
    group_label: "Dados do Aluno"
    label: "Número da Parcela"
    description: "Indica o número da parcela do contrato de financiamento do aluno"
    sql: ${TABLE}."NUMERO_PARCELA" ;;
  }

  dimension: org {
    type: number
    group_label: "Org"
    sql: ${TABLE}."ORG" ;;
  }

  dimension: origem {
    type: string
    group_label: "Dados Base Oliveira Trust"
    label: "Origem"
    description: "Indica a base de origem dos dados"
    sql: ${TABLE}."ORIGEM" ;;
  }

  dimension: prazo {
    type: string
    label: "Prazo"
    sql: ${TABLE}."PRAZO" ;;
  }

  dimension: protesto {
    type: string
    label: "Protesto"
    sql: ${TABLE}."PROTESTO" ;;
  }

  dimension: qtde_parcelas {
    type: number
    group_label: "Dados do Aluno"
    label: "Quantidade de Parcelas"
    sql: ${TABLE}."QTDE_PARCELAS" ;;
  }

  dimension: risco {
    type: string
    label: "Risco?"
    sql: ${TABLE}."RISCO" ;;
  }

  dimension: seguro {
    type: string
    group_label: "Seguro?"
    sql: ${TABLE}."SEGURO" ;;
  }

  dimension: seu_numero {
    type: string
    group_label: "Dados do Boleto"
    label: "SEUNUM - Código"
    sql: ${TABLE}."SEU_NUMERO" ;;
  }

  dimension: taxa_cessao {
    type: number
    group_label: "Dados de Cessão"
    label: "Taxa de Cessão"
    value_format: "0.00%"
    sql: ${TABLE}."TAXA_CESSAO" ;;
  }

  dimension: valor_apropriado {
    type: number
    group_label: "Dados de Cessão"
    label: "Valor Apropriado"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."VALOR_APROPRIADO" ;;
  }

  dimension: valor_aquisicao {
    type: number
    group_label: "Dados de Cessão"
    label: "Valor de Aquisição"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."VALOR_AQUISICAO" ;;
  }

  dimension: valor_face {
    type: number
    group_label: "Dados de Cessão"
    label: "Valor de Face"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."VALOR_FACE" ;;
  }

  dimension: valor_face_corrigido {
    type: number
    group_label: "Dados de Cessão"
    label: "Valor de Face - Corrigido"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."VALOR_FACE_CORRIGIDO" ;;
  }

  dimension: valor_face_original {
    type: number
    group_label: "Dados de Cessão"
    label: "Valor de Face - Original"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."VALOR_FACE_ORIGINAL" ;;
  }

  dimension: valor_futuro_bruto {
    type: number
    group_label: "Dados de Cessão"
    label: "Valor Futuro"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."VALOR_FUTURO_BRUTO" ;;
  }

  dimension: valor_mtm {
    type: number
    group_label: "Dados de Cessão"
    label: "Valor MTM"
    value_format: "$ #,##0.00"
    sql: ${TABLE}."VALOR_MTM" ;;
  }

  dimension: valor_presente {
    type: number
    group_label: "Dados de Cessão"
    label: "Valor Presente"
    value_format: "$ #,##0.00"

    sql: ${TABLE}."VALOR_PRESENTE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
