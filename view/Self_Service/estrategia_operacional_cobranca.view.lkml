view: estrategia_operacional_cobranca {
  derived_table: {
    sql: select

      f.key as cpf,
      f.value:ATRASO::number as ATRASO,
      f.value:BOLETOS_ABERTOS::number as BOLETOS_ABERTOS,
      f.value:BOLETOS_ATRASO::number as BOLETOS_ATRASO,
      f.value:CELULAR_ALUNO::number as CELULAR_ALUNO,
      f.value:CELULAR_FIADOR::number as CELULAR_FIADOR,
      f.value:CONTRATOS::varchar as CONTRATOS,
      f.value:DESCONTO::number as DESCONTO,
      f.value:FAIXA_ATRASO::varchar as FAIXA_ATRASO,
      f.value:FASE::varchar as FASE,
      f.value:FUNDO::varchar as FUNDO,
      f.value:NOME_EMPRESA::varchar as NOME_EMPRESA,
      f.value:ORDEM_FAIXA_ATRASO::varchar as ORDEM_FAIXA_ATRASO,
      f.value:RDG::varchar as RDG

      from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
      lateral flatten (input => dados_elegibilidade) f
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cpf {
    type: string
    hidden: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: atraso {
    type: number
    hidden: no
    sql: ${TABLE}."ATRASO" ;;
  }

  measure: boletos_abertos {
    type: number
    hidden: no
    sql: ${TABLE}."BOLETOS_ABERTOS" ;;
  }

  measure: boletos_atraso {
    type: number
    hidden: no
    sql: ${TABLE}."BOLETOS_ATRASO" ;;
  }

  dimension: celular_aluno {
    type: number
    hidden: yes
    sql: ${TABLE}."CELULAR_ALUNO" ;;
  }

  dimension: celular_fiador {
    type: number
    hidden: yes
    sql: ${TABLE}."CELULAR_FIADOR" ;;
  }

  dimension: contratos {
    type: string
    hidden: no
    sql: ${TABLE}."CONTRATOS" ;;
  }


  measure: desconto {
    type: number
    value_format: "#.##%"
    sql: ${TABLE}."DESCONTO" ;;
  }

  dimension: faixa_atraso {
    type: string
    sql: ${TABLE}."FAIXA_ATRASO" ;;
  }

  dimension: fase {
    type: string
    sql: ${TABLE}."FASE" ;;
  }

  dimension: fundo {
    type: string
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: nome_empresa {
    type: string
    sql: ${TABLE}."NOME_EMPRESA" ;;
  }

  dimension: ordem_faixa_atraso {
    type: string
    sql: ${TABLE}."ORDEM_FAIXA_ATRASO" ;;
  }

  dimension: rdg {
    type: string
    sql: ${TABLE}."RDG" ;;
  }

  set: detail {
    fields: [
      cpf,
      atraso,
      boletos_abertos,
      boletos_atraso,
      celular_aluno,
      celular_fiador,
      contratos,
      desconto,
      faixa_atraso,
      fase,
      fundo,
      nome_empresa,
      ordem_faixa_atraso,
      rdg
    ]
  }
}