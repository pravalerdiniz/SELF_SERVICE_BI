view: instituicao_taxas_ies {
  derived_table: {
      sql:select
            id_instituicao,
            id_contrato_instituicao,
            id_produto,
            numero_contratacao,
            multiplicador_parcela,
            taxa_juros_mensal,
            proc_subsidiado_ies,
            juros_aluno,
            taxa_adesao,
            taxa_adm,
            taxa_comissao,
            taxa_fee_mensal,
            taxa_fee_unico,
            modalidade
from(select
      a.id_instituicao,
      f.value:ID_CONTTRATO_INSTITUICAO::int as id_contrato_instituicao,
      f.value:ID_PRODUTO::varchar as id_produto,
      f.value:NUMERO_CONTRATACAO::int as numero_contratacao,
      null as multiplicador_parcela,
      f.value:VL_IES_TAXA_MENSAL::float as taxa_juros_mensal,
      f.value:PROC_SUBSIDIADO_IES::float as proc_subsidiado_ies,
      f.value:JUROS_ALUNO::float as juros_aluno,
      null as taxa_adesao,
      null as taxa_adm,
      null as taxa_comissao,
      null as taxa_fee_mensal,
      null as  taxa_fee_unico,
      'Antecipação' as modalidade
        from GRADUADO.SELF_SERVICE_BI.INSTITUICAO a,
        lateral flatten (input => antecipacao) f
UNION ALL
      select
        b.id_instituicao,
        null id_contrato_instituicao,
        g.value:ID_PRODUTO::varchar as id_produto,
        g.value:CONTRATACAO::int as numero_contratacao,
        g.value:MULTIPLICADOR_PARCELA::int as multiplicador_parcela,
        g.value:TX_JUROS::float as taxa_juros_mensal,
        null as proc_subsidiado_ies,
        null as juros_aluno,
        g.value:TX_ADESAO::float as taxa_adesao,
        g.value:TX_ADM::float as taxa_adm,
        g.value:TX_COMISSAO::float as taxa_comissao,
        g.value:TX_FEE_MENSAL::float as taxa_fee_mensal,
        g.value:TX_FEE_UNICO::float as taxa_fee_unico,
        'Gestão' as modalidade
          from GRADUADO.SELF_SERVICE_BI.INSTITUICAO b,
          lateral flatten (input => gestao) g);;
    }

  dimension: modalidade {
    type: string
    group_label: "Dados do Produto"
    label: "Modalidade"
    description: "Indica a modalidade do produto. Ex: Gestão e Antecipação."
    sql: ${TABLE}."MODALIDADE";;
  }

  dimension: id_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "ID da Instituição"
    description:"Indica o ID da Instituição de Ensino"
    sql: ${TABLE}."ID_INSTITUICAO";;
  }


  dimension: id_contrato_instituicao {
    type: number
    group_label: "Dados da Instituição"
    label: "Contrato da IES"
    description: "Indica o número do contrato da Instituição por produto"
    sql: ${TABLE}."ID_CONTRATO_INSTITUICAO";;
  }

  dimension: id_produto {
    type: string
    group_label: "Dados do Produto"
    label: "ID Produto"
    description: "Indica o ID Produto PRAVALER."
    sql: ${TABLE}."ID_PRODUTO";;
  }


  dimension: numero_contratacao {
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
  sql: ${taxa_juros_mensal} - IFNULL(${porc_subsidiado_ies},0);;
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
            numero_contratacao,
            multiplicador_parcela,
            taxa_juros_mensal,
            porc_subsidiado_ies,
            juros_aluno,
            taxa_adesao,
            taxa_adm,
            taxa_comissao,
            taxa_fee_mensal,
            taxa_fee_unico,
            modalidade
    ]
  }

}
