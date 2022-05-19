
view: base_ot {
  sql_table_name: "VETERANO"."FATO"."BASE_OT";;


  dimension: boleto {
    type: number
    group_label: "Boleto"
    label: "Boleto -  Quantidade"
    sql: ${TABLE}."BOLETO" ;;
  }

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
    value_format: "0"
    sql: ${TABLE}."CNPJ_ENTIDADE_PAGADORA" ;;
  }

  dimension: cnpj_fundo {
    type: number
    group_label: "Dados do Fundo de Investimento"
    label: "CNPJ"
    sql: ${TABLE}."CNPJ_FUNDO" ;;
    hidden: yes
  }

  dimension: codigo_cedente {
    type: number
    group_label: "Dados Bancários"
    label: "Código Cedente"
    sql: ${TABLE}."CODIGO_CEDENTE" ;;
    hidden: yes
  }

  dimension: contrato {
    type: number
    label: "ID do Contrato"
    sql: ${TABLE}."CONTRATO" ;;
    hidden: yes
  }

  dimension: contrato_1 {
    type: string
    label: "Contrato 1"
    sql: ${TABLE}."CONTRATO_1" ;;
    hidden: yes
  }

  dimension: cpf_cliente {
    type: number
    group_label: "Dados do Aluno"
    label: "CPF do Aluno"
    sql: ${TABLE}."CPF_CLIENTE" ;;
  }

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
    hidden: yes
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
    hidden: yes
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
    hidden: yes
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
    hidden: yes
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
    label: "Vencimento - OT"
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
    hidden: yes
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
    hidden: yes
  }

  dimension: nf {
    type: string
    group_label: "Dados Bancários"
    label: "Nota Fiscal"
    description: "Indica o número de nota fiscal gerado"
    sql: ${TABLE}."NF" ;;
    hidden: yes
  }

  dimension: nome_cedente {
    type: string
    group_label: "Dados Bancários"
    label: "Nome do Cedente - Banco"
    sql: ${TABLE}."NOME_CEDENTE" ;;
    hidden: yes
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
    group_label: "Dados do Fundo de Investimento"
    label: "Nome do Fundo de Investimento"
    description: "Indica o nome do fundo de investimento"
    sql: ${TABLE}."NOME_FUNDO" ;;
    hidden: yes
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
    hidden: yes
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
    hidden: yes
  }

  dimension: protesto {
    type: string
    label: "Protesto"
    sql: ${TABLE}."PROTESTO" ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: seguro {
    type: string
    group_label: "Seguro?"
    sql: ${TABLE}."SEGURO" ;;
    hidden: yes
  }

  dimension: seu_numero {
    type: string
    group_label: "Boleto"
    label: "SEUNUM - OT"
    sql: ${TABLE}."SEU_NUMERO" ;;
    primary_key: yes
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
    hidden: yes
  }
}
