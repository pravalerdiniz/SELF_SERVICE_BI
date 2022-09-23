# The name of this view in Looker is "Can Principal"
view: bullest {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "BULLEST"."CAN_PRINCIPAL"
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
  # This dimension will be called "Ajustada" in Explore.

  dimension: ajustada {
    type: yesno
    sql: ${TABLE}."AJUSTADA" ;;
  }

  dimension: arquivo {
    type: string
    sql: ${TABLE}."ARQUIVO" ;;
  }

  dimension: cod_ies {
    group_label: "Dados IES"
    group_item_label: "Código da IES."
    type: number
    sql: ${TABLE}."COD_IES" ;;
  }

  dimension: grupo {
    group_label: "Dados IES"
    group_item_label: "Grupo da IES."
    type: string
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: ies {
    group_label: "Dados IES"
    group_item_label: "Nome da IES."
    type: string
    sql: ${TABLE}."IES" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.


  dimension: cpf {
    group_label: "Dados Aluno"
    group_item_label: "CPF do Aluno."
    type: number
    sql: ${TABLE}."CPF" ;;
  }

  dimension: nome {
    group_label: "Dados Aluno"
    group_item_label: "Nome do Aluno."
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: createdat {
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
    sql: ${TABLE}."CREATEDAT" ;;
  }

  dimension_group: data_criacao {
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
    sql: ${TABLE}."DATA_CRIACAO" ;;
  }

  dimension_group: data_final {
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
    sql: ${TABLE}."DATA_FINAL" ;;
  }

  dimension_group: data_repasse {
    description: "Data que o valor foi repassado para IES."
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
    sql: ${TABLE}."DATA_REPASSE" ;;
  }

  dimension_group: datapg {
    description: "Data que a IES devolveu o valor para o Pravaler."
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
    sql: ${TABLE}."DATAPG" ;;
  }

  dimension: descricao_do_contrato {
    type: string
    sql: ${TABLE}."DESCRICAO_DO_CONTRATO" ;;
  }

  dimension: diff_extraordinario {
    type: number
    sql: ${TABLE}."DIFF_EXTRAORDINARIO" ;;
  }

  dimension_group: dt_envio {
    description: "Data atual do envio do boleto para IES."
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
    sql: ${TABLE}."DT_ENVIO" ;;
  }

  dimension_group: dt_envio_recompra {
    description: "Data que o contrato foi enviado para recompra."
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
    sql: ${TABLE}."DT_ENVIO_RECOMPRA" ;;
  }

  dimension_group: dt_primeiro_envio {
    description: "Data do primeiro envio do boleto para IES."
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
    sql: ${TABLE}."DT_PRIMEIRO_ENVIO" ;;
  }

  dimension_group: dt_primeiro_vecto {
    description: "Data da primeira data de vencimento do boleto."
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
    sql: ${TABLE}."DT_PRIMEIRO_VECTO" ;;
  }

  dimension_group: dt_recompra {
    description: "Data que o contrato foi enviado para recompra."
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
    sql: ${TABLE}."DT_RECOMPRA" ;;
  }

  dimension_group: dt_vecto {
    description: "Data atual do vencimento do boleto."
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
    sql: ${TABLE}."DT_VECTO" ;;
  }

  dimension: enviado_recompra {
    description: "Se o contrato foi enviado para recompra, sim ou não."
    type: yesno
    sql: ${TABLE}."ENVIADO_RECOMPRA" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }


  dimension: motivo {
    description: "Motivo do cancelamento."
    type: string
    sql: ${TABLE}."MOTIVO" ;;
  }

  dimension: motivo_cancelamento {
    type: string
    sql: ${TABLE}."MOTIVO_CANCELAMENTO" ;;
  }

  dimension: motivo_id {
    type: number
    sql: ${TABLE}."MOTIVO_ID" ;;
  }

  dimension: n_contrato_aluno {
    type: number
    sql: ${TABLE}."N_CONTRATO_ALUNO" ;;
  }

  dimension: observacao {
    description: "Campo de informação adicional."
    type: string
    sql: ${TABLE}."OBSERVACAO" ;;
  }

  dimension: qtd_mensalidades {
    description: "Quantidade de Mensalidades contratadas."
    type: number
    sql: ${TABLE}."QTD_MENSALIDADES" ;;
  }

  dimension: qtd_mensalidades_aluno {
    description: "Quantidade de mensalidades que o aluno ainda terá que pagar para o Pravaler."
    type: number
    sql: ${TABLE}."QTD_MENSALIDADES_ALUNO" ;;
  }

  dimension: qtd_mensalidades_faculdade {
    description: "Quantidade de mensalidades que a IES terá que devolver para o Pravaler.
  "
    type: number
    sql: ${TABLE}."QTD_MENSALIDADES_FACULDADE" ;;
  }

  dimension: qtd_mensalidades_faculdade_recompra {
    description: "Quantidade de mensalidades canceladas que serão enviadas para recompra."
    type: number
    sql: ${TABLE}."QTD_MENSALIDADES_FACULDADE_RECOMPRA" ;;
  }

  dimension: qtd_mensalidades_real {
    type: number
    sql: ${TABLE}."QTD_MENSALIDADES_REAL" ;;
  }

  dimension: qtd_regerado {
    description: "Quantas vezes o boleto foi regerado."
    type: number
    sql: ${TABLE}."QTD_REGERADO" ;;
  }

  dimension: recompra {
    type: string
    sql: ${TABLE}."RECOMPRA" ;;
  }

  dimension: remuneracao_prv {
    description: "Porcentagem a ser repassada para IES."
    type: number
    sql: ${TABLE}."REMUNERACAO_PRV" ;;
  }

  dimension: remuneracao_real_prv {
    type: number
    sql: ${TABLE}."REMUNERACAO_REAL_PRV" ;;
  }

  dimension: sem_financiado {
    type: string
    sql: ${TABLE}."SEM_FINANCIADO" ;;
  }

  dimension: seunum {
    type: number
    sql: ${TABLE}."SEUNUM" ;;
  }

  dimension: situacaoaluno_desc {
    type: string
    sql: ${TABLE}."SITUACAOALUNO_DESC" ;;
  }

  dimension: situacaoaluno_id {
    type: number
    sql: ${TABLE}."SITUACAOALUNO_ID" ;;
  }

  dimension: status_cancelamento {
    type: string
    sql: ${TABLE}."STATUS_CANCELAMENTO" ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}."STATUS_ID" ;;
  }

  dimension_group: updatedat {
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
    sql: ${TABLE}."UPDATEDAT" ;;
  }

  dimension: valor_bruto {
    type: number
    sql: ${TABLE}."VALOR_BRUTO" ;;
    hidden: yes
  }

  dimension: valor_extraordinario {
    type: number
    sql: ${TABLE}."VALOR_EXTRAORDINARIO" ;;
    hidden: yes
  }

  dimension: valor_faculdade {
    type: number
    sql: ${TABLE}."VALOR_FACULDADE" ;;
    hidden: yes
  }

  dimension: valor_mensalidade {
    type: number
    sql: ${TABLE}."VALOR_MENSALIDADE" ;;
    hidden: yes
  }

  dimension: valor_prv {
    type: number
    sql: ${TABLE}."VALOR_PRV" ;;
    hidden: yes
  }

  dimension: valor_reembolso {
    type: number
    sql: ${TABLE}."VALOR_REEMBOLSO" ;;
    hidden: yes
  }

  dimension: valor_repassado {
    type: number
    sql: ${TABLE}."VALOR_REPASSADO" ;;
    hidden: yes
  }

  dimension: valor_restituido {
    type: number
    sql: ${TABLE}."VALOR_RESTITUIDO" ;;
    hidden: yes
  }

  dimension: dias_em_aberto {
    type: number
    label: "Faixa de Dias em atraso"
    description: "Quantidade de dias em atraso."
    sql: case
            when ${status_cancelamento} IN ( 'Aguardando Pagamento', 'Aguardando Pagamento (Regerado)', 'Não Pago', 'Não Pago (Regerado)') AND datediff(day, ${TABLE}."dt_primeiro_vecto", getdate()) between 1 and 30
        then 30
        when ${status_cancelamento} IN ( 'Aguardando Pagamento', 'Aguardando Pagamento (Regerado)', 'Não Pago', 'Não Pago (Regerado)') AND datediff(day, ${TABLE}."dt_primeiro_vecto", getdate()) between 31 and 60
        then 60
        when ${status_cancelamento} IN ( 'Aguardando Pagamento', 'Aguardando Pagamento (Regerado)', 'Não Pago', 'Não Pago (Regerado)') AND datediff(day, ${TABLE}."dt_primeiro_vecto", getdate()) between 61 and 99
        then 90
        when ${status_cancelamento} IN ( 'Aguardando Pagamento', 'Aguardando Pagamento (Regerado)', 'Não Pago', 'Não Pago (Regerado)') AND datediff(day, ${TABLE}."dt_primeiro_vecto", getdate()) > 99
        then 100 end ;;
  }

  measure: sum_valor_bruto {
    type: sum
    description: "Valor do contratado."
    sql: ${valor_faculdade} ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_valor_extraordinario {
    type: sum
    description: "Valor que o grupo Yduqs informou que será devolvido."
    sql: ${valor_extraordinario} ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_reembolso_faculdade {
    group_label: "Reembolso"
    group_item_label: "Reembolso Faculdade."
    type: sum
    description: "Valor total de reembolso da IES para o Pravaler, entre pagos, vencidos e a vencer."
    sql: ${valor_faculdade} ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_reembolso_faculdade_pago {
    group_label: "Reembolso"
    group_item_label: "Reembolso Faculdade pago."
    type: sum
    description: "Valor que a IES devolveu para o Pravaler."
    sql: case when ${status_cancelamento} = 'Pago' then ${valor_faculdade} end ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_reembolso_faculdade_em_aberto {
    group_label: "Reembolso"
    group_item_label: "Reembolso Faculdade em Aberto (Vencidos + A Vencer)."
    type: sum
    description: "Valor que a IES ainda não pagou para o Pravaler, entre vencidos e a vencer."
    sql: case
            when ${status_cancelamento} IN ( 'Aguardando Pagamento', 'Aguardando Pagamento (Regerado)', 'Não Pago', 'Não Pago (Regerado)')
        then ${valor_faculdade} end ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_reembolso_faculdade_a_vencer {
    group_label: "Reembolso"
    group_item_label: "Reembolso Faculdade a vencer (Adimplente)."
    type: sum
    description: "Valor a vencer que a IES não pagou para o Pravaler."
    sql: case
            when ${status_cancelamento} IN ( 'Aguardando Pagamento', 'Aguardando Pagamento (Regerado)', 'Não Pago', 'Não Pago (Regerado)') AND datediff(day, ${TABLE}."dt_primeiro_vecto", getdate()) <= 0
        then ${valor_faculdade}
         end ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_reembolso_faculdade_nao_cobrado {
    group_label: "Reembolso"
    group_item_label: "Reembolso Faculdade Não Cobrado."
    type: sum
    description: "Valor não cobrado da IES."
    sql: case when ${status_cancelamento} IN ( 'Não Cobrado') then ${valor_faculdade} end ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_reembolso_faculdade_inadimplente {
    group_label: "Reembolso"
    group_item_label: "Reembolso Faculdade vencidos (Inadimplente)."
    type: sum
    description: "Valor que a IES não devolveu para o Pravaler."
    sql: case
            when ${status_cancelamento} IN ( 'Aguardando Pagamento', 'Aguardando Pagamento (Regerado)', 'Não Pago', 'Não Pago (Regerado)') AND datediff(day, ${TABLE}."dt_primeiro_vecto", getdate()) > 0
         then ${valor_faculdade}
    end ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_mensalidade {
    type: sum
    description: "Valor da mensalidade."
    sql: ${valor_mensalidade} ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_valor_prv {
    type: sum
    description: "Valor do Pravaler."
    sql: ${valor_prv} ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_valor_reembolso {
    type: sum
    description: "Valor do reembolso do aluno."
    sql: ${valor_reembolso} ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_valor_repassado {
    type: sum
    description: "Valor repassado para IES - a comissão do Pravaler."
    sql: ${valor_repassado} ;;
    value_format: "\R$ #,###.00"
  }

  measure: sum_valor_restituido {
    type: sum
    description: "Valor a ser restituído ao fundo."
    sql: ${valor_restituido} ;;
    value_format: "\R$ #,###.00"
  }

  measure: count {
    group_label: "Count"
    group_item_label: "Quantidade de títulos."
    type: count
    drill_fields: [id]
  }

  measure: count_vencidos {
    group_label: "Count"
    group_item_label: "Quantidade de títulos a receber vencidos."
    type: count_distinct
    description: "Quantidade de títulos (CNPJ) a receber vencidos."
    sql:  case
            when ${status_cancelamento} IN ( 'Aguardando Pagamento', 'Aguardando Pagamento (Regerado)', 'Não Pago', 'Não Pago (Regerado)') AND datediff(day, ${TABLE}."dt_primeiro_vecto", getdate()) > 0
        then ${id}
         end ;;
  }

  measure: count_a_vencer {
    group_label: "Count"
    group_item_label: "Quantidade de títulos a receber a vencer."
    type: count_distinct
    description: "Quantidade de títulos (CNPJ) vencidos."
    sql:  case
            when ${status_cancelamento} IN ( 'Aguardando Pagamento', 'Aguardando Pagamento (Regerado)', 'Não Pago', 'Não Pago (Regerado)') AND datediff(day, ${TABLE}."dt_primeiro_vecto", getdate()) <= 0
        then ${id}
         end ;;
  }

  measure: count_em_aberto {
    group_label: "Count"
    group_item_label: "Quantidade de títulos a receber."
    type: count_distinct
    description: "Quantidade de títulos (CNPJ) vencidos e a vencer."
    sql:  case
            when ${status_cancelamento} IN ( 'Aguardando Pagamento', 'Aguardando Pagamento (Regerado)', 'Não Pago', 'Não Pago (Regerado)')
        then ${id}
         end ;;
  }
}
