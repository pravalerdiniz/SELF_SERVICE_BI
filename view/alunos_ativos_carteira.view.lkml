view: alunos_ativos_carteira {
  derived_table: {
    sql: select
          id_cpf,
          f.value:DATA::DATE as DATA_SNAPSHOT,
          f.value:MODALIDADE::varchar as MODALIDADE
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
    description: "Indica qual a modalidade do produto do aluno (Antecipação, Gestão..."
    sql: ${TABLE}."MODALIDADE" ;;
  }

  set: detail {
    fields: [id_cpf, modalidade]
  }
}
