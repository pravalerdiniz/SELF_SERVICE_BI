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

  dimension: cpf_aluno {
    type: number
    sql: ${proposta.cpf_aluno} ;;
    group_label: "Dados da Proposta"
    group_item_label: "ID CPF do Aluno"
    hidden: yes
    description: "Indica o ID do CPF correspondente ao CPF do aluno"
  }

  dimension: nome_aluno {
    type: string
    sql: ${proposta.aluno_nome} ;;
    group_item_label: "Nome do Aluno"
    hidden: yes
  }

  dimension: aluno_uf {
    type: string
    sql: ${proposta.aluno_uf} ;;
    group_item_label: "UF"
    hidden: yes
  }

  dimension: aluno_idade {
    type: number
    sql: ${proposta.aluno_idade} ;;
    group_item_label: "Idade do Aluno"
    hidden: yes
  }


  dimension: cpf_fiador {
    type: number
    sql: ${proposta.cpf_fiador} ;;
    group_item_label: "CPF Fiador"
    hidden: yes
  }

  dimension: fia_parentesco {
    type: string
    sql: ${proposta.fia_parentesco} ;;
    group_item_label: "Parentesco"
    hidden: yes
  }

  dimension: fia_estado_civil {
    type: string
    sql: ${proposta.estado_civil_fia} ;;
    group_item_label: "Estado Civil - Fiador"
    hidden: yes
  }



  set: detail {
    fields: [
      cpf_aluno,
      nome_aluno,
      proposta,
      aluno_idade,
      aluno_uf,
      cpf_fiador,
      fia_parentesco,
      fia_estado_civil,
      ano_mes,
      classificacao,
      ultimo_status
    ]
  }
}
