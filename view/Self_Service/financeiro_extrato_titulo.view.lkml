view: financeiro_extrato_titulo {
  derived_table: {
    persist_for: "1 hour"

    sql: select
      id_titulo,
      f.key as id_extrato_titulo,
      f.value:DATA_TRANSFERENCIA::date as data_transferencia,
      a.id_cpf,
      a.id_contrato,
      f.value:ds_extrato_transacao::varchar as ds_extrato_transacao,
      f.value:ds_extrato_transacao_tipo::varchar as ds_extrato_transacao_tipo,
      f.value:vl_extrato::float(2) as vl_extrato,
      f.value:id_instituicao::varchar id_instituicao,
      f.value:id_produto::varchar id_produto
      from GRADUADO.SELF_SERVICE_BI.FINANCEIRO a,
      lateral flatten (input => id_extrato_titulo_info) f
      where id_titulo is not null
       ;;
  }

  dimension: id_titulo {
    type: number
    primary_key: yes
    sql: ${TABLE}."ID_TITULO" ;;
    label: "ID Título"
    description: "Indica o ID referência da tabela Financeiro"
    value_format: "#"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    description: "Indica o ID do CPF do Aluno"
  }

  dimension: id_contrato {
    type: string
    label: "ID do Contrato"
    description: "Indica o número do contrato do aluno com PRAVALER"
    sql: ${TABLE}."ID_CONTRATO" ;;
    value_format: "#"
  }

  dimension_group: transferencia {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_num,
      month_name,
      year,
    ]
    sql: ${TABLE}."DATA_TRANSFERENCIA" ;;
    description: "Data em que foi feito o repasse dos valores gestão para a IES"
  }

  dimension: id_extrato_titulo {
    type: string
    sql: ${TABLE}."ID_EXTRATO_TITULO" ;;
    description: "Indica o ID único do extrato de pagamento. Extrato de pagamento referente aos alunos do fundo de investimento 'Gestão'"
    label: "ID Extrato Título"
    value_format: "#"
  }

  dimension: ds_extrato_transacao {
    type: string
    sql: ${TABLE}."DS_EXTRATO_TRANSACAO" ;;
    description: "Indica qual a transação correspondente ao extrato. Ex: Parcela, Comissão, Boleto, Taxas Adicionais."
    label: "Extrato da Transação"
  }

  dimension: ds_extrato_transacao_tipo {
    type: string
    sql: ${TABLE}."DS_EXTRATO_TRANSACAO_TIPO" ;;
    description: "Indica qual o tipo de transação correspondente ao extrato.Ex: Crédito, Débito, Tarifa Bancária."
    label: "Tipo de Extrato da Transação"
  }

  dimension: vl_extrato {
    type: number
    sql: ${TABLE}."VL_EXTRATO" ;;
    description: "Indica qual o valor da transação de cada extrato de pagamento."
    label: "Valor do Extrato"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    label: "Quantidade de Extratos"
    description: "Contagem de Extrato por título"
  }

  measure: qtd_parcelas_pagas {
    type: count_distinct
    sql: ${id_extrato_titulo} ;;
    sql_distinct_key: ${id_contrato} ;;
    filters: [ds_extrato_transacao: "PARCELA"]
    drill_fields: [detail*]
    label: "Quantidade de Parcelas Pagas"
  }



  measure: alunos {
    type: count_distinct
    sql: ${id_cpf} ;;
    drill_fields: [detail*]
    label: "Quantidade de Alunos"
  }

  measure: sum_vl_extrato {
    type: sum
    sql:  ${vl_extrato} ;;
    group_label: "Extrato"
    group_item_label: "Soma"
    description: "Soma do valor do extrato."
  }


  measure: avg_vl_extrato {
    type: average
    sql: ${vl_extrato} ;;
    group_label: "Extrato"
    group_item_label: "Média"
    description: "Média do valor do extrato."
  }

  measure: max_vl_extrato {
    type: max
    sql: ${vl_extrato} ;;
    group_label: "Extrato"
    group_item_label: "Máximo"
    description: "Máximo do valor do extrato."
  }

  measure: min_vl_extrato {
    type: min
    sql: ${vl_extrato} ;;
    group_label: "Extrato"
    group_item_label: "Mínimo"
    description: "Mínimo do valor do extrato."
  }

  measure: sum_vl_debito {
    type: sum
    sql: - ${vl_extrato} ;;
    filters: [ds_extrato_transacao_tipo: "DEBITO"]
    group_label: "Débito"
    group_item_label: "Soma"
    description: "Soma do valor do extrato."
  }

   measure: avg_vl_debito {
    type: average
    sql: - ${vl_extrato} ;;
    filters: [ds_extrato_transacao_tipo: "DEBITO"]
    group_label: "Débito"
    group_item_label: "Média"
    description: "Média do valor do extrato."
  }

    measure: max_vl_debito {
     type: max
     sql: - ${vl_extrato} ;;
     filters: [ ds_extrato_transacao_tipo: "DEBITO"]
     group_label: "Débito"
     group_item_label: "Máximo"
     description: "Máximo do valor do extrato."
    }

  measure: min_vl_debito {
      type: min
        sql: - ${vl_extrato} ;;
        filters: [ds_extrato_transacao_tipo: "DEBITO"]
        group_label: "Débito"
        group_item_label: "Mínimo"
        description: "Mínimo do valor do extrato."
     }

      measure: sum_vl_credito {
        type: sum
        sql:  ${vl_extrato} ;;
        filters: [ds_extrato_transacao_tipo: "CREDITO"]
        group_label: "Crédito"
        group_item_label: "Soma"
        description: "Soma do valor do extrato."
      }

  measure: sum_seguros {
    type: sum
    sql: ${vl_extrato} ;;
    filters: [
      ds_extrato_transacao: "SEGUROS",
      ds_extrato_transacao_tipo: "CREDITO"
    ]
    group_label: "Seguros"
    group_item_label: "Soma"
    description: "Soma do valor de seguro."
  }

    measure: avg_vl_credito {
        type: average
        sql: ${vl_extrato} ;;
        filters: [ds_extrato_transacao_tipo: "CREDITO"]
        group_label: "Crédito"
        group_item_label: "Média"
        description: "Média do valor do extrato."
    }

    measure: max_vl_credito {
      type: max
      sql: ${vl_extrato} ;;
      filters: [
            ds_extrato_transacao_tipo: "CREDITO"
          ]
        group_label: "Crédito"
        group_item_label: "Máximo"
        description: "Máximo do valor do extrato."
      }

    measure: min_vl_credito {
        type: min
        sql: ${vl_extrato} ;;
        filters: [
          ds_extrato_transacao_tipo: "CREDITO"
        ]
        group_label: "Crédito"
        group_item_label: "Mínimo"
        description: "Mínimo do valor do extrato."
      }

  measure: sum_comissao {
    type: sum
    sql: - ${vl_extrato} ;;
    filters: [
      ds_extrato_transacao: "COMISSAO"
    ]
    group_label: "Comissão"
    group_item_label: "Soma"
    description: "Soma do valor de comissão."
  }


  measure: avg_comissao {
    type: average
    sql: - ${vl_extrato} ;;
    filters: [
      ds_extrato_transacao: "COMISSAO"
    ]
    group_label: "Comissão"
    group_item_label: "Média"
    description: "Média do valor de comissão."
  }



  measure: max_comissao {
    type: max
    sql: - ${vl_extrato} ;;
    filters: [
      ds_extrato_transacao: "COMISSAO"
    ]
    group_label: "Comissão"
    group_item_label: "Máximo"
    description: "Máximo do valor de comissão."
  }

  measure: min_comissao {
    type: min
    sql: - ${vl_extrato} ;;
    filters: [
      ds_extrato_transacao: "COMISSAO"
    ]
    group_label: "Comissão"
    group_item_label: "Mínimo"
    description: "Mínimo do valor de comissão."
  }


  measure: sum_repasse_calculo{
    type: number
    sql: ${sum_vl_credito} - ${sum_comissao};;
    label: "Repasse - Soma"
    hidden: yes
    value_format:  "\"R$ \"#,##0.00"
  }

  measure: sum_repasse{
    type: number
    sql: ${sum_repasse_calculo};;
    label: "Repasse - Soma"
    value_format:  "\"R$ \"#,##0.00"
  }

  measure: sum_comissao_gestao{
    type: number
    sql: ${sum_vl_debito} - ${sum_seguros};;
    value_format:  "\"R$ \"#,##0.00"
    group_label: "Comissão Gestão"
    description: "Comissão de Pagamentos Gestão (valor - seguros) com a tarifa de cadastro de cada boleto incluso."
  }

  measure: sum_repasse_gestao_calculo{
    type: number
    sql: ${sum_vl_credito} - ${sum_comissao_gestao};;
    label: "Repasse Gestão - Soma"
    hidden: yes
    value_format:  "\"R$ \"#,##0.00"
  }

  measure: sum_repasse_gestao{
    type: number
    sql: ${sum_repasse_gestao_calculo};;
    label: "Repasse Gestão - Soma"
    value_format:  "\"R$ \"#,##0.00"
  }

  set: detail {
    fields: [id_titulo,
      transferencia_date,
      id_cpf,
      id_contrato,
      id_extrato_titulo,
      ds_extrato_transacao,
      ds_extrato_transacao_tipo,
      vl_extrato]
  }
}
