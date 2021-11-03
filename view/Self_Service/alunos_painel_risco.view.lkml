view: alunos_painel_risco {
  derived_table: {
    persist_for: "1 hour"
    sql: select
            id_cpf,
            f.key as id_cpf_ano_mes,
            f.value:"ANO/MES"::varchar as ANO_MES,
            f.value:CLASSIFICACAO::varchar as CLASSIFICACAO,
            f.value:PROPOSTA::varchar as PROPOSTA,
            f.value:MODALIDADE::varchar as MODALIDADE,
            f.value:ORDEM::varchar as ORDEM,
            f.value:ULTIMO_STATUS::varchar as ULTIMO_STATUS,
            f.value:DATA_HORA::timestamp as DATA_HORA,
            f.value:VL_PONTUACAO::varchar as VL_PONTUACAO,
            f.value:GH::varchar as GH
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
            lateral flatten (input => painel_risco) f
 ;;
  }


  dimension_group: data_hora {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      hour,
      minute,
      second
    ]
    label: "Decisão"
    sql:${TABLE}."DATA_HORA";;
    description: "Indica a data da decisão de análise de risco e crédito do Aluno."


  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: perc_of_total {
    type: percent_of_total
    sql: ${count}
    ;;
    label: "Porcentagem"
  }

  dimension: id_cpf {
    type: number
    label: "ID CPF"
    hidden: yes
    description: "Indica o ID CPF do aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_cpf_ano_mes {
    type: string
    primary_key: yes
    hidden: yes
    description: "Indica o ID CPF, Ano e o Mês"
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

  dimension: modalidade {
    type: string
    label: "Modalidade -  Risco"
    description: "Indica a modalidade que o aluno foi aprovado."
    sql: ${TABLE}."MODALIDADE" ;;
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
    description: "Indica o CPF do aluno"
  }

  dimension: nome_aluno {
    type: string
    sql: ${proposta.aluno_nome} ;;
    group_item_label: "Nome do Aluno"
    description: "Indica o nome do Aluno"
    hidden: yes
  }

  dimension: aluno_uf {
    type: string
    sql: ${proposta.aluno_uf} ;;
    group_item_label: "UF"
    description: "Indica o estado (uf) do aluno"
    hidden: yes
  }

  dimension: aluno_idade {
    type: number
    sql: ${proposta.aluno_idade} ;;
    group_item_label: "Idade do Aluno"
    description: "Indica a idade do aluno"
    hidden: yes
  }


  dimension: cpf_fiador {
    type: number
    sql: ${proposta.cpf_fiador} ;;
    group_item_label: "CPF Garantidor"
    description: "Indica o CPF do Garantidor"
    hidden: yes
  }

  dimension: fia_parentesco {
    type: string
    sql: ${proposta.fia_parentesco} ;;
    group_item_label: "Parentesco"
    description: "Indica qual o parentesco do Garantidor com o aluno"
    hidden: yes
  }

  dimension: fia_estado_civil {
    type: string
    sql: ${proposta.estado_civil_garantidor} ;;
    group_item_label: "Estado Civil - Garantidor"
    description: "Indica qual o estado civil do Garantidor"
    hidden: yes
  }

  dimension: ocupacao_fiador {
    type: string
    sql: ${proposta.ocupacao_garantidor} ;;
    group_item_label: "Natureza de Ocupação -  Garantidor"
    description: "Indica qual a natureza de ocupação do Garantidor"
    hidden: yes
  }

  dimension: flag_sem_fiador {
    type:  yesno
    label: "Flag Sem Fiador"
    sql: ${TABLE}."DATA_HORA" >= '2021-09-14'
      and ${proposta.cpf_fiador} is null
      and ${proposta.fia_idade} is null;;
}

dimension: VL_PONTUACAO {
  type:  number
  label: "Score"
  sql: ${TABLE}."VL_PONTUACAO" ;;
}

  dimension: GH {
    type:  string
    label: "GH"
    sql: ${TABLE}."GH" ;;
  }

  set: detail {
    fields: [
      cpf_aluno,
      nome_aluno,
      proposta,
      modalidade,
      aluno_idade,
      aluno_uf,
      cpf_fiador,
      fia_parentesco,
      fia_estado_civil,
      ocupacao_fiador,
      ano_mes,
      classificacao,
      ultimo_status
    ]
  }
}
