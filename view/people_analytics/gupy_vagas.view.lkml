# The name of this view in Looker is "Gupy Vagas"
view: gupy_vagas {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."GUPY_VAGAS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Branch" in Explore.

  dimension: branch {
    type: string
    sql: ${TABLE}."BRANCH" ;;
  }

  dimension: cep {
    type: string
    sql: ${TABLE}."CEP" ;;
  }

  dimension: cidade {
    type: string
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: codigo {
    type: number
    sql: ${TABLE}."CODIGO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_codigo {
    type: sum
    sql: ${codigo} ;;
  }

  measure: average_codigo {
    type: average
    sql: ${codigo} ;;
  }

  dimension: codigo_interno {
    type: string
    sql: ${TABLE}."CODIGO_INTERNO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_aprovacao {
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
    sql: ${TABLE}."DATA_APROVACAO" ;;
  }

  dimension_group: data_cancelamento {
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
    sql: ${TABLE}."DATA_CANCELAMENTO" ;;
  }

  dimension_group: data_congelamento {
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
    sql: ${TABLE}."DATA_CONGELAMENTO" ;;
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

  dimension_group: data_descongelamento {
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
    sql: ${TABLE}."DATA_DESCONGELAMENTO" ;;
  }

  dimension_group: data_encerramento {
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
    sql: ${TABLE}."DATA_ENCERRAMENTO" ;;
  }

  dimension_group: data_fechamento_headcount {
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
    sql: ${TABLE}."DATA_FECHAMENTO_HEADCOUNT" ;;
  }

  dimension_group: data_publicacao {
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
    sql: ${TABLE}."DATA_PUBLICACAO" ;;
  }

  dimension_group: data_reprovacao {
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
    sql: ${TABLE}."DATA_REPROVACAO" ;;
  }

  dimension_group: data_ultima_atualizacao {
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
    sql: ${TABLE}."DATA_ULTIMA_ATUALIZACAO" ;;
  }

  dimension_group: data_ultima_inscricao {
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
    sql: ${TABLE}."DATA_ULTIMA_INSCRICAO" ;;
  }

  dimension: departamento {
    type: string
    sql: ${TABLE}."DEPARTAMENTO" ;;
  }

  dimension: email_criador {
    type: string
    sql: ${TABLE}."EMAIL_CRIADOR" ;;
  }

  dimension: email_gerente {
    type: string
    sql: ${TABLE}."EMAIL_GERENTE" ;;
  }

  dimension: email_recrutador {
    type: string
    sql: ${TABLE}."EMAIL_RECRUTADOR" ;;
  }

  dimension: estado {
    type: string
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: estimativa_final_salario {
    type: number
    sql: ${TABLE}."ESTIMATIVA_FINAL_SALARIO" ;;
  }

  dimension: estimativa_inicial_salario {
    type: number
    sql: ${TABLE}."ESTIMATIVA_INICIAL_SALARIO" ;;
  }

  dimension: flg_atingiu_headcount {
    type: yesno
    sql: ${TABLE}."FLG_ATINGIU_HEADCOUNT" ;;
  }

  dimension: flg_deficiencia {
    type: yesno
    sql: ${TABLE}."FLG_DEFICIENCIA" ;;
  }

  dimension: flg_remoto {
    type: yesno
    sql: ${TABLE}."FLG_REMOTO" ;;
  }

  dimension: funcao {
    type: string
    sql: ${TABLE}."FUNCAO" ;;
  }

  dimension: headcount {
    type: number
    sql: ${TABLE}."HEADCOUNT" ;;
  }

  dimension: logradouro {
    type: string
    sql: ${TABLE}."LOGRADOURO" ;;
  }

  dimension: motivo_cancelamento {
    type: string
    sql: ${TABLE}."MOTIVO_CANCELAMENTO" ;;
  }

  dimension: motivo_vaga {
    type: string
    sql: ${TABLE}."MOTIVO_VAGA" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: nome_criador {
    type: string
    sql: ${TABLE}."NOME_CRIADOR" ;;
  }

  dimension: nome_gerente {
    type: string
    sql: ${TABLE}."NOME_GERENTE" ;;
  }

  dimension: nome_recrutador {
    type: string
    sql: ${TABLE}."NOME_RECRUTADOR" ;;
  }

  dimension: nome_subsidiador {
    type: string
    sql: ${TABLE}."NOME_SUBSIDIADOR" ;;
  }

  dimension: nota_cancelamento {
    type: string
    sql: ${TABLE}."NOTA_CANCELAMENTO" ;;
  }

  dimension: obj_avaliadores {
    type: string
    sql: ${TABLE}."OBJ_AVALIADORES" ;;
  }

  dimension: obj_criterios_avaliacao {
    type: string
    sql: ${TABLE}."OBJ_CRITERIOS_AVALIACAO" ;;
  }

  dimension: obj_etapas {
    type: string
    sql: ${TABLE}."OBJ_ETAPAS" ;;
  }

  dimension: obj_informacoes_adicionais {
    type: string
    sql: ${TABLE}."OBJ_INFORMACOES_ADICIONAIS" ;;
  }

  dimension: pagina_carreira {
    type: string
    sql: ${TABLE}."PAGINA_CARREIRA" ;;
  }

  dimension: pais {
    type: string
    sql: ${TABLE}."PAIS" ;;
  }

  dimension_group: prazo_candidatura {
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
    sql: ${TABLE}."PRAZO_CANDIDATURA" ;;
  }

  dimension_group: prazo_contratacao {
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
    sql: ${TABLE}."PRAZO_CONTRATACAO" ;;
  }

  dimension: qtd_contratados {
    type: number
    sql: ${TABLE}."QTD_CONTRATADOS" ;;
  }

  dimension: qtd_desistencias {
    type: number
    sql: ${TABLE}."QTD_DESISTENCIAS" ;;
  }

  dimension: qtd_em_processo {
    type: number
    sql: ${TABLE}."QTD_EM_PROCESSO" ;;
  }

  dimension: qtd_inscritos {
    type: number
    sql: ${TABLE}."QTD_INSCRITOS" ;;
  }

  dimension: qtd_reprovados {
    type: number
    sql: ${TABLE}."QTD_REPROVADOS" ;;
  }

  dimension: salario_moeda {
    type: string
    sql: ${TABLE}."SALARIO_MOEDA" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  dimension: tipo_publicacao {
    type: string
    sql: ${TABLE}."TIPO_PUBLICACAO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
