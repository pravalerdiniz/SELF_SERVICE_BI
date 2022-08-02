view: fato_ies_aval {
  derived_table: {
    persist_for: "24 hours"
    sql: select * from "VETERANO"."FATO"."FATO_IES_AVAL"
          where VL_MENSAL <> '0';;
}

  dimension: id_aval {
    type: number
    sql: ${TABLE}."ID_AVAL" ;;
    hidden:  yes
  }

  dimension: id_campus {
    type: string
    sql: ${TABLE}."ID_CAMPUS" ;;
    hidden:  yes
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    hidden:  yes
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
    hidden:  yes
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    hidden:  yes
  }

  dimension: id_produto {
    type: string
    sql: ${TABLE}."ID_PRODUTO" ;;
    hidden:  yes
  }

  dimension: id_proposta {
    type: string
    primary_key: yes
    sql: ${TABLE}."ID_PROPOSTA" ;;
    hidden:  yes
  }

  dimension: id_status_aval {
    type: number
    sql: ${TABLE}."ID_STATUS_AVAL" ;;
    hidden:  yes
  }

  dimension: id_usuario {
    type: number
    sql: ${TABLE}."ID_USUARIO" ;;
    hidden:  yes
  }

  dimension: qtd_parcelas_financiadas {
    type: number
    sql: ${TABLE}."QTD_PARCELAS_FINANCIADAS" ;;
    label: "Quantidade de Parcelas Financiadas (IES)"
    hidden:  yes
  }

  dimension: qtd_parcelas_informada_aluno {
    type: number
    sql: ${TABLE}."QTD_PARCELAS_INFORMADA_ALUNO" ;;
    hidden:  yes
  }

  dimension: mensalidade_inf_alu {
    type: number
    sql: ${TABLE}."VL_MENS_INFORMADA_ALUNO" ;;
    group_label: "Mensalidades"
    label: "Valor da Mensalidade Informada pelo Aluno"
  }

  dimension: mensalidade_ies {
    type: number
    sql: ${TABLE}."VL_MENSAL" ;;
    group_label: "Mensalidades"
    label: "Valor da Mensalidade da Análise IES"
  }

}
