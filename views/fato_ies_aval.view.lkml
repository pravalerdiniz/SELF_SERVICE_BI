# The name of this view in Looker is "Fato Ies Aval"
view: fato_ies_aval {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "FATO"."FATO_IES_AVAL"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ano Mes Fim Financimanto" in Explore.


  dimension: id_aval {
    type: number
    sql: ${TABLE}."ID_AVAL" ;;
  }

  dimension: id_campus {
    type: string
    sql: ${TABLE}."ID_CAMPUS" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_produto {
    type: string
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: id_status_aval {
    type: number
    sql: ${TABLE}."ID_STATUS_AVAL" ;;
  }

  dimension: id_usuario {
    type: number
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension: qtd_parcelas_financiadas {
    type: number
    sql: ${TABLE}."QTD_PARCELAS_FINANCIADAS" ;;
    label: "Quantidade de Parcelas Financiadas (IES)"
  }

  dimension: qtd_parcelas_informada_aluno {
    type: number
    sql: ${TABLE}."QTD_PARCELAS_INFORMADA_ALUNO" ;;
  }

}
