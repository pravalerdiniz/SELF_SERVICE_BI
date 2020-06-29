view: alunos_produtos_aprovados {
  derived_table: {
    sql: select
      id_cpf,
      f.key as id_proposta,
      f.value:id_produto::number as id_produto,
      f.value:nm_modalidade_produto::varchar as nm_modalidade_produto,
      f.value:nm_produto::varchar as nm_produto
      from "SELF_SERVICE_BI"."ALUNOS" a,
      lateral flatten (input => ID_PRODUTOS_CONTRATADOS) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    group_item_label: "ID CPF"
    description: "Indica o ID_CPF correspondente ao CPF do Aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_proposta {
    type: string
    group_item_label: "ID da Proposta"
    description: "Indica o ID da Proposta correspondente ao produto aprovado do aluno"
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: id_produto {
    type: number
    group_item_label: "ID do Produto"
    description: "Indica o ID do Produto aprovado para o aluno por proposta"
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: nm_modalidade_produto {
    type: string
    group_item_label: "Modalidade"
    description: "Indica o nome da modalidade do produto aprovada para o aluno por proposta"
    sql: ${TABLE}."NM_MODALIDADE_PRODUTO" ;;
  }

  dimension: nm_produto {
    type: string
    group_item_label: "Nome do Produto"
    description: "Indica o nome do produto aprovado para o aluno"
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  set: detail {
    fields: [id_cpf, id_proposta, id_produto, nm_modalidade_produto, nm_produto]
  }
}
