# Esta view contém a relação de alunos financeiramente ativo mensalmente


view: ano_mes_carteira_ativa {
  derived_table: {
    sql: select
            id_cpf,
            LEFT(f.value,4)||'-'||RIGHT(f.value,2)||'-'||'01'::varchar as ano_mes
            from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
            lateral flatten (input => ATIVO_ANOMES) f ;;
  }


  dimension: id_cpf {
    type: number
    primary_key: yes
    label: "ID CPF"
    description: "Indica o ID do CPF do aluno"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: ano_mes {
    type: date
    label: "Ativo Ano Mes"
    description: "Indica o Ano e o Mês em que o status do aluno é financeiramente ativo"
    sql: TO_DATE(${TABLE}."ANO_MES") ;;
  }

  }
