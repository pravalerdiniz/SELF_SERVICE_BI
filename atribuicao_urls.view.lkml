view: atribuicao_urls {
  derived_table: {
    persist_for: "1 hour"
    sql: select
            id_cpf,
            B.DS_URL AS URL_DESCOBERTA,
            C.DS_URL AS URL_FINALIZACAO
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a
            left join VETERANO.FATO.DIM_URL B ON A.ID_URL_DESCOBERTA = B.ID_URL
            LEFT JOIN VETERANO.FATO.DIM_URL C ON A.ID_URL_FINALIZACAO = C.ID_URL ;;
  }

  dimension: url_descoberta {
    type: string
    label: "URL de Descoberta"
    description: "Indica a URL de Descoberta do aluno."
    sql: ${TABLE}."URL_DESCOBERTA" ;;
    group_label: "Dados de Descoberta"
  }

  dimension: url_finalizacao {
    type: string
    label: "URL de Finalização"
    description: "Indica a URL de Finalização do aluno."
    sql: ${TABLE}."URL_FINALIZACAO" ;;
    group_label: "Dados de Finalização"
  }

  dimension: id_cpf {
    sql: ${TABLE}."ID_CPF" ;;
    hidden:  yes
  }
}
