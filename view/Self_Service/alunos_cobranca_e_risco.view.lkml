view: alunos_cobranca_e_risco {
  derived_table: {
    sql: select *  from stage.public.cobranca_risco_cobranca
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_acordo {
    type: number
    sql: ${TABLE}."ID_ACORDO" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
    primary_key: yes
  }

  dimension: proposta {
    type: number
    sql: ${TABLE}."PROPOSTA" ;;
  }

  dimension: usuario_rede {
    type: string
    group_item_label: "Usuario Rede"
    sql: ${TABLE}."USUARIO_REDE" ;;
  }

   dimension_group: data_acordo{
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
    label: "Data Acordo"
    description: "Indica a a data do acordo do aluno"
    datatype: date
    sql: ${TABLE}."DT_ACORDO" ;;
  }

  dimension: ano_mes_data_acordo {
    type: number
    label: "Ano - Mês Acordo"
    value_format: "0"
    description: "Indica o ano e mes da data do acordo"
    sql: ${TABLE}."ANOMES_DT_ACORDO" ;;
  }

  dimension_group: data_concessao {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      month_name,
      year,
      time
    ]
    convert_tz: no
    label: "Data Concessao"
    datatype: date
    sql: ${TABLE}."DT_CONCESSAO" ;;
  }

  dimension: ano_mes_cessao {
    type: number
    label: "Ano - Mês Cessao"
    value_format: "0"
    description: "Indica o ano e mês da data da cessao"
    sql: ${TABLE}."ANOMES_CESSAO" ;;
  }

  measure: vp_divida {
    type: sum
    group_item_label: "VP Divida"
    description: "Valor Principal da Divida do aluno"
    sql: ${TABLE}."VP_DIVIDA" ;;
  }

  dimension_group: data{
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
    label: "Data"
    datatype: date
    sql: ${TABLE}."DATA" ;;
  }

  dimension: status {
    type: number
    group_item_label: "Status"
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: dec_status {
    type: string
    group_item_label: "Dec. Status"
    sql: ${TABLE}."DEC_STATUS" ;;
  }

  dimension: cessao {
    type: string
    group_item_label: "Cessao"
    sql: ${TABLE}."CESSAO" ;;
  }

  dimension: fundo {
    type: number
    group_item_label: "Fundo"
    sql: ${TABLE}."FUNDO" ;;
  }

  dimension: gerado {
    type: string
    group_item_label: "Gerado"
    sql: ${TABLE}."GERADO" ;;
  }

  dimension: status_quebra {
    type: string
    group_item_label: "Status Quebra"
    sql: ${TABLE}."STATUS_QUEBRA" ;;
  }

  dimension: taxa {
    type: number
    group_item_label: "Taxa"
    sql: ${TABLE}."TAXA" ;;
  }

  dimension: tipo_acordo {
    type: number
    group_item_label: "Tipo Acordo"
    sql: ${TABLE}."TIPO_ACORDO" ;;
  }

  dimension: nome {
    type: string
    group_item_label: "Nome"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: produto {
    type: string
    group_item_label: "Produto"
    sql: ${TABLE}."PRODUTO" ;;
  }

  dimension: wo {
    type: string
    group_item_label: "WO"
    sql: ${TABLE}."WO" ;;
  }

  dimension: complementar {
    type: string
    group_item_label: "Complementar"
    sql: ${TABLE}."COMPLEMENTAR" ;;
  }

  measure: vp_anterior {
    type: sum
    group_item_label: "VP Anterior"
    sql: ${TABLE}."VP_ANTERIOR" ;;
  }

  dimension: atraso {
    type: number
    group_item_label: "Atraso"
    sql: ${TABLE}."ATRASO" ;;
  }

  dimension: taxa_pdd {
    type: number
    group_item_label: "Taxa PDD"
    sql: ${TABLE}."TX_PDD" ;;
  }

  measure: valor_pdd {
    type: sum
    group_item_label: "Valor PDD"
    sql: ${TABLE}."VL_PDD" ;;
  }

  dimension: novo_vp {
    type: number
    group_item_label: "Novo VP"
    sql: ${TABLE}."NOVO_VP" ;;
  }

  measure: dif_vp {
    type: sum
    group_item_label: "Dif VP"
    sql: ${TABLE}."DIF_VP" ;;
  }

  measure: valor_complementar {
    type: sum
    group_item_label: "Valor Complementar"
    sql: ${TABLE}."VL_COMPLEMENTAR" ;;
  }

  dimension: desconto {
    type: number
    group_item_label: "Desconto"
    sql: ${TABLE}."DESCONTO" ;;
  }

  measure: valor_presente {
    type: sum
    group_item_label: "Valor Presente"
    sql: ${TABLE}."VL_PRESENTE" ;;
  }

  set: detail {
    fields: [
      id_acordo,
      cpf,
      proposta,
      usuario_rede,
      data_acordo_time,
      ano_mes_data_acordo,
      data_concessao_time,
      ano_mes_cessao,
      vp_divida,
      data_time,
      status,
      dec_status,
      cessao,
      fundo,
      gerado,
      status_quebra,
      taxa,
      tipo_acordo,
      nome,
      produto,
      wo,
      complementar,
      vp_anterior,
      atraso,
      taxa_pdd,
      valor_pdd,
      novo_vp,
      dif_vp,
      valor_complementar,
      desconto,
      valor_presente
    ]
  }
}
