# The name of this view in Looker is "Gupy Candidaturas"
view: gupy_candidaturas {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."GUPY_CANDIDATURAS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Avaliadores Vaga" in Explore.

  dimension: avaliadores_vaga {
    type: string
    sql: ${TABLE}."AVALIADORES_VAGA" ;;
  }

  dimension: campos_personalizados_vaga {
    type: string
    sql: ${TABLE}."CAMPOS_PERSONALIZADOS_VAGA" ;;
  }

  dimension: cd_vaga {
    type: string
    sql: ${TABLE}."CD_VAGA" ;;
  }

  dimension: cidade_candidato {
    type: string
    sql: ${TABLE}."CIDADE_CANDIDATO" ;;
  }

  dimension: cidade_vaga {
    type: string
    sql: ${TABLE}."CIDADE_VAGA" ;;
  }

  dimension: codigos_vaga {
    type: string
    sql: ${TABLE}."CODIGOS_VAGA" ;;
  }

  dimension: criterios_avaliacao_vaga {
    type: string
    sql: ${TABLE}."CRITERIOS_AVALIACAO_VAGA" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_nasc_candidato {
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
    sql: ${TABLE}."DATA_NASC_CANDIDATO" ;;
  }

  dimension: deficiencias {
    type: string
    sql: ${TABLE}."DEFICIENCIAS" ;;
  }

  dimension_group: dt_aprovacao_vaga {
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
    sql: ${TABLE}."DT_APROVACAO_VAGA" ;;
  }

  dimension_group: dt_atualizacao_candidatura {
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
    sql: ${TABLE}."DT_ATUALIZACAO_CANDIDATURA" ;;
  }

  dimension_group: dt_atualizacao_vaga {
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
    sql: ${TABLE}."DT_ATUALIZACAO_VAGA" ;;
  }

  dimension_group: dt_cancelamento_vaga {
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
    sql: ${TABLE}."DT_CANCELAMENTO_VAGA" ;;
  }

  dimension_group: dt_candidatura {
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
    sql: ${TABLE}."DT_CANDIDATURA" ;;
  }

  dimension_group: dt_congelamento_vaga {
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
    sql: ${TABLE}."DT_CONGELAMENTO_VAGA" ;;
  }

  dimension_group: dt_contratacao {
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
    sql: ${TABLE}."DT_CONTRATACAO" ;;
  }

  dimension_group: dt_criacao_vaga {
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
    sql: ${TABLE}."DT_CRIACAO_VAGA" ;;
  }

  dimension_group: dt_deadline_candidatura {
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
    sql: ${TABLE}."DT_DEADLINE_CANDIDATURA" ;;
  }

  dimension_group: dt_descongelamento_vaga {
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
    sql: ${TABLE}."DT_DESCONGELAMENTO_VAGA" ;;
  }

  dimension_group: dt_finalizacao_candidatura {
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
    sql: ${TABLE}."DT_FINALIZACAO_CANDIDATURA" ;;
  }

  dimension_group: dt_publicacao {
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
    sql: ${TABLE}."DT_PUBLICACAO" ;;
  }

  dimension_group: dt_registro_entrada_etapa {
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
    sql: ${TABLE}."DT_REGISTRO_ENTRADA_ETAPA" ;;
  }

  dimension: escolaridade_candidato {
    type: string
    sql: ${TABLE}."ESCOLARIDADE_CANDIDATO" ;;
  }

  dimension: estado_candidato {
    type: string
    sql: ${TABLE}."ESTADO_CANDIDATO" ;;
  }

  dimension: estado_vaga {
    type: string
    sql: ${TABLE}."ESTADO_VAGA" ;;
  }

  dimension: etapas_vagas {
    type: string
    sql: ${TABLE}."ETAPAS_VAGAS" ;;
  }

  dimension: flg_cadastro_completo {
    type: yesno
    sql: ${TABLE}."FLG_CADASTRO_COMPLETO" ;;
  }

  dimension: flg_deficiencia {
    type: yesno
    sql: ${TABLE}."FLG_DEFICIENCIA" ;;
  }

  dimension: flg_feedback {
    type: yesno
    sql: ${TABLE}."FLG_FEEDBACK" ;;
  }

  dimension: flg_funcionario {
    type: yesno
    sql: ${TABLE}."FLG_FUNCIONARIO" ;;
  }

  dimension: flg_indicacao {
    type: yesno
    sql: ${TABLE}."FLG_INDICACAO" ;;
  }

  dimension: flg_vaga_deficiencia {
    type: yesno
    sql: ${TABLE}."FLG_VAGA_DEFICIENCIA" ;;
  }

  dimension: genero_candidato {
    type: string
    sql: ${TABLE}."GENERO_CANDIDATO" ;;
  }

  dimension: id_candidato {
    type: number
    sql: ${TABLE}."ID_CANDIDATO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_id_candidato {
    type: sum
    sql: ${id_candidato} ;;
  }

  measure: average_id_candidato {
    type: average
    sql: ${id_candidato} ;;
  }

  dimension: id_candidatura {
    type: number
    sql: ${TABLE}."ID_CANDIDATURA" ;;
  }

  dimension: id_etapa_atual {
    type: number
    sql: ${TABLE}."ID_ETAPA_ATUAL" ;;
  }

  dimension: id_vaga {
    type: number
    sql: ${TABLE}."ID_VAGA" ;;
  }

  dimension: indicado_por {
    type: string
    sql: ${TABLE}."INDICADO_POR" ;;
  }

  dimension: metodo_fluxo_requerido {
    type: string
    sql: ${TABLE}."METODO_FLUXO_REQUERIDO" ;;
  }

  dimension: motivo_cancelamento_vaga {
    type: string
    sql: ${TABLE}."MOTIVO_CANCELAMENTO_VAGA" ;;
  }

  dimension: motivo_declinio {
    type: string
    sql: ${TABLE}."MOTIVO_DECLINIO" ;;
  }

  dimension: motivo_vaga {
    type: string
    sql: ${TABLE}."MOTIVO_VAGA" ;;
  }

  dimension: nm_candidato {
    type: string
    sql: ${TABLE}."NM_CANDIDATO" ;;
  }

  dimension: nm_criador {
    type: string
    sql: ${TABLE}."NM_CRIADOR" ;;
  }

  dimension: nm_depto {
    type: string
    sql: ${TABLE}."NM_DEPTO" ;;
  }

  dimension: nm_etapa_atual {
    type: string
    sql: ${TABLE}."NM_ETAPA_ATUAL" ;;
  }

  dimension: nm_funcao {
    type: string
    sql: ${TABLE}."NM_FUNCAO" ;;
  }

  dimension: nm_gerente {
    type: string
    sql: ${TABLE}."NM_GERENTE" ;;
  }

  dimension: nm_parceiro {
    type: string
    sql: ${TABLE}."NM_PARCEIRO" ;;
  }

  dimension: nm_recrutador {
    type: string
    sql: ${TABLE}."NM_RECRUTADOR" ;;
  }

  dimension: nm_vaga {
    type: string
    sql: ${TABLE}."NM_VAGA" ;;
  }

  dimension: nota_cancelamento_vaga {
    type: string
    sql: ${TABLE}."NOTA_CANCELAMENTO_VAGA" ;;
  }

  dimension: nro_vagas {
    type: number
    sql: ${TABLE}."NRO_VAGAS" ;;
  }

  dimension: origem_candidatura {
    type: string
    sql: ${TABLE}."ORIGEM_CANDIDATURA" ;;
  }

  dimension: pais_candidato {
    type: string
    sql: ${TABLE}."PAIS_CANDIDATO" ;;
  }

  dimension: pais_vaga {
    type: string
    sql: ${TABLE}."PAIS_VAGA" ;;
  }

  dimension: perguntas_adicionais {
    type: string
    sql: ${TABLE}."PERGUNTAS_ADICIONAIS" ;;
  }

  dimension: salario_estimativa_final {
    type: number
    sql: ${TABLE}."SALARIO_ESTIMATIVA_FINAL" ;;
  }

  dimension: salario_estimativa_inicial {
    type: number
    sql: ${TABLE}."SALARIO_ESTIMATIVA_INICIAL" ;;
  }

  dimension: salario_moeda {
    type: string
    sql: ${TABLE}."SALARIO_MOEDA" ;;
  }

  dimension: status_candidatura {
    type: string
    sql: ${TABLE}."STATUS_CANDIDATURA" ;;
  }

  dimension: status_etapa_atual {
    type: string
    sql: ${TABLE}."STATUS_ETAPA_ATUAL" ;;
  }

  dimension: status_indicacao {
    type: string
    sql: ${TABLE}."STATUS_INDICACAO" ;;
  }

  dimension: status_vaga {
    type: string
    sql: ${TABLE}."STATUS_VAGA" ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}."TAGS" ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  dimension: tipo_contratacao {
    type: string
    sql: ${TABLE}."TIPO_CONTRATACAO" ;;
  }

  dimension: tipo_publicacao {
    type: string
    sql: ${TABLE}."TIPO_PUBLICACAO" ;;
  }

  dimension: trabalho_remoto {
    type: yesno
    sql: ${TABLE}."TRABALHO_REMOTO" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
