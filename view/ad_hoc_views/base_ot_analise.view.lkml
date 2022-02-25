# The name of this view in Looker is "Base Ot Analise"
view: base_ot_analise {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."BASE_OT_ANALISE"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cpf Aluno" in Explore.

  dimension: cpf_aluno {
    type: number
    label: "CPF do Aluno"
    value_format: "0"
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cpf_aluno {
    type: sum
    sql: ${cpf_aluno} ;;
  }

  measure: average_cpf_aluno {
    type: average
    sql: ${cpf_aluno} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

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
    label: "Referencia"
    description: "Indica a data de recebimento da base de dados da Oliveira Trust"
    sql: ${TABLE}."DATA_REFERENCIA" ;;
  }

  dimension_group: data_vencimento_boleto {
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
    description: "Indica a data de vencimento do boleto do aluno"
    sql: ${TABLE}."DATA_VENCIMENTO_BOLETO" ;;
  }

  dimension: dias_diferenca {
    type: number
    label: "Dias de Diferença"
    description: "Indica a quantidade de dias de diferença entre a DATA Base do Arquivo da OT até o vencimento do boleto do aluno"
    sql: ${TABLE}."DIAS_DIFERENCA" ;;
  }

  dimension: id_alu_contrato {
    type: string
    label: "ID do Contrato"
    description: "Indica o código do contrato do aluno"
    sql: ${TABLE}."ID_ALU_CONTRATO" ;;
  }

  dimension: id_produto {
    type: string
    label: "ID do Produto"
    description: "Indica o código do produto contratado pelo aluno"
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: modalidade_risco {
    type: string
    label: "ID do Produto"
    description: "Indica a modalidade do produto do contrato do aluno"
    sql: ${TABLE}."MODALIDADE_RISCO" ;;
  }

  dimension: nm_produto {
    type: string
    label: "Nome do Produto"
    description: "Indica o nome do produto contratado pelo aluno"
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: nm_produto_comercial {
    type: string
    label: "Produto - Agrupado"
    description: "Indica o nome do produto agrupado contratado pelo aluno"
    sql: ${TABLE}."NM_PRODUTO_COMERCIAL" ;;
  }

  dimension: qtd_renovacao_realizada {
    type: number
    label: "Quantidade de Renovações"
    description: "Indica a quantidade de renovações do aluno até o momento"
    sql: ${TABLE}."QTD_RENOVACAO_REALIZADA" ;;
  }

  dimension: taxa_media_ponderada {
    type: number
    label: "Taxa - Média Ponderada"
    description: "Indica a taxa paga para o fundo de investimento por aluno na cessão."
    sql: ${TABLE}."TAXA_MEDIA_PONDERADA" ;;
  }

  dimension: tipo_proposta {
    type: string
    label: "Tipo de Proposta"
    description: "Indica o tipo de proposta do aluno: NOVO, RENOVAÇÃO, SEGUNDO REPASSE, e etc"
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
  }

  dimension: flg_base_recente {
    type: yesno
    label: "Base Recente"
    description: "Indica o tipo de proposta do aluno: NOVO, RENOVAÇÃO, SEGUNDO REPASSE, e etc"
    sql: ${TABLE}."FLG_BASE_RECENTE" ;;
  }

  dimension: vl_presente {
    type: number
    label: "Valor Presente"
    sql: ${TABLE}."VALOR_PRESENTE" ;;
  }


  dimension: vl_face {
    type: number
    label: "Valor de Face"
    sql: ${TABLE}."VALOR_FACE" ;;
  }




  dimension: vl_aquisicao {
    type: number
    label: "Valor Aquisição"
    sql: ${TABLE}."VALOR_AQUISICAO" ;;
  }


  dimension: nome_fundo {
    type: string
    label: "Fundo de Investimento"
    sql: ${TABLE}."NOME_FUNDO" ;;
  }



  measure: count {
    type: count
    drill_fields: []
  }


  measure: sum_vl_face {
    type: sum
    label: "Valor de Face"
    sql: ${vl_face} ;;
    drill_fields: []
  }

  measure: sum_vl_presente {
    type: sum
    label: "Valor Presente"
    sql: ${vl_presente} ;;
    drill_fields: []
  }


  measure: sum_vl_aquisicao {
    type: sum
    label: "Valor Aquisição"
    sql: ${vl_aquisicao} ;;
    drill_fields: []
  }


}
