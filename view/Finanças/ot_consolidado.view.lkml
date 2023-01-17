view: ot_consolidado {
    # The sql_table_name parameter indicates the underlying database table
    # to be used for all fields in this view.
    sql_table_name: "POS_GRADUADO"."FINANCEIRO"."OT_CONSOLIDADO"
      ;;

    dimension: desp_pdd {
      description: "Valor de despesa PDD."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."DESP_PDD" ;;
      hidden: yes
    }

    dimension: fundo {
      description: "Fundo de investimento, sendo código 2 BV e 1,4,41 os FIDCS I, II e III respectivamente."
      type: number
      sql: ${TABLE}."FUNDO" ;;
      hidden: no
    }


    dimension: desp_pdd_liquida {
      description: "Valor de despesa PDD líquida na safra (Despesa_PDD - Recuperado_WO)."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."DESP_PDD_LIQUIDA" ;;
      hidden: yes
    }

    dimension: estoque_pdd {
      description: "Valor de estoque PDD na safra."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."ESTOQUE_PDD" ;;
      hidden: yes
    }

    dimension: pagamentos {
      description: "Valor de pagamentos recebidos na safra."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."SOMA_PAGO" ;;
      hidden: yes
    }

    dimension: vp_pagamentos {
      description: "Valor de pagamentos recebidos a valor presente."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."SOMA_VP_PAGOS" ;;
      hidden: yes
    }

    dimension: vp_originado {
      description: "Valor de originações no mês de referência."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."SOMA_VP_ORIGINADOS" ;;
      hidden: yes
    }

    dimension: accrual_juros {
      description: "Valor de receita de juros safrado."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."RECEITA_JUROS" ;;
      hidden: yes
    }

    dimension: pdd_carteira {
      description: "Valor de PDD da carteira."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."PDD_CARTEIRA" ;;
      hidden: yes
    }

    dimension: recwo {
      description: "Valor de WO recuperado."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."SOMA_RECWO" ;;
      hidden: yes
    }

    dimension_group: safra {
      description: "Safra referência de cessão do CPF."
      type: time
      datatype: date
      timeframes: [
        month,
        year
      ]
      convert_tz: no
      sql: date_from_parts(SUBSTR(TO_VARCHAR(${TABLE}."SAFRA"),1,4), SUBSTR(TO_VARCHAR(${TABLE}."SAFRA"),5,6), 1) ;;
    }

    dimension_group: tdt_ano_mes {
      description: "Data de referência dos valores."
      type: time
      datatype: date
      timeframes: [
        month,
        year
      ]
      convert_tz: no
      sql: date_from_parts(SUBSTR(TO_VARCHAR(${TABLE}."TDT_ANO_MES"),1,4), SUBSTR(TO_VARCHAR(${TABLE}."TDT_ANO_MES"),5,6), 1);;
    }

    dimension: var_estoque_pdd {
      description: "Valor de estoque PDD."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."VAR_ESTOQUE_PDD" ;;
      hidden: yes
    }

    dimension: vp_carteira {
      description: "Valor presente da carteira."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."SOMA_VP_CARTEIRA" ;;
      hidden: yes
    }

    dimension: var_carteira {
      description: "Variação do Valor presente da carteira."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."VAR_VP_CARTEIRA" ;;
      hidden: yes
    }

    dimension: vp_wo {
      description: "Valor presente em WriteOff."
      type: number
      value_format: "$ #,###.00"
      sql: ${TABLE}."SOMA_VP_WO" ;;
      hidden: yes
    }

    measure: total_desp_pdd_liquida {
      type: sum
      sql: ${desp_pdd_liquida} ;;
      value_format: "$ #,###.00"
      group_label: "PDD"
      group_item_label: "PDD Líquida."
      description: "Soma do valor de PDD Líquida (PDD - Recuperado_WO)"
    }

    measure: total_desp_pdd {
      type: sum
      sql: ${desp_pdd} ;;
      value_format: "$ #,###.00"
      group_label: "PDD"
      group_item_label: "Total Despesa de PDD."
      description: "Soma do (ΔEstoque_PDD + VP_WO)."
    }

    measure: total_estoque_pdd{
      type: sum
      sql: ${estoque_pdd} ;;
      value_format: "$ #,###.00"
      group_label: "PDD"
      group_item_label: "Total Estoque de PDD."
      description: "Soma do valor de estoque PDD."
    }

    measure: total_pagamentos {
      value_format: "$ #,###.00"
      group_label: "Pagos"
      group_item_label: "Total Pago"
      description: "Soma do valor total recebido."
      type: sum
      sql: ${pagamentos} ;;
    }

    measure: total_pdd_carteira {
      type: sum
      sql: ${pdd_carteira} ;;
      value_format_name: percent_2
      group_label: "PDD"
      group_item_label: "PDD da carteira em %."
      description: "Soma do (Estoque_PDD/VP_carteira) da carteira."
    }

    measure: total_rec_wo {
      type: sum
      sql: ${recwo} ;;
      value_format: "$ #,###.00"
      group_label: "Pagos"
      group_item_label: "WO Recuperado."
      description: "Soma do valor de WO recuperado."
    }

    measure: total_var_estoque_pdd {
      type: sum
      sql: ${var_estoque_pdd} ;;
      value_format: "$ #,###.00"
      group_label: "PDD"
      group_item_label: "ΔEstoque_PDD."
      description: "Soma da variação do estoque PDD."
    }

    measure: total_vp_carteira {
      type: sum
      sql: ${vp_carteira} ;;
      value_format: "$ #,###.00"
      group_label: "Valor presente"
      group_item_label: "VP Carteira"
      description: "Soma do valor presente da carteira."
    }

    measure: total_vp_carteira_profit_sharing {
      type: sum
      sql: CASE
              WHEN ${fundo} = 2  THEN  ${vp_carteira} * 0.5
              WHEN ${fundo} = 41 THEN  ${vp_carteira} * 0.4
         ELSE ${vp_carteira} END;;
      value_format: "$ #,###.00"
      group_label: "Valor presente"
      group_item_label: "VP Carteira Profit Sharing"
      description: "Soma do valor presente da carteira, aplicando 50% da carteira para BV, 40% para FIDC III e 100% para FIDC I e II."
    }

    measure: total_vp_wo {
      type: sum
      sql: ${vp_wo} ;;
      value_format: "$ #,###.00"
      group_label: "Valor presente"
      group_item_label: "VP em WO"
      description: "Soma do valor presente em WO."
    }

    measure: total_vp_pagamentos {
      type: sum
      sql: ${vp_pagamentos} ;;
      value_format: "$ #,###.00"
      group_label: "Valor presente"
      group_item_label: "VP Pagamentos"
      description: "Soma do valor presente de pagamentos recebidos."
    }

    measure: total_vp_originado {
      type: sum
      sql: ${vp_originado} ;;
      value_format: "$ #,###.00"
      group_label: "Valor presente"
      group_item_label: "VP Originações"
      description: "Soma do valor presente de originações."
    }

    measure: total_accrual_juros {
      type: sum
      sql: ${accrual_juros}  ;;
      value_format: "$ #,###.00"
      group_label: "Receita de Juros"
      group_item_label: "Receita de Juros"
      description: "Receita de juros calculada. (ΔVP_CARTEIRA + VP_PAGOS - VP_ORIGINADOS)"
    }

    measure: qtd_alunos {
      type: sum
      sql: ${TABLE}."QTD_ALUNOS" ;;
      description: "Quantidade de alunos compondo a carteira. *Usar somente na visão por mês, pois no ano irá somar os alunos*"
    }
  }
