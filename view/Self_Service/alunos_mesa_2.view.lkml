view: alunos_mesa_2 {
  derived_table: {
    sql: select * from stage.public.mesa2
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: sl_cpf {
    type: number
    hidden: yes
    sql: ${TABLE}."SL_CPF" ;;
  }

  dimension: sl_data {
    type: date

    sql: ${TABLE}."SL_DATA" ;;
  }

  dimension: sl_status_destino {
    type: number
    group_label: "Dados do Status"
    label: "Status Destino - Geral"
    sql: ${TABLE}."SL_STATUS_DESTINO" ;;
  }

  dimension: sl_status_destino_detalhe {
    type: number
    group_label: "Dados do Status"
    label: "Status Destino - Detalhe"
    sql: ${TABLE}."SL_STATUS_DESTINO_DETALHE" ;;
  }

  dimension: instituicao {
    type: number
    label: "ID da Instituição de Ensino"
    group_label: "Dados da Instituição"
    sql: ${TABLE}."INSTITUICAO" ;;
  }

  measure: valor_mensal {
    type: sum
    label: "Valor Mensal"
    sql: ${TABLE}."VALOR_MENSAL" ;;
  }

  dimension: produto {
    type: number
    label: "ID do Produto"
    group_label: "Dados do Produto"
    sql: ${TABLE}."PRODUTO" ;;
  }

  dimension: alu_contrato {
    type: number
    label: "ID do Contrato"
    sql: ${TABLE}."ALU_CONTRATO" ;;
  }

  measure: ult_mensa {
    type: sum
    group_label: "Mensalidade"
    label: "Ultima Mensalidade"
    sql: ${TABLE}."ULT_MENSA" ;;
  }

  dimension: pro_nome {
    type: string
    label: "Nome do Produto"
    group_label: "Dados do Produto"
    sql: ${TABLE}."PRO_NOME" ;;
  }

  dimension: st_juro_zero {
    type: yesno
    label: "Juros Zero?"
    sql: ${TABLE}."ST_JURO_ZERO" ;;
  }

  dimension: apelido {
    type: string
    group_label: "Dados da Instituição"
    label: "Nome da Instituição"
    sql: ${TABLE}."APELIDO" ;;
  }

  dimension: ies_grupo {
    type: string
    group_label: "Dados da Instituição"
    label: "Grupo"
    sql: ${TABLE}."IES_GRUPO" ;;
  }

  measure: renda_fia {
    type: sum
    group_label: "Renda"
    label: "Fiador"
    sql: ${TABLE}."RENDA_FIA" ;;
  }

  measure: renda_alu {
    type: sum
    group_label: "Renda"
    label: "Aluno"
    sql: ${TABLE}."RENDA_ALU" ;;
  }

  dimension: valor_fia {
    type: number
    hidden: yes
    sql: ${TABLE}."VALOR_FIA" ;;
  }

  dimension: valor_alu {
    type: number
    hidden: yes
    sql: ${TABLE}."VALOR_ALU" ;;
  }

  dimension: multiplicador {
    type: number
    label: "Multiplicador"
    sql: ${TABLE}."MULTIPLICADOR" ;;
  }

  dimension: mensalidade_menor {
    type: string
    label: "Resultado - Menor Mensalidade"
    sql: ${TABLE}."MENSALIDADE_MENOR" ;;
  }

  measure: renda_total {
    type: sum
    group_label: "Renda"
    label: "Total"
    sql: ${TABLE}."RENDA_TOTAL" ;;
  }

  measure: renda_min {
    type: sum
    group_label: "Renda"
    label: "Minimo"
    sql: ${TABLE}."RENDA_MIN" ;;
  }

  measure: difer_renda {
    type: sum
    group_label: "Renda"
    label: "Diferença"
    sql: ${TABLE}."DIFER_RENDA" ;;
  }

  dimension: cr2 {
    type: number
    label: "Comprometimento de Renda"
    value_format: "00.00%"
    sql: ${TABLE}."CR2" ;;
  }

  dimension: alunos_fies {
    type: string
    label: "FIES?"
    sql: ${TABLE}."ALUNOS_FIES" ;;
  }

  dimension: checagem_de_renda {
    type: string
    group_label: "Renda"
    label: "Checagem"
    sql: ${TABLE}."CHECAGEM_DE_RENDA" ;;
  }

  dimension: politica_renda {
    type: string
    group_label: "Renda"
    label: "Politica"
    sql: ${TABLE}."POLITICA_RENDA" ;;
  }

  set: detail {
    fields: [
      sl_cpf,
      sl_data,
      sl_status_destino,
      sl_status_destino_detalhe,
      instituicao,
      valor_mensal,
      produto,
      alu_contrato,
      ult_mensa,
      pro_nome,
      st_juro_zero,
      apelido,
      ies_grupo,
      renda_fia,
      renda_alu,
      valor_fia,
      valor_alu,
      multiplicador,
      mensalidade_menor,
      renda_total,
      renda_min,
      difer_renda,
      cr2,
      alunos_fies,
      checagem_de_renda,
      politica_renda
    ]
  }
}
