# The name of this view in Looker is "Enps"
view: enps {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."ENPS"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Analise" in Explore.

   dimension: analise {
    type: string
    sql: ${TABLE}."ANALISE" ;;
    hidden: yes
  }

  dimension: area {
    type: string
    sql: ${TABLE}."AREA" ;;
    label: "Área do Colaborador"
    description: "Indica a área em que o colaborador trabalha."
  }

  dimension: colab_nps {
    type: string
    sql: ${TABLE}."COLAB_NPS" ;;
    label: "Classificação do NPS"
    description: "Indica se a avaliação do colaborador foi positiva (promotor), negativa (detrator) ou neutra."
  }

  dimension_group: data_fim_pesquisa {
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
    sql: ${TABLE}."DATA_FIM_PESQUISA" ;;
    label: "Fim da Pesquisa"
    description: "Dia que a pesquisa foi encerrada."
  }

  dimension_group: data_hora_fim {
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
    sql: ${TABLE}."DATA_HORA_FIM" ;;
    label: "Fim da Resposta"
    description: "Data em que o colaborador terminou de preencher a pesquisa."
  }

  dimension_group: data_hora_inicio {
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
    sql: ${TABLE}."DATA_HORA_INICIO" ;;
    label: "Início da Resposta"
    description: "Data em que o colaborador começou a preencher a pesquisa."
  }

  dimension_group: data_inicio_pesquisa {
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
    sql: ${TABLE}."DATA_INICIO_PESQUISA" ;;
    label: "Início da Pesquisa"
    description: "Dia que a pesquisa foi iniciada."
  }

  dimension: id_pergunta {
    type: number
    sql: ${TABLE}."ID_PERGUNTA" ;;
    hidden: yes
  }

  dimension: id_pesquisa {
    type: number
    sql: ${TABLE}."ID_PESQUISA" ;;
    hidden: yes
  }

  dimension: id_resposta {
    type: number
    sql: ${TABLE}."ID_RESPOSTA" ;;
    primary_key: yes
    hidden: yes
  }

  dimension: id_tema {
    type: number
    sql: ${TABLE}."ID_TEMA" ;;
    hidden: yes
  }

  dimension: nps {
    type: number
    sql: ${TABLE}."NPS" ;;
    label: "NPS"
    description: "Nota de NPS do colaborador."
  }

  dimension: objetivo {
    type: string
    sql: ${TABLE}."OBJETIVO" ;;
    label: "Objetivo da Pesquisa"
    description: "Indica se a pesqusia foi feita para colaboradores novos (Onboarding) ou para os demais."
  }

  dimension: pergunta {
    type: string
    sql: ${TABLE}."PERGUNTA" ;;
    label: "Texto da Pergunta"
    description: "Indica o texto da pergunta feita ao colaborador."
  }

  dimension: responsavel {
    type: string
    sql: ${TABLE}."RESPONSAVEL" ;;
    label: "Responsável pela Pesquisa"
    description: "Indica o responsável pela pesquisa."
  }

  dimension: tema {
    type: string
    sql: ${TABLE}."TEMA" ;;
    label: "Tema da Pergunta"
    description: "Indica o tema geral da pergunta feita ao colaborador."
  }

  dimension: tempo_casa {
    type: string
    sql: ${TABLE}."TEMPO_CASA" ;;
    label: "Tempo de Casa"
    description: "Indica a quanto tempo, aproximadamente, o colaborador está no PRAVALER."
  }

  dimension: tempo_casa_sort {
    label: "Tempo de Casa (Ordenação)"
    type: number
    sql: CASE ${TABLE}."TEMPO_CASA"
      WHEN '3 meses ou menos' THEN 1
      WHEN 'Entre 4 e 6 meses' THEN 2
      WHEN 'Entre 7 e 11 meses' THEN 3
      WHEN 'Entre 1 ano e 1 ano e 11 meses' THEN 4
      WHEN '2 anos ou mais'  THEN 5
      ELSE 0
    END;;
    description: "Este campo é uma regra de negócio*. Indica a ordenadação de 1 à 5 a faixa de tempo do Pravalente. Então: 3 meses ou menos = 1; entre 4 e 6 meses = 2; entre 7 e 11 = 3; entre 1 ano e 1 ano e 11 meses = 4; 2 anos ou mais = 5; e caso contrário, não atender essas regras o valor será = 0"
  }

  dimension: ano_ingresso {
    type: string
    sql: ${TABLE}."ANO_INGRESSO" ;;
    label: "Ano de Ingresso"
    description: "Indica o ano de ingresso do funcionário no PRAVALER."
  }


  dimension: trimestre_ingresso {
    type: string
    sql: ${TABLE}."TRIMESTRE_INGRESSO" ;;
    label: "Trimestre de Ingresso"
    description: "Indica o trimestre de ingresso do funcionário no PRAVALER."
  }

  dimension: valor {
    type: string
    sql: ${TABLE}."VALOR" ;;
    label: "Valor da Resposta"
    description: "Texto da resposta do colaborador."
  }

  dimension: respondentes {
    type: number
    sql: case when ${id_tema} = 2 then 1 else 0 end ;;
    hidden: yes
  }

  dimension: detratores {
    type: number
    sql: case when ${colab_nps} = 'DETRATOR' then 1 else 0 end ;;
    hidden: yes
  }

  dimension: promotores {
    type: number
    sql: case when ${colab_nps} = 'PROMOTOR' then 1 else 0 end ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
    label: "Quantidade de Linhas"
    description: "Contagem de linhas da tabela."
  }

  measure: sum_respondetes {
    type: count_distinct
    sql: ${id_resposta};;
    filters: [id_tema: "2"]
    label: "Quantidade de Respondentes"
    description: "Contagem distinsta de respostas."
  }

  # measure: sum_respondetes {
  #   type: sum_distinct
  #   sql: ${respondentes};;
  #   sql_distinct_key: ${id_resposta} ;;
  #   label: "Quantidade de Respondentes"
  #   description: "Contagem distinsta de respostas."
  # }

  measure: sum_detratores {
    type: sum_distinct
    sql: ${detratores} ;;
    sql_distinct_key: ${id_resposta} ;;
    label: "Quantidade de Detratores"
    description: "Contagem distinta de respostas que deram nota menor que 7 no NPS."
  }

  measure: sum_promotores {
    type: sum_distinct
    sql: ${promotores} ;;
    sql_distinct_key: ${id_resposta} ;;
    label: "Quantidade de Promotores"
    description: "Contagem distinta de respostas que deram nota superior a 8 no NPS."
  }

  measure: nps_valor {
    type: number
    sql: 100*((${sum_promotores} - ${sum_detratores})/${sum_respondetes}) ;;
    value_format: "#"
    label: "e-NPS"
    description: "Nota final do NPS, calculada como a diferença entre os promotores e os detratodres divido pelo total de respondentes."
  }
}
