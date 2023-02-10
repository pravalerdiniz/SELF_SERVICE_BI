view: ligacoes_55pbx {

  sql_table_name: "SELF_SERVICE_BI"."LIGACOES_55PBX"
    ;;

  dimension: caminho_ura {
    type: string
    group_label: "Dados da Ligação"
    group_item_label: "Caminho URA"
    description: "Indica a opção de caminho da URA."
    sql: ${TABLE}."CAMINHO_URA" ;;
  }

  dimension: cpf_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "CPF"
    description: "CPF do Aluno."
    sql: ${TABLE}."CPF_ALUNO" ;;
  }

  dimension: cpf_aluno_num {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "CPF Num"
    description: "CPF do Aluno (Numérico)."
    sql: ${TABLE}."CPF_ALUNO_NUM" ;;
  }

  dimension: custo_ligacao {
    type: number
    group_label: "Dados da Ligação"
    group_item_label: "Custo da Ligação"
    description: "Indica o custo da ligação."
    sql: ${TABLE}."CUSTO_LIGACAO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_ligacao {
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
    sql: ${TABLE}."DATA_LIGACAO" ;;
  }

  dimension: email_agente {
    type: string
    group_label: "Dados do Agente"
    group_item_label: "E-mail"
    description: "Indica o e-mail do Agente."
    sql: ${TABLE}."EMAIL_AGENTE" ;;
  }

  dimension: id_ligacao {
    type: string
    group_label: "Dados da Ligação"
    group_item_label: "Id Ligação"
    description: "Indica o ID da Ligação."
    sql: ${TABLE}."ID_LIGACAO" ;;
  }

  dimension: nome_agente {
    type: string
    group_label: "Dados do Agente"
    group_item_label: "Nome"
    description: "Indica o nome do Agente."
    sql: ${TABLE}."NOME_AGENTE" ;;
  }

  dimension: nome_fila {
    type: string
    group_label: "Dados da Ligação"
    group_item_label: "Fila"
    description: "Indica o nome da fila."
    sql: ${TABLE}."NOME_FILA" ;;
  }

  dimension: nome_questionario {
    type: string
    group_label: "Dados da Satisfação"
    group_item_label: "Questionário"
    description: "Indica o questionário da pesquisa."
    sql: ${TABLE}."NOME_QUESTIONARIO" ;;
  }

  dimension: numero_aluno {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Telefone"
    description: "Indica o número de telefone do aluno."
    sql: ${TABLE}."NUMERO_ALUNO" ;;
  }

  dimension: operacao {
    type: string
    group_label: "Dados da Ligação"
    group_item_label: "Operação"
    description: "Indica a operação que a ligação foi atendida."
    sql: ${TABLE}."OPERACAO" ;;
  }

  dimension: pergunta_1 {
    type: string
    group_label: "Dados da Satisfação"
    group_item_label: "Nota 1"
    description: "Indica a nota da primeira pergunta de satisfação."
    sql: ${TABLE}."PERGUNTA_1" ;;
  }

  dimension: pergunta_2 {
    type: string
    group_label: "Dados da Satisfação"
    group_item_label: "Nota 2"
    description: "Indica a nota da segunda pergunta de satisfação."
    sql: ${TABLE}."PERGUNTA_2" ;;
  }

  dimension: pergunta_3 {
    type: string
    group_label: "Dados da Satisfação"
    group_item_label: "Nota 3"
    description: "Indica a nota da terceira pergunta de satisfação."
    sql: ${TABLE}."PERGUNTA_3" ;;
  }

  dimension: retencao {
    type: string
    group_label: "Dados da Ligação"
    group_item_label: "Retenção"
    description: "Indica o tipo de retenção da ligação (Retida na URA, Abandonada, Atendida, etc)."
    sql: ${TABLE}."RETENCAO" ;;
  }



  # SOMA DAS MEDIDAS DE TEMPO
  measure: tempo_espera {
    type: sum
    group_label: "Métricas da Ligação"
    group_item_label: "Soma - Tempo Espera"
    description: "Tempo que o aluno esperou durante o atendimento."
    sql: ${TABLE}."TEMPO_ESPERA" ;;
  }

  measure: tempo_falado {
    type: sum
    group_label: "Métricas da Ligação"
    group_item_label: "Soma - Tempo Falado"
    description: "Tempo de Atendimento da ligação."
    sql: ${TABLE}."TEMPO_FALADO" ;;
  }

  measure: tempo_total_ligacao {
    type: sum
    group_label: "Métricas da Ligação"
    group_item_label: "Soma - Tempo Total Ligação"
    description: "Tempo total de atendimento, desde a URA até o encerramento do contato."
    sql: ${TABLE}."TEMPO_TOTAL_LIGACAO" ;;
  }

  measure: tempo_ura {
    type: sum
    group_label: "Métricas da Ligação"
    group_item_label: "Soma - Tempo URA"
    description: "Tempo que o aluno ficou na URA."
    sql: ${TABLE}."TEMPO_URA" ;;
  }


  # MÉDIA DAS MEDIDAS DE TEMPO
  measure: media_tempo_espera {
    type: average
    group_label: "Métricas da Ligação"
    group_item_label: "Média - Tempo Espera"
    description: "Tempo que o aluno esperou durante o atendimento."
    sql: ${TABLE}."TEMPO_ESPERA" ;;
  }

  measure: media_tempo_falado {
    type: average
    group_label: "Métricas da Ligação"
    group_item_label: "Média - Tempo Falado"
    description: "Tempo de Atendimento da ligação."
    sql: ${TABLE}."TEMPO_FALADO" ;;
  }

  measure: media_tempo_total_ligacao {
    type: average
    group_label: "Métricas da Ligação"
    group_item_label: "Média - Tempo Total Ligação"
    description: "Tempo total de atendimento, desde a URA até o encerramento do contato."
    sql: ${TABLE}."TEMPO_TOTAL_LIGACAO" ;;
  }

  measure: media_tempo_ura {
    type: average
    group_label: "Métricas da Ligação"
    group_item_label: "Média - Tempo URA"
    description: "Tempo que o aluno ficou na URA."
    sql: ${TABLE}."TEMPO_URA" ;;
  }

  dimension: tipo_contato {
    type: string
    group_label: "Dados da Ligação"
    group_item_label: "Tipo Contato"
    description: "Indica se o contato foi receptivo ou ativo."
    sql: ${TABLE}."TIPO_CONTATO" ;;
  }

  dimension: tipo_desconexao {
    type: string
    group_label: "Dados da Ligação"
    group_item_label: "Tipo Desconexão"
    description: "Indica se a ligação foi desligada pelo atendente ou pelo aluno."
    sql: ${TABLE}."TIPO_DESCONEXAO" ;;
  }

  dimension: retencao_original {
    type: string
    hidden: yes
    group_label: "Dados da Ligação"
    group_item_label: "Retenção (Original)"
    description: "Indica o tipo de retenção da ligação em inglês."
    sql: ${TABLE}."TIPO_LIGACAO" ;;
  }

  dimension: ultima_opcao_ura_descricao {
    type: string
    group_label: "Dados da Ligação"
    group_item_label: "Última opção URA"
    description: "Indica a última opção que o aluno escolheu na URA."
    sql: ${TABLE}."ULTIMA_OPCAO_URA_DESCRICAO" ;;
  }

  dimension: ultima_opcao_ura_ordinal {
    type: string
    group_label: "Dados da Ligação"
    group_item_label: "Última opção URA (Ordinal)"
    description: "Indica a última opção que o aluno escolheu na URA, de forma ordinal."
    sql: ${TABLE}."ULTIMA_OPCAO_URA_ORDINAL" ;;
  }

  dimension: ura_input_aluno_1 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 1"
    description: "Indica a 1ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_1" ;;
  }

  dimension: ura_input_aluno_10 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 10"
    description: "Indica a 10ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_10" ;;
  }

  dimension: ura_input_aluno_11 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 11"
    description: "Indica a 11ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_11" ;;
  }

  dimension: ura_input_aluno_12 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 12"
    description: "Indica a 12ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_12" ;;
  }

  dimension: ura_input_aluno_13 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 13"
    description: "Indica a 13ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_13" ;;
  }

  dimension: ura_input_aluno_14 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 14"
    description: "Indica a 14ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_14" ;;
  }

  dimension: ura_input_aluno_15 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 15"
    description: "Indica a 15ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_15" ;;
  }

  dimension: ura_input_aluno_16 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 16"
    description: "Indica a 16ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_16" ;;
  }

  dimension: ura_input_aluno_17 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 17"
    description: "Indica a 17ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_17" ;;
  }

  dimension: ura_input_aluno_18 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 18"
    description: "Indica a 18ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_18" ;;
  }

  dimension: ura_input_aluno_19 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 19"
    description: "Indica a 19ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_19" ;;
  }

  dimension: ura_input_aluno_2 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 2"
    description: "Indica a 2ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_2" ;;
  }

  dimension: ura_input_aluno_20 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 20"
    description: "Indica a 20ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_20" ;;
  }

  dimension: ura_input_aluno_21 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 21"
    description: "Indica a 21ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_21" ;;
  }

  dimension: ura_input_aluno_22 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 22"
    description: "Indica a 22ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_22" ;;
  }

  dimension: ura_input_aluno_23 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 23"
    description: "Indica a 23ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_23" ;;
  }

  dimension: ura_input_aluno_3 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 3"
    description: "Indica a 3ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_3" ;;
  }

  dimension: ura_input_aluno_4 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 4"
    description: "Indica a 4ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_4" ;;
  }

  dimension: ura_input_aluno_5 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 5"
    description: "Indica a 5ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_5" ;;
  }

  dimension: ura_input_aluno_6 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 6"
    description: "Indica a 6ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_6" ;;
  }

  dimension: ura_input_aluno_7 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 7"
    description: "Indica a 7ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_7" ;;
  }

  dimension: ura_input_aluno_8 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 8"
    description: "Indica a 8ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_8" ;;
  }

  dimension: ura_input_aluno_9 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input 9"
    description: "Indica a 9ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_ALUNO_9" ;;
  }

  dimension: ura_input_resultado_1 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 1"
    description: "Indica a 1ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_1" ;;
  }

  dimension: ura_input_resultado_10 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 10"
    description: "Indica a 10ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_10" ;;
  }

  dimension: ura_input_resultado_11 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 11"
    description: "Indica a 11ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_11" ;;
  }

  dimension: ura_input_resultado_12 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 12"
    description: "Indica a 12ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_12" ;;
  }

  dimension: ura_input_resultado_13 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 13"
    description: "Indica a 13ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_13" ;;
  }

  dimension: ura_input_resultado_14 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 14"
    description: "Indica a 14ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_14" ;;
  }

  dimension: ura_input_resultado_15 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 15"
    description: "Indica a 15ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_15" ;;
  }

  dimension: ura_input_resultado_16 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 16"
    description: "Indica a 16ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_16" ;;
  }

  dimension: ura_input_resultado_17 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 17"
    description: "Indica a 17ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_17" ;;
  }

  dimension: ura_input_resultado_18 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 18"
    description: "Indica a 18ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_18" ;;
  }

  dimension: ura_input_resultado_19 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 19"
    description: "Indica a 19ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_19" ;;
  }

  dimension: ura_input_resultado_2 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 2"
    description: "Indica a 2ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_2" ;;
  }

  dimension: ura_input_resultado_20 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 20"
    description: "Indica a 20ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_20" ;;
  }

  dimension: ura_input_resultado_21 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 21"
    description: "Indica a 21ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_21" ;;
  }

  dimension: ura_input_resultado_22 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 22"
    description: "Indica a 22ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_22" ;;
  }

  dimension: ura_input_resultado_23 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 23"
    description: "Indica a 23ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_23" ;;
  }

  dimension: ura_input_resultado_3 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 3"
    description: "Indica a 3ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_3" ;;
  }

  dimension: ura_input_resultado_4 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 4"
    description: "Indica a 4ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_4" ;;
  }

  dimension: ura_input_resultado_5 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 5"
    description: "Indica a 5ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_5" ;;
  }

  dimension: ura_input_resultado_6 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 6"
    description: "Indica a 6ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_6" ;;
  }

  dimension: ura_input_resultado_7 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 7"
    description: "Indica a 7ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_7" ;;
  }

  dimension: ura_input_resultado_8 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 8"
    description: "Indica a 8ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_8" ;;
  }

  dimension: ura_input_resultado_9 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Input Resultado 9"
    description: "Indica a 9ª opção da escolhida na URA."
    sql: ${TABLE}."URA_INPUT_RESULTADO_9" ;;
  }

  dimension: ura_opcao_1 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 1"
    description: "Indica a 1ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_1" ;;
  }

  dimension: ura_opcao_10 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 10"
    description: "Indica a 10ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_10" ;;
  }

  dimension: ura_opcao_11 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 11"
    description: "Indica a 11ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_11" ;;
  }

  dimension: ura_opcao_12 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 12"
    description: "Indica a 12ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_12" ;;
  }

  dimension: ura_opcao_13 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 13"
    description: "Indica a 13ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_13" ;;
  }

  dimension: ura_opcao_14 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 14"
    description: "Indica a 14ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_14" ;;
  }

  dimension: ura_opcao_15 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 15"
    description: "Indica a 15ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_15" ;;
  }

  dimension: ura_opcao_16 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 16"
    description: "Indica a 16ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_16" ;;
  }

  dimension: ura_opcao_17 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 17"
    description: "Indica a 17ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_17" ;;
  }

  dimension: ura_opcao_18 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 18"
    description: "Indica a 18ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_18" ;;
  }

  dimension: ura_opcao_19 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 19"
    description: "Indica a 19ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_19" ;;
  }

  dimension: ura_opcao_2 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 2"
    description: "Indica a 2ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_2" ;;
  }

  dimension: ura_opcao_20 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 20"
    description: "Indica a 20ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_20" ;;
  }

  dimension: ura_opcao_21 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 21"
    description: "Indica a 21ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_21" ;;
  }

  dimension: ura_opcao_22 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 22"
    description: "Indica a 22ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_22" ;;
  }

  dimension: ura_opcao_23 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 23"
    description: "Indica a 23ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_23" ;;
  }

  dimension: ura_opcao_3 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 3"
    description: "Indica a 3ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_3" ;;
  }

  dimension: ura_opcao_4 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 4"
    description: "Indica a 4ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_4" ;;
  }

  dimension: ura_opcao_5 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 5"
    description: "Indica a 5ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_5" ;;
  }

  dimension: ura_opcao_6 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 6"
    description: "Indica a 6ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_6" ;;
  }

  dimension: ura_opcao_7 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 7"
    description: "Indica a 7ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_7" ;;
  }

  dimension: ura_opcao_8 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 8"
    description: "Indica a 8ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_8" ;;
  }

  dimension: ura_opcao_9 {
    type: string
    group_label: "Dados da URA"
    group_item_label: "Opção 9"
    description: "Indica a 9ª opção da URA."
    sql: ${TABLE}."URA_OPCAO_9" ;;
  }

  dimension: zendesk_id {
    type: string
    #primary_key: yes
    group_label: "Dados da Ligação"
    group_item_label: "ID Ticket - Zendesk"
    description: "Indica o ticket atrelado no zendesk."
    sql: ${TABLE}."ZENDESK_ID" ;;
  }

  measure: quantidade_ligacoes {
    type: count
    group_item_label: "Quantidade Ligações"
    drill_fields: []
  }
}
