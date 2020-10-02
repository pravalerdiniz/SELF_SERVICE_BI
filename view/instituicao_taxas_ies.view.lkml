view: instituicao_taxas_ies {
  derived_table: {
      sql: select
            id_instituicao,
            id_contrato_instituicao,
            id_produto,
            numero_contracao,
            multiplicador_parcela,
            taxa_juros_mensal,
            porc_subsidiado_ies,
            juros_aluno,
            taxa_adesao,
            taxa_adm,
            taxa_comissao,
            taxa_fee_mensal,
            taxa_fee_unico
from(select
      id_instituicao,
      id_contrato_instituicao,
      f.value:ID_PRODUTO::int as id_produto,
      f.value:NUMERO_CONTRATACAO::int as numero_contracao,
      null as multiplicador_parcela,
      f.value:VL_IES_TAXA_MENSAL::boolean as taxa_juros_mensal,
      f.value:PROC_SUBSIDIADO_IES::boolean as porc_subsidiado_ies,
      f.value:JUROS_ALUNO::boolean as juros_aluno,
      null as taxa_adesao,
      null as taxa_adm,
      null as taxa_comissao,
      null as taxa_fee_mensal,
      null as  taxa_fee_unico
        from GRADUADO.SELF_SERVICE_BI.INSTITUICAO a,
        lateral flatten (input => antecipacao) f
UNION ALL
      select
        id_instituicao,
        null as id_contrato_instituicao,
        g.value:ID_PRODUTO::int as id_produto,
        g.value:CONTRATACAO::int as numero_contracao,
        g.value:MULTIPLICADOR_PARCELA::int as multiplicador_parcela,
        g.value:TX_JUROS::float as taxa_juros_mensal,
        null as porc_subsidiado_ies,
        null as juros_aluno,
        g.value:TX_ADESAO::float as taxa_adesao,
        g.value:TX_ADM::float as taxa_adm,
        g.value:TX_COMISSAO::float as taxa_comissao,
        g.value:TX_FEE_MENSAL::float as taxa_fee_mensal,
        g.value:TX_FEE_UNICO::float as taxa_fee_unico
          from GRADUADO.SELF_SERVICE_BI.INSTITUICAO a,
          lateral flatten (input => gestao) g);;
    }

  dimension: id_instituicao {
    type: number
    primary_key: yes
    group_label: "Dados da Instituição"
    label: "ID da Instituição"
    description:"Indica o ID da Instituição de Ensino"
    sql: ${TABLE}."ID_CONTRATO_INSTITUICAO";;
  }


  dimension: id_contrato_instituicao {
    type: number
    group_label: "Dados da Instituição"
    label: "Contrato da IES"
    description: "Indica o número do contrato da Instituição por produto"
    sql: ${TABLE}."ID_PRODUTO";;
  }

  dimension: id_produto {
    type: number
    group_label: "Dados do Produto"
    label: "ID Produto"
    description: "Indica o ID Produto PRAVALER."
    sql: ${TABLE}."ID_INSTITUICAO";;
  }


  dimension: numero_contracao {
    type: number
    group_label: "Dados do Aluno"
    label: "Número da Contratação"
    description:"Indica em qual contratação o aluno está"
    sql: ${TABLE}."NUMERO_CONTRATACAO";;
  }

  dimension: multiplicador_parcela {
    type: number
    group_label: "Dados da Instituição"
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

dimension: porc_subsidiado_ies {
  type:  number
  group_label: "Taxas"
  group_item_label:  "Porc Subsidiado pela Instituição"
  description:"Indica o juros pago pela Instituição de Ensino"
  sql: ${TABLE}."PROC_SUBSIDIADO_IES";;
}

dimension: juros_aluno {
  type: number
  group_label: "Taxas"
  group_item_label: "Juros do Aluno"
  description:"Indica o juros pago pelo aluno"
  sql: ${TABLE}."JUROS_ALUNO";;
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
            id_contrato_instituicao,
            id_produto,
            numero_contracao,
            multiplicador_parcela,
            taxa_juros_mensal,
            porc_subsidiado_ies,
            juros_aluno,
            taxa_adesao,
            taxa_adm,
            taxa_comissao,
            taxa_fee_mensal,
            taxa_fee_unico
    ]
  }

}
