view: pesquisa_perfil_aluno {
  sql_table_name: "AD_HOC"."PESQUISA_PERFIL_ALUNO"
    ;;

  dimension: aplicativo_mobilidade_preferido {
    type: string
    sql: ${TABLE}."APLICATIVO_MOBILIDADE_PREFERIDO" ;;
  }

  dimension: aplicativo_musica_preferido {
    type: string
    sql: ${TABLE}."APLICATIVO_MUSICA_PREFERIDO" ;;
  }

  dimension: canais_tv_aberta {
    type: string
    sql: ${TABLE}."CANAIS_TV_ABERTA" ;;
  }

  dimension: canais_tv_fechada {
    type: string
    sql: ${TABLE}."CANAIS_TV_FECHADA" ;;
  }

  dimension: collector_id {
    type: string
    sql: ${TABLE}."COLLECTOR_ID" ;;
  }

  dimension: como_conheceu_pravaler {
    type: string
    sql: ${TABLE}."COMO_CONHECEU_PRAVALER" ;;
  }

  dimension: comportamento_de_compra {
    type: string
    sql: ${TABLE}."COMPORTAMENTO_DE_COMPRA" ;;
  }

  dimension: compras_pelo_smartphone {
    type: string
    sql: ${TABLE}."COMPRAS_PELO_SMARTPHONE" ;;
  }

  dimension: custom_1 {
    type: string
    sql: ${TABLE}."CUSTOM_1" ;;
  }

  dimension_group: date_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATE_CREATED" ;;
  }

  dimension_group: date_modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATE_MODIFIED" ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}."EMAIL_ADDRESS" ;;
  }

  dimension: empresa_online_que_adora_comprar {
    type: string
    sql: ${TABLE}."EMPRESA_ONLINE_QUE_ADORA_COMPRAR" ;;
  }

  dimension: empresa_referencia_experiencia_cliente {
    type: string
    sql: ${TABLE}."EMPRESA_REFERENCIA_EXPERIENCIA_CLIENTE" ;;
  }

  dimension: faz_com_frequencia {
    type: string
    sql: ${TABLE}."FAZ_COM_FREQUENCIA" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: formas_pagamento_compras {
    type: string
    sql: ${TABLE}."FORMAS_PAGAMENTO_COMPRAS" ;;
  }

  dimension: frequencia_assiste_tv_aberta {
    type: string
    sql: ${TABLE}."FREQUENCIA_ASSISTE_TV_ABERTA" ;;
  }

  dimension: frequencia_assiste_tv_fechada {
    type: string
    sql: ${TABLE}."FREQUENCIA_ASSISTE_TV_FECHADA" ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}."IP_ADDRESS" ;;
  }

  dimension: joga_jogos_online {
    type: string
    sql: ${TABLE}."JOGA_JOGOS_ONLINE" ;;
  }

  dimension: key_ {
    type: string
    sql: ${TABLE}."key_" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: maior_peso_opiniao_produto {
    type: string
    sql: ${TABLE}."MAIOR_PESO_OPINIAO_PRODUTO" ;;
  }

  dimension: menor_peso_opiniao_produto {
    type: string
    sql: ${TABLE}."MENOR_PESO_OPINIAO_PRODUTO" ;;
  }

  dimension: momento_profissional_atual {
    type: string
    sql: ${TABLE}."MOMENTO_PROFISSIONAL_ATUAL" ;;
  }

  dimension: mora_com_quantas_pessoas {
    type: string
    sql: ${TABLE}."MORA_COM_QUANTAS_PESSOAS" ;;
  }

  dimension: onde_pede_comida {
    type: string
    sql: ${TABLE}."ONDE_PEDE_COMIDA" ;;
  }

  dimension: onde_procura_informacoes_produto {
    type: string
    sql: ${TABLE}."ONDE_PROCURA_INFORMACOES_PRODUTO" ;;
  }

  dimension: paga_compras_com {
    type: string
    sql: ${TABLE}."PAGA_COMPRAS_COM" ;;
  }

  dimension: possui_filhos {
    type: string
    sql: ${TABLE}."POSSUI_FILHOS" ;;
  }

  dimension: qual_frase_de_consumo_se_identifica {
    type: string
    sql: ${TABLE}."QUAL_FRASE_DE_CONSUMO_SE_IDENTIFICA" ;;
  }

  dimension: quantos_filhos {
    type: string
    sql: ${TABLE}."QUANTOS_FILHOS" ;;
  }

  dimension: redes_sociais_mais_visualizadas {
    type: string
    sql: ${TABLE}."REDES_SOCIAIS_MAIS_VISUALIZADAS" ;;
  }

  dimension: redes_sociais_usadas {
    type: string
    sql: ${TABLE}."REDES_SOCIAIS_USADAS" ;;
  }

  dimension: respondent_id {
    type: string
    sql: ${TABLE}."RESPONDENT_ID" ;;
  }

  dimension: tem_conta_banco {
    type: string
    sql: ${TABLE}."TEM_CONTA_BANCO" ;;
  }

  dimension: ultima_compra_internet {
    type: string
    sql: ${TABLE}."ULTIMA_COMPRA_INTERNET" ;;
  }

  dimension: utiliza_servico_streaming {
    type: string
    sql: ${TABLE}."UTILIZA_SERVICO_STREAMING" ;;
  }

  measure: count {
    type: count
    drill_fields: [first_name, last_name]
  }

  measure: pesquisa_unica {
    type: count_distinct
    sql: ${key_} ;;

  }

  measure: percentual_pesquisa_unica {
    type: percent_of_total
    sql: ${pesquisa_unica} ;;

  }
}
