#View criada para utilização no Explore Base Atendimento

#Atualização da aba Base Novos da planilha em Excel utilizada pelo time Comercial de Conversão Fundo de Funil via Looker + Geração de Indicadores

view: base_atendimento_fundo_funil {
  sql_table_name: "POS_GRADUADO"."MARKETING"."BASE_ATENDIMENTO"
    ;;
  drill_fields: [cpf, alunos.aluno_nome, grupo_ies, proposta.ds_instituicao, dt_status_date, id_status_destino_geral, data_entrada_base_date, status_entrada_base, login_consultor, id_chamado, titulo_chamado, sub_titulo_chamado, date_ultimo_contato_date, date_primeiro_contato_date, quantidade_contato, proposta.ds_campus, proposta.ds_curso, proposta.aluno_cal_vet]

  dimension: id_cpf {
    label: "ID CPF do aluno"
    type: number
    sql:  ${TABLE}."ID_CPF"  ;;
  }

  dimension: id_proposta {
    label: "ID Última Proposta "
    type: string
    sql:  ${TABLE}."ID_PROPOSTA"  ;;
  }

  dimension: cpf {
    label: "CPF do Aluno"
    type: number
    sql:  ${TABLE}."CPF"  ;;
  }

  dimension: id_instituicao {
    label: "ID da Instituição"
    type: string
    sql:  ${TABLE}."ID_INSTITUICAO"  ;;
  }

  dimension: grupo_ies {
    label: "Grupo da IES"
    type: string
    sql:  ${TABLE}."GRUPO"  ;;
  }

  dimension: semestre_financiado {
    label: "Semestre Financiado"
    type: number
    sql:  ${TABLE}."SEMESTRE_FINANCIADO"  ;;
  }

  dimension: produto_comercial {
    label: "Nome Produto Comercial"
    type: string
    sql:  ${TABLE}."NM_PRODUTO_COMERCIAL"  ;;
  }

  dimension: id_status_destino_detalhe {
    label: "ID do Status Destino Detalhado"
    type: string
    sql:  ${TABLE}."ID_STATUS_DETALHE"  ;;
  }

  dimension: id_status_destino_geral {
    label: "ID do Status Destino Geral"
    type: number
    sql:  ${TABLE}."ID_STATUS_GERAL"  ;;
  }

  dimension: status_destino_detalhe {
    label: "Status Destino Detalhado"
    type: string
    sql:  ${TABLE}."VL_STATUS_DETALHADO"  ;;
  }

  dimension: descricao_status_destino_detalhe {
    label: "Descrição do Status Destino Detalhado"
    type: string
    sql:  ${TABLE}."DS_STATUS_DETALHADO"  ;;
  }

  dimension: id_chamado {
    label: "ID Último Chamado"
    type: number
    sql:  ${TABLE}."ID_CHAMADO"  ;;
  }

  dimension_group: date_primeiro_contato {
    label: "Data Primeiro Contato"
    description: "Data do Primeiro Contato realizado com o aluno pelo último consultor"
    type: time
    timeframes: [
      hour,
      date,
      day_of_week,
      week,
      month,
      year
    ]
    sql: ${TABLE}."DATA_PRIMEIRO_CONTATO" ;;
  }

  dimension_group: date_ultimo_contato {
    label: "Data Ultimo Contato"
    description: "Data do último contato realizado com o aluno pelo último consultor"
    type: time
    timeframes: [
      hour,
      date,
      day_of_week,
      week,
      month,
      year
    ]
    sql: ${TABLE}."DATA_ULTIMO_CONTATO" ;;
  }

  dimension: login_consultor {
    label: "Login Consultor"
    description: "Login do último consultor a entrar em contato com o aluno"
    type: string
    sql:  ${TABLE}."LOGIN"  ;;
  }

  dimension: tipo_atendimento {
    label: "Tipo Atendimento"
    type: string
    sql:  ${TABLE}."FLG_TIPO_ATENDIMENTO"  ;;
  }

  dimension: canal_atendimento {
    label: "Canal de Atendimento"
    type: string
    sql:  ${TABLE}."DS_CANAL"  ;;
  }

  dimension: titulo_chamado {
    label: "Título do Chamado"
    type: string
    sql:  ${TABLE}."DS_TITULO_CHAMADO"  ;;
  }

  dimension: sub_titulo_chamado {
    label: "Subtítulo do Chamado"
    type: string
    sql:  ${TABLE}."DS_SUB_TITULO_CHAMADO"  ;;
  }

  dimension: quantidade_contato {
    label: "Quantidade de Contatos"
    description: "Contagem de chamados realizados pelo último consultor que entrou em contato com o aluno"
    type: number
    sql:  ${TABLE}."QTD_CONTATO"  ;;
  }

  dimension: priority {
    label: "Prioridade"
    description: "Prioridade de atendimento sugerida pelo modelo de Persona"
    type: number
    sql:  ${TABLE}."PRIORITY"  ;;
  }

  dimension: persona {
    label: "Persona"
    description: "Indica a persona atribuída ao aluno pelo modelo"
    type: string
    sql:  ${TABLE}."PERSONA"  ;;
  }

  dimension: actions {
    label: "Ação Sugerida"
    description: "Indica a ação sugerida ao aluno pelo modelo de Persona"
    type: string
    sql:  ${TABLE}."ACTIONS"  ;;
  }

  dimension_group: date_cessao_ultima_proposta {
    label: "Data de Cessão da Última Proposta"
    type: time
    timeframes: [
      hour,
      date,
      day_of_week,
      week,
      month,
      year
    ]
    sql: ${TABLE}."DATA_CESSAO_ORIGINAL" ;;
  }

  dimension_group: dt_status {
    label: "Data do Último Status do Aluno"
    type: time
    timeframes: [
      hour,
      date,
      day_of_week,
      week,
      month,
      year
    ]
    sql: ${TABLE}."DT_STATUS" ;;
  }

  dimension_group: dt_snapshot {
    label: "Data do Snapshot da Base Atendimento"
    type: time
    timeframes: [
      hour,
      date,
      day_of_week,
      week,
      month,
      year
    ]
    sql: ${TABLE}."DT_SNAPSHOT" ;;
  }

  dimension: flg_contatar {
    label: "Flag Contatar"
    description: "Indica se o consultor precisa contatar o aluno"
    type: yesno
    sql:  ${TABLE}."FLG_CONTATAR"  ;;
  }

  dimension: dias_sem_contato {
    label: "Quantidade Dias Sem Contato"
    description: "Indica a quantidade de dias desde o último contato com o aluno"
    type: number
    sql:  ${TABLE}."DIAS_SEM_CONTATO"  ;;
  }

  dimension: flg_tabulacao {
    label: "Flag Tabulação"
    description: "Indica se o aluno possui tabulação"
    type: yesno
    sql:  ${TABLE}."FLG_TABULACAO"  ;;
  }

  dimension: dias_no_status {
    label: "Quantidade Dias no Status"
    description: "Indica a quantidade de dias que o aluno está no status atual"
    type: number
    sql:  ${TABLE}."DIAS_NO_STATUS"  ;;
  }

  dimension: flg_cedido {
    label: "Flag Cedido"
    description: "Indica se o aluno foi cedido ou não"
    type: yesno
    sql:  ${TABLE}."FLG_CEDIDO"  ;;
  }

  dimension: validador {
    label: "Validador"
    description: "Indica se o aluno que foi cedido possui tabulação realizada pelo consultor"
    type: yesno
    sql:  ${TABLE}."VALIDADOR"  ;;
  }

  dimension: flg_fechamento {
    label: "Flag Base Fechamento"
    description: "Indica se o snapshot é referente a uma base de fechamento de mês"
    type: yesno
    sql:
    LAST_DAY(DATE_TRUNC("MONTH", ${TABLE}."DT_SNAPSHOT")) = DATE_TRUNC("DAY", ${TABLE}."DT_SNAPSHOT")
    AND (HOUR(${TABLE}."DT_SNAPSHOT") > 17 OR HOUR(${TABLE}."DT_SNAPSHOT") = 00)  ;;
  #regra de negócio acima paliativa para considerar último snapshot (snap de fechamento) dos meses anteriores e snapshot do mês 09/2022 criado à meia-noite
  }

  dimension: flg_ultimo_snap {
    label: "Flag Último Snap"
    description: "Indica se os registros pertencem ao último snapshot da base de atendimento"
    type: yesno
    sql: ${TABLE}."FLG_ULTIMO_SNAP" ;;
  }

  dimension: flg_indicadores {
    label: "Flag Indicadores"
    description: "Indica se os registros pertecem à base de fechamento ou ao último snapshot = Base Indicadores"
    type: yesno
    sql: ${flg_fechamento} = 'Yes' or ${flg_ultimo_snap} = 'Yes' ;;
  }

  dimension: flg_consultor_fundo_funil {
    label: "Flag Consultor Fundo de Funil"
    description: "Indica se o último consultor a entrar em contato com o aluno pertence à célula de fundo de funil"
    type: yesno
    sql: ${TABLE}."LOGIN" IN
        ('ANDERSON.OLIVEIRA', 'ANDREZA.SILVA', 'ARYELLY.PEQUENO',
          'BRUNO.NICOLETI', 'DANNY.SILVA', 'DENISE.OLIVEIRA', 'GABRIELLY.ANDRADE', 'INGRID.SANTOS',
          'JULIANA.AZEVEDO', 'KAUANY.SABINO', 'MARCELLA.SANTOS', 'NATHALYA.MARTINS', 'SABRINA.RODRIGUES',
          'SHAIRON.WEINBERG', 'WESLEY.DALBERIO') ;;
  }

  dimension: subtitulo_grupo {
    label: "Subtitulo do Chamado Agrupado"
    description: "Agrupa específicos subtítulos dos chamados em um novo subtítulo resumo"
    type: string
    sql: CASE WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'FORMALIZACAO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'NAO VAI ASSINAR' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'FORMALIZACAO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'NAO VAI ENVIAR' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'FORMALIZACAO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO NAO VAI ENVIAR (BOLSA)' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'FORMALIZACAO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO NAO VAI ENVIAR (FIES)' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'FORMALIZACAO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO NAO VAI ENVIAR (PAGAMENTO A VISTA)' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'FORMALIZACAO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO NAO VAI ENVIAR (PROUNI)' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'FORMALIZACAO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO NAO VAI ENVIOR (TRANCOU)' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'FORMALIZACAO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO NAO CONSEGUE COMPROVAR RENDA' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'CADASTRO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO/GARANTIDOR COM RESTRICAO' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'CADASTRO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO NAO CONSEGUE COMPROVAR RENDA' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'CADASTRO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO SEM GARANTIDOR' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'CADASTRO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'SEM PREVISAO DE INICIAR A IES' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'CADASTRO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'POSSUI OUTROS BENEFICIOS NAO CUMULATIVOS (FIES, PROUNI, BOLSAS OU OUTROS)' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'CADASTRO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'TEM INTERESSE PARA O PROXIMO ANO/SEMESTRE' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'CADASTRO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'CADASTRO REPROVADO POR POLITICA' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'FORMALIZACAO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO/GARANTIDOR NAO CONSEGUEM COMPROVAR RENDA SUFICIENTE' THEN 'NEGATIVA'
WHEN ${TABLE}."DS_TITULO_CHAMADO" = 'CADASTRO' AND ${TABLE}."DS_SUB_TITULO_CHAMADO" = 'ALUNO/GARANTIDOR NAO CONSEGUEM COMPROVAR RENDA SUFICIENTE' THEN 'NEGATIVA'
ELSE ${TABLE}."DS_SUB_TITULO_CHAMADO" END ;;
  }

  dimension: status_entrada_base {
    label: "Status Entrada Base"
    description: "Indica o Status Geral Destino que fez com que o aluno entrasse na Base de Atendimento"
    type: number
    sql: ${TABLE}."ID_STATUS_ENTRADA" ;;
  }

  dimension_group: data_entrada_base {
    label: "Data de Entrada do Aluno"
    description: "Data em que o aluno entrou na Base de Atendimento"
    type: time
    timeframes: [
      hour,
      date,
      day_of_week,
      week,
      month,
      year
    ]
    sql: ${TABLE}."DT_ENTRADA_BASE" ;;
  }

  dimension: qtd_dias_base {
    label: "Quantidade de Dias na Base"
    description: "Indica a quantidade de dias que o aluno está na Base de Atendimento"
    type: number
    sql: DATEDIFF(DAY,${TABLE}."DT_ENTRADA_BASE", ${TABLE}."DT_SNAPSHOT") ;;
  }

  dimension: flg_cashback {
    label: "Flag Cashback"
    description: "Indica se o consultor deve oferecer Cashback ao aluno ou não"
    type: yesno
    sql: ${qtd_dias_base} > 13 ;;
  }

  dimension: celula_atendimento {
    label: "Célula de Atendimento"
    type: string
    sql: CASE WHEN ${grupo_ies} ILIKE '%ANIMA%' THEN 'ANIMA'
              WHEN ${grupo_ies} ILIKE '%CRUZEIRO DO SUL%' THEN 'CRUZEIRO'
              ELSE 'DEMAIS IES' END ;;
  }

  dimension: flg_convertido {
    label: "Flag Convertido"
    description: "Indica se o aluno foi convertido (Status Geral Destino = 41, 50 ou 51)"
    type: yesno
    sql: ${id_status_destino_geral} IN (41, 50, 51) ;;
  }

  dimension: flg_cancelado {
    label: "Flag Cancelado"
    description: "Indica se o aluno foi cancelado (Status Geral Destino = 18, 28, 38, 48, 58)"
    type: yesno
    sql: ${id_status_destino_geral} IN (18, 28, 38, 48, 58) ;;
  }

  measure: qtd_alunos {
    label: "Quantidade de Alunos"
    description: "Contagem de alunos distintos da Base de Atendimento"
    group_label: "Aluno"
    type: count_distinct
    sql: ${TABLE}."ID_CPF" ;;
  }

  measure: qtd_alunos_sem_contato {
    label: "Quantidade de Alunos Sem Contato"
    description: "Contagem de alunos distintos sem contato da Base de Atendimento"
    group_label: "Aluno"
    type: count_distinct
    filters: [flg_tabulacao: "No"]
    sql: ${TABLE}."ID_CPF" ;;
  }

  measure: qtd_alunos_com_contato {
    label: "Quantidade de Alunos Com Contato"
    description: "Contagem de alunos distintos sem contato da Base de Atendimento"
    group_label: "Aluno"
    type: count_distinct
    filters: [flg_tabulacao: "Yes"]
    sql: ${TABLE}."ID_CPF" ;;
  }

  measure: qtd_alunos_sem_contato_fundo_funil {
    label: "Quantidade de Alunos Sem Contato - Fundo Funil"
    description: "Contagem de alunos distintos sem contato pela célula de fundo de funil da Base de Atendimento"
    group_label: "Aluno"
    type: count_distinct
    filters: [flg_consultor_fundo_funil: "No"]
    sql: ${TABLE}."ID_CPF" ;;
  }

  measure: qtd_alunos_com_contato_fundo_funil {
    label: "Quantidade de Alunos Com Contato - Fundo Funil"
    description: "Contagem de alunos distintos com contato pela célula de fundo de funil da Base de Atendimento"
    group_label: "Aluno"
    type: count_distinct
    filters: [flg_consultor_fundo_funil: "Yes"]
    sql: ${TABLE}."ID_CPF" ;;
  }

  measure: qtd_alunos_convertidos {
    label: "Quantidade de Alunos Convertidos"
    description: "Contagem de alunos distintos que foram Formalizados ou Cedidos da Base de Atendimento"
    group_label: "Aluno"
    type: count_distinct
    filters: [id_status_destino_geral: "41, 50, 51"]
    sql: ${TABLE}."ID_CPF" ;;
  }

  measure: conversao_alunos {
    label: "Conversão Alunos"
    description: "Quantidade de alunos Formalizados ou Cedidos pela quantidade de alunos da Base de Atendimento"
    group_label: "Aluno"
    type: number
    value_format: "0.0%"
    sql: ${qtd_alunos_convertidos}/${qtd_alunos} ;;
  }

  measure: taxa_contato {
    label: "Taxa de Contato"
    description: "Quantidade de alunos com contato pela quantidade de alunos da Base de Atendimento"
    group_label: "Aluno"
    type: number
    value_format: "0.0%"
    sql: ${qtd_alunos_com_contato}/${qtd_alunos} ;;
  }

  measure: taxa_contato_fundo_funil {
    label: "Taxa de Contato - Fundo Funil"
    description: "Quantidade de alunos com contato da célula de fundo de funil pela quantidade de alunos da Base de Atendimento"
    group_label: "Aluno"
    type: number
    value_format: "0.0%"
    sql: ${qtd_alunos_com_contato_fundo_funil}/${qtd_alunos} ;;
  }

  measure: aluno_consultor {
    label: "Quantidade de Alunos por Consultor"
    description: "Quantidade de alunos da Base de Atendimento pela quantidade de consultores"
    group_label: "Aluno"
    type: number
    value_format: "0.0"
    sql: ${qtd_alunos}/${qtd_consultores} ;;
  }

  measure: aluno_consultor_fundo_funil {
    label: "Quantidade de Alunos Base por Consultor - Fundo Funil"
    description: "Quantidade de alunos da Base de Atendimento pela quantidade de consultores de fundo de funil"
    group_label: "Aluno"
    type: number
    value_format: "0.0"
    sql: ${qtd_alunos}/${qtd_consultores_fundo_funil} ;;
  }

  measure: soma_contatos {
    label: "Soma de Contatos Realizados"
    description: "Soma da quantidade de contatos realizados com cada aluno da Base de Atendimento"
    group_label: "Contato"
    type: sum
    sql: ${TABLE}."QTD_CONTATO" ;;
  }

  measure: soma_contatos_fundo_funil {
    label: "Soma de Contatos Realizados - Fundo Funil"
    description: "Soma da quantidade de contatos realizados pela célula de fundo de funil com cada aluno da Base de Atendimento"
    group_label: "Contato"
    type: sum
    filters: [flg_consultor_fundo_funil: "Yes"]
    sql: ${TABLE}."QTD_CONTATO" ;;
  }

  measure: soma_contatos_tentativa {
    label: "Soma de Contatos Não Efetivos (Tentativa de Contato)"
    description: "Soma da quantidade de contatos não atendidos realizados com cada aluno da Base de Atendimento (tentativa de contato)"
    group_label: "Contato"
    type: sum
    filters: [titulo_chamado: "ERRO"]
    sql: ${TABLE}."QTD_CONTATO" ;;
  }

  measure: soma_contatos_tentativa_fundo_funil {
    label: "Soma de Contatos Não Efetivos (Tentativa de Contato) - Fundo Funil"
    description: "Soma da quantidade de contatos não atendidos realizados pela célula de fundo de funil com cada aluno da Base de Atendimento (tentativa de contato)"
    group_label: "Contato"
    type: sum
    filters: [titulo_chamado: "ERRO", flg_consultor_fundo_funil: "Yes"]
    sql: ${TABLE}."QTD_CONTATO" ;;
  }

  measure: soma_contatos_efetivos {
    label: "Soma de Contatos Efetivos"
    description: "Soma da quantidade de contatos atendidos realizados com cada aluno da Base de Atendimento (tentativa de contato)"
    group_label: "Contato"
    type: sum
    filters: [titulo_chamado: "-ERRO"]
    sql: ${TABLE}."QTD_CONTATO" ;;
  }

  measure: soma_contatos_efetivos_fundo_funil {
    label: "Soma de Contatos Efetivos - Fundo Funil"
    description: "Soma da quantidade de contatos atendidos realizados pela célula de fundo de funil com cada aluno da Base de Atendimento (tentativa de contato)"
    group_label: "Contato"
    type: sum
    filters: [titulo_chamado: "-ERRO", flg_consultor_fundo_funil: "Yes"]
    sql: ${TABLE}."QTD_CONTATO" ;;
  }

  measure: qtd_consultores {
    label: "Quantidade de Consultores"
    group_label: "Atendimento"
    type: count_distinct
    sql: ${TABLE}."LOGIN" ;;
  }

  measure: qtd_consultores_fundo_funil {
    label: "Quantidade de Consultores - Fundo Funil"
    group_label: "Atendimento"
    type: count_distinct
    filters: [flg_consultor_fundo_funil: "Yes"]
    sql: ${TABLE}."LOGIN" ;;
  }

  measure: qtd_contato_aluno {
    label: "Quantidade de Contatos por Aluno"
    description: "Soma da quantidade de contatos realizados pela quantidade de alunos na Base de Atendimento"
    group_label: "Atendimento"
    type: number
    value_format: "0.0"
    sql: ${soma_contatos}/${qtd_alunos} ;;
  }

  measure: qtd_contato_aluno_fundo_funil {
    label: "Quantidade de Contatos por Aluno - Fundo Funil"
    description: "Soma da quantidade de contatos realizados pela célula de fundo de funil pela quantidade de alunos na Base de Atendimento"
    group_label: "Atendimento"
    type: number
    value_format: "0.0"
    sql: ${soma_contatos_fundo_funil}/${qtd_alunos} ;;
  }

  measure: qtd_contato_consultor  {
    label: "Quantidade de Contato por Consultor"
    description: "Soma da quantidade de contatos realizdaos pela quantidade de consultores"
    group_label: "Atendimento"
    type: number
    value_format: "0.0"
    sql: ${soma_contatos}/${qtd_consultores} ;;
  }

}
