view: fato_swap {
  sql_table_name: "VETERANO"."FATO"."FATO_SWAP"
    ;;

  dimension: id_volume {
    type: number
    sql: RIGHT(${volume_inicial},4) ;;
    group_label: "Dados do Contrato"
    group_item_label: "ID Volume"
    description: ""
  }


  dimension: ativo {
    type: yesno
    sql: ${TABLE}."ATIVO" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Ativo (Sim/Não)"
    description: ""
  }

  dimension: ativo_vm {
    type: number
    sql: ${TABLE}."ATIVO_VM" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "VM"
    group_item_label: "Ativo"
    description: ""
  }

  dimension_group: entrada {
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
    sql: ${TABLE}."DATA_ENTRADA" ;;
  }

  dimension: di_futuro {
    type: number
    sql:TO_NUMBER(${TABLE}."DI_FUTURO",10,8);;
    group_label: "Dados do Contrato"
    group_item_label: "DI Futuro"
    description: ""
  }

  dimension: du_ate_vencimento {
    type: number
    sql: ${TABLE}."DU_ATE_VENCIMENTO" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Dias Uteis até o vencimento"
    description: ""
  }

  dimension: du_tx_pre_fixada {
    type: number
    sql: ${TABLE}."DU_TX_PRE_FIXADA" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Dias Úteis taxa pré-fixada"
    description: ""
  }

  dimension: duration {
    type: number
    sql: ${TABLE}."DURATION" ;;
    value_format: "0.00"
    group_label: "Dados do Contrato"
    group_item_label: "Duration"
    description: ""
  }

  dimension: duration_modificada {
    type: number
    sql: ${TABLE}."DURATION_MODIFICADA" ;;
    value_format: "0.00"
    group_label: "Dados do Contrato"
    group_item_label: "Duration Modificada"
    description: ""
  }

  dimension: fator_cdi {
    type: number
    sql: TO_NUMBER({TABLE}."FATOR_CDI",10,8) ;;
    value_format: "0.#######"
    group_label: "Dados do Contrato"
    group_item_label: "Fator CDI"
    description: ""
  }

  dimension: fator_cdi_acumulado_mes {
    type: number
    sql: TO_NUMBER(${TABLE}."FATOR_CDI_ACUMULADO_MES",10,8) ;;
    value_format: "0.#######"
    group_label: "Dados do Contrato"
    group_item_label: "DI Acumulado do Mês"
    description: ""
  }

  measure: fcx_swap {
    type: sum
    sql:
      SELECT CASE
        WHEN ${TABLE}.fim_mes_referencia =  ${TABLE}.fim_mes_vencimento
        THEN ${mtm_vp_diff}
      END ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Soma"
    group_item_label: "FCX Swap"
    description: "Soma do VP Diferencial a receber no mes de vencimento do volume"
  }

  dimension_group: fim_mes_entrada {
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
    sql: ${TABLE}."FIM_MES_ENTRADA" ;;
  }

  dimension_group: fim_mes_referencia {
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
    sql: ${TABLE}."FIM_MES_REFERENCIA" ;;
  }

  dimension_group: fim_mes_vencimento {
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
    sql: ${TABLE}."FIM_MES_VENCIMENTO" ;;
  }

  dimension: id_fundo {
    type: number
    sql: ${TABLE}."ID_FUNDO" ;;
    drill_fields: [detail*]
    group_label: "Dados do Contrato"
    group_item_label: "ID Fundo"
    description: ""
  }

  dimension: desc_fundo {
    type: string
    case: {
      when: {
        sql: ${id_fundo} = 1  ;;
        label: "Fundo I"
      }
      when: {
        sql: ${id_fundo} = 2  ;;
        label: "Fundo II"
      }
      else: "N/A"
    }
    drill_fields: [detail*]
    group_label: "Dados do Contrato"
    group_item_label: "Descrição Fundo"
    description: ""
    }

  dimension: mtm_ativo_fv {
    type: number
    sql: ${TABLE}."MTM_ATIVO_FV" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Valor Futuro"
    group_item_label: "Ativo"
    description: ""
  }

  dimension: mtm_passivo_fv {
    type: number
    sql: ${TABLE}."MTM_PASSIVO_FV" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Valor Futuro"
    group_item_label: "Passivo"
    description: ""
  }

  dimension: mtm_vf_diferencial {
    type: number
    sql: ${TABLE}."MTM_VF_DIFERENCIAL" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Valor Futuro"
    group_item_label: "FV Diferencial"
    description: ""
  }

  dimension: mtm_vp_diff {
    type: number
    sql: ${TABLE}."MTM_VP_DIFF" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "VM"
    group_item_label: "VP Diferencial a Receber"
    description: ""
  }

  dimension: orcado_ativo {
    type: number
    sql: ${TABLE}."ORCADO_ATIVO" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Orçado"
    group_item_label: "Ativo"
    description: "Indica uma previsão do ativo contábil no fechamento do mes referente"

  }

  dimension: orcado_diferencial_receber {
    type: number
    sql: ${TABLE}."ORCADO_DIFERENCIAL_RECEBER" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Orçado"
    group_item_label: "Dif a Receber"
    description: ""
  }

  dimension: orcado_passivo {
    type: number
    sql: ${TABLE}."ORCADO_PASSIVO" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Orçado"
    group_item_label: "Passivo"
    description: "Indica uma previsão do passivo contábil no fechamento do mes referente"

  }

  dimension: orcado_resultado_curva {
    type: number
    sql: ${TABLE}."ORCADO_RESULTADO_CURVA" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Orçado"
    group_item_label: "Resultado Curva"
    description: ""
  }

  dimension: orcado_resultado_mtm {
    type: number
    sql: ${TABLE}."ORCADO_RESULTADO_MTM" ;;
  }

  dimension: orcado_volatilidade {
    type: number
    sql: ${TABLE}."ORCADO_VOLATILIDADE" ;;
  }

  dimension: orcado_vp_diferencial_receber {
    type: number
    sql: ${TABLE}."ORCADO_VP_DIFERENCIAL_RECEBER" ;;

  }

  dimension: passivo_vm {
    type: number
    sql: ${TABLE}."PASSIVO_VM" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "VM"
    group_item_label: "Passivo"
    description: ""
  }

  dimension: rn {
    type: number
    sql: ${TABLE}."RN" ;;
  }

  dimension: taxa_pre {
    type: number
    sql: ${TABLE}."TAXA_PRE" ;;
    group_label: "Dados do Contrato"
    group_item_label: "Taxa Pré-Fixada"
    description: ""
  }

  dimension: valor_contabil_ativo {
    type: number
    sql: ${TABLE}."VALOR_CONTABIL_ATIVO" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Valor Contabil"
    group_item_label: "Ativo"
    description: ""
  }

  dimension: valor_contabil_diff {
    type: number
    sql: ${TABLE}."VALOR_CONTABIL_DIFF" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Valor Contabil"
    group_item_label: "Dif a Receber"
    description: ""
  }

  dimension: valor_contabil_passivo {
    type: number
    sql: ${TABLE}."VALOR_CONTABIL_PASSIVO" ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Valor Contabil"
    group_item_label: "Passivo"
    description: ""
  }

  dimension_group: vecto {
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
    sql: ${TABLE}."VECTO" ;;
  }

  dimension: volume_inicial {
    type: number
    sql: ${TABLE}."VOLUME_INICIAL" ;;
    value_format: "0"
    drill_fields: [detail*]
    group_label: "Dados do Contrato"
    group_item_label: "Volume Inicial"
    description: ""
  }

  measure: count_volume_inicial{
    type: count_distinct
    sql: ${volume_inicial} ;;
    drill_fields: [detail*]
    group_label: "Contagem"
    group_item_label: "Volume Inicial"
    description: "Contagem distinta dos contratos SWAP"
  }

  measure: soma_volume_inicial {
    type: sum_distinct
    sql_distinct_key: CONCAT(${volume_inicial},${vecto_date}) ;;
    sql: ${volume_inicial} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Soma"
    group_item_label: "Volume Inicial"
    description: "Soma Total do Volume Inicial dos contratos SWAP"

  }

  measure: soma_ativo_contabil {
    type: sum
    sql: ${valor_contabil_ativo} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Posição Contábil"
    group_item_label: "Ativo Contabil"
    description: ""
  }

  measure: soma_passivo_contabil {
    type: sum
    sql: ${valor_contabil_passivo} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Posição Contábil"
    group_item_label: "Passivo Contabil"
    description: ""
  }

  measure: soma_dif_vl_contabil {
    type: sum
    sql: ${valor_contabil_diff} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Posição Contábil"
    group_item_label: "Valor Contabil - Dif a Receber"
    description: ""
  }

  measure: soma_ativo_fv {
    type: sum
    sql: ${mtm_ativo_fv} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Soma"
    group_item_label: "Ativo FV"
    description: ""
  }

  measure: soma_fv_dif_a_receber {
    type: sum
    sql: ${mtm_vf_diferencial} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Soma"
    group_item_label: "FV - Dif a Receber"
    description: ""
  }


  measure: soma_passivo_fv {
    type: sum
    sql: ${mtm_passivo_fv} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Soma"
    group_item_label: "Passivo FV"
    description: ""
  }

  measure: soma_ativo_vm {
    type: sum
    sql: ${ativo_vm} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Soma"
    group_item_label: "Ativo VM"
    description: ""
  }

  measure: soma_passivo_vm {
    type: sum
    sql:${passivo_vm} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Soma"
    group_item_label: "Passivo VM"
    description: ""
  }


  measure: soma_vp_dif {
    type: sum
    sql: ${mtm_vp_diff}  ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Soma"
    group_item_label: "VP Diferencial a Receber"
    description: ""
  }


  measure: somaproduto_tx_pre {
    type: sum
    sql: ${taxa_pre} * ${passivo_vm} ;;
    hidden: yes
  }

  measure: somaproduto_tx_vm {
    type: sum
    sql: ${di_futuro} * ${passivo_vm};;
    hidden: no
    group_label: "Média Ponderada"
    group_item_label: "SomarProduto Taxa VM"
    description: ""
  }

  measure: somaproduto_duration {
    type: sum
    sql: TO_NUMBER((${duration} * ${passivo_vm}),10,0) ;;
    hidden: yes
  }

  measure: acum_tx_pre {
    type: number
    sql: (${somaproduto_tx_pre} / nullif(${soma_passivo_vm},0)) *100  ;;
    value_format: "0.00\%"
    group_label: "Média Ponderada"
    group_item_label: "Taxa Pré Acumulada"
    description: ""
  }


  measure: acum_tx_vm {
    type: number
    sql: TO_NUMBER(${somaproduto_tx_vm},10,8) / nullif(${soma_passivo_vm},0)  ;;
    #value_format: "0.00\%"
    group_label: "Média Ponderada"
    group_item_label: "Taxa VM Acumulada"
    description: ""
  }


  measure: acum_duration {
    type: number
    sql: ${somaproduto_duration} / nullif(${soma_passivo_vm},0) ;;
    value_format: "0.00"
    group_label: "Média Ponderada"
    group_item_label: "Duration Acumulada"
    description: ""
  }


  measure: acum_duration_mod {
    type: number
    sql: ${acum_duration} / (1 + TO_NUMBER(${acum_tx_vm},10,8))  ;;
    #value_format: "0.00"
    hidden: yes
  }


  measure: sum_vp_dif_a_receber {
    type: number
    sql: ${soma_vp_dif} - ${fcx_swap} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Orçado"
    group_item_label: "VP Diferencial a Receber"
    description: "Indica uma previsão do passivo contábil no fechamento do mes referente"
  }

  measure: sum_orcado_ativo {
    type: sum
    sql:
      CASE
        WHEN ${TABLE}.fim_mes_referencia <  ${TABLE}.fim_mes_vencimento
        THEN ${valor_contabil_ativo}
      END ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Orçado"
    group_item_label: "Ativo"
    description: "Indica uma previsão do ativo contábil no fechamento do mes referente"
  }

  measure: sum_orcado_passivo {
    type: sum
    sql:
      SELECT CASE
      WHEN ${TABLE}.fim_mes_referencia <  ${TABLE}.fim_mes_vencimento
      THEN ${valor_contabil_passivo}
      END ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Orçado"
    group_item_label: "Passivo"
    description: "Indica uma previsão do passivo contábil no fechamento do mes referente"
  }


measure: orcado_dif_a_receber_mes_ant {
  type: number
  sql:    TO_NUMBER( LAG(${orcado_vp_diferencial_receber}, 1)
      OVER(PARTITION BY ${id_fundo}, ${fim_mes_vencimento_date} ORDER BY ${fim_mes_referencia_date} ASC),10,8)
    ;;
  hidden: yes

  #value_format:  "\"R$ \"#,##0.00"
}

measure: sum_realizado_ativo {
  type: sum
  sql: ${fato_swap_realizado.valor_contabil_ativo} ;;
  value_format:  "\"R$ \"#,##0.00"
  group_label: "Realizado"
  group_item_label: "Ativo"
  description: "Indica o valor real do ativo contábil no fechamento do mes referente"
}

measure: sum_realizado_passivo {
  type: sum
  sql: ${fato_swap_realizado.valor_contabil_passivo} ;;
  value_format:  "\"R$ \"#,##0.00"
  group_label: "Realizado"
  group_item_label: "Passivo"
  description: "Indica o valor real do passivo contábil no fechamento do mes referente"
}

measure: real_dif_a_receber {
  type: number
  sql: ${sum_realizado_ativo} - ${sum_realizado_passivo} ;;
  value_format:  "\"R$ \"#,##0.00"
  group_label: "Realizado"
  group_item_label: "Dif a Receber"
  description: ""
}

  measure: sum_orcado_resultado_curva {
    type: number
    sql: ${orcado_dif_a_receber} + ${fcx_swap};;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Orçado"
    group_item_label: "Resultado Curva"
    description: ""
  }

  measure: sum_orcado_resultado_mtm {
    type: sum
    sql: ${orcado_resultado_mtm} ;;
    group_label: "Orçado"
    group_item_label: "Resultado MTM"
    description: ""
  }


  measure: orcado_dif_a_receber {
    type: number
    sql: ${sum_orcado_ativo} - ${sum_orcado_passivo} ;;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Orçado"
    group_item_label: "Dif a Receber"
    description: ""
  }



set: detail {
  fields: [
    id_fundo,
    volume_inicial,
    taxa_pre,
    acum_tx_pre,
    di_futuro,
    duration,
    duration_modificada,
    fator_cdi,
    fator_cdi_acumulado_mes,
    valor_contabil_ativo,
    valor_contabil_passivo,
    valor_contabil_diff,
    mtm_ativo_fv,
    mtm_passivo_fv,
    mtm_vf_diferencial,
    mtm_vp_diff,
    ativo_vm,
    passivo_vm,
    ativo
  ]
  }
  }
