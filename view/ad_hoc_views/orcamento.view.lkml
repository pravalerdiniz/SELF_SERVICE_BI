view: orcamento {
  view_label: "Orçamento"
  derived_table: {
    sql: select
      TIPO_ORCAMENTO,
DESCRICAO_CENTRO_DE_CUSTO,
TIPO_DE_DESPESA,
VISAO,
DATA,
CENTRO_DE_CUSTO,
CONTA_CONTABIL,
DESCRICAO_DESPESA,
DESC_FORNECEDOR,
MONTANTE,
OBSERVACAO,
UNIDADE_DE_NEGOCIO_INICIATIVA,
PROJETO_IES,
CLASSIFICACAO_CUSTOS,
TEMPORADA
    from(SELECT
TIPO_ORCAMENTO,
DESCRICAO_CENTRO_DE_CUSTO,
TIPO_DE_DESPESA,
VISAO,
B.DS_DATE AS "DATA",
CENTRO_DE_CUSTO,
CONTA_CONTABIL,
DESCRICAO_DESPESA,
DESC_FORNECEDOR,
MONTANTE,
OBSERVACAO,
UNIDADE_DE_NEGOCIO_INICIATIVA,
PROJETO_IES,
CLASSIFICACAO_CUSTOS,
TEMPORADA
      FROM  "VETERANO"."FATO"."ORCAMENTO_ORCADO" AS A
      LEFT JOIN "VETERANO"."DIMENSAO"."DIM_DATE" b ON b.ID_DATE = a.DATA
      UNION ALL
      SELECT
TIPO_ORCAMENTO,
DESCRICAO_CENTRO_DE_CUSTO,
TIPO_DE_DESPESA,
VISAO,
B.DS_DATE AS "DATA",
CENTRO_DE_CUSTO,
CONTA_CONTABIL,
DESCRICAO_DESPESA,
DESC_FORNECEDOR,
MONTANTE,
OBSERVACAO,
UNIDADE_DE_NEGOCIO_INICIATIVA,
PROJETO_IES,
CLASSIFICACAO_CUSTOS,
TEMPORADA
      FROM "VETERANO"."FATO"."ORCAMENTO_REALIZADO" AS a
      LEFT JOIN "VETERANO"."DIMENSAO"."DIM_DATE" b ON b.ID_DATE = a.DATA) ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: visao {
    type: string
    sql: ${TABLE}."VISAO" ;;
  }


  dimension: unidade_de_negocio_iniciativa {
    type: string
    sql: ${TABLE}."UNIDADE_DE_NEGOCIO_INICIATIVA" ;;
  }

  dimension: tipo_orcamento {
    type: string
    sql: ${TABLE}."TIPO_ORCAMENTO" ;;
  }

  dimension: tipo_de_despesa {
    type: string
    sql: ${TABLE}."TIPO_DE_DESPESA" ;;
  }

  dimension: temporada {
    type: string
    sql: ${TABLE}."TEMPORADA" ;;
  }

  dimension: projeto_ies {
    type: string
    sql: ${TABLE}."PROJETO_IES" ;;
  }

  dimension: observacao {
    type: string
    sql: ${TABLE}."OBSERVACAO" ;;
  }

  dimension: montante {
    type: number
    sql: ${TABLE}."MONTANTE" ;;
  }

  dimension: descricao_despesa {
    type: string
    sql: ${TABLE}."DESCRICAO_DESPESA" ;;
  }

  dimension: descricao_centro_de_custo {
    type: string
    sql: ${TABLE}."DESCRICAO_CENTRO_DE_CUSTO" ;;
  }

  dimension: diretoria {
    type: string
    sql: ${TABLE}."DIRETORIA";;
  }

  dimension: desc_fornecedor {
    type: string
    sql: ${TABLE}."DESC_FORNECEDOR" ;;
  }

  dimension: data {
    type: date
    sql: ${TABLE}."DATA" ;;
    hidden: yes
  }

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA" ;;
  }




  dimension: Tri {
    type: string
    case: {
      when: {
        sql: ${data_month_num} < '4'  ;;
        label: "1º Tri"
      }
      when: {
        sql: ${data_month_num} > '3'  and ${data_month_num} < '7'  ;;
        label: "2º Tri"
      }
      when: {
        sql: ${data_month_num} > '6'  and ${data_month_num} < '10'  ;;
        label: "3º Tri"
      }
      else: "4º Tri"
    }
  }


  dimension: conta_contabil {
    type: number
    sql: ${TABLE}."CONTA_CONTABIL" ;;
  }


  dimension: classificacao_custos {
    type: string
    sql: ${TABLE}."CLASSIFICACAO_CUSTOS" ;;
  }

  dimension: centro_de_custo {
    type: number
    sql: ${TABLE}."CENTRO_DE_CUSTO" ;;
  }

  measure: soma_despesa {
    type: sum
    sql: ${montante};;
    description: "Soma dos valores das despesas"}

  measure: soma_orcado {
    type: sum
    filters: {
      field: visao
      value: "Orçado"
    }
    sql: ${montante};;
    description: "Soma das despesas orçadas"
  }

  measure: soma_realizado{
    type: sum
    value_format: "$ #,###"
    filters: {
      field: visao
      value: "Realizado"
    }
    sql: ${montante};;
    description: "Soma das despesas realizadas"
  }

  measure: soma_forecast{
    type: sum
    value_format: "$ #,###"
    filters: {
      field: visao
      value: "Forecast"
    }
    sql: ${montante};;
    description: "Soma do forecast das despesas"
  }

  measure: Real_vs_Orcado{
    type: number
    value_format: "$ #,###"
    sql: ${soma_orcado} - NULLIF(${soma_realizado},0);;
  }

  set: detail {
    fields: [
      tipo_orcamento,
      descricao_centro_de_custo,
      tipo_de_despesa,
      visao,
      centro_de_custo,
      conta_contabil,
      descricao_despesa,
      desc_fornecedor,
      montante,
      observacao,
      unidade_de_negocio_iniciativa,
      projeto_ies,
      classificacao_custos,
      temporada
    ]
  }
}
