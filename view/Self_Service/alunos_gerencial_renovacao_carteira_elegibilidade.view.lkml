view: alunos_gerencial_renovacao_carteira_elegibilidade {
  derived_table: {
    sql: select * from stage.public.base_carteira_renovacao
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_cpf {
    type: count_distinct
    label: "Quantidade de Alunos"
    sql: ${tdt_cpf} ;;
  }

  dimension: chave_primaria {
    type: string
    primary_key: yes
    sql: CONCAT(${tdt_ano_mes},${tdt_cpf},${data_carga_raw}) ;;
    hidden: yes


  }

  dimension: tdt_ano_mes {
    type: number
    label: "Carteira - Ano e mês"
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: tdt_cpf {
    type: number
    label: "CPF"
    hidden: yes
    sql: ${TABLE}."TDT_CPF" ;;
  }

  dimension: modalidade {
    type: string
    label: "Modalidade"
    sql: ${TABLE}."MODALIDADE" ;;
  }

  dimension_group: data_visao {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Referência"
    sql: ${TABLE}."DATA_VISAO" ;;
  }


  dimension_group: data_carga {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      month_name,
      quarter,
      year,
      day_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Carga"
    sql: ${TABLE}."DT_CARGA" ;;
  }

  dimension: maturidade_cpf2 {
    type: number
    label: "Maturidade CPF"
    sql: ${TABLE}."MATURIDADE_CPF2" ;;
  }

  measure: valor_presente2 {
    type: sum
    label: "Valor Presente"
    sql: ${TABLE}."VALOR_PRESENTE2" ;;
  }

  dimension: id_produto2 {
    type: string
    hidden: yes
    sql: ${TABLE}."ID_PRODUTO2" ;;
  }

  dimension: gh_bhv {
    type: string
    group_label: "Dados de Behavior"
    label: "GH"
    sql: ${TABLE}."GH_BHV" ;;
  }

  dimension: chave {
    type: number
    hidden: yes
    sql: ${TABLE}."CHAVE" ;;
  }

  dimension: id {
    type: number
   hidden: yes
    sql: ${TABLE}."ID" ;;
  }

  dimension: prp_pro_id {
    type: number
    label: "ID Produto"
    hidden: yes
    sql: ${TABLE}."PRP_PRO_ID" ;;
  }

  dimension: instituicao {
    type: number
    hidden: yes
    label: "ID Instituição"
    sql: ${TABLE}."INSTITUICAO" ;;
  }

  dimension: curso {
    type: number
    hidden: yes
    label: "Curso"
    sql: ${TABLE}."CURSO" ;;
  }

  dimension: email {
    type: string
    label: "E-mail"
    hidden: yes
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: alu_contrato {
    type: number
    group_label: "Dados de Contrato"
    label: "ID do contrato"
    sql: ${TABLE}."ALU_CONTRATO" ;;
  }

  dimension: data_concessao {
    type: date
    sql: ${TABLE}."DATA_CONCESSAO" ;;
  }

  dimension: safra_ult_cont {
    type: number
    group_label: "Dados de Contrato"
    label: "Ultimo Contrato - Safra"
    sql: ${TABLE}."SAFRA_ULT_CONT" ;;
  }

  measure: qtd_boletos_0_900 {
    type: sum
    group_label: "Boleto"
    label: "Quantidade"
    sql: ${TABLE}."QTD_BOLETOS_0_900" ;;
  }

  dimension: safra_fim_finan {
    type: number
    group_label: "Dados de Contrato"
    label: "Fim do Contrato - Safra"
    sql: ${TABLE}."SAFRA_FIM_FINAN" ;;
  }

  measure: qtd_parc_finan {
    type: sum
    group_label: "Financiamento"
    label: "Parcelas"
    description: "Indica a quantidade de parcelas financiado no contrato do aluno"
    sql: ${TABLE}."QTD_PARC_FINAN" ;;
  }

  measure: qtd_calendario_ies {
    type: sum
    group_label: "Calendário - IES"
    label: "Quantidade"
    sql: ${TABLE}."QTD_CALENDARIO_IES" ;;
  }

  dimension: blacklist {
    type: number
    group_label: "Dados de Behavior"
    label: "Blacklist?"
    sql: ${TABLE}."BLACKLIST" ;;
  }

  dimension: ies_descadastrada {
    type: number
    group_label: "Dados de Calendário"
    label: "IES Descadastrada?"
    sql: ${TABLE}."IES_DESCADASTRADA" ;;
  }

  dimension: safra_ref_calendario {
    type: number
    group_label: "Dados de Calendário"
    label: "Calendário - Safra"
    sql: ${TABLE}."SAFRA_REF_CALENDARIO" ;;
  }

  measure: qtd_calendario {
    type: sum
    group_label: "Calendário"
    label: "Quantidade"
    sql: ${TABLE}."QTD_CALENDARIO" ;;
  }

  dimension: cd_tipo_elegibilidade {
    type: number
    group_label: "Dados de Behavior"
    label: "Código - Tipo Elegibilidade"
    sql: ${TABLE}."CD_TIPO_ELEGIBILIDADE" ;;
  }

  set: detail {
    fields: [
      tdt_ano_mes,
      tdt_cpf,
      modalidade,
      maturidade_cpf2,
      valor_presente2,
      id_produto2,
      gh_bhv,
      chave,
      id,
      prp_pro_id,
      instituicao,
      curso,
      email,
      alu_contrato,
      data_concessao,
      safra_ult_cont,
      qtd_boletos_0_900,
      safra_fim_finan,
      qtd_parc_finan,
      qtd_calendario_ies,
      blacklist,
      ies_descadastrada,
      safra_ref_calendario,
      qtd_calendario,
      cd_tipo_elegibilidade
    ]
  }
}
