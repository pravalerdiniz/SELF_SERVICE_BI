view: taxa_instituicao_simplificada {
  derived_table: {
    persist_for: "1 hour"
    sql: select
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
          lateral flatten (input => GESTAO) g
         qualify row_number () over (partition by id_instituicao, ID_PRODUTO order by numero_contratacao desc)=1
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden:  yes

  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    label: "ID Instituição"
    group_label: "Dados do Contrato"
    hidden:  yes
  }

  dimension: id_produto {
    type: string
    sql: ${TABLE}."ID_PRODUTO" ;;
    label: "ID Produto"
    group_label: "Dados do Contrato"
    hidden:  yes
  }

  dimension: nome_produto {
    type: string
    sql: ${TABLE}."NOME_PRODUTO" ;;
    label: "Nome do Produto"
    group_label: "Dados do Contrato"
  }

  dimension: numero_contratacao {
    type: number
    sql: ${TABLE}."NUMERO_CONTRATACAO" ;;
    label: "Número da Contratação"
    group_label: "Dados do Contrato"
  }

  dimension: multiplicador_parcela {
    type: number
    sql: ${TABLE}."MULTIPLICADOR_PARCELA" ;;
    label: "Multiplicador Parcela"
    group_label: "Dados do Contrato"
  }

  dimension: taxa_juros_mensal {
    type: number
    sql: ${TABLE}."TAXA_JUROS_MENSAL" ;;
    label: "Taxa de Juros Mensal"
    group_label: "Taxas"
    value_format: "0.00\%"
  }

  dimension: taxa_adesao {
    type: number
    sql: ${TABLE}."TAXA_ADESAO" ;;
    label: "Taxa de Adesão"
    group_label: "Taxas"
    value_format: "0.00\%"
  }

  dimension: taxa_adm {
    type: number
    sql: ${TABLE}."TAXA_ADM" ;;
    label: "Taxa Administrativa"
    group_label: "Taxas"
    value_format: "0.00\%"
  }

  dimension: taxa_comissao {
    type: number
    sql: ${TABLE}."TAXA_COMISSAO" ;;
    label: "Taxa de Comissão"
    group_label: "Taxas"
    value_format: "0.00\%"
  }

  dimension: taxa_fee_mensal {
    type: number
    sql: ${TABLE}."TAXA_FEE_MENSAL" ;;
    label: "Taxa de Fee Mensal"
    group_label: "Taxas"
    value_format: "0.00\%"
  }

  dimension: taxa_fee_unico {
    type: number
    sql: ${TABLE}."TAXA_FEE_UNICO" ;;
    label: "Taxa de Fee Unico"
    group_label: "Taxas"
    value_format: "0.00\%"
  }

  dimension: modalidade {
    type: string
    sql: ${TABLE}."MODALIDADE" ;;
    label: "Modalidade"
    group_label: "Dados do Contrato"
  }

  set: detail {
    fields: [
      id_instituicao,
      id_produto,
      nome_produto,
      numero_contratacao,
      multiplicador_parcela,
      taxa_juros_mensal,
      taxa_adesao,
      taxa_adm,
      taxa_comissao,
      taxa_fee_mensal,
      taxa_fee_unico,
      modalidade
    ]
  }
}
