view: solucx {
  derived_table: {
    sql: select
        solucx."JOURNEY" as jornada,
        solucx."TIMESTAMP" as data_envio_pesquisa,
        solucx."STORE_NAME" as grupo_pesquisa,
        solucx."CUSTOMER_CPF" as cpf_aluno,
        solucx."CUSTOMER_EMAIL" as email_aluno,
        solucx."CUSTOMER_NAME" as nome_aluno,
        solucx."CUSTOMER_PHONE" as telefone_aluno,
        solucx."RATING_COMMENT" as comentario_pesquisa,
        solucx."RATING_ATENDIMENTO_ALUNOS" as motivo_atendimento_alunos,
        solucx."RATING_PRODUTOS" as motivo_produtos,
        solucx."RATING_PROCESSO_APROVACAO" as motivo_processo_aprovacao,
        solucx."RATING_CADASTRO" as motivo_cadastro,
        solucx."RATING_RESOLUTIVIDADE" as motivo_resolutividade,
        solucx."RATING_ACESSIBILIDADE" as motivo_acessibilidade,
        solucx."RATING_COMUNICACAO" as motivo_comunicacao,
        solucx."RATING_PAGAMENTO" as motivo_pagamento,
        solucx."RATING_CLAREZA" as motivo_clareza,
        solucx."RATING_CANAIS" as motivo_canais,
        solucx."RATING_CONTRATACAO" as motivo_contratacao,
        solucx."RATING_ATENDIMENTO" as motivo_atendimento,
        solucx."RATING_SOURCE" as canal_pesquisa,
        solucx."RATING_TIMESTAMP" as data_resposta_pesquisa,
        solucx."RATING_VALUE" as nota_pesquisa,
        solucx."CLASS_NOTA" as promotor_detrator
      from "FATO"."SOLUCX_TRANSACTION" as solucx
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension: jornada {
    type: string
    group_label: "Dados da Pesquisa"
    group_item_label: "Jornada"
    description: "Tipo de jornada que o aluno está participando."
    sql: ${TABLE}."JORNADA" ;;
  }

  dimension: grupo_pesquisa {
    type: string
    group_label: "Dados da Pesquisa"
    group_item_label: "Grupo Pesquisa"
    description: "Grupo da pesquisa. (Relacional ou Transacional)"
    sql: ${TABLE}."GRUPO_PESQUISA" ;;
  }

  dimension: comentario_pesquisa {
    type: string
    group_label: "Dados da Pesquisa"
    group_item_label: "Comentário da Pesquisa"
    description: "Comentário do aluno."
    sql: ${TABLE}."COMENTARIO_PESQUISA" ;;
  }

  dimension: nota_pesquisa {
    type: number
    group_label: "Dados da Pesquisa"
    group_item_label: "Nota da Pesquisa"
    description: "Nota de recomendação do aluno."
    sql: ${TABLE}."NOTA_PESQUISA" ;;
  }

  dimension: promotor_detrator {
    type: string
    group_label: "Dados da Pesquisa"
    group_item_label: "Tipo de aluno - Promotor/Detrator"
    description: "Tipo do aluno de acordo com a sua nota de recomendação (0-6 = detrator, 7 e 8 = neutro, 9 e 10 = promotor)."
    sql: ${TABLE}."PROMOTOR_DETRATOR" ;;
  }

  dimension: canal_pesquisa {
    type: string
    group_label: "Dados da Pesquisa"
    group_item_label: "Canal da Pesquisa"
    description: "Canal de disparo da pesquisa."
    sql: ${TABLE}."CANAL_PESQUISA" ;;
  }

  dimension: cpf_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "CPF do Aluno"
    description: "Número do CPF do aluno."
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  dimension: email_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "E-mail do Aluno"
    description: "E-mail do aluno."
    sql: ${TABLE}."EMAIL_ALUNO" ;;
  }

  dimension: nome_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Nome do Aluno"
    description: "Nome do aluno."
    sql: ${TABLE}."NOME_ALUNO" ;;
  }

  dimension: telefone_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Telefone do Aluno"
    description: "Número do telefone do aluno."
    sql: ${TABLE}."TELEFONE_ALUNO" ;;
  }

  dimension: motivo_atendimento_alunos {
    type: string
    group_label: "Motivos"
    group_item_label: "Atendimento Alunos"
    description: "Como o aluno avalia o Atendimento ao Aluno."
    sql: ${TABLE}."MOTIVO_ATENDIMENTO_ALUNOS" ;;
  }

  dimension: motivo_produtos {
    type: string
    group_label: "Motivos"
    group_item_label: "Produtos"
    description: "Como o aluno avalia os Produtos."
    sql: ${TABLE}."MOTIVO_PRODUTOS" ;;
  }

  dimension: motivo_processo_aprovacao {
    type: string
    group_label: "Motivos"
    group_item_label: "Processo Aprovação"
    description: "Como o aluno avalia o Processo de Aprovação."
    sql: ${TABLE}."MOTIVO_PROCESSO_APROVACAO" ;;
  }

  dimension: motivo_cadastro {
    type: string
    group_label: "Motivos"
    group_item_label: "Cadastro"
    description: "Como o aluno avalia o Cadastro."
    sql: ${TABLE}."MOTIVO_CADASTRO" ;;
  }

  dimension: motivo_resolutividade {
    type: string
    group_label: "Motivos"
    group_item_label: "Resolutividade"
    description: "Como o aluno avalia a Resolutividade."
    sql: ${TABLE}."MOTIVO_RESOLUTIVIDADE" ;;
  }

  dimension: motivo_acessibilidade {
    type: string
    group_label: "Motivos"
    group_item_label: "Acessibilidade"
    description: "Como o aluno avalia a Acessibilidade."
    sql: ${TABLE}."MOTIVO_ACESSIBILIDADE" ;;
  }

  dimension: motivo_comunicacao {
    type: string
    group_label: "Motivos"
    group_item_label: "Comunicação"
    description: "Como o aluno avalia a Comunicação."
    sql: ${TABLE}."MOTIVO_COMUNICACAO" ;;
  }

  dimension: motivo_pagamento {
    type: string
    group_label: "Motivos"
    group_item_label: "Pagamento"
    description: "Como o aluno avalia o Pagamento."
    sql: ${TABLE}."MOTIVO_PAGAMENTO" ;;
  }

  dimension: motivo_clareza {
    type: string
    group_label: "Motivos"
    group_item_label: "Clareza"
    description: "Como o aluno avalia a Clareza."
    sql: ${TABLE}."MOTIVO_CLAREZA" ;;
  }

  dimension: motivo_canais {
    type: string
    group_label: "Motivos"
    group_item_label: "Canais"
    description: "Como o aluno avalia os Canais."
    sql: ${TABLE}."MOTIVO_CANAIS" ;;
  }

  dimension: motivo_contratacao {
    type: string
    group_label: "Motivos"
    group_item_label: "Contratação"
    description: "Como o aluno avalia a Contratação."
    sql: ${TABLE}."MOTIVO_CONTRATACAO" ;;
  }

  dimension: motivo_atendimento {
    type: string
    group_label: "Motivos"
    group_item_label: "Atendimento"
    description: "Como o aluno avalia o Atendimento."
    sql: ${TABLE}."MOTIVO_ATENDIMENTO" ;;
  }

  dimension_group: data_envio_pesquisa {
    type: time
    sql: ${TABLE}."DATA_ENVIO_PESQUISA" ;;
  }

  dimension_group: data_resposta_pesquisa {
    type: time
    sql: ${TABLE}."DATA_RESPOSTA_PESQUISA" ;;
  }



  set: detail {
    fields: [
      jornada,
      data_envio_pesquisa_time,
      grupo_pesquisa,
      cpf_aluno,
      email_aluno,
      nome_aluno,
      telefone_aluno,
      comentario_pesquisa,
      motivo_atendimento_alunos,
      motivo_produtos,
      motivo_processo_aprovacao,
      motivo_cadastro,
      motivo_resolutividade,
      motivo_acessibilidade,
      motivo_comunicacao,
      motivo_pagamento,
      motivo_clareza,
      motivo_canais,
      motivo_contratacao,
      motivo_atendimento,
      canal_pesquisa,
      data_resposta_pesquisa_time,
      nota_pesquisa,
      promotor_detrator
    ]
  }
}
