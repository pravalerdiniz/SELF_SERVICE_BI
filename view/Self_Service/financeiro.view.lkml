view: financeiro {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO"
    ;;

  dimension_group: data_baixa {
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
    label: "Baixa"
    description: "Indica a data de baixa realizada"
    datatype: date
    sql: ${TABLE}."DATA_BAIXA" ;;
  }

  dimension_group: data_geracao_titulo {
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
    label: "Geração Título"
    description: "Indica a data de geração do título"
    datatype: date
    hidden: yes
    sql: ${TABLE}."DATA_GERACAO_TITULO" ;;
  }

dimension: data_trunc  {
  type: date
  sql:date_trunc('MONTH', DATA_VENCIMENTO );;
  hidden: yes
}



  dimension_group: data_compra {
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

    label: "Compra"
    description: "Indica a Data de Compra do Título"
    sql: ${TABLE}."DATA_COMPRA" ;;
  }

  dimension_group: data_despesa {
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
    label: "Despesa"
    description: "Indica a Data que a despesa pode ser cobrada"
    sql: ${TABLE}."DATA_DESPESA" ;;
  }

  dimension_group: data_entrada {
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

    label: "Entrada"
    description: "Indica a data de Entrada do Título no Sistema"
    sql: ${TABLE}."DATA_ENTRADA" ;;
  }

  dimension_group: data_pagamento {
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

    label: "Pagamento"
    description: "Indica a data que o boleto foi pago"
    sql: ${TABLE}."DATA_PAGAMENTO" ;;
  }


  dimension: dias_pagamento_vencido {
    type: number
    group_label: "Dados do Boleto"
    label: "Dias do pagamento após vencimento"
    description: "Indica a quantidade de dias do pagamento após vencimento"
    sql: datediff('day',${data_vencimento_raw}, ${data_pagamento_raw}) ;;
  }

  dimension: dias_a_vencer {
    type: number
    group_label: "Dados do Boleto"
    label: "Dias até vencimento"
    description: "Este campo é uma regra de negócio.* Indica o número de dias para pagamento até a data de vencimento do boleto. Conta apenas dias de boletos não pagos e que não estão em atraso"
    sql: CASE WHEN ${flg_boleto_pago} = FALSE AND ${flg_boleto_atrasado} = FALSE THEN
        datediff('day', current_date,${data_vencimento_raw})
        ELSE 0
        END;;
  }


  dimension: faixa_aging_a_vencer {
    type: string
    case: {
      when: {
        sql: ${dias_a_vencer} <= 30 ;;
        label: "Até 30 dias"
      }
      when: {
        sql: ${dias_a_vencer} <= 60 ;;
        label: "De 31 a 60 dias"
      }
      when: {
        sql: ${dias_a_vencer} <= 90 ;;
        label: "De 61 a 90 dias"
      }
      when: {
        sql: ${dias_a_vencer} <= 120;;
        label: "De 91 a 120 dias"
      }
      when: {
        sql: ${dias_a_vencer} <= 150;;
        label: "De 121 a 150 dias"
      }
      when: {
        sql: ${dias_a_vencer} <= 180 ;;
        label: "De 151 a 180 dias"
      }
      when: {
        sql: ${dias_a_vencer} <= 360 ;;
        label: "De 181 a 360 dias"
      }
      when: {
        sql: ${dias_a_vencer} <= 720 ;;
        label: "De 361 a 720 dias"
      }
      when: {
        sql: ${dias_a_vencer} <= 1080 ;;
        label: "De 721 a 1080 dias"
      }
      else: "Acima de 1080 dias"
    }
    group_label: "Dados do Boleto"
    group_item_label: "Aging List - A Vencer"
    description: "Indica a faixa de tempo detalhada dos títulos a vencer, elencados em ordem cronológica de acordo com sua data de vencimento."

    }


  dimension: faixa_adimple {
    type: string
    sql:
    CASE WHEN ${flg_boleto_pago} = FALSE AND ${data_vencimento_raw} >= current_date THEN
     'A Vencer' ELSE
    CASE WHEN ${flg_boleto_pago} = TRUE  THEN 'Pago'
         WHEN ${dias_atraso} <= 5 THEN 'Vencidos <= 5'
         ELSE 'Maior que 5'
              END
              END;;
    group_label: "Dados do Boleto"
    group_item_label: "Faixa de Adimplência"
    description: "Indica a faixa de adimplência do aluno"
  }

  dimension: faixa_adimple2 {
    type: string
    sql:
    CASE WHEN ${flg_boleto_pago} = TRUE THEN
    CASE WHEN ${dias_pagamento_vencido} <= -30  THEN 'A - Pago - Menos 30'
         ELSE 'B - Pago Após' END
    ELSE 'C - A pagar'
              END;;
    group_label: "Dados do Boleto"
    group_item_label: "Faixa de Adimplência 2"
    description: "Indica a faixa de adimplência do aluno"
  }

  dimension_group: data_vencimento {
    type: time
    timeframes: [
       raw,
      date,
      week,
      month_num,
      month,
      day_of_month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    label: "Vencimento"
    description: "Indica a data de vencimento do boleto"
    sql: ${TABLE}."DATA_VENCIMENTO" ;;
  }

  dimension_group: data_corte {
    type: time
    timeframes: [
      raw,
      date,
      month
    ]
    convert_tz: no
    datatype: date
    group_label: "Gestão Garantido"
    label: "Data de Corte Gestão Garantido."
    description: "Indica o mês de corte no Gestão Garantido. Se o vencimento é até dia 5 considera-se o mês de vencimento original, e se for após dia 5, considera-se o mês seguinte."
    sql: CASE WHEN ${data_vencimento_day_of_month} > 5 THEN DATEFROMPARTS(${data_vencimento_year},${data_vencimento_month_num}+1,5) ELSE DATEFROMPARTS(${data_vencimento_year},${data_vencimento_month_num},5) END ;;
    #sql: CASE WHEN ${data_vencimento_day_of_month} > 5 THEN DATEADD('month', 1, ${data_vencimento_date}) ELSE ${data_vencimento_date} END ;;
  }

  dimension: wtd_only {
    group_label: "Filtros para Análise de Períodos (Data de Vencimento)"
    label: "Week to Date"
    type: yesno
    sql:  (EXTRACT(DOW FROM ${data_vencimento_raw}) < EXTRACT(DOW FROM GETDATE())
                OR
          (EXTRACT(DOW FROM ${data_vencimento_raw}) = EXTRACT(DOW FROM GETDATE())))  ;;
    description: "Ou WTD. Use esse campo para realizar análises entre semanas diferentes usando como base o dia da semana da data corrente."
  }

  dimension: mtd_only {
    group_label: "Filtros para Análise de Períodos (Data de Vencimento)"
    label: "Month to Date"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${data_vencimento_raw}) < EXTRACT(DAY FROM GETDATE())
                OR
          (EXTRACT(DAY FROM ${data_vencimento_raw}) = EXTRACT(DAY FROM GETDATE())))  ;;
    description: "Ou MTD. Use esse campo para realizar análises entre meses diferentes usando como base o dia do mês da data corrente."
  }

  dimension: ytd_only {
    group_label: "Filtros para Análise de Períodos (Data de Vencimento)"
    label: "Year to Date"
    type: yesno
    sql:  (EXTRACT(DOY FROM ${data_vencimento_raw}) < EXTRACT(DOY FROM GETDATE())
                OR
            (EXTRACT(DOY FROM ${data_vencimento_raw}) = EXTRACT(DOY FROM GETDATE())))  ;;
    description: "Ou YTD. Use esse campo para realizar análises entre anos diferentes usando como base o dia do ano da data corrente."
  }


  measure: ultimo_vencimento {
    type: date
    group_label: "Vencimento"
    label: "Vencimento mais antigo"
    sql: MIN(${data_vencimento_raw}) ;;
    description: "Indica a data mais antiga do vencimento do boleto da proposta do aluno. MIN(DATA_VENCIMENTO)."
    convert_tz: no
  }



  measure: ultimo_vencimento_mais_recente {
    type: date
    group_label: "Vencimento"
    label: "Último Vencimento"
    sql: MAX(${data_vencimento_raw}) ;;
    description: "Indica a última data do vencimento do boleto da proposta do aluno. MAX(DATA_VENCIMENTO)."
    convert_tz: no
  }






dimension: safra_vencimento {
  type: number
  label: "Vencimento - Safra"
  value_format: "0"
  sql: CONCAT(LEFT(${data_vencimento_month},4),RIGHT(${data_vencimento_month},2)) ;;
  description: "Indica a safra de vencimento do boleto do aluno"


}


  dimension: pagamento_prazo {
    sql: CASE
        WHEN ${TABLE}."DATA_PAGAMENTO" > ${TABLE}."DATA_VENCIMENTO"  THEN 'Atrasado'
        ELSE 'No Prazo'
        END ;;
      group_label: "Dados do Boleto"
    label: "Pagou no prazo"
    description: "Indica se boleto foi pago no prazo ou em atraso"
  }

  dimension: faixa_aging_vencidos {
    type: string
    case: {
      when: {
        sql: ${dias_atraso} <= 30 ;;
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
    group_label: "Dados do Boleto"
    group_item_label: "Aging List - Vencidos"
    description: "Indica a faixa de tempo detalhada dos títulos a receber em atraso, elencados em ordem cronológica de acordo com sua data de vencimento."
  }

  dimension_group: data_writeoff {
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

    label: "WriteOff"
    description: "Indica a data de entrada do título no W.O, ou seja, é a data que o titulo completou 180 dias após a data de vencimento e ainda não foi pago."
    sql: ${TABLE}."DATA_WRITEOFF" ;;
  }

  dimension: dias_atraso {
    type: number
    group_label: "Dados do Boleto"
    label: "Número de dias de atraso"
    description: "Este campo é uma regra de negócio.* Indica o número de dias de atraso após vencimento do boleto."
    link: {
      label: "Documentação - Dias de Atraso"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/975732737/DIAS+DE+ATRASO"
    }
    sql: ${TABLE}."DIAS_ATRASO" ;;
  }



  dimension: arrasto_dias_atraso {
    type: number
    sql: ${financeiro_arrasto_atraso.arrasto}  ;;
    group_label: "Gestão Garantido"
    group_item_label: "Arrasto Dias"
    description: "Quantidade de arrasto de dias de atraso do CPF."
  }

  dimension: ipca_12m {
    type: number
    value_format_name: percent_2
    group_label: "IPCA - IBGE"
    label: "IPCA Acumulado"
    description: "% Taxa IPCA acumulado nos últimos 12 meses em relação ao mês de vencimento do boleto."
    sql: ${dim_ipca.vl_ipca} ;;
  }

  dimension: vl_ipca_acumulado {
    type: number
    label: "Correção IPCA Acumulado"
    description: "Valor de IPCA acumulado desde o boleto original."
    sql: ${TABLE}."vl_ipca_acumulado" ;;
    hidden: yes
  }

  dimension: ds_baixa {
    type: string
    group_label: "Status do Boleto"
    label: "Tipo de Baixa"
    description: "Indica o tipo de baixa do boleto.
    Ex: Quitação, Em aberto, Baixa Manual, Baixa Automática, Baixa Judicial, entre outros."
    sql: ${TABLE}."DS_BAIXA" ;;
  }

  dimension: ds_banco {
    type: string
    group_label: "Dados do Banco"
    label: "Nome do Banco"
    description: "Indica o nome do Banco responsável pela geração do boleto"
    sql: ${TABLE}."DS_BANCO" ;;
  }

  dimension: ds_fundo_investimento {
    type: string
    group_label: "Dados do Fundo de Investimento"
    label: "Nome do Fundo de Investimento"
    description: "Indica o nome do fundo de investimento"
    sql: ${TABLE}."DS_FUNDO_INVESTIMENTO" ;;
  }

  dimension: ds_tipo_boleto {
    type: string
    group_label: "Dados do Boleto"
    label: "Tipo do Boleto"
    description: "Indica o tipo de boleto gerado. Ex: Original ou Avulso"
    sql: ${TABLE}."DS_TIPO_BOLETO" ;;
  }

  dimension: ds_titulo_classificacao {
    type: string
    group_label: "Dados do Título"
    label: "Classificação do Título"
    description: "Indica qual a classificação do título gerado.
    Ex: Contrato, Antecipação de Parcelas, Boleto de Matrícula Expressa, Avulso, entre outros. "
    sql: ${TABLE}."DS_TITULO_CLASSIFICACAO" ;;
  }

  dimension: ds_titulo_status {
    type: string
    group_label: "Status do Boleto"
    label: "Nome do Status"
    description: "Indica qual é o status do título gerado.
    Ex: Ativo, Recompra, Cobrança, Erro Operacional, Cancelamento Boleto Matrícula, entre outros."
    sql: ${TABLE}."DS_TITULO_STATUS" ;;
  }

  dimension: flg_baixa_manual {
    type: yesno
    group_label: "Status do Boleto"
    label: "Baixa Manual?"
    description: "Indica se foi realizada a baixa manual do boleto"
    sql: ${TABLE}."FLG_BAIXA_MANUAL" ;;
  }

  dimension: flg_boleto_atrasado {
    type: yesno
    group_label: "Dados do Boleto"
    label: "Boleto Atrasado?"
    description: "Este campo é uma regra de negócio*. Indica se o boleto passou da data de vencimento."
    link: {
      label: "Documentação - Boleto Atrasado"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/976093197/BOLETO+ATRASADO"
    }
    sql: ${TABLE}."FLG_BOLETO_ATRASADO" ;;
  }

  dimension: flg_boleto_pago {
    type: yesno
    group_label: "Dados do Boleto"
    label: "Boleto Pago?"
    description: "Este campo é uma regra de negócio*.Indica se o boleto já foi pago pelo aluno"
    link: {
      label: "Documentação - Boleto Pago"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/971112540/BOLETO+PAGO"
    }
    sql: ${TABLE}."FLG_BOLETO_PAGO" ;;
  }

  dimension: flg_boleto_pago_em_dia {
    type: yesno
    group_label: "Gestão Garantido"
    label: "Boleto Pago em dia?"
    description: "Este campo é uma regra de negócio*.Indica se o boleto foi pago em dia. Se pago é um repasse, senão é uma compra."
    sql: ${TABLE}."FLG_PAGO_GESTAO_GARANTIDA" ;;
  }

  dimension: flg_boleto_base_gestao_garantido {
    type: yesno
    group_label: "Gestão Garantido"
    label: "Boleto consta na base Gestão Garantido?"
    description: "Este campo é uma regra de negócio*.Indica se o boleto está na base prv_gestao_garantido."
    sql: CASE WHEN ${TABLE}."VALOR_AQUISICAO_CALCULADO" IS NULL THEN FALSE ELSE TRUE END ;;
  }

  dimension: flg_writeoff {
    type: yesno
    group_label: "Dados do Título"
    label: "Entrou em WriteOff?"
    description: "Este campo é uma regra de negócio*.Indica se o título entrou no W.O. Ou seja, caso o boleto ultrapasse o prazo de 180 dias após o vencimento e ainda não foi pago ele está em Write Off."
    link: {
      label: "Documentação - Write Off"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/975732813/WRITE-OFF"
    }
    sql: ${TABLE}."FLG_WRITEOFF" ;;
  }

  dimension: id_baixa {
    type: number
    group_label: "Status do Boleto"
    label: "ID Baixa"
    description: "Indica o código de identificação da baixa do boleto."
    sql: ${TABLE}."ID_BAIXA" ;;
    value_format: "#"
  }



  dimension: id_banco {
    type: number
    group_label: "Dados do Banco"
    label: "ID do Banco"
    description: "Indica o ID do Banco responsável pela geração do boleto"
    sql: ${TABLE}."ID_BANCO" ;;
    value_format: "#"
  }

  dimension: id_boleto {
    type: string
    group_label: "Dados do Boleto"
    label: "ID do Boleto"
    description: "Indica o código de identificação do boleto. O número do Cedente (cednum)."
    sql: ${TABLE}."ID_BOLETO" ;;
    value_format: "#"
  }

  dimension: id_contrato {
    type: string
    group_label: "Dados do Aluno"
    label: "ID do Contrato"
    description: "Indica o número do contrato do aluno com PRAVALER"
    sql: ${TABLE}."ID_CONTRATO" ;;

  }

  measure: array_contrato {
    type: list
    group_label: "Dados do Aluno"
    label: "Lista de Contratos"
    description: "Exibe todos os contratos do aluno segundo os filtros selecionados"
#sql:  listagg(${TABLE}."ID_CONTRATO",',')  ;;
    list_field: id_contrato
    }

  dimension: id_cpf {
    type: number
    group_label: "Dados do Aluno"
    label: "ID CPF"
    description: "Indica o código de referência do CPF do Aluno"
    sql: ${TABLE}."ID_CPF" ;;
    value_format: "#"
  }

  dimension: id_extrato_titulo_info {
    type: string
    group_label: "Dados do Aluno"
    label: "Extrato titulo"
    hidden: yes
    description: "Indica os IDs correspondentes de extratos de titulos de alunos do produto GESTÃO"
    sql: ${TABLE}."ID_EXTRATO_TITULO_INFO" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    group_label: "Dados do Fundo de Investimento"
    label: "ID do Fundo de Investimento"
    description: "Indica a identificação do fundo de investimento"
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
    value_format: "#"
  }

  dimension: id_log_titulo_info {
    type: string
    group_label: "Dados do Título"
    hidden: yes
    label: "ID Titulo Info - Log"
    description: "Indica o ID correspondente a URL da geração do título"
    sql: ${TABLE}."ID_LOG_TITULO_INFO" ;;
  }

  dimension: id_nossonum {
    type: number
    group_label: "Dados do Boleto"
    label: "Nossonum"
    description: "Indica o código de controle que permite o PRAVALER e ao Aluno identificar os dados da cobrança que deu origem ao Boleto de Pagamento"
    sql: ${TABLE}."ID_NOSSONUM" ;;
    value_format: "#"
  }

  dimension: id_seunum {
    type: number
    group_label: "Dados do Boleto"
    label: "Seunum"
    description: "Indica o código único do boleto."
    sql: ${TABLE}."ID_SEUNUM" ;;
    value_format: "#"
  }

  dimension: id_titulo {
    type: number
    group_label: "Dados do Título"
    label: "ID Titulo"
    description: "Indica o ID único do título."
    sql: ${TABLE}."ID_TITULO" ;;
    primary_key: yes
    value_format: "#"
  }

  dimension: id_titulo_classificacao {
    type: number
    group_label: "Dados do Título"
    label: "ID Classificação do Título "
    description: "Indica o ID correspondente a classificação do título gerado."
    sql: ${TABLE}."ID_TITULO_CLASSIFICACAO" ;;
    value_format: "#"
  }

  dimension: id_titulo_status {
    type: number
    group_label: "Status do Boleto"
    label: "ID do Status"
    description: "Indica o ID correspondente ao status do título gerado."
    sql: ${TABLE}."ID_TITULO_STATUS" ;;
    value_format: "#"
  }

  dimension: num_parcela {
    type: number
    group_label: "Dados do Aluno"
    label: "Número da Parcela"
    description: "Indica o número da parcela do contrato que o boleto está."
    sql: ${TABLE}."NUM_PARCELA" ;;
  }

  dimension: perc_ipca {
    type: number
    group_label: "Dados do Boleto"
    label: "Percentual de IPCA"
    value_format: "0.00%"
    description: "Indica o valor em percentual da taxa de IPCA do boleto. IPCA aplicado sobre os boletos. A sigla IPCA corresponde ao Índice Nacional de Preços ao Consumidor Amplo. A diferença entre eles está no uso do termo “amplo”. O IPCA engloba uma parcela maior da população. Ele aponta a variação do custo de vida médio de famílias com renda mensal de 1 e 40 salários mínimos."
    sql: ${TABLE}."PERC_IPCA" ;;
  }



  dimension: vl_aquisicao {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,###"
    label: "Valor de Aquisição"
    description: "Indica o valor de aquisiçao do título"
    hidden: yes
    sql: ${TABLE}."VL_AQUISICAO" ;;
  }

  dimension: vl_aquisicao_gestao {
    type: number
    group_label: "Gestão Garantido"
    value_format: "$ #,###.00"
    label: "Valor de Aquisição (Gestão Garantido)"
    description: "Indica o valor de aquisiçao do título, no âmbito do produto Gestão Garantido"
    hidden: yes
    sql: ${TABLE}."VALOR_AQUISICAO_CALCULADO" ;;
  }

  dimension: vl_lucro_gestao {
    type: number
    group_label: "Gestão Garantido"
    value_format: "$ #,###.00"
    label: "Valor de Aquisição (Gestão Garantido)"
    description: "Indica o valor de aquisiçao do título, no âmbito do produto Gestão Garantido"
    hidden: yes
    sql: ${TABLE}."LUCRO_AQUISICAO" ;;
  }

  dimension: vl_boleto {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor de Boleto"
    description: "Indica o valor do boleto"
    sql: ${TABLE}."VL_BOLETO" ;;
  }

  dimension: vl_total {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor Total"
    description: "Indica o valor total do boleto. Considerando: Valor de Boleto + Juros + Multa + Despesa de Cobrança"
    sql: CASE WHEN ${dias_atraso} <= 0 THEN ${vl_boleto}
          WHEN ${dias_atraso} > 0 AND ${dias_atraso} < 11 THEN (${dias_atraso} * ${vl_juros}) + ${vl_boleto} +  ${vl_multa}
          WHEN ${dias_atraso} > 10 THEN (${dias_atraso} * ${vl_juros}) + ${vl_boleto} + ${vl_multa} + ${vl_despesa}
          ELSE 0 END;;
  }

  dimension: ativo_boleto {
    type: number
    group_label: "Gestão de Portifólio (Dados do Boleto)"
    label: "Ativo do Boleto"
    description: "Indica qual o ativo do boleto"
    sql: CASE WHEN ${id_fundo_investimento} = 6 THEN ${id_titulo_status} = 2
      ELSE ${id_titulo_status} IN (2,4,14) END;;
      hidden: yes
  }

  dimension: vl_despesa {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,##0.00"
    label: "Valor de Despesa"
    description: "Indica o valor de cobrança de despesa do título."
    hidden: yes
    sql: ${TABLE}."VL_DESPESA" ;;
  }

  dimension: vl_ipca {
    type: number
    group_label: "Dados do Título"
    value_format: "$ #,##0.00"
    label: "Valor do IPCA"
    description: "Indica o valor do IPCA sobre o título."
    hidden: yes
    sql: ${TABLE}."VL_IPCA" ;;
  }

  dimension: vl_juros {
    type: number
    group_label: "Dados do Boleto"
    label: "Valor de Juros"
    description: "Indica o valor de juros aplicado sobre o boleto"
    hidden: yes
    sql: ${TABLE}."VL_JUROS" ;;
  }

  dimension: vl_multa {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor da Multa"
    description: "Indica o valor da multa aplicada sobre o boleto"
    hidden: yes
    sql: ${TABLE}."VL_MULTA" ;;
  }

  dimension: vl_pago {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor do Pagamento"
    hidden: yes
    description: "Indica o valor de pagamento do boleto gerado"
    sql: ${TABLE}."VL_PAGO" ;;
  }

  dimension: vl_pago_credito {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor do Pagamento - Crédito"
    hidden: yes
    description: "Indica o valor de pagamento por crédito do boleto gerado"
    sql: ${TABLE}."VL_PAGO_CREDITO" ;;
  }

  dimension: vl_pago_debito {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor do Pagamento - Débito"
    hidden: yes
    description: "Indica o valor de pagamento por débito do boleto gerado"
    sql: ${TABLE}."VL_PAGO_DEBITO" ;;
  }

  dimension: vl_seguro {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor do Seguro"
    hidden: yes
    description: "Indica o valor do seguro do boleto gerado"
    sql: ${TABLE}."VL_SEGURO" ;;
  }

  dimension: vl_taxa {
    type: number
    group_label: "Dados do Boleto"
    value_format: "$ #,##0.00"
    label: "Valor da Taxa Bancária"
    hidden: yes
    description: "Indica o valor da taxa bancária"
    sql: ${TABLE}."VL_TAXA" ;;
  }







  dimension: flg_titulo_diferenca {
    type: yesno
    group_label: "Dados do Boleto"
    label: "Boleto de Diferença?"
    description: "Esta campo é uma regra de negócio.* Indica se o boleto é um titulo de diferença. Diferença: Valores de diferença a serem repassados do título que
foi gerado por um pagamento menor do boleto anterior."
    link: {
      label: "Documentação - Titulo Diferença"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/976060487/T+TULO+DIFEREN+A"
    }
    sql: ${TABLE}."FLG_TITULO_DIFERENCA" ;;
  }


  dimension: cpf_aluno {
    sql: ${proposta.cpf_aluno};;
    hidden: yes

  }

  dimension: aluno_email {
    sql: ${proposta.aluno_email};;
    hidden: yes

  }


  dimension: aluno_celular {
    sql: ${proposta.aluno_celular};;
    hidden: yes

  }


  dimension: grupo_instituicao {
    sql: ${proposta.grupo_instituicao};;
    hidden: yes

  }


  dimension: ds_instituicao {
    sql: ${proposta.ds_instituicao};;
    hidden: yes

  }



  dimension: ds_campus {
    sql: ${proposta.ds_campus};;
    hidden: yes

  }





  dimension: nm_modalidade_produto{
    sql: ${proposta.nm_modalidade_produto};;
    hidden: yes

  }


  dimension: nm_produto{
    sql: ${proposta.nm_produto};;
    hidden: yes

  }

  dimension: ds_curso{
    sql: ${proposta.ds_curso};;
    hidden: yes

  }

  dimension: aluno_nome {
    sql: ${proposta.aluno_nome};;
    hidden: yes

  }

  dimension: linha_digitavel {
    type: string
    group_label: "Dados do Boleto"
    label: "Linha Digitavel"
    description: "Indica o código de barras (linha digitavel) do boleto."
    sql: ${TABLE}."LINHA_DIGITAVEL" ;;
  }






  measure: count_titulo {
    type: count
    value_format: "0"
    group_item_label: "Quantidade de titulos"
    drill_fields: [

      id_titulo,
      id_nossonum,
      cpf_aluno,
      aluno_nome,
      id_contrato,
      aluno_email,
      aluno_celular,
      ds_curso,
      grupo_instituicao,
      ds_instituicao,
      ds_campus,
      nm_modalidade_produto,
      nm_produto,
      dias_atraso,
      vl_boleto,
      data_pagamento_date,
      data_vencimento_date,
      ]
  }


  measure: count_alunos {
    type: count_distinct
    sql: ${id_cpf} ;;
    value_format: "0"
    group_label: "Quantidade de Alunos"
    group_item_label: "Valor"
    description: "Contagem de ID_CPFs únicos"
    drill_fields: [
      id_titulo,
      id_nossonum,
      cpf_aluno,
      aluno_nome,
      id_contrato,
      aluno_email,
      aluno_celular,
      ds_curso,
      grupo_instituicao,
      ds_instituicao,
      ds_campus,
      nm_modalidade_produto,
      nm_produto,
      id_titulo,
      dias_atraso,
      vl_boleto,
      data_pagamento_date,
      data_vencimento_date,


      ]
  }

  measure: perc_alunos {
    type: percent_of_total
    sql: ${count_alunos} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Porcentagem"
    description: "Porcentagem da quantidade de alunos."


  }

  measure: count_atraso {
    type: count
    value_format: "0"
    group_label: "Atraso"
    group_item_label: "Quantidade de Boletos em Atraso"
    description: "Indica a quantidade total de boletos em atraso"
    filters: [flg_boleto_atrasado: "Yes"]
    drill_fields: [id_cpf, id_contrato, data_vencimento_date,data_pagamento_date]
  }



  measure: avg_dias_atraso {
    type: average
    sql: ${dias_atraso} ;;
    value_format: "0"
    group_label: "Atraso"
    group_item_label: "Dias - Média"
    description: "Média de dias de atraso de pagamento do boleto"
    drill_fields: [id_cpf, id_contrato, data_vencimento_date,data_pagamento_date]
  }

  measure: sum_dias_atraso {
    type: sum
    sql: ${dias_atraso} ;;
    value_format: "0"
    group_label: "Atraso"
    group_item_label: "Dias - Soma"
    description: "Soma de dias de atraso de pagamento do boleto"
    drill_fields: [id_cpf, id_contrato, data_vencimento_date,data_pagamento_date]
  }

  measure: max_dias_atraso {
    type: max
    sql: ${dias_atraso} ;;
    value_format: "0"
    group_label: "Atraso"
    group_item_label: "Dias - Máximo"
    description: "Valor máximo de dias de atraso do pagamento do boleto"
    drill_fields: [id_cpf, id_contrato, data_vencimento_date,data_pagamento_date]
  }


  measure: avg_aquisicao {
    type: average
    sql: ${vl_aquisicao} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Aquisição"
    group_item_label: "Média"
    description: "Valor médio de aquisição do titulo"
  }

  measure: sum_aquisicao {
    type: sum
    sql: ${vl_aquisicao} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Aquisição"
    group_item_label: "Soma"
    description: "Soma do valor de aquisição do titulo"
  }

  measure: sum_aquisicao_gestao {
    type: sum
    sql: CASE WHEN ${flg_boleto_base_gestao_garantido} = TRUE THEN ${vl_aquisicao_gestao} ELSE 0 END;;
    group_label: "Gestão Garantido"
    value_format: "$ #,###.00"
    group_item_label: "Soma do Valor de Aquisição (Gestão Garantido)"
    description: "Indica a soma do valor de aquisiçao, no âmbito do produto Gestão Garantido"

  }


  measure: sum_lucro_aquisicao_gestao {
    type: sum
    sql: ${vl_lucro_gestao} ;;
    group_label: "Gestão Garantido"
    value_format: "$ #,###.00"
    group_item_label: "Soma do Lucro na Aquisição (Gestão Garantido)"
    description: "Esta medida é uma regra de negócio. * Indica a soma do possível lucro da aquisiçao, no âmbito do produto Gestão Garantido"

  }

  measure: sum_PDD {
    type: sum
    sql: CASE
      WHEN ${flg_writeoff} AND ${flg_boleto_pago} = FALSE THEN ${vl_boleto}
      WHEN DATEDIFF(DAY,${data_vencimento_date},GETDATE()) BETWEEN 1 AND 14 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.077
      WHEN DATEDIFF(DAY,${data_vencimento_date},GETDATE()) BETWEEN 15 AND 30 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.174
      WHEN DATEDIFF(DAY,${data_vencimento_date},GETDATE()) BETWEEN 31 AND 60 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.44
      WHEN DATEDIFF(DAY,${data_vencimento_date},GETDATE()) BETWEEN 61 AND 90 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.60
      WHEN DATEDIFF(DAY,${data_vencimento_date},GETDATE()) BETWEEN 91 AND 120 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.75
      WHEN DATEDIFF(DAY,${data_vencimento_date},GETDATE()) BETWEEN 121 AND 150 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.84
      WHEN DATEDIFF(DAY,${data_vencimento_date},GETDATE()) BETWEEN 151 AND 180 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.89
      WHEN DATEDIFF(DAY,${data_vencimento_date},GETDATE()) BETWEEN 181 AND 360 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}
      ELSE 0 END
      /*
       CASE
      WHEN ${flg_writeoff} AND ${flg_boleto_pago} = FALSE THEN ${vl_boleto}
      WHEN DATEDIFF(DAY,${data_vencimento_date},last_day(${data_corte_raw})) BETWEEN 1 AND 14 AND ${id_titulo_status} = 2  AND (${data_pagamento_date} > ${data_vencimento_date} OR ${data_pagamento_date} IS NULL)  THEN ${vl_boleto}* 0.077
      WHEN DATEDIFF(DAY,${data_vencimento_date},last_day(${data_corte_raw})) BETWEEN 15 AND 30 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.174
      WHEN DATEDIFF(DAY,${data_vencimento_date},last_day(${data_corte_raw})) BETWEEN 31 AND 60 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.44
      WHEN DATEDIFF(DAY,${data_vencimento_date},last_day(${data_corte_raw})) BETWEEN 61 AND 90 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.60
      WHEN DATEDIFF(DAY,${data_vencimento_date},last_day(${data_corte_raw})) BETWEEN 91 AND 120 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.75
      WHEN DATEDIFF(DAY,${data_vencimento_date},last_day(${data_corte_raw})) BETWEEN 121 AND 150 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.84
      WHEN DATEDIFF(DAY,${data_vencimento_date},last_day(${data_corte_raw})) BETWEEN 151 AND 180 AND ((${id_titulo_status} = 2  AND ${flg_boleto_pago} = FALSE) OR (${data_pagamento_date} > ${data_vencimento_date}) ) AND ${flg_boleto_base_gestao_garantido} = TRUE and ${flg_boleto_pago_em_dia} = FALSE THEN ${vl_boleto}* 0.89
      ELSE 0
      END*/
      ;;
    group_label: "Gestão Garantido"
    value_format: "$ #,###.00"
    group_item_label: "Soma do Valor de PDD (Gestão Garantido)"
    description: "Indica a soma do valor de PDD, no âmbito do produto Gestão Garantido"

  }


  measure: min_aquisicao {
    type: min
    sql: ${vl_aquisicao} ;;
    value_format: "$ #,###"
    group_label: "Valor de Aquisição"
    group_item_label: "Mínimo"
    description: "Valor minimo de aquisição do titulo"
  }


  measure: max_aquisicao {
    type: max
    sql: ${vl_aquisicao} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Aquisição"
    group_item_label: "Máximo"
    description: "Valor máximo de aquisição do titulo"
  }


  measure: avg_boleto {
    type: average
    sql: ${vl_boleto} ;;
    value_format: "$ #,###.00"
    group_label: "Valor do Boleto"
    group_item_label: "Média"
    description: "Valor médio do boleto."
  }

  measure: sum_boleto {
    type: sum
    sql: ${vl_boleto} ;;
    value_format: "$ #,###.00"
    group_label: "Valor do Boleto"
    group_item_label: "Soma"
    description: "Soma do valor do boleto."
    drill_fields: [
      cpf_aluno, aluno_nome,id_contrato,
      aluno_email,
      aluno_celular,
      ds_curso,
      grupo_instituicao,
      ds_instituicao,
      ds_campus,
      nm_modalidade_produto,
      nm_produto,
      id_boleto,
      dias_atraso,
      vl_boleto,
      data_pagamento_date,
      data_vencimento_date,


      ]
  }


  measure: min_boleto {
    type: min
    sql: ${vl_boleto} ;;
    value_format: "$ #,###.00"
    group_label: "Valor do Boleto"
    group_item_label: "Mínimo"
    description: "Valor minimo do boleto"
  }


  measure: max_boleto {
    type: max
    sql: ${vl_boleto} ;;
    value_format: "$ #,###.00"
    group_label: "Valor do Boleto"
    group_item_label: "Máximo"
    description: "Valor máximo de aquisição do titulo"
  }

  measure: vl_total__boleto {
    type: sum
    sql: ${vl_total} ;;
    value_format: "$ #,###.00"
    group_label: "Valor do Boleto"
    group_item_label: "Total"
    description: "Soma do valor total do boleto considerando: Valor de Boleto + Juros + Multa + Despesa de Cobrança "
  }


  measure: avg_despesa {
    type: average
    sql: ${vl_despesa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Despesa"
    group_item_label: "Média"
    description: "Valor médio de cobrança da despesa"
  }

  measure: sum_despesa {
    type: sum
    sql: ${vl_despesa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Despesa"
    group_item_label: "Soma"
    description: "Soma do valor de cobrança da despesa."
  }


  measure: min_despesa {
    type: min
    sql: ${vl_despesa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Despesa"
    group_item_label: "Mínimo"
    description: "Valor minimo de cobrança da despesa"
  }


  measure: max_despesa {
    type: max
    sql: ${vl_despesa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Despesa"
    group_item_label: "Máximo"
    description: "Valor máximo de cobrança da despesa"
  }

  measure: avg_juros {
    type: average
    sql: ${vl_juros} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Juros"
    group_item_label: "Média"
    description: "Valor médio de juros aplicado"
  }

  measure: sum_juros {
    type: sum
    sql: ${vl_juros} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Juros"
    group_item_label: "Soma"
    description: "Soma do valor de juros aplicado"
  }


  measure: min_juros {
    type: min
    sql: ${vl_juros} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Juros"
    group_item_label: "Mínimo"
    description: "Valor minimo de juros aplicado"
  }


  measure: max_juros {
    type: max
    sql: ${vl_juros} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Juros"
    group_item_label: "Máximo"
    description: "Valor máximo de juros aplicado"
  }


  measure: avg_multa {
    type: average
    sql: ${vl_multa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Multa"
    group_item_label: "Média"
    description: "Valor médio de multa aplicada"
  }

  measure: sum_multa {
    type: sum
    sql: ${vl_multa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Multa"
    group_item_label: "Soma"
    description: "Soma do valor da multa aplicada"
  }


  measure: min_multa {
    type: min
    sql: ${vl_multa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Multa"
    group_item_label: "Mínimo"
    description: "Valor minimo da multa aplicada"
  }


  measure: max_multa {
    type: max
    sql: ${vl_multa} ;;
    value_format: "$ #,###.00"
    group_label: "Valor de Multa"
    group_item_label: "Máximo"
    description: "Valor máximo de multa aplicada"
  }



  measure: avg_pago {
    type: average
    sql: ${vl_pago} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago"
    group_item_label: "Média"
    description: "Valor médio dos boletos pagos"
  }

  measure: sum_pago {
    type: sum
    sql: ${vl_pago} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago"
    group_item_label: "Soma"
    description: "Soma do valor de boletos pagos"
  }

  measure: sum_pago_compra {
    type: sum
    sql: CASE WHEN ${flg_boleto_pago_em_dia} = FALSE AND ${flg_boleto_base_gestao_garantido} = TRUE  THEN ${vl_pago} ELSE 0 END;;
    value_format: "$ #,###.00"
    group_label: "Gestão Garantido"
    group_item_label: "Soma valor pago (compra)"
    description: "Soma do valor pago (compra)"
  }

  measure: sum_pago_repasse {
    type: sum
    sql: CASE WHEN ${flg_boleto_pago_em_dia} = TRUE AND ${flg_boleto_base_gestao_garantido} = TRUE THEN ${vl_pago} ELSE 0 END;;
    value_format: "$ #,###.00"
    group_label: "Gestão Garantido"
    group_item_label: "Soma valor pago (repasse)"
    description: "Soma do valor pago (repasse)"
  }

  measure: sum_boleto_pago_compra {
    type: sum
    sql: CASE WHEN ${flg_boleto_pago_em_dia} = FALSE AND ${flg_boleto_pago} = TRUE THEN ${vl_boleto} ELSE 0 END;;
    value_format: "$ #,###.00"
    group_label: "Gestão Garantido"
    group_item_label: "Soma pago (compra)"
    description: "Soma do valor de boletos pagos (compra)"
  }

  measure: sum_boleto_pago_repasse {
    type: sum
    sql: CASE WHEN ${flg_boleto_pago_em_dia} = TRUE THEN ${vl_boleto} ELSE 0 END;;
    value_format: "$ #,###.00"
    group_label: "Gestão Garantido"
    group_item_label: "Soma pago (repasse)"
    description: "Soma do valor de boletos pagos (repasse)"
  }

  measure: sum_carteira_operacionalizada {
    type: sum
    sql: CASE
        WHEN DATE(GETDATE()) > ${data_corte_date} and ${data_corte_date} = TRUE  AND  ${id_titulo_status} IN (2,4) THEN ${vl_boleto}
        WHEN DATE(GETDATE()) = (${data_corte_date}) and ${data_corte_date} = FALSE  AND  ${id_titulo_status} = (2) THEN ${vl_boleto}
    ELSE 0 END;;
    value_format: "$ #,###.00"
    group_label: "Gestão Garantido"
    group_item_label: "Soma carteira operacionalizada"
    description: "Soma do valor dos boletos ativos e dos boletos cancelados."
  }


  measure: min_pago {
    type: min
    sql: ${vl_pago} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago"
    group_item_label: "Mínimo"
    description: "Valor minimo de boletos pagos"
  }


  measure: max_pago {
    type: max
    sql: ${vl_pago} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago"
    group_item_label: "Máximo"
    description: "Valor máximo de boletos pagos"
  }

  measure: avg_pago_credito {
    type: average
    sql: ${vl_pago_credito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Média"
    description: "Valor médio de pagamentos por crédito "
  }

  measure: sum_pago_credito {
    type: sum
    sql: ${vl_pago_credito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Soma"
    description: "Soma do valor de pagamentos por crédito"
  }


  measure: min_pago_credito {
    type: min
    sql: ${vl_pago_credito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Mínimo"
    description: "Valor minimo de pagamento por crédito"
  }


  measure: max_pago_credito {
    type: max
    sql: ${vl_pago_credito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Crédito"
    group_item_label: "Máximo"
    description: "Valor máximo de pagamento por crédito"
  }


  measure: avg_pago_debito {
    type: average
    sql: ${vl_pago_debito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Débito"
    group_item_label: "Média"
    description: "Valor médio de pagamentos por débito "
  }

  measure: sum_pago_debito {
    type: sum
    sql: ${vl_pago_debito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Débito"
    group_item_label: "Soma"
    description: "Soma do valor de pagamentos por débito"
  }


  measure: min_pago_debito {
    type: min
    sql: ${vl_pago_debito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Débito"
    group_item_label: "Mínimo"
    description: "Valor minimo de pagamento por débito"
  }


  measure: max_pago_debito {
    type: max
    sql:  ${vl_pago_debito} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Pago - Débito"
    group_item_label: "Máximo"
    description: "Valor máximo de pagamento por débito"
  }

  measure: avg_vl_seguro {
    type: average
    sql: ${vl_seguro} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Seguro"
    group_item_label: "Médio"
    description: "Valor médio do pagamento do seguro"
  }

  measure: sum_vl_seguro {
    type: sum
    sql: ${vl_seguro} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Seguro"
    group_item_label: "Soma"
    description: "Valor da soma de pagamento do seguro"
  }


  measure: min_vl_seguro {
    type: min
    sql: ${vl_seguro} ;;
    value_format: "$ #,###.00"
    group_label: "Valor Seguro"
    group_item_label: "Mínimo"
    description: "Valor minimo de pagamento do seguro"
  }


  measure: max_vl_seguro {
    type: max
    sql: ${vl_seguro} ;;
    value_format: "$ #,###"
    group_label: "Valor Seguro"
    group_item_label: "Máximo"
    description: "Valor máximo de pagamento do seguro"
  }


  measure: avg_tx_bancaria {
    type: average
    sql: ${vl_taxa} ;;
    value_format: "$ #,###"
    group_label: "Taxa Bancária"
    group_item_label: "Médio"
    description: "Valor médio da taxa bancária"
  }

  measure: sum_tx_bancaria {
    type: sum
    sql: ${vl_taxa} ;;
    value_format: "$ #,###"
    group_label: "Taxa Bancária"
    group_item_label: "Soma"
    description: "Valor da soma de taxa bancária"
  }


  measure: min_tx_bancaria {
    type: min
    sql: ${vl_taxa}  ;;
    value_format: "$ #,###"
    group_label: "Taxa Bancária"
    group_item_label: "Mínimo"
    description: "Valor minimo da taxa bancária"
  }


  measure: max_tx_bancaria {
    type: max
    sql: ${vl_taxa}  ;;
    value_format: "$ #,###"
    group_label: "Taxa Bancária"
    group_item_label: "Máximo"
    description: "Valor máximo da taxa bancária"
  }


  measure: avg_vl_ipca {
    type: average
    sql: ${vl_ipca} ;;
    value_format: "$ #,###.00"
    group_label: "IPCA"
    group_item_label: "Médio"
    description: "Valor médio de IPCA aplicado sobre os boletos. A sigla IPCA corresponde ao Índice Nacional de Preços ao Consumidor Amplo. A diferença entre eles está no uso do termo “amplo”. O IPCA engloba uma parcela maior da população. Ele aponta a variação do custo de vida médio de famílias com renda mensal de 1 e 40 salários mínimos."
  }

  measure: sum_vl_ipca {
    type: sum
    sql: ${vl_ipca} ;;
    value_format: "$ #,###.00"
    group_label: "IPCA"
    group_item_label: "Soma"
    description: "Valor da soma de IPCA aplicado sobre os boletos. A sigla IPCA corresponde ao Índice Nacional de Preços ao Consumidor Amplo. A diferença entre eles está no uso do termo “amplo”. O IPCA engloba uma parcela maior da população. Ele aponta a variação do custo de vida médio de famílias com renda mensal de 1 e 40 salários mínimos."
  }


  measure: min_vl_ipca {
    type: min
    sql: ${vl_ipca}  ;;
    value_format: "$ #,###.00"
    group_label: "IPCA"
    group_item_label: "Mínimo"
    description: "Valor minimo da IPCA aplicado sobre os boletos. A sigla IPCA corresponde ao Índice Nacional de Preços ao Consumidor Amplo. A diferença entre eles está no uso do termo “amplo”. O IPCA engloba uma parcela maior da população. Ele aponta a variação do custo de vida médio de famílias com renda mensal de 1 e 40 salários mínimos."
  }


  measure: max_vl_ipca {
    type: max
    sql: ${vl_ipca}  ;;
    value_format: "$ #,###.00"
    group_label: "IPCA"
    group_item_label: "Máximo"
    description: "Valor máximo da IPCA aplicado sobre os boletos. A sigla IPCA corresponde ao Índice Nacional de Preços ao Consumidor Amplo. A diferença entre eles está no uso do termo “amplo”. O IPCA engloba uma parcela maior da população. Ele aponta a variação do custo de vida médio de famílias com renda mensal de 1 e 40 salários mínimos."
  }

 measure: total_vl_ipca_acum {
    type: sum
    sql: ${vl_ipca_acumulado}  ;;
    value_format: "$ #,###.00"
    group_label: "IPCA"
    group_item_label: "Valor acumulado"
    description: "Valor acumulado de IPCA aplicado sobre os boletos originais (valor de face na cessão)."
  }


  measure: vl_atraso {
    type: sum
    sql: ${vl_total};;
    value_format: "$ #,###.00"
    group_label: "Valor em Atraso"
    filters: [flg_boleto_atrasado: "yes"]
    group_item_label: "Soma"
    description: "Soma do valor total em atraso. O valor considerado para este cálculo é o 'Valor Total' do boleto"
  }


  measure: count_pagos {
    type: count_distinct
    sql: ${id_cpf} ;;
    value_format: "0"
    group_label: "Pagos"
    group_item_label: "Valor"
    description: "Quantidade de CPF por boleto pago"
    filters: [flg_boleto_pago: "Yes"]
    drill_fields: [
      cpf_aluno, aluno_nome,id_contrato,
      aluno_email,
      aluno_celular,
      ds_curso,
      grupo_instituicao,
      ds_instituicao,
      ds_campus,
      nm_modalidade_produto,
      nm_produto,
      id_boleto,
      dias_atraso,
      vl_boleto,
      data_pagamento_date,
      data_vencimento_date,


    ]
  }



# Esse campo não existe na tabela Financeiro
  dimension_group: data_transferencia {
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
    hidden: yes
    label: "Data de Transferência"
    description: "Indica a Data de Transferência do Valor"
    sql: ${TABLE}."DATA_TRANSFERENCIA" ;;
  }

  dimension_group: data_avaliacao_collection {
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
    label: "Data Avaliacao Collection"
    description: "Indica a Data de Avaliação do GH - Collection."
    sql: ${TABLE}."DATA_AVALIACAO_COLLECTION" ;;
  }





  dimension: gh_collection_boleto{
    type: string
    group_label: "Collection"
    label: "GH do Collection Boleto"
    description: "Este campo é uma regra de negócio*. Indica o Grupo Homogêneo do comportamento de pagamento do aluno inadimplente por boleto.A classificação dos GHs estão da seguinte forma: A - B - C - D "
    link: {
      label: "Documentação - Dias de Atraso"
      url: "https://pravaler.atlassian.net/wiki/spaces/IDD/pages/976060579/GH+-+Collection"
    }
    sql: ${TABLE}."GH_COLLECTION" ;;
  }


  dimension: ultimo_collection {
    type: string
    group_label: "Collection"
    label: "Último - GH do Collection"
    description: "Este campo é uma regra de negócio*. Indica o Último Grupo Homogêneo do comportamento de pagamento do aluno inadimplente."
    sql: ${TABLE}."ULTIMO_COLLECTION" ;;
  }

  dimension: st_importacao_bradesco {
    type: string
    group_label: "Dados do Título"
    label: "Situação - Importação Bradesco"
    description: "Este campo é uma regra de negócio*. Indica qual é a situação da importação dos boletos do bradesco."
    sql: ${TABLE}."ST_IMPORTACAO_BRADESCO" ;;
  }


  dimension: st_registrado_starKbank {
    type: yesno
    group_label: "Dados do Título"
    label: "Registrado na StarKbank?"
    description: "Indica se o título foi registrado na Starkbank,ou seja, na API de Boletos."
    sql: ${TABLE}."ST_REGISTRADO_STARKBANK" ;;
  }

  dimension: id_ies_contrato {
    type: number
    group_label: "Dados do Título"
    label: "ID Contrato IES"
    description: "Indica o código de contrato da ies com o pravaler para o título."
    sql: ${TABLE}."ID_IES_CONTRATO" ;;
  }

  dimension_group: data_ultimo_collection {
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
    label: "Último Collection"
    description: "Indica a Última data de Avaliação do GH - Collection do Aluno"
    sql: ${TABLE}."DATA_ULTIMO_COLLECTION" ;;
  }




  dimension: campo_mensagem_cobranca {
    type: string
    group_label: "Dados do Aluno"
    label: "Mensagem de Cobrança"
    description: "Indica mensagem preventiva de vencimento do boleto do aluno, utilizado para ação de cobrança."
    sql:
    CASE WHEN ${data_vencimento_date}::date =current_date THEN
    CONCAT('Pravaler: Seu boleto de R$',${financeiro.vl_boleto},' vence hoje. Pague com o cod barras: ',${financeiro.linha_digitavel},' se ja pagou, desconsidere')
    ELSE
    CONCAT('Pravaler: Seu boleto de R$',${financeiro.vl_boleto},' vence ',${data_vencimento_date}::date,'. Pague com o cod barras: ',${financeiro.linha_digitavel},' se ja pagou, desconsidere')
    END
    ;;
  }

  dimension_group: data_reajuste_ipca {
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
    label: "Data de reajuste de IPCA"
    description: "Data em que o boleto foi reajustado de acordo com o IPCA"
    datatype: date
    sql: ${TABLE}."DATA_TIT_IPCA" ;;
  }

  measure: valor_total_divida {
    type: number
    sql: ${sum_boleto} * ${proposta.sum_qtd_prestacoes} ;;
    group_label: "Repasse Gestão"
    group_item_label: "Valor Total da Dívida"
    description: "Valor total da dívida é o produto do valor do boleto vezes a quantidade de prestações. Considera incremento de juros, taxa de adm e/ou IPCA"
    value_format: "$ #,###.00"
  }

  measure: mensal_composicao_juros_tx_adm_ipca {
    type: number
    sql: (${valor_total_divida} - ${proposta.sum_vl_financiamento}) / ${proposta.sum_qtd_prestacoes} ;;
    group_label: "Repasse Gestão"
    group_item_label: "Mensal Composição Juros + Tx Adm + IPCA"
    description: "Parcela do boleto referente a um incremento composto por Juros do Produto, Tx Adm e/ou IPCA"
    value_format: "$ #,###.00"
  }

  measure: estimativa_comissao {
    type: number
    sql: ((${proposta.sum_vl_financiamento} / ${proposta.sum_qtd_prestacoes}) * ${taxa_instituicao_simplificada.taxa_comissao}/100) +
    (${mensal_composicao_juros_tx_adm_ipca} * ${taxa_instituicao_simplificada.taxa_comissao}/100) ;;
    group_label: "Repasse Gestão"
    group_item_label: "Estimativa Comissão"
    description: "Estimativa Comissão considerando incremento de juros, taxa de adm e/ou IPCA"
    value_format: "$ #,###.00"
  }

  measure: estimativa_repasse {
    type: number
    sql: ((${proposta.sum_vl_financiamento} / ${proposta.sum_qtd_prestacoes}) * (1 - ${taxa_instituicao_simplificada.taxa_comissao}/100)) +
    ${mensal_composicao_juros_tx_adm_ipca} * (1 - ${taxa_instituicao_simplificada.taxa_comissao}/100) ;;
    group_label: "Repasse Gestão"
    group_item_label: "Estimativa Repasse"
    description: "Estimativa Repasse considerando incremento de juros, taxa de adm e/ou IPCA"
    value_format: "$ #,###.00"
  }

  dimension: flg_reg_online {
    type: yesno
    label: "Flag Reg Online"
    group_label: "Dados do Boleto"
    sql: ${TABLE}."FLG_REG_ONLINE" ;;
  }

}
