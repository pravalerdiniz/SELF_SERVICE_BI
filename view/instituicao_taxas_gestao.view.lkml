view: instituicao_taxas_gestao {
  derived_table: {
      sql:
      select
        b.id_instituicao,
        g.value:ID_PRODUTO::varchar as id_produto,
        g.value:NOME_PRODUTO::varchar as nome_produto,
        g.value:CONTRATACAO::int as numero_contratacao,
        g.value:MULTIPLICADOR_PARCELA::int as multiplicador_parcela,
        g.value:TX_JUROS::float as taxa_juros_mensal,
        g.value:TX_ADESAO::float as taxa_adesao,
        g.value:TX_ADM::float as taxa_adm,
        g.value:TX_COMISSAO::float as taxa_comissao,
        g.value:TX_FEE_MENSAL::float as taxa_fee_mensal,
        g.value:TX_FEE_UNICO::float as taxa_fee_unico,
        'Gestão' as modalidade
          from GRADUADO.SELF_SERVICE_BI.INSTITUICAO b,
          lateral flatten (input => GESTAO) g;;
  }

  dimension: id_instituicao {
    type: string
    label: "ID da Instituição"
    description:"Indica o ID da Instituição de Ensino"
    sql: ${TABLE}."ID_INSTITUICAO";;
  }

  dimension: id_produto {
    type: string
    label: "ID Produto"
    description: "Indica o ID Produto PRAVALER."
    sql: ${TABLE}."ID_PRODUTO";;
  }


  dimension: nome_produto {
    type: string
    label: "Nome Produto"
    description: "Indica o nome do Produto PRAVALER."
    sql: ${TABLE}."NOME_PRODUTO";;
  }

  dimension: numero_contratacao {
    type: number
    label: "Número da Contratação"
    description:"Indica em qual contratação o aluno está"
    sql: ${TABLE}."NUMERO_CONTRATACAO";;
  }

  dimension: multiplicador_parcela {
    type: number
    group_item_label: "Multiplicador de Parcela"
    description:""
    sql: ${TABLE}."MULTIPLICADOR_PARCELA";;
  }

  dimension: taxa_juros_mensal {
    type:  number
    group_label: "Taxas"
    group_item_label: "Taxa de Juros Mensal"
    description:"Indica a Taxa de Juros Mensal do Produto"
    sql: ${TABLE}."TAXA_JUROS_MENSAL";;
  }

  dimension: taxa_adesao {
    type: number
    group_label: "Taxas"
    group_item_label: "Taxa de Adesão"
    description:""
    sql: ${TABLE}."TAXA_ADESAO";;
  }

  dimension: taxa_adm {
    type: number
    group_label: "Taxas"
    group_item_label: "Taxa Administrativa"
    description: ""
    sql: ${TABLE}."TAXA_ADM";;
  }


  dimension: taxa_comissao {
    type: number
    group_label: "Taxas"
    group_item_label: "Comissão"
    description: ""
    sql: ${TABLE}."TAXA_COMISSAO";;
  }

  dimension: taxa_fee_mensal {
    type: number
    group_label: "Taxas"
    group_item_label: "Fee Mensal"
    description: ""
    sql: ${TABLE}."TAXA_FEE_MENSAL";;
  }

  dimension: taxa_fee_unico {
    type: number
    group_label: "Taxas"
    group_item_label: "Fee Único"
    description: ""
    sql: ${TABLE}."TAXA_FEE_UNICO";;
  }

  set: detail {
    fields: [
      id_instituicao,
      id_produto,
      numero_contratacao,
      multiplicador_parcela,
      taxa_juros_mensal,
      taxa_adesao,
      taxa_adm,
      taxa_comissao,
      taxa_fee_mensal,
      taxa_fee_unico
      ]
 }


}
