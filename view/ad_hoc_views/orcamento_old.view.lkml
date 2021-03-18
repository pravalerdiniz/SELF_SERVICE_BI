view: orcamento_old {
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
    label: "Visão"
    description: "Indica a visão do orçamento.Ex: Orçado ou Realizado."
    sql: ${TABLE}."VISAO" ;;
  }


  dimension: unidade_de_negocio_iniciativa {
    type: string
    label: "Iniciativa"
    description: "Indica a iniciativa em relação ao orçamento"
    sql: ${TABLE}."UNIDADE_DE_NEGOCIO_INICIATIVA" ;;
  }

  dimension: tipo_orcamento {
    type: string
    label: "Tipo de Orçamento"
    description: "Indica o tipo de orçamento. Ex: Folha ou Operacional"
    sql: ${TABLE}."TIPO_ORCAMENTO" ;;
  }

  dimension: tipo_de_despesa {
    type: string
    group_label: "Despesa"
    label: "Tipo de Despesa"
    description: "Indica o tipo de despesa. Ex: 13º Salário,  Assist. Médica,   Auxílio academia, Call Center, e etc."
    sql: ${TABLE}."TIPO_DE_DESPESA" ;;
  }

  dimension: temporada {
    type: string
    label: "Temporada"
    description: "Indica a temporada do orçamento. Ex: Verão, Inverno."
    sql: ${TABLE}."TEMPORADA" ;;
  }

  dimension: projeto_ies {
    type: string
    label: "Projeto IES"
    description: "Indica qual é o projeto em relação as Instituiições de Ensino no orçamento."
    sql: ${TABLE}."PROJETO_IES" ;;
  }

  dimension: observacao {
    type: string
    label: "Observação"
    description: "Indica qual é o projeto em relação as Instituiições de Ensino no orçamento."
    sql: ${TABLE}."OBSERVACAO" ;;
  }

  dimension: montante {
    type: number
    label: "Montante"
    description: "Indica o montante disponivel dentro do orçamento."
    sql: ${TABLE}."MONTANTE" ;;
  }

  dimension: descricao_despesa {
    type: string
    group_label: "Despesa"
    label: "Descrição da Despesa"
    description: "Indica a descrição da despesa do orçamento."
    sql: ${TABLE}."DESCRICAO_DESPESA" ;;
  }

  dimension: descricao_centro_de_custo {
    type: string
    group_label: "Centro de Custo"
    label: "Descrição do Centro de Custo"
    description: "Indica a descrição do centro de custo no orçamento."
    sql: ${TABLE}."DESCRICAO_CENTRO_DE_CUSTO" ;;
  }

  dimension: diretoria {
    type: string
    label: "Diretoria"
    description: "Indica a diretoria responsável pelo orçamento. Ex: Diretoria Financeira,Diretoria Produtos,Institucional."
    sql: ${TABLE}."DIRETORIA";;
  }

  dimension: desc_fornecedor {
    type: string
    group_label: "Despesa"
    label: "Fornecedor"
    description: "Indica qual o fornecedor em relação a despesa no orçamento."
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
    label: "Orçamento"
    sql: ${TABLE}."DATA" ;;
  }




  dimension: Tri {
    type: string
    label: "Trimestre"
    description: "Indica o trimestre do orçamento."
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
    group_label: "Contabilidade"
    label: "Conta Contabil"
    description: "Indica o número da conta contábil do orçamento"
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
    value_format: "$ #,###"
    description: "Soma dos valores das despesas"
    }

  measure: soma_orcado {
    type: sum
    filters: {
      field: visao
      value: "ORÇADO"
    }
    sql: ${montante};;
    value_format: "$ #,###"
    description: "Soma das despesas orçadas"
  }

  measure: soma_realizado {
    type: sum
    filters: {
      field: visao
      value: "Realizado"
    }
    value_format: "$ #,###"
    sql: ${montante};;
    description: "Soma das despesas realizadas"
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
