view: alunos_inadimplencia_book_produtos {
  derived_table: {
    sql: select distinct* from GRADUADO.RISCO.VW_BOOK_INADIMPLENCIA_PRODUTOS
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]

  }

  dimension: rank_ano_mes {
    type: number
    sql: ${TABLE}."RANK_ANO_MES" ;;
  }


  dimension: primary_key {
    type: string
    hidden: yes
    sql: CONCAT(${tdt_ano_mes},${cpf}) ;;
    primary_key: yes


  }

  dimension: cpf {
    type: number
    value_format: "0"
    sql: ${TABLE}."CPF" ;;
  }


  dimension: produtos {
    type: string
    label: "Produto"
    sql: ${TABLE}."PRODUTOS" ;;
  }



  dimension: tdt_ano_mes {
    type: number
    label: "Ano - Mês"
    value_format: "0"
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: data_fechamento {
    type: date
    label: "Data de Fechamento"
    sql: ${TABLE}."DATA_FECHAMENTO" ;;
  }

  dimension: fundo {
    type: number
    label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: ies_grupo {
    type: string
    sql: ${TABLE}."IES_GRUPO" ;;
  }

  dimension: ies_nome {
    type: string
    hidden: yes
    sql: ${TABLE}."IES_NOME" ;;
  }

  dimension: estado {
    type: string
    map_layer_name: MAPA_ESTADO_ALUNO
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: aluno_novo {
    type: string
    label: "Tipo de Aluno - Produto"
    sql: ${TABLE}."ALUNO_NOVO" ;;
  }

  dimension: modalidade {
    type: string
    label: "Modalidade"
    sql: ${TABLE}."MODALIDADE" ;;
  }

  dimension: produtos_novos {
    type: string
    label: "Produtos - Novos"
    sql: ${TABLE}."PRODUTOS_NOVOS" ;;
  }

  dimension: p_fies {
    type: string
    hidden: yes
    sql: ${TABLE}."P_FIES" ;;
  }

  dimension: maturidade {
    type: number
    label: "Maturidade CPF"
    sql: ${TABLE}."MATURIDADE" ;;
  }

  dimension: qtde_cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."QTDE_CPF" ;;
  }

 dimension: vp {
    type: number
    label: "Valor Presente"
    hidden: yes
    sql: ${TABLE}."VP";;
  }


  dimension: vp_campo {
    type: number
    label: "Valor Presente"
    sql: ${TABLE}."VP" ;;
  }

  measure: pdd {
    type: sum
    label: "PDD"
    sql: ${TABLE}."PDD" ;;
  }

  measure: pdd_new {
    type: sum
    label: "PDD - Nova"
    sql: ${TABLE}."PDD_NEW" ;;
  }

  dimension: vp_mob6 {
    type: number
    hidden: yes
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

  dimension: over_15 {
    type: number
    hidden: yes
    sql: ${TABLE}."OVER_15" ;;
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

  dimension: over_15_90 {
    type: number
    hidden: yes
    sql: ${TABLE}."OVER_15_90" ;;
  }

  dimension: cpf_fpd {
    type: number
    hidden: yes
    sql: ${TABLE}."#CPF_FPD" ;;
  }

  dimension: cpf_fpd15 {
    type: number
    hidden: yes
    sql: ${TABLE}."#CPF_FPD15" ;;
  }

  dimension: fpd15 {
    type: number
    hidden: yes
    sql: ${TABLE}."FPD15" ;;
  }

  dimension: fpd {
    type: number
    hidden: yes
    sql: ${TABLE}."FPD" ;;
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


  measure:sum_vp  {
    type: sum
    group_label: "Valor Presente"
    label: "Soma"
    sql: ${vp} ;;
  }


  measure:sum_pdd_mob6  {
    type: sum
    group_label: "PDD"
    label: "MOB 6 - Soma"
    sql: ${pdd_mob6} ;;
  }



  measure:sum_pdd_mob6_nova {
    type: sum
    group_label: "PDD"
    label: "MOB 6 (Nova) - Soma"
    sql: ${pdd_new_mob6} ;;
  }

  measure:sum_pdd_over_15  {
    type: sum
    group_label: "PDD"
    label: "OVER 15 - Soma"
    sql: ${over_15} ;;
  }

  measure:sum_pdd_over_15_90  {
    type: sum
    group_label: "PDD"
    label: "OVER 15 a 90 - Soma"
    sql: ${over_15_90} ;;
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
      estado,
      aluno_novo,
      modalidade,
      produtos_novos,
      p_fies,
      maturidade,
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
      cpf_fpd,
      cpf_fpd15,
      fpd15,
      fpd
    ]
  }
}
