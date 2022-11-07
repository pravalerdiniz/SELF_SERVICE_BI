# The name of this view in Looker is "Avaliacoes Qulture Rocks"
view: avaliacoes_qulture_rocks {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GRADUADO"."AVALIACOES_QULTURE_ROCKS"
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
  # This dimension will be called "Cargo Avaliado" in Explore.

  dimension: cargo_avaliado {
    type: string
    sql: ${TABLE}."CARGO_AVALIADO" ;;
  }

  dimension: cargo_avaliador {
    type: string
    sql: ${TABLE}."CARGO_AVALIADOR" ;;
  }

  dimension: cpf_avaliado {
    type: string
    sql: ${TABLE}."CPF_AVALIADO" ;;
  }

  dimension: cpf_avaliador {
    type: string
    sql: ${TABLE}."CPF_AVALIADOR" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_admissao_avaliado {
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
    sql: ${TABLE}."DATA_ADMISSAO_AVALIADO" ;;
  }

  dimension_group: data_admissao_avaliador {
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
    sql: ${TABLE}."DATA_ADMISSAO_AVALIADOR" ;;
  }

  dimension_group: data_criacao_avaliado {
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
    sql: ${TABLE}."DATA_CRIACAO_AVALIADO" ;;
  }

  dimension_group: data_criacao_avaliador {
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
    sql: ${TABLE}."DATA_CRIACAO_AVALIADOR" ;;
  }

  dimension_group: data_inicio {
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
    sql: ${TABLE}."DATA_INICIO" ;;
  }

  dimension_group: data_termino {
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
    sql: ${TABLE}."DATA_TERMINO" ;;
  }

  dimension_group: data_ultimo_convite_enviado_avaliado {
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
    sql: ${TABLE}."DATA_ULTIMO_CONVITE_ENVIADO_AVALIADO" ;;
  }

  dimension_group: data_ultimo_convite_enviado_avaliador {
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
    sql: ${TABLE}."DATA_ULTIMO_CONVITE_ENVIADO_AVALIADOR" ;;
  }

  dimension_group: data_ultimo_lembrete_enviado {
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
    sql: ${TABLE}."DATA_ULTIMO_LEMBRETE_ENVIADO" ;;
  }

  dimension: departamento_avaliado {
    type: string
    sql: ${TABLE}."DEPARTAMENTO_AVALIADO" ;;
  }

  dimension: departamento_avaliador {
    type: string
    sql: ${TABLE}."DEPARTAMENTO_AVALIADOR" ;;
  }

  dimension: diretoria_avaliado {
    type: string
    sql: ${TABLE}."DIRETORIA_AVALIADO" ;;
  }

  dimension: diretoria_avaliador {
    type: string
    sql: ${TABLE}."DIRETORIA_AVALIADOR" ;;
  }

  dimension: email_avaliado {
    type: string
    sql: ${TABLE}."EMAIL_AVALIADO" ;;
  }

  dimension: email_avaliador {
    type: string
    sql: ${TABLE}."EMAIL_AVALIADOR" ;;
  }

  dimension: flg_anonimizado {
    type: yesno
    sql: ${TABLE}."FLG_ANONIMIZADO" ;;
  }

  dimension: flg_avaliado_ativo {
    type: yesno
    sql: ${TABLE}."FLG_AVALIADO_ATIVO" ;;
  }

  dimension: flg_avaliado_inativo_com_data_rescisao {
    type: yesno
    sql: ${TABLE}."FLG_AVALIADO_INATIVO_COM_DATA_RESCISAO" ;;
  }

  dimension: flg_avaliado_inativo_sem_data_rescisao {
    type: yesno
    sql: ${TABLE}."FLG_AVALIADO_INATIVO_SEM_DATA_RESCISAO" ;;
  }

  dimension: flg_avaliador_ativo {
    type: yesno
    sql: ${TABLE}."FLG_AVALIADOR_ATIVO" ;;
  }

  dimension: flg_avaliador_inativo_com_data_rescisao {
    type: yesno
    sql: ${TABLE}."FLG_AVALIADOR_INATIVO_COM_DATA_RESCISAO" ;;
  }

  dimension: flg_avaliador_inativo_sem_data_rescisao {
    type: yesno
    sql: ${TABLE}."FLG_AVALIADOR_INATIVO_SEM_DATA_RESCISAO" ;;
  }

  dimension: flg_completa {
    type: yesno
    sql: ${TABLE}."FLG_COMPLETA" ;;
  }

  dimension: flg_finalizada {
    type: yesno
    sql: ${TABLE}."FLG_FINALIZADA" ;;
  }

  dimension: id_avaliado {
    type: number
    sql: ${TABLE}."ID_AVALIADO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_id_avaliado {
    type: sum
    sql: ${id_avaliado} ;;
  }

  measure: average_id_avaliado {
    type: average
    sql: ${id_avaliado} ;;
  }

  dimension: id_avaliador {
    type: number
    sql: ${TABLE}."ID_AVALIADOR" ;;
  }

  dimension: id_lider_avaliado {
    type: number
    sql: ${TABLE}."ID_LIDER_AVALIADO" ;;
  }

  dimension: id_lider_avaliador {
    type: number
    sql: ${TABLE}."ID_LIDER_AVALIADOR" ;;
  }

  dimension: id_participacao_pesquisa {
    type: number
    sql: ${TABLE}."ID_PARTICIPACAO_PESQUISA" ;;
  }

  dimension: id_pesquisa {
    type: number
    sql: ${TABLE}."ID_PESQUISA" ;;
  }

  dimension: lista_subordinados_ativos_avaliado {
    type: string
    sql: ${TABLE}."LISTA_SUBORDINADOS_ATIVOS_AVALIADO" ;;
  }

  dimension: lista_subordinados_ativos_avaliador {
    type: string
    sql: ${TABLE}."LISTA_SUBORDINADOS_ATIVOS_AVALIADOR" ;;
  }

  dimension: lista_subordinados_avaliado {
    type: string
    sql: ${TABLE}."LISTA_SUBORDINADOS_AVALIADO" ;;
  }

  dimension: lista_subordinados_avaliador {
    type: string
    sql: ${TABLE}."LISTA_SUBORDINADOS_AVALIADOR" ;;
  }

  dimension: nome_avaliado {
    type: string
    sql: ${TABLE}."NOME_AVALIADO" ;;
  }

  dimension: nome_avaliador {
    type: string
    sql: ${TABLE}."NOME_AVALIADOR" ;;
  }

  dimension: perc_completa {
    type: number
    sql: ${TABLE}."PERC_COMPLETA" ;;
  }

  dimension: relacionamento {
    type: string
    sql: ${TABLE}."RELACIONAMENTO" ;;
  }

  dimension: relacionamento_avaliado {
    type: string
    sql: ${TABLE}."RELACIONAMENTO_AVALIADO" ;;
  }

  dimension: relacionamento_avaliador {
    type: string
    sql: ${TABLE}."RELACIONAMENTO_AVALIADOR" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: status_avaliacao {
    type: string
    sql: ${TABLE}."STATUS_AVALIACAO" ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
