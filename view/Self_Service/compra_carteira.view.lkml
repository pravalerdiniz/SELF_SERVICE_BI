view: compra_carteira {
  sql_table_name: "POS_GRADUADO"."FINANCEIRO"."COMPRA_CARTEIRA" ;;


  dimension: ativo {
    type: number
    label: "Contrato Ativo"
    group_label: "Compra de Carteira"
    description: "Indica se o contrato do aluno está ativo."
    value_format: "0"
    sql: ${TABLE}."ATIVO" ;;
  }

  dimension: contrato_concedido {
    type: number
    label: "Contrato Cedido"
    group_label: "Compra de Carteira"
    value_format: "0"
    description: "Indica se o contrato foi concedido ao aluno."
    sql: ${TABLE}."CONTRATO_CONCEDIDO" ;;
  }

  dimension: contrato_conjunto {
    type: string
    label: "Contrato Conjunto"
    group_label: "Compra de Carteira"
    description: "Número do contrato conjunto. no caso de propostas de segundo repasse, indica o número do contrato original do aluno."
    sql: ${TABLE}."CONTRATO_CONJUNTO" ;;
  }

  dimension_group: data_cessao_original {
    type: time
    timeframes: [
      month
    ]
    sql: ${TABLE}."DATA_CESSAO_ORIGINAL" ;;
    label: "Cessão Original"
    group_label: "Compra de Carteira"
    group_item_label: "Data Cessão Original"
    description: "Data de cessao informada na primeira importação."
  }

  dimension_group: data_concessao {
    type: time
    timeframes: [
      month
    ]
    sql: ${TABLE}."DATA_CONCESSAO" ;;
    label: "Cessão"
    group_label: "Compra de Carteira"
    group_item_label: "Data Cessão"
    description: "Data de pagamento dos contratos concedidos."
  }

  dimension_group: data_geracao {
    type: time
    timeframes: [
      month
    ]
    sql: ${TABLE}."DATA_GERACAO" ;;
    label: "Geração"
    group_label: "Compra de Carteira"
    group_item_label: "Data Geração"
    description: "Data de geração do contrato"
  }

  dimension_group: data_preenchimento {
    type: time
    timeframes: [
      month
    ]
    sql: ${TABLE}."DATA_PREENCHIMENTO" ;;
    label: "Preenchimento"
    group_label: "Compra de Carteira"
    group_item_label: "Data Preenchimento"
    description: "Data de preenchimento da proposta."

  }

  dimension: digito_verificador {
    type: number
    sql: ${TABLE}."DIGITO_VERIFICADOR" ;;
    hidden: yes
  }

  dimension_group: dt_carga {
    type: time
    timeframes: [
      month
    ]
    sql: ${TABLE}."DT_CARGA" ;;
    label: "Carga"
    group_label: "Compra de Carteira"
    group_item_label: "Data de Carga"
    description: "Data em que o registro foi inserido na tabela"
  }

  dimension: flg_ultimo_status {
    type: yesno
    label: "Flag Último Status"
    group_label: "Compra de Carteira"
    sql: ${TABLE}."FLG_ULTIMO_STATUS" ;;
    description: "Indica que o registro é importação mais recente."

  }

  dimension: id_contrato {
    type: string
    label: "Id Contrato"
    group_label: "Compra de Carteira"
    description: "Primary key da tabela veterano.fato.fato_proposta. id do contrato do aluno."
    sql: ${TABLE}."ID_CONTRATO" ;;
    hidden: yes
  }

  dimension: id_cpf {
    type: number
    primary_key: yes
    label: "Id CPF"
    description: "Número atribuído como máscara do cpf do aluno."
    group_label: "Compra de Carteira"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_proposta {
    type: string
    label: "Id Proposta"
    description: "Identificador do numero da proposta do aluno"
    group_label: "Compra de Carteira"
    sql: ${TABLE}."ID_PROPOSTA" ;;
    hidden: yes
  }

  dimension: nm_produto {
    type: string
    label: "Nome Produto"
    description: "Descrição do nome do produto."
    group_label: "Compra de Carteira"
    sql: ${TABLE}."NM_PRODUTO" ;;
    hidden: yes
  }

  dimension: release_contrato {
    type: number
    label: "Release do Contrato"
    group_label: "Compra de Carteira"
    description: "Número do release do contrato do aluno."
    sql: ${TABLE}."RELEASE_CONTRATO" ;;
    hidden: yes
  }

  dimension: st_contrato {
    type: string
    label: "Status do Contrato"
    group_label: "Compra de Carteira"
    description: "Situação geral do contrato com base no campo contrato_cedido"
    sql: ${TABLE}."ST_CONTRATO" ;;
    hidden: yes
  }

  dimension: tipo_proposta {
    type: string
    label: "Tipo Proposta"
    group_label: "Compra de Carteira"
    description: "Descrição do tipo de proposta do aluno (novo, renovação, segundo repasse etc.)."
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
    hidden: yes
  }

  dimension: vl_total {
    type: number
    label: "Valor Total"
    group_label: "Compra de Carteira"
    description: "Soma total dos vencimentos"
    sql: ${TABLE}."VL_TOTAL" ;;
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
