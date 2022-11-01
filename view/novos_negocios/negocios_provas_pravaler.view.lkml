# The name of this view in Looker is "Negocios Provas Pravaler"
view: negocios_provas_pravaler {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "PIPEDRIVE"."NEGOCIOS_PROVAS_PRAVALER"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Atividades Concluidas" in Explore.

  dimension: atividades_concluidas {
    type: number
    sql: ${TABLE}."ATIVIDADES_CONCLUIDAS" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_atividades_concluidas {
    type: sum
    sql: ${atividades_concluidas} ;;
  }

  measure: average_atividades_concluidas {
    type: average
    sql: ${atividades_concluidas} ;;
  }

  dimension: criador_do_negocio {
    type: string
    sql: ${TABLE}."CRIADOR_DO_NEGOCIO" ;;
  }

  dimension: dor_empresa_quer_resolver {
    type: string
    sql: ${TABLE}."DOR_EMPRESA_QUER_RESOLVER" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: dt_atualizacao_negocio {
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
    sql: ${TABLE}."DT_ATUALIZACAO_NEGOCIO" ;;
  }

  dimension_group: dt_criacao_negocio {
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
    sql: ${TABLE}."DT_CRIACAO_NEGOCIO" ;;
  }

  dimension_group: dt_fechado_em_negocio {
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
    sql: ${TABLE}."DT_FECHADO_EM_NEGOCIO" ;;
  }

  dimension_group: dt_fechamento_esperada {
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
    sql: ${TABLE}."DT_FECHAMENTO_ESPERADA" ;;
  }

  dimension_group: dt_ganho_negocio {
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
    sql: ${TABLE}."DT_GANHO_NEGOCIO" ;;
  }

  dimension: dt_limite_faturamento {
    type: string
    sql: ${TABLE}."DT_LIMITE_FATURAMENTO" ;;
  }

  dimension_group: dt_perda_negocio {
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
    sql: ${TABLE}."DT_PERDA_NEGOCIO" ;;
  }

  dimension_group: dt_primeiro_ganho_negocio {
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
    sql: ${TABLE}."DT_PRIMEIRO_GANHO_NEGOCIO" ;;
  }

  dimension: email_criador_do_negocio {
    type: string
    sql: ${TABLE}."EMAIL_CRIADOR_DO_NEGOCIO" ;;
  }

  dimension: email_pessoa_negocio {
    type: string
    sql: ${TABLE}."EMAIL_PESSOA_NEGOCIO" ;;
  }

  dimension: email_proprietario_negocio {
    type: string
    sql: ${TABLE}."EMAIL_PROPRIETARIO_NEGOCIO" ;;
  }

  dimension: etiqueta {
    type: string
    sql: ${TABLE}."ETIQUETA" ;;
  }

  dimension: flg_ativo_criador {
    type: yesno
    sql: ${TABLE}."FLG_ATIVO_CRIADOR" ;;
  }

  dimension: flg_ativo_negocio {
    type: yesno
    sql: ${TABLE}."FLG_ATIVO_NEGOCIO" ;;
  }

  dimension: flg_deletado_negocio {
    type: yesno
    sql: ${TABLE}."FLG_DELETADO_NEGOCIO" ;;
  }

  dimension: forma_pgto {
    type: string
    sql: ${TABLE}."FORMA_PGTO" ;;
  }

  dimension: id_negocio {
    type: number
    primary_key: yes
    sql: ${TABLE}."ID_NEGOCIO" ;;
  }

  measure: idade_negocio_segundos {
    type: sum
    sql: ${TABLE}."IDADE_NEGOCIO_SEGUNDOS" ;;
  }

  dimension: impacto_dores_operacao {
    type: string
    sql: ${TABLE}."IMPACTO_DORES_OPERACAO" ;;
  }

  dimension: infos_atividades {
    type: string
    sql: ${TABLE}."INFOS_ATIVIDADES" ;;
  }

  dimension: infos_pipeline {
    type: string
    sql: ${TABLE}."INFOS_PIPELINE" ;;
  }

  dimension: interesse_de_negocio {
    type: string
    sql: ${TABLE}."INTERESSE_DE_NEGOCIO" ;;
  }

  dimension: motivo_perda_negocio {
    type: string
    sql: ${TABLE}."MOTIVO_PERDA_NEGOCIO" ;;
  }

  dimension: mql_valido {
    type: string
    sql: ${TABLE}."MQL_VALIDO" ;;
  }

  dimension: nivel_provas_digitais {
    type: string
    sql: ${TABLE}."NIVEL_PROVAS_DIGITAIS" ;;
  }

  dimension: nome_organizacao {
    type: string
    sql: ${TABLE}."NOME_ORGANIZACAO" ;;
  }

  dimension: nome_pessoa_negocio {
    type: string
    sql: ${TABLE}."NOME_PESSOA_NEGOCIO" ;;
  }

  dimension: nr_provas_digitais_ano {
    type: number
    sql: ${TABLE}."NR_PROVAS_DIGITAIS_ANO" ;;
  }

  dimension: numero_mensagens_emails {
    type: number
    sql: ${TABLE}."NUMERO_MENSAGENS_EMAILS" ;;
  }

  dimension: origem_lead {
    type: string
    sql: ${TABLE}."ORIGEM_LEAD" ;;
  }

  dimension: previsao_dt_prova_prvdigitais {
    type: string
    sql: ${TABLE}."PREVISAO_DT_PROVA_PRVDIGITAIS" ;;
  }

  dimension: probabilidade_negocio_porcentagem {
    type: number
    sql: ${TABLE}."PROBABILIDADE_NEGOCIO_PORCENTAGEM" ;;
  }

  dimension: proprietario_negocio {
    type: string
    sql: ${TABLE}."PROPRIETARIO_NEGOCIO" ;;
  }

  dimension: qtd_arquivos {
    type: number
    sql: ${TABLE}."QTD_ARQUIVOS" ;;
  }

  dimension: qtd_atividades_nao_concluidas {
    type: number
    sql: ${TABLE}."QTD_ATIVIDADES_NAO_CONCLUIDAS" ;;
  }

  dimension: qtd_notas {
    type: number
    sql: ${TABLE}."QTD_NOTAS" ;;
  }

  dimension: qtd_participantes {
    type: number
    sql: ${TABLE}."QTD_PARTICIPANTES" ;;
  }

  measure: qtd_produtos {
    type: sum
    sql: ${TABLE}."QTD_PRODUTOS" ;;
  }

  measure: qtd_seguidores {
    type: sum
    sql: ${TABLE}."QTD_SEGUIDORES" ;;
  }

  measure: receita_estimada {
    type: sum
    sql: ${TABLE}."RECEITA_ESTIMADA" ;;
  }

  measure: receita_total {
    type: sum
    sql: ${TABLE}."RECEITA_TOTAL" ;;
  }

  dimension: sdr {
    type: string
    sql: ${TABLE}."SDR" ;;
  }

  dimension: status_negocio {
    type: string
    sql: ${TABLE}."STATUS_NEGOCIO" ;;
  }

  dimension: telefone_pessoa_negocio {
    type: string
    sql: ${TABLE}."TELEFONE_PESSOA_NEGOCIO" ;;
  }

  dimension: tempo_medio_de_ganho_total_segundo {
    type: number
    sql: ${TABLE}."TEMPO_MEDIO_DE_GANHO_TOTAL_SEGUNDO" ;;
  }

  dimension: ticket_medio {
    type: number
    sql: ${TABLE}."TICKET_MEDIO" ;;
  }

  dimension: titulo_negocio {
    type: string
    sql: ${TABLE}."TITULO_NEGOCIO" ;;
  }

  dimension: total_atividades {
    type: number
    sql: ${TABLE}."TOTAL_ATIVIDADES" ;;
  }

  dimension_group: ult_email_enviado {
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
    sql: ${TABLE}."ULT_EMAIL_ENVIADO" ;;
  }

  dimension_group: ult_email_recebido {
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
    sql: ${TABLE}."ULT_EMAIL_RECEBIDO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
