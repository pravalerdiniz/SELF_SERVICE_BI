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
    group_label: "Dados da Vaga"
    label: "Ramificação da página"
    type: string
    sql: ${TABLE}."BRANCH" ;;
  }

  dimension: cep {
    group_label: "Dados da Vaga"
    label: "CEP"
    type: string
    sql: ${TABLE}."CEP" ;;
  }

  dimension: cidade {
    group_label: "Dados da Vaga"
    label: "Cidade"
    type: string
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: codigo {
    group_label: "Dados da Vaga"
    label: "Código"
    type: number
    sql: ${TABLE}."CODIGO" ;;
  }

  dimension: codigo_interno {
    group_label: "Dados da Vaga"
    label: "Código interno"
    type: string
    sql: ${TABLE}."CODIGO_INTERNO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_aprovacao {
    group_label: "Dados da Vaga"
    label: "Data de aprovação"
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
    group_label: "Dados da Vaga"
    label: "Data do cancelamento"
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
    group_label: "Dados da Vaga"
    label: "Data do congelamento"
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
    group_label: "Dados da Vaga"
    label: "Data da criação"
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
    group_label: "Dados da Vaga"
    label: "Data de descongelamento"
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
    group_label: "Dados da Vaga"
    label: "Data do encerramento"
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
    group_label: "Dados da Vaga"
    label: "Data do fechamento do headcount"
    description: "Data na qual ocorreu a contratação que atingiu o limite de headcount para a vaga"
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
    group_label: "Dados da Vaga"
    label: "Data da publicação"
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
    group_label: "Dados da Vaga"
    label: "Data da reprovação"
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
    group_label: "Dados da Vaga"
    label: "Data da última atualização"
    description: "Data na qual ocorreu a última atualização em alguma informação referente a essa vaga"
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
    group_label: "Dados da Vaga"
    label: "Data da última inscrição para a vaga"
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
    group_label: "Dados da Vaga"
    label: "Departamento"
    type: string
    sql: ${TABLE}."DEPARTAMENTO" ;;
  }

  dimension: email_criador {
    group_label: "Dados da Vaga"
    label: "Email do criador"
    type: string
    sql: ${TABLE}."EMAIL_CRIADOR" ;;
  }

  dimension: email_gerente {
    group_label: "Dados da Vaga"
    label: "Email do gerente"
    type: string
    sql: ${TABLE}."EMAIL_GERENTE" ;;
  }

  dimension: email_recrutador {
    group_label: "Dados da Vaga"
    label: "Email do recrutador"
    type: string
    sql: ${TABLE}."EMAIL_RECRUTADOR" ;;
  }

  dimension: estado {
    group_label: "Dados da Vaga"
    label: "Estado"
    type: string
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: estimativa_final_salario {
    group_label: "Dados da Vaga"
    label: "Estimativa máxima salarial"
    type: number
    sql: ${TABLE}."ESTIMATIVA_FINAL_SALARIO" ;;
  }

  dimension: estimativa_inicial_salario {
    group_label: "Dados da Vaga"
    label: "Estimativa inicial salarial"
    type: number
    sql: ${TABLE}."ESTIMATIVA_INICIAL_SALARIO" ;;
  }

  dimension: flg_atingiu_headcount {
    group_label: "Dados da Vaga"
    label: "Atingiu o headcount?"
    type: yesno
    sql: ${TABLE}."FLG_ATINGIU_HEADCOUNT" ;;
  }

  dimension: flg_deficiencia {
    group_label: "Dados da Vaga"
    label: "Vaga aberta para deficientes?"
    type: yesno
    sql: ${TABLE}."FLG_DEFICIENCIA" ;;
  }

  dimension: flg_remoto {
    group_label: "Dados da Vaga"
    label: "A vaga aceita trabalho remoto?"
    type: yesno
    sql: ${TABLE}."FLG_REMOTO" ;;
  }

  dimension: funcao {
    group_label: "Dados da Vaga"
    label: "Função"
    type: string
    sql: ${TABLE}."FUNCAO" ;;
  }

  dimension: headcount {
    group_label: "Dados da Vaga"
    label: "Headcount"
    description: "Número de vagas"
    type: number
    sql: ${TABLE}."HEADCOUNT" ;;
  }

  dimension: logradouro {
    group_label: "Dados da Vaga"
    label: "Logradouro"
    type: string
    sql: ${TABLE}."LOGRADOURO" ;;
  }

  dimension: motivo_cancelamento {
    group_label: "Dados da Vaga"
    label: "Motivo do cancelamento"
    type: string
    sql: ${TABLE}."MOTIVO_CANCELAMENTO" ;;
  }

  dimension: motivo_vaga {
    group_label: "Dados da Vaga"
    label: "Motivador para abertura"
    type: string
    sql: ${TABLE}."MOTIVO_VAGA" ;;
  }

  dimension: nome {
    group_label: "Dados da Vaga"
    label: "Nome da Vaga"
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: nome_criador {
    group_label: "Dados da Vaga"
    label: "Criador"
    type: string
    sql: ${TABLE}."NOME_CRIADOR" ;;
  }

  dimension: nome_gerente {
    group_label: "Dados da Vaga"
    label: "Gerente"
    type: string
    sql: ${TABLE}."NOME_GERENTE" ;;
  }

  dimension: nome_recrutador {
    group_label: "Dados da Vaga"
    label: "Recrutador"
    type: string
    sql: ${TABLE}."NOME_RECRUTADOR" ;;
  }

  dimension: nome_subsidiador {
    group_label: "Dados da Vaga"
    label: "Subsidiador"
    type: string
    sql: ${TABLE}."NOME_SUBSIDIADOR" ;;
  }

  dimension: nota_cancelamento {
    group_label: "Dados da Vaga"
    label: "Nota de cancelamento"
    type: string
    sql: ${TABLE}."NOTA_CANCELAMENTO" ;;
  }

  dimension: obj_avaliadores {
    group_label: "Dados da Vaga"
    label: "Lista de avaliadores"
    type: string
    sql: ${TABLE}."OBJ_AVALIADORES" ;;
  }

  dimension: obj_criterios_avaliacao {
    group_label: "Dados da Vaga"
    label: "Lista de critérios de avaliação"
    type: string
    sql: ${TABLE}."OBJ_CRITERIOS_AVALIACAO" ;;
  }

  dimension: obj_etapas {
    group_label: "Dados da Vaga"
    label: "Lista de etapas"
    type: string
    sql: ${TABLE}."OBJ_ETAPAS" ;;
  }

  dimension: obj_informacoes_adicionais {
    group_label: "Dados da Vaga"
    label: "Lista de informações adicionais"
    type: string
    sql: ${TABLE}."OBJ_INFORMACOES_ADICIONAIS" ;;
  }

  dimension: pagina_carreira {
    group_label: "Dados da Vaga"
    label: "Página de carreira"
    type: string
    sql: ${TABLE}."PAGINA_CARREIRA" ;;
  }

  dimension: pais {
    group_label: "Dados da Vaga"
    label: "País"
    type: string
    sql: ${TABLE}."PAIS" ;;
  }

  dimension_group: prazo_candidatura {
    group_label: "Dados da Vaga"
    label: "Prazo para candidaturas"
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
    group_label: "Dados da Vaga"
    label: "Prazo para contratação"
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
    group_label: "Dados da Vaga"
    label: "Quantidade de contratados"
    type: number
    sql: ${TABLE}."QTD_CONTRATADOS" ;;
  }

  dimension: qtd_desistencias {
    group_label: "Dados da Vaga"
    label: "Quantidade de desistências"
    type: number
    sql: ${TABLE}."QTD_DESISTENCIAS" ;;
  }

  dimension: qtd_em_processo {
    group_label: "Dados da Vaga"
    label: "Quantidade em processo"
    type: number
    sql: ${TABLE}."QTD_EM_PROCESSO" ;;
  }

  dimension: qtd_inscritos {
    group_label: "Dados da Vaga"
    label: "Quantidade de inscritos"
    type: number
    sql: ${TABLE}."QTD_INSCRITOS" ;;
  }

  dimension: qtd_reprovados {
    group_label: "Dados da Vaga"
    label: "Quantidade de reprovados"
    type: number
    sql: ${TABLE}."QTD_REPROVADOS" ;;
  }

  dimension: salario_moeda {
    group_label: "Dados da Vaga"
    label: "Moeda"
    type: string
    sql: ${TABLE}."SALARIO_MOEDA" ;;
  }


  dimension: status {
    group_label: "Dados da Vaga"
    label: "Status"
    type: string
    sql: case ${TABLE}."STATUS"
          when 'approved' then 'aprovada'
          when 'canceled' then 'cancelada'
          when 'closed' then 'encerrada'
          when 'frozen' then 'congelada'
          when 'published' then 'publicada'
          when 'waiting_approval' then 'em aprovação'
          when 'draft' then 'rascunho'
          when 'disapproved' then 'reprovada'
          else ${TABLE}."STATUS"
        end
    ;;
  }

  dimension: status_original {
    group_label: "Dados da Vaga"
    label: "Status (Original)"
    type: string
    sql: ${TABLE}."STATUS";;
    hidden: yes
  }

  dimension: tipo {
    group_label: "Dados da Vaga"
    label: "Tipo"
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  dimension: tipo_publicacao {
    group_label: "Dados da Vaga"
    label: "Tipo de publicação"
    type: string
    sql: ${TABLE}."TIPO_PUBLICACAO" ;;
  }

  dimension: qtd_inscricoes_internas {
    group_label: "Dados Candidaturas Internas"
    label: "Qtd. de inscrições internas"
    description: "Indica quantos colaborades do Pravaler se candidataram para essa vaga"
    type: number
    sql: ${TABLE}."QTD_INSCRICOES_INTERNAS" ;;
  }

  dimension: flg_houve_incricao_interna {
    group_label: "Dados Candidaturas Internas"
    label: "Houve inscrição interna?"
    description: "Indica se houve pelo menos uma inscrição de colaborador"
    type: yesno
    sql: ${TABLE}."FLG_HOUVE_INSCRICAO_INTERNA" ;;
  }

  dimension: sla_dias_corridos {
    group_label: "Dados da Vaga"
    label: "SLA dias corridos"
    description: "Indica a quantidade de dias corridos desde a data de publição, subtraindo os dias de congelamento (se houver)"
    type: number
    sql: ${TABLE}."SLA_DIAS_CORRIDOS" ;;
  }

  dimension: area_rh {
    group_label: "Dados da Vaga"
    label: "Área (RH)"
    description: "Indica a área da qual a vaga pertence (na visão do RH)"
    type: string
    sql: ${TABLE}."AREA_RH" ;;
  }

  dimension: flg_excluida {
    group_label: "Dados da Vaga"
    label: "Vaga excluída da plataforma?"
    type: yesno
    sql: ${TABLE}."FLG_EXCLUIDA" ;;
  }

  dimension_group: referencia_fechamento {
    group_label: "Dados da Vaga"
    label: "Data de referência de fechamento"
    description: "Indica a data na qual a data foi fechada (Seja por cancelamento ou por preenchimento da mesma)"
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: to_date(coalesce(${data_encerramento_date}, ${data_cancelamento_date}), 'YYYY-MM-DD') ;;
  }

  dimension_group: eng_data_atualizacao {
    group_label: "Dados da Vaga"
    label: "ENG - última data de atualização dos dados"
    description: "Indica a última data na qual houve coleta dos dados na sua origem"
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      time
    ]
    convert_tz: no
    datatype: date
    hidden: yes
    sql: ${TABLE}."ENG_DATA_ATUALIZACAO";;
  }

  measure: max_eng_data_atualizacao {
    group_label: "Dados da Vaga"
    label: "ENG - última data de atualização dos dados"
    description: "Indica a última data na qual houve coleta dos dados na sua origem"
    type: string
    sql: to_char(max(${TABLE}."ENG_DATA_ATUALIZACAO"), 'DD/MM/YYYY HH24:MI');;
  }

  measure: count_congeladas {
    label: "Qtd. Congeladas"
    type: count_distinct
    filters: [status_original: "frozen"]
    sql:  ${TABLE}."CODIGO";;
    drill_fields: [codigo, nome, area_rh, data_publicacao_date, data_congelamento_date]
  }

  measure: count_publicadas {
    label: "Qtd. Publicadas em aberto"
    type: count_distinct
    filters: [status_original: "published"]
    sql:  ${TABLE}."CODIGO";;
    drill_fields: [codigo, nome, area_rh, data_publicacao_date, sla_dias_corridos]
  }

  measure: count {
    type: count_distinct
    sql:  ${TABLE}."CODIGO";;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      codigo, nome, prazo_candidatura_date, prazo_contratacao_date, sla_dias_corridos
      , qtd_inscritos, qtd_em_processo, qtd_contratados, qtd_desistencias
      , qtd_inscricoes_internas, qtd_reprovados
    ]
  }

}
