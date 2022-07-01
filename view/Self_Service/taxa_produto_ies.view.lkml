# The name of this view in Looker is "Taxa Produto Ies"
view: taxa_produto_ies {
  sql_table_name: "AD_HOC"."TAXA_PRODUTO_IES"
    ;;


  dimension_group: data_atualizacao {
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
    label: "Data de Atualização"
    description:"Data de update do registro"
    sql: ${TABLE}."DATA_ATUALIZACAO" ;;
  }

  dimension_group: data_cadastro {
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
    label: "Data de Cadastro"
    description:"Indica a data de inserção do Cadastro da Taxa de Juros"
    sql: ${TABLE}."DATA_CADASTRO" ;;
  }

  dimension_group: data_final {
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
    group_label: "Data Vigência Taxa"
    group_item_label: "Data final de vigência"
    description:"Indica a data final do contrato"
    sql: ${TABLE}."DATA_FINAL" ;;
  }

  dimension_group: data_inicio {
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
    group_label: "Data Vigência Taxa"
    group_item_label: "Data início de vigência"
    description:"Indica a data de início ddo contrato"
    sql: ${TABLE}."DATA_INICIO" ;;
  }

  dimension_group: data_subsidio_fim {
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
    group_label: "Data Vigência Subsidio"
    group_item_label: "Data final de vigência Subsidio"
    description:"Indica a data fim do Subsídio do contrato"
    sql: ${TABLE}."DATA_SUBSIDIO_FIM" ;;
  }

  dimension_group: data_subsidio_inicio {
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
    group_label: "Data Vigência Subsidio"
    group_item_label: "Data início de vigência Subsidio"
    description:"Indica a data início do Subsídio do contrato"
    sql: ${TABLE}."DATA_SUBSIDIO_INICIO" ;;
  }

  dimension: ds_produto {
    type: string
    group_label: "Dados do Produto"
    group_item_label: "Descrição do Produto"
    description:"Indica a descrição do nome do produto"
    sql: ${TABLE}."DS_PRODUTO" ;;
  }

  dimension: ds_tipo_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Tipo do Aluno"
    description:"Indica a descrição do tipo do aluno: NOVO, RENOVAÇÂO etc"
    hidden: no
    sql: ${TABLE}."DS_TIPO_ALUNO" ;;
  }

  dimension: flg_ativo {
    type: yesno
    group_label: "Dados da Taxa"
    group_item_label: "Flag Taxa Ativa"
    description:"Indica se a Taxa está ativa (Yes/No)"
    sql: ${TABLE}."FLG_ATIVO" ;;
  }

  dimension: flg_produto_ativo {
    type: yesno
    group_label: "Dados do Produto"
    group_item_label: "Flag Produto Ativo"
    description:"Indica se o produto está ativo (Yes/No)"
    sql: ${TABLE}."FLG_PRODUTO_ATIVO" ;;
  }

  dimension: flg_subsidio_ies_ativo {
    type: yesno
    group_label: "Dados do Subsidio"
    group_item_label: "Flag Subsidio IES Ativo"
    description:"Indica se o Subsidio IES está ativo (Yes/No)"
    sql: ${TABLE}."FLG_SUBSIDIO_IES_ATIVO" ;;
  }

  dimension: id_contrato_taxa {
    type: number
    group_label: "Dados da Taxa"
    group_item_label: "ID Contrato da Taxa"
    description:"Indicador da taxa de contratação cobrada pela IES"
    sql: ${TABLE}."ID_CONTRATO_TAXA" ;;
  }

  dimension: id_ies_contrato {
    type: number
    label: "Contrato da IES"
    description: "Indica o número do contrato entre a Instituição e o Pravaler"
    sql: ${TABLE}."ID_IES_CONTRATO" ;;
    value_format: "0"
  }

  dimension: id_instituicao {
    type: string
    label: "ID da Instituição"
    description:"Indica o ID da Instituição de Ensino"
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_produto {
    type: string
    group_label: "Dados do Produto"
    group_item_label: "ID Produto"
    description: "Indica o ID Produto PRAVALER."
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: multiplicador_parcela {
    type: number
    group_item_label: "Multiplicador de Parcela"
    description:"Taxa de multiplicação do valor a cada parcela do acordo"
    sql: ${TABLE}."MULTIPLICADOR_PARCELA" ;;
  }

  dimension: nm_modalidade_produto {
    type: string
    group_label: "Dados do Produto"
    group_item_label: "Modalidade"
    description: "Indica a modalidade Produto PRAVALER."
    sql: ${TABLE}."NM_MODALIDADE_PRODUTO" ;;
  }

  dimension: nm_modalidade_resumo {
    type: string
    group_label: "Dados do Produto"
    group_item_label: "Modalidade grupo"
    description: "Indica a modalidade Produto PRAVALER agrupada entre Antecipação e Gestão."
    sql: ${TABLE}."NM_MODALIDADE_RESUMO" ;;
  }

  dimension: nm_produto {
    type: string
    group_label: "Dados do Produto"
    group_item_label: "Nome do Produto"
    description: "Indica o nome do produto PRAVALER."
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: nm_produto_comercial {
    type: string
    group_label: "Dados do Produto"
    label: "Nome comercial do Produto"
    description: "Indica o nome comercial do produto PRAVALER."
    sql: ${TABLE}."NM_PRODUTO_COMERCIAL" ;;
  }

  dimension: numero_contratacao {
    type: number
    label: "Número da Contratação"
    description:"Indica número da contratação do aluno"
    sql: ${TABLE}."NUMERO_CONTRATACAO" ;;
  }

  dimension: proc_subsidiado_ies {
    type: number
    group_label: "Taxas"
    group_item_label:  "Porc Subsidiado pela Instituição"
    description:"Indica o percentual que a IES subsidia por contrato"
    sql: ${TABLE}."PROC_SUBSIDIADO_IES" ;;
  }

  dimension: taxa_adesao {
    type: number
    group_label: "Taxas"
    group_item_label:  "Taxa de Adesão"
    description:"Indica a taxa cobrada pela adesão do contrato"
    sql: ${TABLE}."TAXA_ADESAO" ;;
  }

  dimension: taxa_adm {
    type: number
    group_label: "Taxas"
    group_item_label:  "Taxa Administrativa"
    description:"Valor da taxa de administração cobrada pelo Pravaler nos contratos de antecipaçao"
    sql: ${TABLE}."TAXA_ADM" ;;
  }

  dimension: taxa_comissao {
    type: number
    group_label: "Taxas"
    group_item_label: "Comissão"
    description:"Taxa de comissão cobrada pelo Pravaler"
    sql: ${TABLE}."TAXA_COMISSAO" ;;
  }

  dimension: taxa_fee_mensal {
    type: number
    group_label: "Taxas"
    group_item_label: "Fee Mensal"
    description: "Taxa de encargos cobrada mensalmente"
    sql: ${TABLE}."TAXA_FEE_MENSAL" ;;
  }

  dimension: taxa_fee_unico {
    type: number
    group_label: "Taxas"
    group_item_label: "Fee Único"
    description: "Taxa única cobrada no contrato"
    sql: ${TABLE}."TAXA_FEE_UNICO" ;;
  }

  dimension: taxa_juros_mensal {
    type: number
    group_label: "Taxas"
    group_item_label: "Taxa de Juros Mensal"
    description:"Valor da taxa de juros mensal do contrato do aluno que consta no contrato entre a instituição e o Pravaler."
    sql: ${TABLE}."TAXA_JUROS_MENSAL" ;;
  }

  dimension: tipo_aluno {
    type: number
    group_label: "Dados do Aluno"
    label: "Código do Tipo do Aluno"
    description:"Indica o código para o tipo do contrato do aluno: NOVO, RENOVAÇÂO etc"
    hidden: yes
    sql: ${TABLE}."TIPO_ALUNO" ;;
  }

  dimension: tipo_curso {
    type: string
    group_label: "Dados do Aluno"
    label: "Tipo do Curso"
    description:"Indica o tipo do curso: GRADUAÇÃO, TECNICO, PÓS, etc"
    sql: ${TABLE}."TIPO_CURSO" ;;
  }

  dimension: tipo_encargo {
    type: string
    label: "Código do Tipo do Encargo"
    description:"Tipo de encargo cobrado pela IES"
    sql: ${TABLE}."TIPO_ENCARGO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
