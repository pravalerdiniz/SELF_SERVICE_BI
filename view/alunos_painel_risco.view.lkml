view: alunos_painel_risco {
  derived_table: {
    sql: select
            id_cpf,
            f.key as id_cpf_ano_mes,
            f.value:"ANO/MES"::varchar as ANO_MES,
            f.value:CLASSIFICACAO::varchar as CLASSIFICACAO,
            f.value:PROPOSTA::varchar as PROPOSTA,
            f.value:ULTIMO_STATUS::varchar as ULTIMO_STATUS
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
            lateral flatten (input => painel_risco) f
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    label: "ID CPF"
    hidden: yes
    description: "Indica o ID CPF"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_cpf_ano_mes {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}."ID_CPF_ANO_MES" ;;
  }

  dimension: ano_mes {
    type: string
    label: "Ano/Mês"
    description: "Indica o ano mês da decisão de análise de risco e crédito do Aluno."
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: classificacao {
    type: string
    label: "Classificação"
    description: "Indica a classificação da decisão de análise de risco e crédito do Aluno."
    sql: ${TABLE}."CLASSIFICACAO" ;;
  }

  dimension: proposta {
    type: string
    label: "ID Proposta"
    description: "Indica a proposta do aluno que passou pela análise de risco e crédito."
    sql: ${TABLE}."PROPOSTA" ;;
  }

  dimension: ultimo_status {
    type: string
    label: "Último Status - Análise de Risco e Crédito"
    description: "Indica a proposta do aluno que passou pela análise de risco e crédito."
    sql: ${TABLE}."ULTIMO_STATUS" ;;
  }

  set: detail {
    fields: [
      id_cpf,
      id_cpf_ano_mes,
      ano_mes,
      classificacao,
      proposta,
      ultimo_status
    ]
  }
}
