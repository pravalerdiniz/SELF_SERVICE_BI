view: amigo_edu {
  derived_table: {
    sql: select * from "GRADUADO"."AD_HOC".amigo_edu
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dt {
    type: date
    sql: ${TABLE}."DATA" ;;
    hidden: yes
  }

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num
    ]
    sql: ${TABLE}."DATA" ;;
    label: "Data"
     }

  dimension: d_bolsa {
    type: string
    sql: ${TABLE}."BOLSA" ;;
    hidden: yes
  }

  measure: bolsa {
    type: sum
    sql: ${d_bolsa} ;;
  }

  dimension: d_alunos_bolsa {
    type: string
    sql: ${TABLE}."ALUNOS_BOLSA" ;;
    hidden: yes
  }

  measure: alunos_bolsa {
    type: sum
    sql: ${d_alunos_bolsa} ;;
  }

  dimension: d_alunos_preparae {
    type: string
    sql: ${TABLE}."ALUNOS_PREPARAE" ;;
    hidden: yes
  }

  measure: alunos_preparae {
    type: sum
    sql: ${d_alunos_preparae} ;;
  }

  dimension: d_nps_mktp {
    type: string
    sql: ${TABLE}."NPS_MKTP" ;;
    hidden: yes
  }

  measure: nps_mktp {
    type: sum
    sql: ${d_nps_mktp} ;;
  }

  dimension: d_bolsa_checkout {
    type: string
    sql: ${TABLE}."BOLSA_CHECKOUT" ;;
    hidden: yes
  }

  measure: bolsa_checkout {
    type: sum
    sql: ${d_bolsa_checkout} ;;
  }

  dimension: d_perc_alunos_ies_via_matriculae_balcao {
    type: string
    sql: ${TABLE}."PERC_ALUNOS_IES_VIA_MATRICULAE_BALCAO" ;;
    hidden: yes
  }

  measure: perc_alunos_ies_via_matriculae_balcao {
    type: sum
    sql: ${d_perc_alunos_ies_via_matriculae_balcao} ;;
  }

  dimension: d_receita_provas_dig {
    type: string
    sql: ${TABLE}."RECEITA_PROVAS_DIG" ;;
    hidden: yes
  }

  measure: receita_provas_dig {
    type: sum
    sql: ${d_receita_provas_dig} ;;
  }

  dimension: d_receita_bruta_bolsa {
    type: string
    sql: ${TABLE}."RECEITA_BRUTA_BOLSA" ;;
    hidden: yes
  }

  measure: receita_bruta_bolsa {
    type: sum
    sql: ${d_receita_bruta_bolsa} ;;
  }

  dimension: d_bolsa_de_estudos_perc_peso_tipo_de_cursospresencial_ead_pos_etc {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_PERC_PESO_TIPO_DE_CURSOSPRESENCIAL_EAD_POS_ETC" ;;
    hidden: yes
  }

  measure: bolsa_de_estudos_perc_peso_tipo_de_cursos_presencial_ead_pos_etc {
    type: sum
    sql: ${d_bolsa_de_estudos_perc_peso_tipo_de_cursospresencial_ead_pos_etc} ;;
  }

  dimension: d_bolsa_de_estudos_ticket_medio {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_TICKET_MEDIO" ;;
    hidden: yes
  }

  measure: bolsa_de_estudos_ticket_medio {
    type: sum
    sql: ${d_bolsa_de_estudos_ticket_medio} ;;
  }

  dimension: d_bolsa_de_estudos_perc_margem_ticket_medio {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_PERC_MARGEM_TICKET_MEDIO" ;;
    hidden: yes
  }

  measure: bolsa_de_estudos_perc_margem_ticket_medio {
    type: sum
    sql: ${d_bolsa_de_estudos_perc_margem_ticket_medio} ;;
  }

  dimension: d_bolsa_de_estudos {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS" ;;
    hidden: yes
  }

  measure: bolsa_de_estudos {
    type: sum
    sql: ${d_bolsa_de_estudos} ;;
  }

  dimension: d_ticket_medio_por_tipo_de_curso {
    type: string
    sql: ${TABLE}."TICKET_MEDIO_POR_TIPO_DE_CURSO" ;;
    hidden: yes
  }

  measure: ticket_medio_por_tipo_de_curso {
    type: sum
    sql: ${d_ticket_medio_por_tipo_de_curso} ;;
  }

  dimension: d_bolsa_de_estudos_share_leads_por_canal {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_SHARE_LEADS_POR_CANAL" ;;
    hidden: yes
  }

  measure: bolsa_de_estudos_share_leads_por_canal {
    type: sum
    sql: ${d_bolsa_de_estudos_share_leads_por_canal} ;;
  }

  dimension: d_bolsa_de_estudos_conversao_por_canal {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_CONVERSAO_POR_CANAL" ;;
    hidden: yes
  }

  measure: bolsa_de_estudos_conversao_por_canal {
    type: sum
    sql: ${d_bolsa_de_estudos_conversao_por_canal} ;;
  }

  dimension: d_bolsa_de_estudos_funil_conversao_lead_ate_pago {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_FUNIL_CONVERSAO_LEAD_ATE_PAGO" ;;
    hidden: yes
  }

  measure: bolsa_de_estudos_funil_conversao_lead_ate_pago {
    type: sum
    sql: ${d_bolsa_de_estudos_funil_conversao_lead_ate_pago} ;;
  }

  dimension: d_bolsa_de_estudos_funil_conversao_carrinho_leads {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_FUNIL_CONVERSAO_CARRINHO_LEADS" ;;
    hidden: yes
  }

  measure: bolsa_de_estudos_funil_conversao_carrinho_leads {
    type: sum
    sql: ${d_bolsa_de_estudos_funil_conversao_carrinho_leads} ;;
  }

  dimension: d_bolsa_de_estudos_funil_conversao_carrinho_pago {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_FUNIL_CONVERSAO_CARRINHO_PAGO" ;;
    hidden: yes
  }

  measure: bolsa_de_estudos_funil_conversao_carrinho_pago {
    type: sum
    sql: ${d_bolsa_de_estudos_funil_conversao_carrinho_pago} ;;
  }

  dimension: d_bolsa_de_estudos_funil_conversao_pago_leads {
    type: string
    sql: ${TABLE}."BOLSA_DE_ESTUDOS_FUNIL_CONVERSAO_PAGO_LEADS" ;;
    hidden: yes
  }

  measure: bolsa_de_estudos_funil_conversao_pago_leads {
    type: sum
    sql: ${d_bolsa_de_estudos_funil_conversao_pago_leads} ;;
  }

  dimension: d_produto_de_atracao_usuarios_ativos_total {
    type: string
    sql: ${TABLE}."PRODUTO_DE_ATRACAO_USUARIOS_ATIVOS_TOTAL" ;;
    hidden: yes
  }

  measure: produto_de_atracao_usuarios_ativos_total {
    type: sum
    sql: ${d_produto_de_atracao_usuarios_ativos_total} ;;
  }

  dimension: d_produto_de_atracao_perc_conv_usuarios {
    type: string
    sql: ${TABLE}."PRODUTO_DE_ATRACAO_PERC_CONV_USUARIOS" ;;
    hidden: yes
  }

  measure: produto_de_atracao_perc_conv_usuarios {
    type: sum
    sql: ${d_produto_de_atracao_perc_conv_usuarios} ;;
  }

  dimension: d_produto_de_atracao_usuarios_preparae_total {
    type: string
    sql: ${TABLE}."PRODUTO_DE_ATRACAO_USUARIOS_PREPARAE_TOTAL" ;;
    hidden: yes
  }

  measure: produto_de_atracao_usuarios_preparae_total {
    type: sum
    sql: ${d_produto_de_atracao_usuarios_preparae_total} ;;
  }

  dimension: d_produto_de_atracao_usuarios_ativos_preparae_total {
    type: string
    sql: ${TABLE}."PRODUTO_DE_ATRACAO_USUARIOS_ATIVOS_PREPARAE_TOTAL" ;;
    hidden: yes
  }

  measure: produto_de_atracao_usuarios_ativos_preparae_total {
    type: sum
    sql: ${d_produto_de_atracao_usuarios_ativos_preparae_total} ;;
  }

  dimension: d_alunos_busca_nota {
    type: string
    sql: ${TABLE}."ALUNOS_BUSCA_NOTA" ;;
    hidden: yes
  }

  measure: alunos_busca_nota {
    type: sum
    sql: ${d_alunos_busca_nota} ;;
  }

  dimension: d_perc_conversao_busca_nota {
    type: string
    sql: ${TABLE}."PERC_CONVERSAO_BUSCA_NOTA" ;;
    hidden: yes
  }

  measure: perc_conversao_busca_nota {
    type: sum
    sql: ${d_perc_conversao_busca_nota} ;;
  }

  dimension: d_inscritos_enae {
    type: string
    sql: ${TABLE}."INSCRITOS_ENAE" ;;
    hidden: yes
  }

  measure: inscritos_enae {
    type: sum
    sql: ${d_inscritos_enae} ;;
  }

  dimension: d_inscritos_que_fizeram_a_prova_enae {
    type: string
    sql: ${TABLE}."INSCRITOS_QUE_FIZERAM_A_PROVA_ENAE" ;;
    hidden: yes
  }

  measure: inscritos_que_fizeram_a_prova_enae {
    type: sum
    sql: ${d_inscritos_que_fizeram_a_prova_enae} ;;
  }

  dimension: d_tendencia_de_alunos_amigo_edu {
    type: string
    sql: ${TABLE}."TENDENCIA_DE_ALUNOS_AMIGO_EDU" ;;
    hidden: yes
  }

  measure: tendencia_de_alunos_amigo_edu {
    type: sum
    sql: ${d_tendencia_de_alunos_amigo_edu} ;;
  }

  dimension: d_peso_receita_por_tipo_de_prova_vestibular_padrao_vestibular_premium_etc {
    type: string
    sql: ${TABLE}."PESO_RECEITA_POR_TIPO_DE_PROVA_VESTIBULAR_PADRAO_VESTIBULAR_PREMIUM_ETC" ;;
    hidden: yes
  }

  measure: peso_receita_por_tipo_de_prova_vestibular_padrao_vestibular_premium_etc {
    type: sum
    sql: ${d_peso_receita_por_tipo_de_prova_vestibular_padrao_vestibular_premium_etc} ;;
  }

  dimension: d_total_de_vestibulares_realizados {
    type: string
    sql: ${TABLE}."TOTAL_DE_VESTIBULARES_REALIZADOS" ;;
    hidden: yes
  }

  measure: total_de_vestibulares_realizados {
    type: sum
    sql: ${d_total_de_vestibulares_realizados} ;;
  }

  dimension: d_total_provas_letivas_contratadas {
    type: string
    sql: ${TABLE}."TOTAL_PROVAS_LETIVAS_CONTRATADAS" ;;
    hidden: yes
  }

  measure: total_provas_letivas_contratadas {
    type: sum
    sql: ${d_total_provas_letivas_contratadas} ;;
  }

  dimension: d_ticket_medio_provas_digitais_por_tipo {
    type: string
    sql: ${TABLE}."TICKET_MEDIO_PROVAS_DIGITAIS_POR_TIPO" ;;
    hidden: yes
  }

  measure: ticket_medio_provas_digitais_por_tipo {
    type: sum
    sql: ${d_ticket_medio_provas_digitais_por_tipo} ;;
  }


  set: detail {
    fields: [
      data_date,
      dt,
      d_bolsa,
      d_alunos_bolsa,
      d_alunos_preparae,
      d_nps_mktp,
      d_bolsa_checkout,
      d_perc_alunos_ies_via_matriculae_balcao,
      d_receita_provas_dig,
      d_receita_bruta_bolsa,
      d_bolsa_de_estudos_perc_peso_tipo_de_cursospresencial_ead_pos_etc,
      d_bolsa_de_estudos_ticket_medio,
      d_bolsa_de_estudos_perc_margem_ticket_medio,
      d_bolsa_de_estudos,
      d_ticket_medio_por_tipo_de_curso,
      d_bolsa_de_estudos_share_leads_por_canal,
      d_bolsa_de_estudos_conversao_por_canal,
      d_bolsa_de_estudos_funil_conversao_lead_ate_pago,
      d_bolsa_de_estudos_funil_conversao_carrinho_leads,
      d_bolsa_de_estudos_funil_conversao_carrinho_pago,
      d_bolsa_de_estudos_funil_conversao_pago_leads,
      d_produto_de_atracao_usuarios_ativos_total,
      d_produto_de_atracao_perc_conv_usuarios,
      d_produto_de_atracao_usuarios_preparae_total,
      d_produto_de_atracao_usuarios_ativos_preparae_total,
      d_alunos_busca_nota,
      d_perc_conversao_busca_nota,
      d_inscritos_enae,
      d_inscritos_que_fizeram_a_prova_enae,
      d_tendencia_de_alunos_amigo_edu,
      d_peso_receita_por_tipo_de_prova_vestibular_padrao_vestibular_premium_etc,
      d_total_de_vestibulares_realizados,
      d_total_provas_letivas_contratadas,
      d_ticket_medio_provas_digitais_por_tipo
    ]
  }
}
