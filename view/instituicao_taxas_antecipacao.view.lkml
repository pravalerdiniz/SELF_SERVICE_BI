view: instituicao_taxas_antecipacao {
  derived_table: {
      sql:select
      a.id_instituicao,
      f.value:ID_CONTRATO_INSTITUICAO::int as id_contrato_instituicao,
      f.value:ID_PRODUTO::varchar as id_produto,
      f.value:NUMERO_CONTRATACAO::int as numero_contratacao,
      f.value:VL_IES_TAXA_MENSAL::float as taxa_juros_mensal,
      f.value:PROC_SUBSIDIADO_IES::float as proc_subsidiado_ies,
      f.value:JUROS_ALUNO::float as juros_aluno,
      'Antecipação' as modalidade
        from GRADUADO.SELF_SERVICE_BI.INSTITUICAO a,
        lateral flatten (input => ANTECIPACAO) f;;


    }


dimension: id_instituicao_contrato_numero {
  type: string
  sql: CONCAT(${id_instituicao},${id_contrato_instituicao},${numero_contratacao}) ;;
  primary_key: yes
  hidden: yes

}

  dimension: id_instituicao {
    type: string
        label: "ID da Instituição"
    description:"Indica o ID da Instituição de Ensino"
    sql: ${TABLE}."ID_INSTITUICAO";;
  }


  dimension: id_contrato_instituicao {
    type: number
    label: "Contrato da IES"
    description: "Indica o número do contrato da Instituição por produto"
    sql: ${TABLE}."ID_CONTRATO_INSTITUICAO";;
  }

  dimension: id_produto {
    type: string
    label: "ID Produto"
    description: "Indica o ID Produto PRAVALER."
    sql: ${TABLE}."ID_PRODUTO";;
  }


  dimension: numero_contratacao {
    type: number
    label: "Número da Contratação"
    description:"Indica em qual contratação o aluno está"
    sql: ${TABLE}."NUMERO_CONTRATACAO";;
  }

  dimension: taxa_juros_mensal {
    type:  number
    group_label: "Taxas"
    group_item_label: "Taxa de Juros Mensal"
    description:"Indica a Taxa de Juros Mensal do Produto"
    sql: ${TABLE}."TAXA_JUROS_MENSAL";;
    value_format: "0.00"
  }

dimension: porc_subsidiado_ies {
  type:  number
  group_label: "Taxas"
  group_item_label:  "Porc Subsidiado pela Instituição"
  description:"Indica o percentual de juros pago pela Instituição de Ensino"
  sql: ${TABLE}."PROC_SUBSIDIADO_IES";;
  value_format: "0.00"
}



dimension: juros_aluno {
  type: number
  group_label: "Taxas"
  group_item_label: "Juros do Aluno"
  description:"Indica o juros pago pelo aluno"
  sql: ${taxa_juros_mensal} - IFNULL(${porc_subsidiado_ies},0);;
  value_format: "0.00"
}



  dimension: modalidade {
    type: string
    label: "Modalidade"
    description: "Indica a modalidade do produto. Ex: Gestão e Antecipação."
    sql: ${TABLE}."MODALIDADE";;
  }

  set: detail {
    fields: [
            id_instituicao,
            id_contrato_instituicao,
            id_produto,
            numero_contratacao,
            taxa_juros_mensal,
            porc_subsidiado_ies,
            juros_aluno,
            modalidade
    ]
  }

}
