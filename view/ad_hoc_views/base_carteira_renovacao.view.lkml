# The name of this view in Looker is "Base Carteira Renovacao"
view: base_carteira_renovacao {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "RISCO"."BASE_CARTEIRA_RENOVACAO"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Alu Contrato" in Explore.


  measure: count_cpf {
    type: count_distinct
    label: "Quantidade de Alunos"
    sql: ${tdt_cpf} ;;
  }

  dimension: alu_contrato {
    type: number
    sql: ${TABLE}."ALU_CONTRATO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_alu_contrato {
    type: sum
    sql: ${alu_contrato} ;;
  }

  measure: average_alu_contrato {
    type: average
    sql: ${alu_contrato} ;;
  }

  dimension: blacklist {
    type: number
    sql: ${TABLE}."BLACKLIST" ;;
  }

  dimension: cd_tipo_elegibilidade {
    type: number
    sql: ${TABLE}."CD_TIPO_ELEGIBILIDADE" ;;
  }

  dimension: chave {
    type: number
    sql: ${TABLE}."CHAVE" ;;
  }

  dimension: curso {
    type: number
    sql: ${TABLE}."CURSO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_concessao {
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
    datatype: date
    sql: ${TABLE}."DATA_CONCESSAO" ;;
  }

  dimension_group: data_visao {
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
    datatype: date
    sql: ${TABLE}."DATA_VISAO" ;;
  }

  dimension_group: dt_carga {
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
    sql: ${TABLE}."DT_CARGA" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: gh_bhv {
    type: string
    sql: ${TABLE}."GH_BHV" ;;
  }

  dimension: id_produto2 {
    type: string
    sql: ${TABLE}."ID_PRODUTO2" ;;
  }

  dimension: ies_descadastrada {
    type: number
    sql: ${TABLE}."IES_DESCADASTRADA" ;;
  }

  dimension: instituicao {
    type: number
    sql: ${TABLE}."INSTITUICAO" ;;
  }

  dimension: maturidade_cpf2 {
    type: number
    sql: ${TABLE}."MATURIDADE_CPF2" ;;
  }

  dimension: modalidade {
    type: string
    sql: ${TABLE}."MODALIDADE" ;;
  }

  dimension: prp_pro_id {
    type: number
    sql: ${TABLE}."PRP_PRO_ID" ;;
  }

  dimension: qtd_boletos_0_900 {
    type: number
    sql: ${TABLE}."QTD_BOLETOS_0_900" ;;
  }

  dimension: qtd_calendario {
    type: number
    sql: ${TABLE}."QTD_CALENDARIO" ;;
  }

  dimension: qtd_calendario_ies {
    type: number
    sql: ${TABLE}."QTD_CALENDARIO_IES" ;;
  }

  dimension: qtd_parc_finan {
    type: number
    sql: ${TABLE}."QTD_PARC_FINAN" ;;
  }

  dimension: safra_fim_finan {
    type: number
    sql: ${TABLE}."SAFRA_FIM_FINAN" ;;
  }

  dimension: safra_ref_calendario {
    type: number
    sql: ${TABLE}."SAFRA_REF_CALENDARIO" ;;
  }

  dimension: safra_ult_cont {
    type: number
    sql: ${TABLE}."SAFRA_ULT_CONT" ;;
  }

  dimension: tdt_ano_mes {
    type: number
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: tdt_cpf {
    type: number
    sql: ${TABLE}."TDT_CPF" ;;
  }

  dimension: valor_presente2 {
    type: number
    sql: ${TABLE}."VALOR_PRESENTE2" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
