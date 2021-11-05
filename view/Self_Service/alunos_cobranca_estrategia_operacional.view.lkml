view: alunos_cobranca_estrategia_operacional {
  derived_table: {
    sql: select
      a.id_cpf,
      f.key as cpf,
      f.value:ATRASO::number as ATRASO,
      f.value:BOLETOS_ABERTOS::number as BOLETOS_ABERTOS,
      f.value:BOLETOS_ATRASO::number as BOLETOS_ATRASO,
      f.value:CELULAR_ALUNO::number as CELULAR_ALUNO,
      f.value:CELULAR_FIADOR::number as CELULAR_FIADOR,
      f.value:CONTRATOS::varchar as CONTRATOS,
      f.value:DESCONTO::float as DESCONTO,
      f.value:FAIXA_ATRASO::varchar as FAIXA_ATRASO,
      f.value:FASE::varchar as FASE,
      f.value:FUNDO::varchar as FUNDO,
      f.value:NOME_EMPRESA::varchar as NOME_EMPRESA,
      f.value:ORDEM_FAIXA_ATRASO::varchar as ORDEM_FAIXA_ATRASO,
      f.value:VENCIMENTO::date as VENCIMENTO,
      f.value:VALOR_BOLETO_ATRASO::number(38,2) as VALOR_ATRASO,
      f.value:RDG::varchar as RDG,
      f.value:TELEFONE_01::number as TELEFONE_01,
      f.value:TELEFONE_02::number as TELEFONE_02,
      f.value:TELEFONE_03::number as TELEFONE_03,
      f.value:CELULAR_01::number as CELULAR_01,
      f.value:CELULAR_02::number as CELULAR_02,
      f.value:CELULAR_03::number as CELULAR_03,
      f.value:EMAIL_01::varchar as EMAIL_01,
      f.value:EMAIL_02::varchar as EMAIL_02,
      f.value:EMAIL_03::varchar as EMAIL_03
      from GRADUADO.SELF_SERVICE_BI.ALUNOS a,
      lateral flatten (input => dados_elegibilidade) f
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_valor_atraso{
    type: sum
    label: "Valor do Atraso"
    sql: ${valor_atraso} ;;
  }


  dimension: valor_atraso{
    type: number
    label: "Valor do Atraso"
    sql: ${TABLE}."VALOR_ATRASO" ;;
  }

  dimension: vencimento{
    type: date
    hidden: yes
    sql: ${TABLE}."VENCIMENTO" ;;
  }

  dimension_group: data_vencimento_group{
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      month_name,
      year,
      time,

    ]
    convert_tz: no
    label: "Vencimento"
    description: "Indica a a data de menor vencimento do aluno"
    datatype: date
    sql: ${vencimento} ;;
  }


  dimension: id_cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: cpf {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: atraso {
    type: number
    hidden: no
    sql: ${TABLE}."ATRASO" ;;
  }

  dimension: boletos_abertos {
    type: number
    sql: ${TABLE}."BOLETOS_ABERTOS" ;;
  }

  dimension: boletos_atraso {
    type: number
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

  dimension: desconto {
   type: number
   label: "Desconto?"
   value_format: "0.00%"
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

  dimension: telefone_01 {
    type: number
    value_format: "0"
    sql: ${TABLE}."TELEFONE_01" ;;
  }

  dimension: telefone_02 {
    type: number
    value_format: "0"
    sql: ${TABLE}."TELEFONE_02" ;;
  }

  dimension: telefone_03 {
    type: number
    value_format: "0"
    sql: ${TABLE}."TELEFONE_03" ;;
  }

  dimension: celular_01 {
    type: number
    value_format: "0"
    sql: ${TABLE}."CELULAR_01" ;;
  }

  dimension: celular_02 {
    type: number
    value_format: "0"
    sql: ${TABLE}."CELULAR_02" ;;
  }

  dimension: celular_03 {
    type: number
    value_format: "0"
    sql: ${TABLE}."CELULAR_03" ;;
  }

  dimension: email_01 {
    type: string
    sql: ${TABLE}."EMAIL_01" ;;
  }

  dimension: email_02 {
    type: string
    sql: ${TABLE}."EMAIL_02" ;;
  }

  dimension: email_03 {
    type: string
    sql: ${TABLE}."EMAIL_03" ;;
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
      rdg,
      telefone_01,
      telefone_02,
      telefone_03,
      celular_01,
      celular_02,
      celular_03,
      email_01,
      email_02,
      email_03
    ]
  }
}
