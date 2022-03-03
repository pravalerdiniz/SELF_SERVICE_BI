view: amigo_edu {
  derived_table: {
    sql: select * from "GRADUADO"."AD_HOC".amigo_edu
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: data {
    type: date
    sql: ${TABLE}."DATA" ;;
  }

  dimension: bolsa {
    type: string
    sql: ${TABLE}."BOLSA" ;;
  }

  dimension: alunos_bolsa {
    type: string
    sql: ${TABLE}."ALUNOS_BOLSA" ;;
  }

  dimension: alunos_preparae {
    type: string
    sql: ${TABLE}."ALUNOS_PREPARAE" ;;
  }

  dimension: nps_mktp {
    type: string
    sql: ${TABLE}."NPS_MKTP" ;;
  }

  dimension: bolsa_checkout {
    type: string
    sql: ${TABLE}."BOLSA_CHECKOUT" ;;
  }

  dimension: perc_alunos_ies_via_matriculae_balcao {
    type: string
    sql: ${TABLE}."PERC_ALUNOS_IES_VIA_MATRICULAE_BALCAO" ;;
  }

  dimension: receita_provas_dig {
    type: string
    sql: ${TABLE}."RECEITA_PROVAS_DIG" ;;
  }

  dimension: receita_bruta_bolsa {
    type: string
    sql: ${TABLE}."RECEITA_BRUTA_BOLSA" ;;
  }

  dimension: bolsa_de_estudos_perc_peso_tipo_de_cursospresencial_ead_pos_etc {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_PERC_PESO_TIPO_DE_CURSOSPRESENCIAL_EAD_POS_ETC" ;;
  }

  dimension: bolsa_de_estudos_ticket_medio {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_TICKET_MEDIO" ;;
  }

  dimension: bolsa_de_estudos_perc_margem_ticket_medio {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_PERC_MARGEM_TICKET_MEDIO" ;;
  }

  dimension: bolsa_de_estudos {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS" ;;
  }

  dimension: ticket_medio_por_tipo_de_curso {
    type: string
    sql: ${TABLE}."TICKET_MEDIO_POR_TIPO_DE_CURSO" ;;
  }

  dimension: bolsa_de_estudos_share_leads_por_canal {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_SHARE_LEADS_POR_CANAL" ;;
  }

  dimension: bolsa_de_estudos_conversao_por_canal {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_CONVERSAO_POR_CANAL" ;;
  }

  dimension: bolsa_de_estudos_funil_conversao_lead_ate_pago {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_FUNIL_CONVERSAO_LEAD_ATE_PAGO" ;;
  }

  dimension: bolsa_de_estudos_funil_conversao_carrinho_leads {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_FUNIL_CONVERSAO_CARRINHO_LEADS" ;;
  }

  dimension: bolsa_de_estudos_funil_conversao_carrinho_pago {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_FUNIL_CONVERSAO_CARRINHO_PAGO" ;;
  }

  dimension: bolsa_de_estudos_funil_conversao_pago_leads {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_FUNIL_CONVERSAO_PAGO_LEADS" ;;
  }

  dimension: produto_de_atracao_usuarios_ativos_total {
    type: string
    sql: ${TABLE}."PRODUTO_DE_ATRACAO_USUARIOS_ATIVOS_TOTAL" ;;
  }

  dimension: produto_de_atracao_perc_conv_usuarios {
    type: string
    sql: ${TABLE}."PRODUTO_DE_ATRACAO_PERC_CONV_USUARIOS" ;;
  }

  dimension: produto_de_atracao_usuarios_preparae_total {
    type: string
    sql: ${TABLE}."PRODUTO_DE_ATRACAO_USUARIOS_PREPARAE_TOTAL" ;;
  }

  dimension: produto_de_atracao_usuarios_ativos_preparae_total {
    type: string
    sql: ${TABLE}."PRODUTO_DE_ATRACAO_USUARIOS_ATIVOS_PREPARAE_TOTAL" ;;
  }

  dimension: alunos_busca_nota {
    type: string
    sql: ${TABLE}."ALUNOS_BUSCA_NOTA" ;;
  }

  dimension: perc_conversao_busca_nota {
    type: string
    sql: ${TABLE}."PERC_CONVERSAO_BUSCA_NOTA" ;;
  }

  dimension: inscritos_enae {
    type: string
    sql: ${TABLE}."INSCRITOS_ENAE" ;;
  }

  dimension: inscritos_que_fizeram_a_prova_enae {
    type: string
    sql: ${TABLE}."INSCRITOS_QUE_FIZERAM_A_PROVA_ENAE" ;;
  }

  dimension: tendencia_de_alunos_amigo_edu {
    type: string
    sql: ${TABLE}."TENDENCIA_DE_ALUNOS_AMIGO_EDU" ;;
  }

  dimension: peso_receita_por_tipo_de_prova_vestibular_padrao_vestibular_premium_etc {
    type: string
    sql: ${TABLE}."PESO_RECEITA_POR_TIPO_DE_PROVA_VESTIBULAR_PADRAO_VESTIBULAR_PREMIUM_ETC" ;;
  }

  dimension: total_de_vestibulares_realizados {
    type: string
    sql: ${TABLE}."TOTAL_DE_VESTIBULARES_REALIZADOS" ;;
  }

  dimension: total_provas_letivas_contratadas {
    type: string
    sql: ${TABLE}."TOTAL_PROVAS_LETIVAS_CONTRATADAS" ;;
  }

  dimension: ticket_medio_provas_digitais_por_tipo {
    type: string
    sql: ${TABLE}."TICKET_MEDIO_PROVAS_DIGITAIS_POR_TIPO" ;;
  }

  set: detail {
    fields: [
      data,
      bolsa,
      alunos_bolsa,
      alunos_preparae,
      nps_mktp,
      bolsa_checkout,
      perc_alunos_ies_via_matriculae_balcao,
      receita_provas_dig,
      receita_bruta_bolsa,
      bolsa_de_estudos_perc_peso_tipo_de_cursospresencial_ead_pos_etc,
      bolsa_de_estudos_ticket_medio,
      bolsa_de_estudos_perc_margem_ticket_medio,
      bolsa_de_estudos,
      ticket_medio_por_tipo_de_curso,
      bolsa_de_estudos_share_leads_por_canal,
      bolsa_de_estudos_conversao_por_canal,
      bolsa_de_estudos_funil_conversao_lead_ate_pago,
      bolsa_de_estudos_funil_conversao_carrinho_leads,
      bolsa_de_estudos_funil_conversao_carrinho_pago,
      bolsa_de_estudos_funil_conversao_pago_leads,
      produto_de_atracao_usuarios_ativos_total,
      produto_de_atracao_perc_conv_usuarios,
      produto_de_atracao_usuarios_preparae_total,
      produto_de_atracao_usuarios_ativos_preparae_total,
      alunos_busca_nota,
      perc_conversao_busca_nota,
      inscritos_enae,
      inscritos_que_fizeram_a_prova_enae,
      tendencia_de_alunos_amigo_edu,
      peso_receita_por_tipo_de_prova_vestibular_padrao_vestibular_premium_etc,
      total_de_vestibulares_realizados,
      total_provas_letivas_contratadas,
      ticket_medio_provas_digitais_por_tipo
    ]
  }
}
