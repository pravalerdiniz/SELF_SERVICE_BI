view: interacoes_detalhes_ligacao {
  derived_table: {
    persist_for: "1 hour"
    sql: select a.id_ticket,
      (f.value:"DATA_LIGACAO"::timestamp)  as DATA_LIGACAO,
      f.value:"DURACAO_CHAMADA"::varchar as DURACAO_CHAMADA,
      f.value:"FILA_ATENDIMENTO"::varchar as FILA_ATENDIMENTO,
      f.value:"ID_LIGACAO"::varchar as ID_LIGACAO,
      --f.value:"HORARIO_ENTRADA_LIGACAO"::time as HORARIO_ENTRADA_LIGACAO,
      f.value:"NOME_AGENTE"::varchar as NOME_AGENTE,
      f.value:"TEMPO_ESPERA_ATE_ATENDIMENTO"::varchar as TEMPO_ESPERA_ATE_ATENDIMENTO,
      f.value:"TEMPO_FALADO"::varchar as TEMPO_FALADO,
      f.value:"TEMPO_URA"::varchar as TEMPO_URA,
      f.value:"CAMINHO_URA"::varchar as CAMINHO_URA,
      f.value:"TIPO_CONEXAO"::varchar as TIPO_CONEXAO,
    f.value:"DURACAO_CHAMADA_SEG"::int as DURACAO_CHAMADA_SEG,
    f.value:"TEMPO_ESPERA_ATE_ATENDIMENTO_SEG"::int as TEMPO_ESPERA_ATE_ATENDIMENTO_SEG,
    f.value:"TEMPO_FALADO_SEG"::int as TEMPO_FALADO_SEG,
    f.value:"TEMPO_URA_SEG"::int as TEMPO_URA_SEG,
    f.value:"TIPO_LIGACAO"::varchar as TIPO_LIGACAO,
    f.value:"TIPO_LIGACAO_PRV"::varchar as TIPO_LIGACAO_PRV,
    f.value:"TIPO_QUESTIONARIO"::string as TIPO_QUESTIONARIO,
    f.value:"PERGUNTA_1"::int as PERGUNTA_1,
    f.value:"PERGUNTA_2"::int as PERGUNTA_2,
    f.value:"PERGUNTA_3"::int as PERGUNTA_3
      from "GRADUADO"."SELF_SERVICE_BI"."INTERACOES" a,
      lateral flatten (input => detalhes_ligacao) f
       ;;


    }

    measure: count {
      type: count
      label: "Quantidade de Ligações"
      drill_fields: [detail*]
    }

    measure: DURACAO_CHAMADA_SEG{
      type: sum
      sql: ${TABLE}."DURACAO_CHAMADA_SEG"/ 86400.0;;
      group_label: "Tempos de Atendimento"
      label: "Tempo Total - Duração da Chamada"
      description: "Soma do tempo falado da ligação."
      value_format: "[hh]:mm:ss"

    }

    measure: medio_duracao_chamada_seg {
      type: average
      sql: ${TABLE}."DURACAO_CHAMADA_SEG"/ 86400.0;;
      group_label: "Tempos de Atendimento"
      label: "Tempo Médio - Duração da Chamada"
      description: "Média do tempo de duração da chamada"
      value_format: "[hh]:mm:ss"

    }




    measure: TEMPO_ESPERA_ATE_ATENDIMENTO_SEG{
      type: sum
      group_label: "Tempos de Atendimento"
      label: "Tempo Total - Espera"
      description: "Soma do tempo espera até atendimento da ligação."
      sql: ${TABLE}."TEMPO_ESPERA_ATE_ATENDIMENTO_SEG"/ 86400.0;;
      value_format: "[hh]:mm:ss"
    }


    measure: medio_tempo_espera_ate_atendimento {
      type: average
      sql: ${TABLE}."TEMPO_ESPERA_ATE_ATENDIMENTO_SEG"/ 86400.0;;
      group_label: "Tempos de Atendimento"
      label: "Tempo Médio - Espera"
      description: "Média do tempo de espera até o atendimento chamada"
      value_format: "[hh]:mm:ss"


    }

    measure: TEMPO_FALADO_SEG{
      type: sum
      group_label: "Tempos de Atendimento"
      label: "Tempo Total - Falado"
      description: "Soma do tempo falado da ligação."
      sql: ${TABLE}."TEMPO_FALADO_SEG"/ 86400.0;;
      value_format: "[hh]:mm:ss"
    }


    measure: MEDIA_TEMPO_FALADO_SEG{
      type: average
      group_label: "Tempos de Atendimento"
      label: "Tempo Médio - Falado"
      description: "Soma do tempo falado da ligação."
      sql: ${TABLE}."TEMPO_FALADO_SEG"/ 86400.0;;
      value_format: "[hh]:mm:ss"
    }










    measure: TEMPO_URA_SEG{
      type: sum
      group_label: "Tempos de Atendimento"
      label: "Tempo Total -  URA"
      description: "Soma do tempo de ligação na URA."
      sql: ${TABLE}."TEMPO_URA_SEG"/ 86400.0;;
      value_format: "[hh]:mm:ss"
    }


    measure: medio_tempo_ura {
      type: average
      sql: ${TABLE}."TEMPO_URA_SEG"/ 86400.0;;
      group_label: "Tempos de Atendimento"
      label: "Tempo Médio - URA"
      description: "Média do tempo da URA"
      value_format: "[hh]:mm:ss"


    }

    dimension: id_ticket {
      type: number
      group_label: "Dados da Ligação"
      group_item_label: "ID Ticket - Zendesk"
      description: "Indica o ticket da ligação no Zendesk."
      sql: ${TABLE}."ID_TICKET" ;;
    }


    dimension: id_ligacao {
      type: string
      group_label: "Dados da Ligação"
      group_item_label: "ID Ligação"
      description: "Indica o ID da ligação na 55."
      sql: ${TABLE}."ID_LIGACAO" ;;
    }


    dimension_group: data_ligacao {
      type: time
      label: "Ligação"
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        quarter,
        year
      ]
      description: "Indica a data da ligação."
      sql: ${TABLE}."DATA_LIGACAO" ;;
    }

    dimension: tipo_questionario {
      type: string
      group_label: "Dados de Satisfação"
      group_item_label: "Tipo Questionário"
      description: "Indica a pesquisa que está sendo avaliada"
      sql: ${TABLE}."TIPO_QUESTIONARIO" ;;
    }

    dimension: pergunta_1 {
      type: number
      group_label: "Dados de Satisfação"
      group_item_label: "Nota 1. Resolução"
      description: "Conseguimos atender sua necessidade? Digite 1 para SIM e 2 para NÃO"
      sql: ${TABLE}."PERGUNTA_1" ;;
    }


    dimension: pergunta_2 {
      type: number
      group_label: "Dados de Satisfação"
      group_item_label: "Nota 2. Atendimento"
      description: "Como você avalia o atendimento do nosso Pravalente? Digite 3 para ótimo, 2 para regular e 1 para ruim."
      sql: ${TABLE}."PERGUNTA_2" ;;
    }


    dimension: pergunta_3 {
      type: number
      group_label: "Dados de Satisfação"
      group_item_label: "Nota 3. Pravaler"
      description: "De modo geral, como classifica sua experiência com o Pravaler? Lembrando que é 3 para ótimo, 2 para regular e 1 para ruim."
      sql: ${TABLE}."PERGUNTA_3" ;;
    }

    measure: pergunta_3_nota_1 {
      type: sum
      hidden: yes
      group_label: "Dados de Satisfação"
      group_item_label: "Terceira Pergunta - Notas 1 - Sim"
      description: "Indica a quantidade de notas 1, ou seja, respondentes Sim."
      sql:  case when ${pergunta_3}=1 then 1 else 0 end ;;
    }

    dimension: duracao_chamada {
      type: string
      group_label: "Tempos de Atendimento"
      label: "Duração da chamada"
      description: "Indica a duração da chamada em HH:MM:SS."
      sql: ${TABLE}."DURACAO_CHAMADA" ;;
    }

    dimension: fila_atendimento {
      type: string
      group_label: "Dados da Ligação"
      group_item_label: "Fila"
      description: "Indica a fila de atendimento durante a ligação."
      sql: ${TABLE}."FILA_ATENDIMENTO" ;;
    }

    dimension: nome_agente {
      type: string
      group_label: "Dados do Atendente"
      group_item_label: "Nome"
      description: "Indica o nome do atendente responsável pela ligação no ticket."
      sql: ${TABLE}."NOME_AGENTE" ;;
    }

    dimension: tempo_espera_ate_atendimento {
      type: string
      group_label: "Tempos de Atendimento"
      label: "Tempo de Espera"
      description: "Indica o tempo de espera da ligação até o atendimento em segundos."

      sql: ${TABLE}."TEMPO_ESPERA_ATE_ATENDIMENTO" ;;
    }

    dimension: tempo_falado {
      type: string
      group_label: "Tempos de Atendimento"
      label: "Tempo Falado"
      description: "Indica o tempo falado da ligação em segundos."
      sql: ${TABLE}."TEMPO_FALADO" ;;
    }

    dimension: tempo_ura {
      type: string
      group_label: "Tempos de Atendimento"
      label: "Tempo na URA"
      description: "Indica o tempo da ligação na URA em segundos"
      sql: ${TABLE}."TEMPO_URA" ;;
    }

    dimension: caminho_ura {
      type: string
      group_label: "Dados da Ligação"
      label: "Caminho da URA"
      description: "Indica o caminho da URA."
      sql: ${TABLE}."CAMINHO_URA" ;;
    }

    dimension: tipo_conexao {
      type: string
      group_label: "Dados da Ligação"
      label: "Tipo de Desconexão"
      description: "Indica se a ligação foi desconectada internamente pelo atendente ou externamente pelo aluno."
      sql: ${TABLE}."TIPO_CONEXAO" ;;
    }

    dimension: tipo_ligacao {
      type: string
      group_label: "Dados da Ligação"
      label: "Tipo de Ligação 55PBX"
      description: "Indica o tipo de ligação de acordo com a regra definida pela 55pbx."
      sql: ${TABLE}."TIPO_LIGACAO" ;;
    }

  dimension: tipo_ligacao_prv {
    type: string
    group_label: "Dados da Ligação"
    label: "Tipo de Ligação Pravaler"
    description: "Indica o tipo de ligação de acordo com a regra definida pela área de negócio."
    sql: ${TABLE}."TIPO_LIGACAO_PRV" ;;
  }


    set: detail {
      fields: [
        data_ligacao_date,
        data_ligacao_time,
        duracao_chamada,
        fila_atendimento,
        nome_agente,
        tempo_espera_ate_atendimento,
        tempo_falado,
        caminho_ura,
        tempo_ura,
        tipo_conexao,
        tipo_ligacao
      ]
    }


  }
