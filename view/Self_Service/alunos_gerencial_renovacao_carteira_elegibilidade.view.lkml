# The name of this view in Looker is "Base Carteira Renovacao"
view: alunos_gerencial_renovacao_carteira_elegibilidade {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "RISCO"."BASE_CARTEIRA_RENOVACAO"
    ;;
  drill_fields: [id, tdt_cpf, funil_elegibilidade,funil_elegibilidade_resumo,data_concessao_date, data_visao_date,dt_filtro_date]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    group_label: "Dados de Renovação"
    label: "ID Proposta - Atual"
    sql: ${TABLE}."ID" ;;
  }

  measure: count_cpf {
    type: count_distinct
    label: "Quantidade de Alunos"
    sql: ${tdt_cpf} ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Alu Contrato" in Explore.

  dimension: alu_contrato {
    type: number
    group_label: "Dados de Renovação"
    label: "ID do Último Contrato Cedido"
    description: "Indica a última proposta cedida do aluno"
    sql: ${TABLE}."ALU_CONTRATO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  measure: average_alu_contrato {
    type: average
    sql: ${alu_contrato} ;;
  }

  dimension: blacklist {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Blacklist?"
    sql: ${TABLE}."BLACKLIST" ;;
  }

  dimension: boleto_0_900 {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "W.O?"
    sql: ${TABLE}."BOLETO_0_900" ;;
  }

  dimension: calendario_operacional {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Calendário Operacional?"
    sql: ${TABLE}."CALENDARIO_OPERACIONAL" ;;
  }

  dimension: cd_rnv_status {
    type: number
    group_label: "Dados de Status - Renovação"
    label: "Último Status Renovação - Geral"
    sql: ${TABLE}."CD_RNV_STATUS" ;;
  }

  dimension: cd_rnv_status_detalhe {
    type: number
    group_label: "Dados de Status - Renovação"
    label: "Último Status Renovação - Detalhado"
    sql: ${TABLE}."CD_RNV_STATUS_DETALHE" ;;
  }

  dimension: cd_tipo_elegibilidade {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Tipo Elegibilidade"
    sql: ${TABLE}."CD_TIPO_ELEGIBILIDADE" ;;
  }

  dimension: chave {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Chave"
    sql: ${TABLE}."CHAVE" ;;
  }

  dimension: curso {
    type: number
    group_label: "Dados de Renovação"
    label: "Curso"
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
    label: "Concessão"
    description: "Indica a data em que o aluno foi cedido pela última vez antes de passar pela elegibilidade"
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
    label: "Visão"
    sql: ${TABLE}."DATA_VISAO" ;;
  }




  dimension_group: dt_filtro {
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
    label: "Filtro"
    sql: ${TABLE}."DT_FILTRO" ;;
  }

  dimension: email {
    type: string
    group_label: "Dados de Renovação"
    label: "E-mail"
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: esta_em_recontratacao {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Em recontratação?"
    sql: ${TABLE}."ESTA_EM_RECONTRATACAO" ;;
  }

  dimension: funil_elegibilidade {
    type: string
    group_label: "Funil"
    label: "Geral"
    sql: ${TABLE}."FUNIL_ELEGIBILIDADE" ;;
  }

  dimension: funil_elegibilidade_resumo {
    type: string
    group_label: "Funil"
    label: "Resumo"
    order_by_field: etapa_ordem
    sql: ${TABLE}."FUNIL_ELEGIBILIDADE_RESUMO" ;;
  }

  dimension: etapa_ordem {
    type: number
    hidden: yes
    sql: CAST(${ordem_etapa_funil_elegibilidade} AS INT) ;;
  }


  dimension: ordem_etapa_funil_elegibilidade {
    type: string
    case: {
      when: {
        sql: ${funil_elegibilidade_resumo} = 'WO' ;;
        label: "0"
      }
      when: {
        sql: ${funil_elegibilidade_resumo} = 'Cancelados' ;;
        label: "1"
      }

      when: {
        sql: ${funil_elegibilidade_resumo} = 'Recusado pela IES' ;;
        label: "2"
      }
      when: {
        sql: ${funil_elegibilidade_resumo} = 'Outros'  ;;
        label: "3"
      }
      when: {
        sql: ${funil_elegibilidade_resumo} = 'Tela da IES'  ;;
        label: "4"
      }
      when: {
        sql: ${funil_elegibilidade_resumo} = 'Já financiou' ;;
        label: "5"
      }
      when: {
        sql: ${funil_elegibilidade_resumo} = 'Em formalização' ;;
        label: "6"
      }

      when: {
        sql: ${funil_elegibilidade_resumo} = 'Elegível' ;;
        label: "7"
      }

      else: "8"
    }
    hidden: yes
  }



  dimension: gh_bhv {
    type: string
    group_label: "Dados de Renovação"
    label: "GH"
    sql: ${TABLE}."GH_BHV" ;;
  }

  dimension: id_produto2 {
    type: string
    group_label: "Dados de Renovação"
    label: "Nome do Produto - Resumo"
    sql: ${TABLE}."ID_PRODUTO2" ;;
  }

  dimension: ies_descadastrada {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "IES Descadastrada?"
    sql: ${TABLE}."IES_DESCADASTRADA" ;;
  }

  dimension: instituicao {
    type: number
    group_label: "Dados de Renovação"
    label: "IES"
    sql: ${TABLE}."INSTITUICAO" ;;
  }

  dimension: ja_esta_no_fluxo {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Já está no fluxo?"
    sql: ${TABLE}."JA_ESTA_NO_FLUXO" ;;
  }

  dimension: ja_financiou {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Já financiou?"
    sql: ${TABLE}."JA_FINANCIOU" ;;
  }

  dimension: maturidade_cpf2 {
    type: number
    group_label: "Dados de Renovação"
    label: "Maturidade - CPF"
    sql: ${TABLE}."MATURIDADE_CPF2" ;;
  }

  dimension: modalidade {
    type: string
    group_label: "Dados de Renovação"
    label: "Modalidade"
    sql: ${TABLE}."MODALIDADE" ;;
  }

  dimension: prp_pro_id {
    type: number
    group_label: "Dados de Renovação"
    label: "ID do Produto"
    sql: ${TABLE}."PRP_PRO_ID" ;;
  }

  measure: qtd_boletos_0_900 {
    type: sum
    group_label: "Filtros de Elegibilidade"
    label: "Quantidade de Boletos W.O"
    sql: ${TABLE}."QTD_BOLETOS_0_900" ;;
  }

  measure: qtd_calendario {
    type: sum
    group_label: "Filtros de Elegibilidade"
    label: "Quantidade de Calendário"
    sql: ${TABLE}."QTD_CALENDARIO" ;;
  }

  measure: qtd_calendario_ies {
    type: sum
    group_label: "Filtros de Elegibilidade"
    label: "Quantidade de Calendário IES"
    sql: ${TABLE}."QTD_CALENDARIO_IES" ;;
  }

  measure: qtd_contratos_n_cedido {
    type: sum
    group_label: "Filtros de Elegibilidade"
    label: "Quantidade de Contratos Cedidos"
    sql: ${TABLE}."QTD_CONTRATOS_N_CEDIDO" ;;
  }

  measure: qtd_etapa_proc_1_2 {
    type: sum
    group_label: "Filtros de Elegibilidade"
    label: "Quantidade - Etapa de Processamento 1 e 2"
    sql: ${TABLE}."QTD_ETAPA_PROC_1_2" ;;
  }

  measure: qtd_parc_finan {
    type: sum
    group_label: "Filtros de Elegibilidade"
    label: "Quantidade de Parcelas no Financiamento"
    sql: ${TABLE}."QTD_PARC_FINAN" ;;
  }

  dimension: safra_fim_finan {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Safra - Semestre Final - Proposta"
    sql: ${TABLE}."SAFRA_FIM_FINAN" ;;
  }

  dimension: safra_ref_calendario {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Safra - Semestre Referencia - Calendário"
    sql: ${TABLE}."SAFRA_REF_CALENDARIO" ;;
  }

  dimension: safra_ult_cont {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Safra - Ultimo Semestre Financiado"
    sql: ${TABLE}."SAFRA_ULT_CONT" ;;
  }

  dimension: sl_status {
    type: number
    group_label: "Dados de Status - Renovação"
    label: "Último Status Novo - Geral"
    sql: ${TABLE}."SL_STATUS" ;;
  }

  dimension: sl_status_detalhe {
    type: number
    group_label: "Dados de Status - Renovação"
    label: "Último Status Novo - Detalhado"
    sql: ${TABLE}."SL_STATUS_DETALHE" ;;
  }

  dimension: st_aluno_novo {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Aluno Novo?"
    sql: ${TABLE}."ST_ALUNO_NOVO" ;;
  }

  dimension: st_aluno_renov {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Aluno Renovação?"
    sql: ${TABLE}."ST_ALUNO_RENOV" ;;
  }

  dimension: tdt_ano_mes {
    type: number
    group_label: "Dados de Renovação"
    label: "Ano Mês - Carteira"
    sql: ${TABLE}."TDT_ANO_MES" ;;
  }

  dimension: tdt_cpf {
    type: number
    group_label: "Dados de Renovação"
    label: "CPF do Aluno"
    sql: ${TABLE}."TDT_CPF" ;;
  }

  dimension: valor_presente2 {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Valor Presente"
    sql: ${TABLE}."VALOR_PRESENTE2" ;;
  }

  measure: sum_valor_presente2 {
    type: sum
    group_label: "Filtros de Elegibilidade"
    label: "Valor Presente"
    sql: ${valor_presente2} ;;
  }

  dimension: vp_zero {
    type: number
    group_label: "Filtros de Elegibilidade"
    label: "Valor Presente Zero?"
    sql: ${TABLE}."VP_ZERO" ;;
  }

  dimension: flg_semestre_atual_financiado {
    type: yesno
    group_label: "Filtros de Elegibilidade"
    label: "Semestre Atual Financiado?"
    sql: ${TABLE}."FLG_SEMESTRE_ATUAL_FINANCIADO" ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
