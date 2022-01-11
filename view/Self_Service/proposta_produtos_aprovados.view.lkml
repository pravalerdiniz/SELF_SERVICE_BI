view: proposta_produtos_aprovados {
  derived_table: {
    sql: select
      id_proposta,
      f.key as ID_ALUNO_SCORE_FINAL,
      f.value:DATA_USUARIO_INS::timestamp as DATA_CRIACAO,
      f.value:FLG_APROVADO::boolean as FLG_APROVADO,
      f.value:ID_PRODUTO::varchar as ID_PRODUTO,
      f.value:NM_PRODUTO::varchar as NM_PRODUTO,
      f.value:VL_NOTA_CORTE::float as VL_NOTA_CORTE
      from GRADUADO.SELF_SERVICE_BI.PROPOSTA a,
      lateral flatten (input => PRODUTOS_APROVADOS) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_proposta {
    type: string
    label: "ID Proposta"
    hidden: yes
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: id_aluno_score_final {
    type: number
    label: "ID Aluno Score Final"
    sql: ${TABLE}."ID_ALUNO_SCORE_FINAL" ;;
  }

  dimension_group: data_criacao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month
    ]
    label: "Inserção"
    description: "Indica a data de inserção da avaliação da proposta do aluno após análise de risco "
    sql: ${TABLE}."DATA_CRIACAO" ;;
  }

  dimension: flg_aprovado {
    type: yesno
    label: "Aprovado?"
    sql: ${TABLE}."FLG_APROVADO" ;;
  }

  dimension: id_produto {
    type: string
    label: "ID Produto"
    description: "Indica o ID do produto disponivel para o aluno"
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: nm_produto {
    type: string
    label: "Nome do Produto"
    description: "Indica o nome do produto disponivel para o aluno"
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: vl_nota_corte {
    type: number
    label: "Nota de Corte"
    description: "Indica a nota de corte do produto"
    sql: ${TABLE}."VL_NOTA_CORTE" ;;
  }

  set: detail {
    fields: [
      id_proposta,
      id_aluno_score_final,
      data_criacao_time,
      flg_aprovado,
      id_produto,
      nm_produto,
      vl_nota_corte
    ]
  }
}
