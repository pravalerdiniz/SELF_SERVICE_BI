view: carteira {
  sql_table_name: "SELF_SERVICE_BI"."CARTEIRA"
    ;;

  dimension: primary_key {
    primary_key: yes
    label: "Chave Única"
    group_label: "Dados da Tabela"
    type: string
    description: "Indica a chave única da tabela [id boleto + mês referencia] "
    sql: CONCAT(${id_boleto},${tdt_ano_mes} );;
  }

  dimension: boleto {
    type: number
    label: "Boleto"
    group_label: "Dados do Título"
    description: "A CONFIRMAR"
    sql: ${TABLE}."BOLETO" ;;
  }

  measure: total_boleto {
    type: sum
    sql: ${boleto} ;;
  }

  measure: average_boleto {
    type: average
    sql: ${boleto} ;;
  }


 ###


  dimension: cd_cedente {
    type: number
    value_format: "0"
    label: "ID Banco"
    group_label: "Dados do Banco"
    description: "Indica o código do banco responsável pelo financiamento"
    sql: ${TABLE}."CD_CEDENTE" ;;
  }

  dimension: nm_cedente {
    type: string
    label: "Nome do Banco"
    group_label: "Dados do Banco"
    sql: ${TABLE}."NM_CEDENTE" ;;
  }

  dimension: cnpj_entidade_pagadora {
    type: number
    label: "CNPJ IES"
    group_label: "Dados da IES"
    value_format: "0"
    description: "Indica o CNPJ da instituição de ensino"
    sql: ${TABLE}."CNPJ_ENTIDADE_PAGADORA" ;;
  }

  dimension: cnpj_fundo {
    type: number
    label: "CNPJ Fundo"
    group_label: "Dados do Fundo"
    value_format: "0"
    description: "Indica o CNPJ do fundo de investimento do boleto do aluno"
    sql: ${TABLE}."CNPJ_FUNDO" ;;
  }

  dimension: cpf_cliente {
    type: number
    value_format: "0"
    label: "CPF do Aluno"
    group_label: "Dados do Aluno"
    description: "Indica o CPF do aluno"
    sql: ${TABLE}."CPF_CLIENTE" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_concessao {
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
    label: "Data Concessão"
    description: "Indica a data de pagamento dos contratos concedidos"
    sql: ${TABLE}."DATA_CONCESSAO" ;;
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
    label: "Data Emissão"
    description: "Indica a data de emissão do titulo no backoffice"
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
    label: "Data Entrada"
    description: "Indica a data de entrada do titulo no fundo de investimento"
    sql: ${TABLE}."DATA_ENTRADA" ;;
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
    label: "Data Protesto"
    group_label: "Dados do Contrato"
    description: "Coluna padrão do sistema que vem sempre preenchida com a data “01/01/1900”"
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
    label: "Data Vencimento"
    description: "Indica a data de vencimento do boleto (titulo gerado)"
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  ### FIM DAS DATAS

  dimension: ds_produto {
    type: string
    label: "Descrição Produto"
    description: "Indica a descrição do produto contratado"
    group_label: "Dados do Produto"
    sql: ${TABLE}."DS_PRODUTO" ;;
  }

  dimension: id_alu_contrato {
    type: string
    label: "ID contrato Aluno"
    group_label: "Dados do Contrato"
    description: "Indica o ID do contrato do Aluno com o Pravaler"
    sql: ${TABLE}."ID_ALU_CONTRATO" ;;
  }

  dimension: id_boleto {
    type: string
    label: "ID Boleto"
    group_label: "Dados do Título"
    description: "Indica o ID identificador do Boleto"
    sql: ${TABLE}."ID_BOLETO" ;;
  }

  dimension: id_cpf {
    type: number
    label: "ID CPF"
    group_label: "Dados do Aluno"
    description: "Número atribuído como máscara do cpf do aluno ou garantidor"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    label: "ID fundo de Investimento"
    group_label: "Dados do Fundo"
    description: "ID do fundo de investimento atribuído ao contrato do aluno"
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: id_produto {
    type: string
    label: "ID Produto"
    group_label: "Dados do Contrato"
    description: "Indica o ID do Produto aprovado para o aluno por proposta"
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: id_seunum {
    type: string
    label: "ID SEUNUM"
    group_label: "Dados do Título"
    description: "Indica o código do boleto diferente do backoffice. Composição de números: Qual parcela, Data de vencimento"
    sql: ${TABLE}."ID_SEUNUM" ;;
  }

  dimension: id_tipo_boleto {
    type: number
    value_format: "0"
    label: "ID Tipo Boleto"
    group_label: "Dados do Título"
    description: "Primary key da tabela VETERANO.DIMENSAO.DIM_TITULO_TIPO. ID que identifica se o titulo/boleto é avulso ou original"
    sql: ${TABLE}."ID_TIPO_BOLETO" ;;
  }

  dimension: id_titulo_status {
    type: number
    label: "ID Status Boleto"
    group_label: "Dados do Título"
    description: "Primary key da tabela VETERANO.DIMENSAO.DIM_TITULO_STATUS. ID que identifica qual o status o titulo está"
    sql: ${TABLE}."ID_TITULO_STATUS" ;;
  }

  dimension: modalidade_risco {
    type: string
    label: "Modalidade de Risco"
    group_label: "Dados de Risco"
    description: "Classificação do produto segundo a área de risco"
    sql: ${TABLE}."MODALIDADE_RISCO" ;;
  }

  dimension: nm_cliente {
    type: string
    label: "Nome do Aluno"
    group_label: "Dados do Aluno"
    description: "Indica o nome do aluno"
    sql: ${TABLE}."NM_CLIENTE" ;;
  }

  dimension: nm_entidade_pagador {
    type: string
    label: "Nome da IES"
    group_label: "Dados da IES"
    description: "Indica o nome da IES."
    sql: ${TABLE}."NM_ENTIDADE_PAGADOR" ;;
  }

  dimension: nm_fundo {
    type: string
    label: "Nome do Fundo"
    group_label: "Dados do Fundo"
    description: "Nome do fundo de investimento do boleto aluno"
    sql: ${TABLE}."NM_FUNDO" ;;
  }

  dimension: nm_produto_comercial {
    type: string
    label: "Nome do Produto Comercial"
    group_label: "Dados do Contrato"
    description: "Descrição comercial do produto"
    sql: ${TABLE}."NM_PRODUTO_COMERCIAL" ;;
  }

  dimension: nm_tipo_produto {
    type: string
    label: "Nome do Produto"
    group_label: "Dados do Produto"
    description: "Descrição do tipo de produto do aluno (core business, fies, compra de carteira etc.)"
    sql: ${TABLE}."NM_TIPO_PRODUTO" ;;
  }

  dimension: num_contrato {
    type: number
    value_format: "0"
    label: "ID Contrato"
    group_label: "Dados do Contrato"
    description: "Indica do ID identificador do contrato do Aluno (ID Contrato)"
    sql: ${TABLE}."NUM_CONTRATO" ;;
  }

  dimension: num_parcela {
    type: number
    value_format: "0"
    label: "Número da Parcela"
    group_label: "Dados do Título"
    description: "Indica o número da parcela do boleto do aluno"
    sql: ${TABLE}."NUM_PARCELA" ;;
  }

  dimension: prazo {
    type: string
    label: "Prazo"
    group_label: "Dados do Contrato"
    description: "Coluna padrão do sistema que vem sempre vazia."
    sql: ${TABLE}."PRAZO" ;;
  }

  dimension: protesto {
    type: string
    label: "Protesto"
    group_label: "Dados do Título"
    description: "A CONFIRMAR"
    sql: ${TABLE}."PROTESTO" ;;
  }

  dimension: qtd_parcelas {
    type: number
    label: "Quantidade de Parcelas"
    group_label: "Dados do Contrato"
    description: "Indica a quantidade total de parcelas do aluno do contrato"
    sql: ${TABLE}."QTD_PARCELAS" ;;
  }

  dimension: taxa_cessao {
    type: number
    label: "Taxa de Cessão"
    group_label: "Dados de Cessão"
    description: "Taxa individual de cada título, calculada na ocasião da cessão de acordo com informações individuais de cada título"
    sql: ${TABLE}."TAXA_CESSAO" ;;
  }

  dimension: taxa_media_ponderada {
    type: number
    label: "Taxa Média Ponderada"
    group_label: "Dados do Contrato"
    description: "A CONFIRMAR"
    sql: ${TABLE}."TAXA_MEDIA_PONDERADA" ;;
  }

  dimension: tdt_ano_mes {
    type: number
    label: "Ano_mês referência"
    group_label: "Dados da Tabela"
    value_format: "0"
    description: "Ano e mês de referência do registro"
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: tipo_proposta {
    type: string
    label: "Tipo de Proposta"
    group_label: "Dados do Contrato"
    description: "Descrição do tipo de proposta do aluno (novo, renovação, segundo repasse etc.)"
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
  }

  dimension: valor_aquisicao {
    type: number
    label: "Valor de Repasse"
    group_label: "Dados do Contrato"
    description: "Indica o valor de repasse realizado na parcela"
    sql: ${TABLE}."VALOR_AQUISICAO" ;;
  }

  dimension: valor_presente {
    type: number
    value_format: "$#,##0.00"
    label: "Valor Presente"
    group_label: "Dados do Título"
    description: "Indica o valor presente da parcela  do aluno"
    sql: ${TABLE}."VALOR_PRESENTE" ;;
  }

  dimension: vl_corrigido {
    type: number
    label: "Valor Corrigido"
    group_label: "Dados do Título"
    description: "A CONFIRMAR"
    sql: ${TABLE}."VL_CORRIGIDO" ;;
  }

  dimension: vl_face {
    type: number
    value_format: "$#,##0.00"
    label: "Valor de Face"
    group_label: "Dados do Título"
    description: "Valor de face é o valor atualizado, ou seja, para fundos que realizam baixas parciais pode haver alteração dos valores"
    sql: ${TABLE}."VL_FACE" ;;
  }

  dimension: vl_face_original {
    type: number
    value_format: "$#,##0.00"
    label: "Valor de Face Original"
    group_label: "Dados do Título"
    description: "A CONFIRMAR"
    sql: ${TABLE}."VL_FACE_ORIGINAL" ;;
  }

  dimension: vl_financiamento {
    type: number
    label: "Valor Financiado"
    group_label: "Dados do Contrato"
    description: "Valor total financiado"
    sql: ${TABLE}."VL_FINANCIAMENTO" ;;
  }

  dimension: valor_apropriado {
    type: number
    label: "Receita de Juros"
    group_label: "Dados do Contrato"
    description: "A CONFIRMAR"
    sql: ${TABLE}."VALOR_APROPRIADO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  dimension: flg_ultima_base {
    type: yesno
    label: "Flag Mais Recente"
    group_label: "Dados da Tabela"
    description: "Indica se a informação é da base de Carteira mais recente ou não"
    sql: ${TABLE}."FLG_ULTIMA_BASE" ;;
    }
}
