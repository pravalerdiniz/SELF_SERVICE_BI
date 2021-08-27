view: alunos_inadimplencia_book_produtos {
  derived_table: {
    sql: select * from stage.public.book_inadimplencia_produtos
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: rank_ano_mes {
    type: number
    hidden: yes
    sql: ${TABLE}."RANK_ANO_MES" ;;
  }

  dimension: cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."CPF" ;;
  }

  dimension: tdt_ano_mes {
    type: number
    hidden: yes
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: data_fechamento {
    type: date
    hidden: yes
    sql: ${TABLE}."DATA_FECHAMENTO" ;;
  }

  dimension: fundo {
    type: number
    hidden: yes
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: ies_grupo {
    type: string
    hidden: yes
    sql: ${TABLE}."IES_GRUPO" ;;
  }

  dimension: ies_nome {
    type: string
    hidden: yes
    sql: ${TABLE}."IES_NOME" ;;
  }

  dimension: estado {
    type: string
    hidden: yes
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: aluno_novo {
    type: string
    hidden: yes
    sql: ${TABLE}."ALUNO_NOVO" ;;
  }

  dimension: modalidade {
    type: string
    label: "Modalidade"
    sql: ${TABLE}."MODALIDADE" ;;
  }

  dimension: produtos_novos {
    type: string
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}."VP" ;;
  }

  dimension: pdd {
    type: number
    hidden: yes
    sql: ${TABLE}."PDD" ;;
  }

  dimension: pdd_new {
    type: number
    hidden: yes
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
