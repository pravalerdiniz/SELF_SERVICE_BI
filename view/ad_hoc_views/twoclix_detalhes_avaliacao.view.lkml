view: twoclix_detalhes_avaliacao {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.TWOCLIX_DETALHES_AVALIACAO
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cod_avaliacao {
    type: number
    label: "Codigo Avaliação"
    sql: ${TABLE}."COD_AVALIACAO" ;;
  }

  dimension: vl_nota {
    type: number
    label: "Nota"
    sql: ${TABLE}."VL_NOTA" ;;
  }

  measure: nota_media {
    type: average
    label: "Nota Média"
    sql: ${TABLE}."vl_nota" ;;
  }

  dimension: vl_nota_sem_ncg {
    type: number
    label: "Nota sem NCG"
    description: "NOTA_SEM_NCG = Nota Sem Não Conformidade Grave"
    sql: ${TABLE}."VL_NOTA_SEM_NCG" ;;
  }

  measure: nota_media_sem_ncg {
    type: average
    label: "Nota Média sem NCG"
    sql: ${TABLE}."vl_nota_sem_ncg" ;;
  }

  dimension: peso_nota {
    type: number
    sql: ${TABLE}."PESO_NOTA" ;;
  }

  dimension: resposta {
    type: string
    sql: ${TABLE}."RESPOSTA" ;;
  }

  dimension: tipo_resposta {
    type: string
    sql: ${TABLE}."TIPO_RESPOSTA" ;;
  }

  dimension: grupo {
    type: string
    sql: ${TABLE}."GRUPO" ;;
  }

  dimension: pergunta {
    type: string
    sql: ${TABLE}."PERGUNTA" ;;
  }

  dimension: situacao {
    type: string
    sql: ${TABLE}."SITUACAO" ;;
  }

  dimension: comentario_avaliador {
    type: string
    sql: ${TABLE}."COMENTARIO_AVALIADOR" ;;
  }

  dimension: detalhes_resposta {
    type: string
    sql: ${TABLE}."DETALHES_RESPOSTA" ;;
  }

  set: detail {
    fields: [
      cod_avaliacao,
      vl_nota,
      vl_nota_sem_ncg,
      peso_nota,
      resposta,
      tipo_resposta,
      grupo,
      pergunta,
      situacao,
      comentario_avaliador,
      detalhes_resposta
    ]
  }
}
