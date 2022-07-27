view: vw_pipedrive_deals_pipeline {
  sql_table_name: "PIPEDRIVE"."VW_PIPEDRIVE_DEALS_PIPELINE"
    ;;

  dimension: assunto_prox_atividade {
    type: string
    group_label: "Dados Atividades"
    group_item_label: "Assunto Próxima Atividade"
    description: "Próxima atividade agendada"
    sql: ${TABLE}."ASSUNTO_PROX_ATIVIDADE" ;;
  }

  measure: atividades_concluidas {
    type: sum
    group_label: "Dados Atividades"
    group_item_label: "Qtd de atividades concluídas"
    description: "Qtd de atividades concluídas para esse negócio"
    sql: ${TABLE}."ATIVIDADES_CONCLUIDAS" ;;
  }

  dimension: codigo_moeda {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Código da moeda"
    description: ""
    sql: ${TABLE}."CODIGO_MOEDA" ;;
  }

  measure: contagem_pessoa_organizacao {
    type: sum
    group_label: "Dados Organização"
    group_item_label: "Qtd de pessoas na organização"
    description: ""
    sql: ${TABLE}."CONTAGEM_PESSOA_ORGANIZACAO" ;;
  }

  dimension: desc_interesse_negocio_1 {
    type: string
    group_label: "Interesse de Negócio"
    group_item_label: "Desc. Interesse de negócio 1"
    description: ""
    sql: ${TABLE}."DESC_INTERESSE_NEGOCIO_1" ;;
  }

  dimension: desc_interesse_negocio_2 {
    type: string
    group_label: "Interesse de Negócio"
    group_item_label: "Desc. Interesse de negócio 2"
    description: ""
    sql: ${TABLE}."DESC_INTERESSE_NEGOCIO_2" ;;
  }

  dimension: desc_interesse_negocio_3 {
    type: string
    group_label: "Interesse de Negócio"
    group_item_label: "Desc. Interesse de negócio 3"
    description: ""
    sql: ${TABLE}."DESC_INTERESSE_NEGOCIO_3" ;;
  }

  dimension: desc_origem_lead {
    type: string
    group_label: "Dados Lead"
    group_item_label: "Descrição origem Lead"
    description: ""
    sql: ${TABLE}."DESC_ORIGEM_LEAD" ;;
  }

  dimension: dor_empresa_quer_resolver {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Dor que a empresa quer resolver"
    description: ""
    sql: ${TABLE}."DOR_EMPRESA_QUER_RESOLVER" ;;
  }

  dimension_group: dt_atualizacao_negocio {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    label: "Data Última atualização Negócio"
    description: ""
    sql: ${TABLE}."DT_ATUALIZACAO_NEGOCIO" ;;
  }

  dimension_group: dt_criacao_negocio {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    label: "Data Criação Negócio"
    description: ""
    sql: ${TABLE}."DT_CRIACAO_NEGOCIO" ;;
  }

  dimension_group: dt_fechado_em_negocio {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    label: "Data Fechamento Negócio"
    description: ""
    sql: ${TABLE}."DT_FECHADO_EM_NEGOCIO" ;;
  }

  dimension_group: dt_fechamento_esperada {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Data esperada de fechamento"
    description: ""
    sql: ${TABLE}."DT_FECHAMENTO_ESPERADA" ;;
  }

  dimension_group: dt_ganho_negocio {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    group_label: "Data ganho Negócio"
    group_item_label: "Data ganho"
    description: ""
    sql: ${TABLE}."DT_GANHO_NEGOCIO" ;;
  }

  dimension: dt_limite_faturamento {
    type: string
    hidden: yes
    sql: ${TABLE}."DT_LIMITE_FATURAMENTO" ;;
  }

  dimension_group: dt_perda_negocio {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    label: "Data perda Negócio"
    description: ""
    sql: ${TABLE}."DT_PERDA_NEGOCIO" ;;
  }

  dimension_group: dt_primeiro_ganho_negocio {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    label: "Data primeiro ganho"
    description: ""
    sql: ${TABLE}."DT_PRIMEIRO_GANHO_NEGOCIO" ;;
  }

  dimension_group: dt_prox_atividade {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    convert_tz: no
    datatype: date
    label: "Data próxima atividade"
    description: ""
    sql: ${TABLE}."DT_PROX_ATIVIDADE" ;;
  }

  dimension_group: dt_ult_alteracao_etapa {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    label: "Data última alteração Etapa"
    description: ""
    sql: ${TABLE}."DT_ULT_ALTERACAO_ETAPA" ;;
  }

  dimension_group: dt_ultima_atividade {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    label: "Data última atividade"
    description: ""
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DT_ULTIMA_ATIVIDADE" ;;
  }

  dimension: duracao_prox_atividade {
    type: string
    group_label: "Dados Atividades"
    group_item_label: "Duração próxima atividade"
    description: ""
    sql: ${TABLE}."DURACAO_PROX_ATIVIDADE" ;;
  }

  dimension: email_criador {
    type: string
    group_label: "Dados Criador Negócio"
    group_item_label: "E-mail do criador"
    description: ""
    sql: ${TABLE}."EMAIL_CRIADOR" ;;
  }

  dimension: email_especifico_negocio {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "E-mail negócio"
    description: ""
    sql: ${TABLE}."EMAIL_ESPECIFICO_NEGOCIO" ;;
  }

  dimension: email_organizacao {
    type: string
    group_label: "Dados Organização"
    group_item_label: "E-mail organização"
    description: ""
    sql: ${TABLE}."EMAIL_ORGANIZACAO" ;;
  }

  dimension: email_pessoa_contato {
    type: string
    group_label: "Dados Organização"
    group_item_label: "E-mail pessoa contato"
    description: ""
    sql: ${TABLE}."EMAIL_PESSOA_CONTATO" ;;
  }

  dimension: email_proprietario {
    type: string
    group_label: "Dados Proprietário Negócio"
    group_item_label: "E-mail do proprietário"
    description: ""
    sql: ${TABLE}."EMAIL_PROPRIETARIO" ;;
  }

  dimension: endereco_organizacao {
    type: string
    group_label: "Dados Organização"
    group_item_label: "Endereço da organização"
    description: ""
    sql: ${TABLE}."ENDERECO_ORGANIZACAO" ;;
  }

  dimension: enviado_email_financeiro {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Enviado email financeiro"
    description: ""
    sql: ${TABLE}."ENVIADO_EMAIL_FINANCEIRO" ;;
  }

  dimension: etiqueta {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Etiqueta"
    description: ""
    sql: ${TABLE}."ETIQUETA" ;;
  }

  dimension: flg_ativo_criador {
    type: yesno
    group_label: "Dados Criador Negócio"
    group_item_label: "Flag Criador Ativo"
    description: ""
    sql: ${TABLE}."FLG_ATIVO_CRIADOR" ;;
  }

  dimension: flg_ativo_moeda {
    type: yesno
    group_label: "Dados Negócio"
    group_item_label: "Flag Moeda Ativa"
    description: ""
    sql: ${TABLE}."FLG_ATIVO_MOEDA" ;;
  }

  dimension: flg_ativo_negocio {
    type: yesno
    group_label: "Dados Negócio"
    group_item_label: "Flag Negócio Ativo"
    description: ""
    sql: ${TABLE}."FLG_ATIVO_NEGOCIO" ;;
  }

  dimension: flg_ativo_organizacao {
    type: yesno
    group_label: "Dados Organização"
    group_item_label: "Flag Organização Ativa"
    description: ""
    sql: ${TABLE}."FLG_ATIVO_ORGANIZACAO" ;;
  }

  dimension: flg_ativo_pessoa_contato {
    type: yesno
    group_label: "Dados Organização"
    group_item_label: "Flag Pessoa Ativa"
    description: ""
    sql: ${TABLE}."FLG_ATIVO_PESSOA_CONTATO" ;;
  }

  dimension: flg_ativo_proprietario {
    type: yesno
    group_label: "Dados Proprietário Negócio"
    group_item_label: "Flag Proprietário Ativo"
    description: ""
    sql: ${TABLE}."FLG_ATIVO_PROPRIETARIO" ;;
  }

  dimension: flg_campo_personalizado {
    type: yesno
    hidden: yes
    sql: ${TABLE}."FLG_CAMPO_PERSONALIZADO" ;;
  }

  dimension: flg_deletado_negocio {
    type: yesno
    group_label: "Dados Negócio"
    group_item_label: "Flag Negócio Deletado"
    description: "Indica se o negócio foi deletado da tela do Pipedrive"
    sql: ${TABLE}."FLG_DELETADO_NEGOCIO" ;;
  }

  dimension: forma_pgto {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Forma de Pagamento"
    description: "Forma de Pagamento escolhida pela Instituição"
    sql: ${TABLE}."FORMA_PGTO" ;;
  }

  dimension: id_criador {
    type: string
    group_label: "Dados Criador Negócio"
    group_item_label: "ID Criador"
    description: ""
    sql: ${TABLE}."ID_CRIADOR" ;;
  }

  dimension: id_etiqueta {
    type: number
    group_label: "Dados Negócio"
    group_item_label: "ID Etiqueta"
    description: ""
    sql: ${TABLE}."ID_ETIQUETA" ;;
  }

  dimension: id_grupo {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "ID Grupo"
    description: ""
    sql: ${TABLE}."ID_GRUPO" ;;
  }

  dimension: id_interesse_negocio_1 {
    type: number
    group_label: "Interesse de Negócio"
    group_item_label: "ID Interesse Negócio 1"
    description: ""
    sql: ${TABLE}."ID_INTERESSE_NEGOCIO_1" ;;
  }

  dimension: id_interesse_negocio_2 {
    type: number
    group_label: "Interesse de Negócio"
    group_item_label: "ID Interesse Negócio 2"
    description: ""
    sql: ${TABLE}."ID_INTERESSE_NEGOCIO_2" ;;
  }

  dimension: id_interesse_negocio_3 {
    type: number
    group_label: "Interesse de Negócio"
    group_item_label: "ID Interesse Negócio 3"
    description: ""
    sql: ${TABLE}."ID_INTERESSE_NEGOCIO_3" ;;
  }

  dimension: id_negocio {
    type: number
    group_label: "Dados Negócio"
    group_item_label: "ID do Negócio"
    description: ""
    sql: ${TABLE}."ID_NEGOCIO" ;;
  }

  dimension: id_organizacao {
    type: number
    group_label: "Dados Organização"
    group_item_label: "ID Organização"
    description: ""
    sql: ${TABLE}."ID_ORGANIZACAO" ;;
  }

  dimension: id_pessoa_contato {
    type: number
    group_label: "Dados Organização"
    group_item_label: "ID Pessoa"
    description: ""
    sql: ${TABLE}."ID_PESSOA_CONTATO" ;;
  }

  dimension: id_proprietario {
    type: string
    group_label: "Dados Proprietário Negócio"
    group_item_label: "ID Proprietário"
    description: ""
    sql: ${TABLE}."ID_PROPRIETARIO" ;;
  }

  dimension: id_proprietario_organizacao {
    type: number
    group_label: "Dados Organização"
    group_item_label: "ID Proprietário Organização"
    description: ""
    sql: ${TABLE}."ID_PROPRIETARIO_ORGANIZACAO" ;;
  }

  dimension: id_proprietario_pessoa_contato {
    type: number
    group_label: "Dados Organização"
    group_item_label: "ID Proprietário Pessoa"
    description: ""
    sql: ${TABLE}."ID_PROPRIETARIO_PESSOA_CONTATO" ;;
  }

  dimension: id_prox_atividade {
    type: number
    group_label: "Dados Atividades"
    group_item_label: "ID Próxima Atividade"
    description: ""
    sql: ${TABLE}."ID_PROX_ATIVIDADE" ;;
  }

  dimension: id_ultima_atividade {
    type: number
    group_label: "Dados Atividades"
    group_item_label: "ID Última Atividade"
    description: ""
    sql: ${TABLE}."ID_ULTIMA_ATIVIDADE" ;;
  }

  dimension: idade_negocio {
    type: number
    group_label: "Dados Negócio"
    group_item_label: "Idade Negócio"
    description: ""
    sql: ${TABLE}."IDADE_NEGOCIO" ;;
  }

  dimension: impacto_dores_operacao {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Impacto dores Operação"
    description: ""
    sql: ${TABLE}."IMPACTO_DORES_OPERACAO" ;;
  }

  dimension: infos_pipeline {
    type: string
    hidden: yes
    sql: ${TABLE}."INFOS_PIPELINE" ;;
  }

  dimension: modelo_demo {
    type: string
    hidden: yes
    sql: ${TABLE}."MODELO_DEMO" ;;
  }

  dimension: motivo_perda_negocio {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Motivo perda negócio"
    description: ""
    sql: ${TABLE}."MOTIVO_PERDA_NEGOCIO" ;;
  }

  dimension: nivel_provas_digitais {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Nível Provas Digitais"
    description: ""
    sql: ${TABLE}."NIVEL_PROVAS_DIGITAIS" ;;
  }

  dimension: nome_completo_organizacao {
    type: string
    group_label: "Dados Organização"
    group_item_label: "Nome completo Organização"
    description: ""
    sql: ${TABLE}."NOME_COMPLETO_ORGANIZACAO" ;;
  }

  dimension: nome_criador {
    type: string
    group_label: "Dados Criador Negócio"
    group_item_label: "Nome Criador"
    description: ""
    sql: ${TABLE}."NOME_CRIADOR" ;;
  }

  dimension: nome_grupo {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Nome Grupo"
    description: ""
    sql: ${TABLE}."NOME_GRUPO" ;;
  }

  dimension: nome_moeda {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Nome Moeda"
    description: ""
    sql: ${TABLE}."NOME_MOEDA" ;;
  }

  dimension: nome_organizacao {
    type: string
    group_label: "Dados Organização"
    group_item_label: "Nome Organização"
    description: ""
    sql: ${TABLE}."NOME_ORGANIZACAO" ;;
  }

  dimension: nome_pessoa_contato {
    type: string
    group_label: "Dados Organização"
    group_item_label: "Nome Pessoa Contato"
    description: ""
    sql: ${TABLE}."NOME_PESSOA_CONTATO" ;;
  }

  dimension: nome_proprietario {
    type: string
    group_label: "Dados Proprietário Negócio"
    group_item_label: "Nome Proprietátio"
    description: ""
    sql: ${TABLE}."NOME_PROPRIETARIO" ;;
  }

  dimension: nr_provas_digitais_ano {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Número de Provas Digitais"
    description: ""
    sql: ${TABLE}."NR_PROVAS_DIGITAIS_ANO" ;;
  }

  dimension: numero_mensagens_emails {
    type: number
    group_label: "Dados Negócio"
    group_item_label: "Qtd de emails"
    description: ""
    sql: ${TABLE}."NUMERO_MENSAGENS_EMAILS" ;;
  }

  dimension: obs_prox_atividade {
    type: string
    group_label: "Dados Atividades"
    group_item_label: "Obs Próxima Atividade"
    description: ""
    sql: ${TABLE}."OBS_PROX_ATIVIDADE" ;;
  }

  dimension: org_hidden {
    type: yesno
    hidden: yes
    sql: ${TABLE}."ORG_HIDDEN" ;;
  }

  dimension: origem_empresa {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Origem Empresa"
    description: ""
    sql: ${TABLE}."ORIGEM_EMPRESA" ;;
  }

  dimension: origem_lead {
    type: string
    group_label: "Dados Lead"
    group_item_label: "Origem Lead"
    description: ""
    sql: ${TABLE}."ORIGEM_LEAD" ;;
  }

  dimension: person_hidden {
    type: yesno
    hidden: yes
    sql: ${TABLE}."PERSON_HIDDEN" ;;
  }

  dimension: ponto_decimal_moeda {
    type: number
    hidden: yes
    sql: ${TABLE}."PONTO_DECIMAL_MOEDA" ;;
  }

  dimension: pontos_atencao_demo {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Pontos Atenção"
    description: ""
    sql: ${TABLE}."PONTOS_ATENCAO_DEMO" ;;
  }

  dimension: prazo_empresa_tem_resolver {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Prazo Empresa"
    description: ""
    sql: ${TABLE}."PRAZO_EMPRESA_TEM_RESOLVER" ;;
  }

  dimension: previsao_dt_prova_prvdigitais {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Previsão Data Provas Digitais"
    description: ""
    sql: ${TABLE}."PREVISAO_DT_PROVA_PRVDIGITAIS" ;;
  }

  dimension: probabilidade_negocio {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Probabilidade de Negócio"
    description: ""
    sql: ${TABLE}."PROBABILIDADE_NEGOCIO" ;;
  }

  dimension: produto {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Produto"
    description: ""
    sql: ${TABLE}."PRODUTO" ;;
  }

  dimension: qtd_arquivos {
    type: number
    group_label: "Dados Negócio"
    group_item_label: "Qtd de arquivos"
    description: ""
    sql: ${TABLE}."QTD_ARQUIVOS" ;;
  }

  dimension: qtd_atividades_nao_concluidas {
    type: number
    group_label: "Dados Atividades"
    group_item_label: "Qtd de Atividades não concluídas"
    description: ""
    sql: ${TABLE}."QTD_ATIVIDADES_NAO_CONCLUIDAS" ;;
  }

  dimension: qtd_notas {
    type: number
    group_label: "Dados Negócio"
    group_item_label: "Qtd de notas"
    description: ""
    sql: ${TABLE}."QTD_NOTAS" ;;
  }

  dimension: qtd_participantes {
    type: number
    group_label: "Dados Negócio"
    group_item_label: "Qtd de participantes"
    description: ""
    sql: ${TABLE}."QTD_PARTICIPANTES" ;;
  }

  dimension: qtd_produtos {
    type: number
    group_label: "Dados Negócio"
    group_item_label: "Qtd de produtos"
    description: ""
    sql: ${TABLE}."QTD_PRODUTOS" ;;
  }

  dimension: qtd_seguidores {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD_SEGUIDORES" ;;
  }

  dimension: qual_sera_ddi {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Qual será o DDI"
    description: ""
    sql: ${TABLE}."QUAL_SERA_DDI" ;;
  }

  dimension: receita_estimada {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Receita Estimada"
    description: ""
    sql: ${TABLE}."RECEITA_ESTIMADA" ;;
  }

  dimension: sdr {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "SDR"
    description: ""
    sql: ${TABLE}."SDR" ;;
  }

  dimension: simbolo_moeda {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Símbolo Moeda"
    description: ""
    sql: ${TABLE}."SIMBOLO_MOEDA" ;;
  }

  dimension: status_negocio {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Status do Negócio"
    description: ""
    sql: ${TABLE}."STATUS_NEGOCIO" ;;
  }

  dimension: telefone_pessoa_contato {
    type: string
    group_label: "Dados Organização"
    group_item_label: "Telefone Pessoa"
    description: ""
    sql: ${TABLE}."TELEFONE_PESSOA_CONTATO" ;;
  }

  dimension: tempo_medio_de_ganho_total_segundo {
    type: number
    group_label: "Dados Negócio"
    group_item_label: "Telefone Pessoa"
    description: ""
    sql: ${TABLE}."TEMPO_MEDIO_DE_GANHO_TOTAL_SEGUNDO" ;;
  }

  measure: sum_tempo_medio_de_ganho {
    type: sum
    group_label: "Dados Negócio"
    group_item_label: "Tempo médio de ganho"
    description: ""
    sql: ${TABLE}."TEMPO_MEDIO_DE_GANHO_TOTAL_SEGUNDO" ;;
  }

  dimension_group: tempo_ocorrencia {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    group_label: "Dados Atividades"
    group_item_label: "Tempo Ocorrência"
    description: ""
    hidden: yes
    sql: ${TABLE}."TEMPO_OCORRENCIA" ;;
  }

  dimension: tempo_prox_atividade {
    type: string
    group_label: "Dados Atividades"
    group_item_label: "Tempo Próxima Atividade"
    description: ""
    sql: ${TABLE}."TEMPO_PROX_ATIVIDADE" ;;
  }

  dimension: tipo_prox_atividade {
    type: string
    group_label: "Dados Atividades"
    group_item_label: "Tipo Próxima Atividade"
    description: ""
    sql: ${TABLE}."TIPO_PROX_ATIVIDADE" ;;
  }

  dimension: tipo_revalidacao {
    type: string
    group_label: "Dados Atividades"
    group_item_label: "Tipo Revalidação"
    description: ""
    sql: ${TABLE}."TIPO_REVALIDACAO" ;;
  }

  dimension: titulo_negocio {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Título Negócio"
    description: ""
    sql: ${TABLE}."TITULO_NEGOCIO" ;;
  }

  dimension: todos_interesses_negocios_id {
    type: string
    group_label: "Interesse de Negócio"
    group_item_label: "Todos Interesses"
    description: ""
    sql: ${TABLE}."TODOS_INTERESSES_NEGOCIOS_ID" ;;
  }

  dimension: total_atividades {
    type: number
    group_label: "Dados Atividades"
    group_item_label: "Qtd total de Atividades"
    description: ""
    sql: ${TABLE}."TOTAL_ATIVIDADES" ;;
  }

  dimension_group: ult_email_enviado {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    label: "Data ultimo email enviado"
    description: ""
    sql: ${TABLE}."ULT_EMAIL_ENVIADO" ;;
  }

  dimension_group: ult_email_recebido {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      week_of_year
    ]
    label: "Data ultimo email recebido"
    description: ""
    sql: ${TABLE}."ULT_EMAIL_RECEBIDO" ;;
  }

  measure: valor {
    type: sum
    group_label: "Valor Proposta"
    group_item_label: "Valor Proposta"
    description: ""
    sql: ${TABLE}."VALOR" ;;
  }

  dimension: valor_moeda {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Valor Moeda"
    description: ""
    sql: ${TABLE}."VALOR_MOEDA" ;;
  }

  dimension: valor_moeda_formatado {
    type: string
    group_label: "Dados Negócio"
    group_item_label: "Valor Moeda Formatado"
    description: ""
    sql: ${TABLE}."VALOR_MOEDA_FORMATADO" ;;
  }

  dimension: visivel_para {
    type: number
    hidden: yes
    sql: ${TABLE}."VISIVEL_PARA" ;;
  }

  measure: qtd_negocios {
    type: count_distinct
    group_label: "Dados Negócio"
    group_item_label: "Qtd de negócios"
    sql: ${id_negocio} ;;
  }

}
