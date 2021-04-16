view: entrevista {
  sql_table_name: "GENTE_GESTAO"."ENTREVISTA"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: admissao {
    type: string
    sql: ${TABLE}."ADMISSAO" ;;
  }

  dimension: apoio_pessoas {
    type: string
    sql: ${TABLE}."APOIO_PESSOAS" ;;
  }

  dimension: area {
    type: string
    sql: ${TABLE}."AREA" ;;
  }

  dimension: autonomia {
    type: string
    sql: ${TABLE}."AUTONOMIA" ;;
  }

  dimension: categoria_cargo {
    type: string
    sql: ${TABLE}."CATEGORIA_CARGO" ;;
  }

  dimension: clareza_comunicacao {
    type: string
    sql: ${TABLE}."CLAREZA_COMUNICACAO" ;;
  }

  dimension: clareza_diretrizes_estrategia_pravaler {
    type: string
    sql: ${TABLE}."CLAREZA_DIRETRIZES_ESTRATEGIA_PRAVALER" ;;
  }

  dimension: confianca_lideranca {
    type: string
    sql: ${TABLE}."CONFIANCA_LIDERANCA" ;;
  }

  dimension: continuado_equipe_pravaler {
    type: string
    sql: ${TABLE}."CONTINUADO_EQUIPE_PRAVALER" ;;
  }

  dimension: cultura_colaboracao {
    type: string
    sql: ${TABLE}."CULTURA_COLABORACAO" ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}."DATA" ;;
  }

  dimension: desligamento_trabalhar_outra_empresa {
    type: string
    sql: ${TABLE}."DESLIGAMENTO_TRABALHAR_OUTRA_EMPRESA" ;;
  }

  dimension: entrevista {
    type: string
    sql: ${TABLE}."ENTREVISTA" ;;
  }

  dimension: fator_decisivo {
    type: string
    sql: ${TABLE}."FATOR_DECISIVO" ;;
  }

  dimension: fatores_considerar_proposta {
    type: string
    sql: ${TABLE}."FATORES_CONSIDERAR_PROPOSTA" ;;
  }

  dimension: feedbacks {
    type: string
    sql: ${TABLE}."FEEDBACKS" ;;
  }

  dimension: feedbacks_gestao {
    type: string
    sql: ${TABLE}."FEEDBACKS_GESTAO" ;;
  }

  dimension: foco_plano_claro {
    type: string
    sql: ${TABLE}."FOCO_PLANO_CLARO" ;;
  }

  dimension: havia_questionamentos {
    type: string
    sql: ${TABLE}."HAVIA_QUESTIONAMENTOS" ;;
  }

  dimension: lideranca_pravaler_inspiradora {
    type: string
    sql: ${TABLE}."LIDERANCA_PRAVALER_INSPIRADORA" ;;
  }

  dimension: meu_desenvolvimento {
    type: string
    sql: ${TABLE}."MEU_DESENVOLVIMENTO" ;;
  }

  dimension: oportunidade_desenvolvimento {
    type: string
    sql: ${TABLE}."OPORTUNIDADE_DESENVOLVIMENTO" ;;
  }

  dimension: por_que {
    type: string
    sql: ${TABLE}."POR_QUE" ;;
  }

  dimension: recebia_direcionamentos_atingir_resultados_trabalho {
    type: string
    sql: ${TABLE}."RECEBIA_DIRECIONAMENTOS_ATINGIR_RESULTADOS_TRABALHO" ;;
  }

  dimension: recomendaria_pravaler {
    type: number
    sql: ${TABLE}."RECOMENDARIA_PRAVALER" ;;
  }

  dimension: reconhecido_trabalho {
    type: string
    sql: ${TABLE}."RECONHECIDO_TRABALHO" ;;
  }

  dimension: tempo_casa {
    type: string
    sql: ${TABLE}."TEMPO_CASA" ;;
  }

  dimension: tipo_demissao {
    type: string
    sql: ${TABLE}."TIPO_DEMISSAO" ;;
  }

  dimension: ultimo_dia_trabalhado {
    type: string
    sql: ${TABLE}."ULTIMO_DIA_TRABALHADO" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
