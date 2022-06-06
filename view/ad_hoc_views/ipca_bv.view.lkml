# The name of this view in Looker is "Ipca Bv"
view: ipca_bv {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: GRADUADO."SELF_SERVICE_BI"."IPCA_BV"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ano Concessao" in Explore.

  dimension: ano_concessao {
    type: number
    sql: ${TABLE}."ANO_CONCESSAO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: ano_vencimento {
    type: number
    sql: ${TABLE}."ANO_VENCIMENTO" ;;
  }

  dimension: cpf_aluno {
    type: number
    sql: ${TABLE}."CPF_ALUNO" ;;
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

  dimension_group: data_vencimento_boleto {
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
    sql: ${TABLE}."DATA_VENCIMENTO_BOLETO" ;;
  }

  dimension_group: fim_mes_boleto {
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
    sql: ${TABLE}."FIM_MES_BOLETO" ;;
  }

  dimension_group: fim_mes_concessao {
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
    sql: ${TABLE}."FIM_MES_CONCESSAO" ;;
  }

  dimension: id_contrato {
    type: string
    sql: ${TABLE}."ID_CONTRATO" ;;
  }

  dimension: id_boleto {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID_BOLETO" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: taxa_ipca_aplicada {
    type: number
    sql: ${TABLE}."TAXA_IPCA_APLICADA" ;;
  }

  dimension: vl_boleto {
    type: number
    sql: ${TABLE}."VL_BOLETO" ;;
  }

  measure: perc_provisao_cpf {
    label: "perc_provisao_cpf"
    description: "Percentual de provisão da faixa de atraso dos CPFs"
    type: number
    sql: ${ipca_bv_cpf.perc_provisao_medida} ;;
    hidden: yes
  }

  measure: soma_boleto {
    group_label: "Soma do boleto"
    type: sum
    sql: ${vl_boleto} ;;
    label: "Total Concessão"
    description: "Soma do valor do boleto."
  }

  measure: PDD_0_IPCA {
    group_label: "Soma do saldo em provisão"
    type: number
    sql: ${soma_boleto} * ${perc_provisao_cpf} ;;
    label: "Total provisão"
    description: "Soma do saldo em provisão da faixa em 0% IPCA."
    hidden: yes
  }

  measure: soma_boleto_cenario_a {
    group_label: "Soma do boleto"
    type: sum
    sql: ${vl_boleto_cenario_a} ;;
    label: "Total Correção FULL IPCA"
    description: "Soma do valor do boleto no cenário aplicando taxa IPCA."
  }

  measure: soma_boleto_cenario_c_5_prc {
    group_label: "Soma do boleto"
    type: sum
    sql: ${vl_boleto_cenario_c_5_prc} ;;
    label: "TETO 5%"
    description: "Soma dos valores dos boletos no cenário C 5%."
  }

  measure: soma_boleto_cenario_c_10_prc {
    group_label: "Soma do boleto"
    type: sum
    sql: ${vl_boleto_cenario_c_10_prc} ;;
    label: "TETO 10%"
    description: "Soma dos valores dos boletos no cenário C 10%."
  }

  measure: soma_boleto_cenario_c_15_prc {
    group_label: "Soma do boleto"
    type: sum
    sql: ${vl_boleto_cenario_c_15_prc} ;;
    label: "TETO 15%"
    description: "Soma dos valores dos boletos no cenário C 15%."
  }

  measure: soma_boleto_cenario_d_5_prc {
    group_label: "Soma do boleto"
    type: sum
    sql: ${vl_boleto_cenario_d_5_prc} ;;
    label: "TETO 5% D"
    description: "Soma dos valores dos boletos no cenário D 5%."
  }

  measure: soma_boleto_cenario_d_10_prc {
    group_label: "Soma do boleto"
    type: sum
    sql: ${vl_boleto_cenario_d_10_prc} ;;
    label: "TETO 10% D"
    description: "Soma dos valores dos boletos no cenário D 10%."
  }

  measure: soma_boleto_cenario_d_15_prc {
    group_label: "Soma do boleto"
    type: sum
    sql: ${vl_boleto_cenario_d_15_prc} ;;
    label: "TETO 15% D"
    description: "Soma dos valores dos boletos no cenário D 15%."
  }

  measure: count_wo {
    type: count
    label: "Contagem de WO"
    description: "Quantidade de títulos em WO"
  }

  dimension: vl_boleto_cenario_a {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_A" ;;
  }

  dimension: vl_boleto_cenario_b {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_B" ;;
  }

  dimension: vl_boleto_cenario_c_10_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_C_10_PRC" ;;
  }

  dimension: vl_boleto_cenario_c_15_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_C_15_PRC" ;;
  }

  dimension: vl_boleto_cenario_c_5_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_C_5_PRC" ;;
  }

  dimension: vl_boleto_cenario_d {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_D" ;;
  }

  dimension: vl_boleto_cenario_d_10_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_D_10_PRC" ;;
  }

  dimension: vl_boleto_cenario_d_15_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_D_15_PRC" ;;
  }

  dimension: vl_boleto_cenario_d_5_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_D_5_PRC" ;;
  }

  dimension: vl_boleto_cenario_e_10_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_E_10_PRC" ;;
  }

  dimension: vl_boleto_cenario_e_15_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_E_15_PRC" ;;
  }

  dimension: vl_boleto_cenario_e_5_prc {
    type: number
    sql: ${TABLE}."VL_BOLETO_CENARIO_E_5_PRC" ;;
  }

dimension: flg_writeoff {
  type: yesno
  sql: ${TABLE}."FLG_WRITEOFF" ;;
}

  dimension: perc_provisao {
    type: number
    sql: ${TABLE}."PERC_PROVISAO" ;;
  }

  dimension: faixa_provisao {
    type: string
    sql: ${TABLE}."FAIXA_PROVISAO" ;;
}

  dimension: aniversario {
    type: number
    sql: ${TABLE}."ANIVERSARIO" ;;
  }

  measure: perc_provisao_medida {
    type: average
    sql: ${perc_provisao} ;;

  }

  dimension: faixa {
    type: string
    sql: ${TABLE}."FAIXA" ;;
  }

  dimension: dias_atraso {
    type: number
    label: "Dias de Atraso do Boleto"
    sql: (datediff('day', current_date,${data_vencimento_boleto_raw})*-1)
     ;;
  }


  dimension: faixa_aging_vencidos {
    type: string
    case: {
      when: {
        sql: ${dias_atraso} <= 30;;
        label: "Até 30 dias"
      }
      when: {
        sql: ${dias_atraso} <= 60 ;;
        label: "De 31 a 60 dias"
      }
      when: {
        sql: ${dias_atraso} <= 90 ;;
        label: "De 61 a 90 dias"
      }
      when: {
        sql: ${dias_atraso}<= 120 ;;
        label: "De 91 a 120 dias"
      }
      when: {
        sql: ${dias_atraso} <= 150 ;;
        label: "De 121 a 150 dias"
      }
      when: {
        sql: ${dias_atraso} <= 180 ;;
        label: "De 151 a 180 dias"
      }
      when: {
        sql: ${dias_atraso} <= 360 ;;
        label: "De 181 a 360 dias"
      }
      when: {
        sql: ${dias_atraso} <= 720 ;;
        label: "De 361 a 720 dias"
      }
      when: {
        sql: ${dias_atraso} <= 1080 ;;
        label: "De 721 a 1080 dias"
      }
      else: "Acima de 1080 dias"
    }
    group_label: "Aging"
    group_item_label: "Aging List - Vencidos"
    description: "Indica a faixa de tempo detalhada dos títulos a receber em atraso, elencados em ordem cronológica de acordo com sua data de vencimento."
  }

  measure: count {
    type: count
    drill_fields: []
  }


}
