view: alunos_ativos_carteira {
  derived_table: {
    persist_for: "1 hour"
    sql: select
          id_cpf,
          cpf,
          f.value:DATA::DATE as DATA_SNAPSHOT,
          f.value:MODALIDADE::varchar as MODALIDADE,
          f.value:DS_FUNDO_INVESTIMENTO::varchar as FUNDO_INVESTIMENTO
      from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
          lateral flatten (input => ALUNO_ATIVO_OBJETO) f
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cpf {
    type: number
    primary_key: yes
    label: "ID CPF"
    description: "Indica o ID do CPF do Aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension_group: data_snapshot {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: datetime
    label: "Data de Verificação"
    description: "Indica a data de snaphot da quando o aluno estava ativo na carteira"
    sql: ${TABLE}."DATA_SNAPSHOT" ;;
  }

  dimension: modalidade {
    type: string
    label: "Modalidade"
    description: "Indica qual a modalidade do produto do aluno (Antecipação, Gestão...)"
    sql: ${TABLE}."MODALIDADE" ;;
  }

  dimension: fundo_investimento {
    type: string
    label: "Fundo de Investimento Histórico"
    description: "Indica qual o fundo de investimento da proposta do aluno, trazendo dados históricos"
    sql: ${TABLE}."FUNDO_INVESTIMENTO" ;;
  }

  dimension: cpf_aluno {
    type: number
    group_label: "Dados do Aluno"
    label: "CPF do Aluno"
    description: "Indica o CPF do Aluno"
    value_format: "0"
    sql: ${TABLE}."CPF" ;;
    required_access_grants: [grupo_cpf]

  }

  set: detail {
    fields: [id_cpf, modalidade,fundo_investimento]
  }
}
