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

  dimension: analise_ytd {
    type: yesno
    group_label: "Filtros para Análise de Período"
    label: "YTD?"
    description: "Indica o acumulado no ano mês a mês."
    sql:
       (EXTRACT(DOY FROM ${data_raw}) < EXTRACT(DOY FROM GETDATE())
                OR
            (EXTRACT(DOY FROM ${data_raw}) = EXTRACT(DOY FROM GETDATE())))  ;;
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

  dimension: d_produto_de_atracao_conv_usuarios {
    type: string
    sql: ${TABLE}."PRODUTO_DE_ATRACAO_CONV_USUARIOS" ;;
    hidden: yes
  }

  measure: produto_de_atracao_conv_usuarios {
    type: sum
    sql: ${d_produto_de_atracao_conv_usuarios} ;;
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

  dimension: d_produto_de_atracao_usuarios_total {
    type: string
    sql: ${TABLE}."PRODUTO_DE_ATRACAO_USUARIOS_TOTAL" ;;
    hidden: yes
  }

  measure: produto_de_atracao_usuarios_total {
    type: sum
    sql: ${d_produto_de_atracao_usuarios_total} ;;
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

   dimension: d_conversao_busca_nota {
    type: string
    sql: ${TABLE}."CONVERSAO_BUSCA_NOTA" ;;
    hidden: yes
  }

  measure: conversao_busca_nota {
    type: sum
    sql: ${d_conversao_busca_nota} ;;
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

  dimension: d_receita_provas_dig {
    type: string
    sql: ${TABLE}."RECEITA_PROVAS_DIG" ;;
    hidden: yes
  }

  measure: receita_provas_dig {
    type: sum
    sql: ${d_receita_provas_dig} ;;
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

    set: detail {
    fields: [
      dt,
      analise_ytd,
      data_date,
      d_produto_de_atracao_conv_usuarios,
      d_produto_de_atracao_usuarios_ativos_total,
      d_produto_de_atracao_usuarios_total,
      d_produto_de_atracao_usuarios_preparae_total,
      d_produto_de_atracao_usuarios_ativos_preparae_total,
      d_conversao_busca_nota,
      d_inscritos_que_fizeram_a_prova_enae,
      d_receita_provas_dig,
      d_total_de_vestibulares_realizados
      ]
  }
}
