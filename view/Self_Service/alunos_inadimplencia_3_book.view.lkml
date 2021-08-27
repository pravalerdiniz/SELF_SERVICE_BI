view: alunos_inadimplencia_3_book {
  derived_table: {
    sql: select * from stage.public.book_inadimplencia_1
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: rank_ano_mes {
    type: number
    label: "Rank -  Ano Mês"
    sql: ${TABLE}."RANK_ANO_MES" ;;
  }

  dimension: cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: tdt_ano_mes {
    type: number
    label: "Ano - Mês"
    description: "Indica o ano mês de análise de inadimplência"
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: data_fechamento {
    type: date
    sql: ${TABLE}."DATA_FECHAMENTO" ;;
  }
  dimension_group: data_fechamento_group{
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    label: "Fechamento"
    description: "Indica a data de baixa realizada"
    datatype: date
    sql: ${data_fechamento} ;;
  }


  dimension: fundo {
    type: number
    label: "ID Fundo de Investimento"
    description: "Indica o fundo de investimento do aluno"
    hidden: yes
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: ies_grupo {
    type: string
    label: "Grupo - IES"
    hidden: yes
    sql: ${TABLE}."IES_GRUPO" ;;
  }

  dimension: ies_nome {
    type: string
    label: "Nome - IES"
    hidden: yes
    sql: ${TABLE}."IES_NOME" ;;
  }

  dimension: curso {
    type: string
    hidden: yes
    sql: ${TABLE}."CURSO" ;;
  }

  dimension: estado {
    type: string
    hidden: yes
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: cidade {
    type: string
    hidden: yes
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: fx_atraso {
    type: string
    label: "Faixa de Atraso"
    description: "Indica a faixa de atraso no pagamento do aluno"
    sql: ${TABLE}."FX_ATRASO" ;;
  }

  dimension: aluno_novo {
    type: string
    label: "Tipo de Aluno"
    description: "Indica se o aluno é novo ou antigo. Regra: Até um mês dentro da carteira 'Novo', caso contrário 'Antigo'"
    sql: ${TABLE}."ALUNO_NOVO" ;;
  }

  dimension: produtos_novos {
    type: string
    label:  "Produtos Novos"
    sql: ${TABLE}."PRODUTOS_NOVOS" ;;
  }

  dimension: p_fies {
    type: string
    label: "P-FIES"
    sql: ${TABLE}."P_FIES" ;;
  }

  dimension: qtde_cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."QTDE_CPF" ;;
  }

  dimension: vp {
    type: number
    group_label: "Valor Presente"
    label: "Valor Presente - Dívida Total"
    hidden: yes
    description: "Indica o Valor Presente da dívida do aluno."
    sql: ${TABLE}."VP" ;;
  }

  dimension: pdd {
    type: number
    group_label: "PDD"
    label: "PDD - Provisão do Fundo"
    hidden: yes
    sql: ${TABLE}."PDD" ;;
  }

  dimension: pdd_new {
    type: number
    group_label: "PDD"
    label: "PDD Nova - Provisão do Fundo"
    hidden: yes
    sql: ${TABLE}."PDD_NEW" ;;
  }

  dimension: vp_mob6 {
    type: number
    group_label: "PDD"
    hidden: yes
    label: "PDD Nova - Provisão do Fundo"
    sql: ${TABLE}."VP_MOB6" ;;
  }

  dimension: vp_over60_mob6 {
    type: number
    hidden: yes
    sql: ${TABLE}."VP_OVER60_MOB6" ;;
  }

  dimension: pdd_mob6 {
    type: number
    hidden: yes
    sql: ${TABLE}."PDD_MOB6" ;;
  }

  dimension: pdd_new_mob6 {
    type: number
    hidden: yes
    sql: ${TABLE}."PDD_NEW_MOB6" ;;
  }

  dimension: over_05 {
    type: number
    hidden: yes
    sql: ${TABLE}."OVER_05" ;;
  }

  dimension: over_30 {
    type: number
    hidden: yes
    sql: ${TABLE}."OVER_30" ;;
  }

  dimension: over_60 {
    type: number
    hidden: yes
    sql: ${TABLE}."OVER_60" ;;
  }

  dimension: over_90 {
    type: number
    hidden: yes
    sql: ${TABLE}."OVER_90" ;;
  }

  dimension: mensalide {
    type: number
    label: "Mensalidade"
    description: "Indica o valor da parcela que o aluno está pagando atualmente"
    sql: ${TABLE}."MENSALIDE" ;;
  }

  dimension: tx_mensal {
    type: number
    label: "Taxa Mensal"
    description: "Indica o valor da taxa mensal paga pelo ano"
    value_format: "00.00%"
    sql: ${TABLE}."TX_MENSAL" ;;
  }

  measure: vl_presente {
    type: sum
    group_label: "Valor Presente"
    label: "Divida Atual - Soma"
    sql: ${vp} ;;


  }
  measure: vl_presente_mob6 {
    type: sum
    group_label: "Valor Presente"
    label: "MOB 6 - Soma"
    sql: ${vp_mob6} ;;


  }

  measure: vl_presente_mob6_over60 {
    type: sum
    group_label: "Valor Presente"
    label: "MOB 6 | OVER60 - Soma"
    sql: ${vp_over60_mob6} ;;


  }

  measure:sum_pdd  {
    type: sum
    group_label: "PDD"
    label: "Provisão Fundo - Soma"
    sql: ${pdd} ;;
  }
  measure:sum_pdd_mob6  {
    type: sum
    group_label: "PDD"
    label: "MOB 6 - Soma"
    sql: ${pdd_mob6} ;;
  }

  measure:sum_pdd_nova  {
    type: sum
    group_label: "PDD"
    label: "Provisão Fundo (Nova) - Soma"
    sql: ${pdd_new} ;;
  }

  measure:sum_pdd_mob6_nova {
    type: sum
    group_label: "PDD"
    label: "MOB 6 (Nova) - Soma"
    sql: ${pdd_new_mob6} ;;
  }

  measure:sum_pdd_over_5  {
    type: sum
    group_label: "PDD"
    label: "OVER 5 - Soma"
    sql: ${over_05} ;;
  }

  measure:sum_pdd_over_30  {
    type: sum
    group_label: "PDD"
    label: "OVER 30 - Soma"
    sql: ${over_30} ;;
  }

  measure:sum_pdd_over_60  {
    type: sum
    group_label: "PDD"
    label: "OVER 60 - Soma"
    sql: ${over_60} ;;
  }

  measure:sum_pdd_over_90  {
    type: sum
    group_label: "PDD"
    label: "OVER 90 - Soma"
    sql: ${over_90} ;;
  }


  set: detail {
    fields: [
      rank_ano_mes,
      cpf,
      tdt_ano_mes,
      data_fechamento,
      fundo,
      ies_grupo,
      ies_nome,
      curso,
      estado,
      cidade,
      fx_atraso,
      aluno_novo,
      produtos_novos,
      p_fies,
      qtde_cpf,
      vp,
      pdd,
      pdd_new,
      vp_mob6,
      vp_over60_mob6,
      pdd_mob6,
      pdd_new_mob6,
      over_05,
      over_30,
      over_60,
      over_90,
      mensalide,
      tx_mensal
    ]
  }
}