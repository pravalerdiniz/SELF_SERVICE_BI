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
    group_label: "Dados da Vaga"
    label: "Lista de Avaliadores da Vaga"
    type: string
    sql: ${TABLE}."AVALIADORES_VAGA" ;;
  }

  dimension: campos_personalizados_vaga {
    group_label: "Dados da Vaga"
    label: "Lista de Campos Personalizados da Vaga"
    type: string
    sql: ${TABLE}."CAMPOS_PERSONALIZADOS_VAGA" ;;
  }

  dimension: cd_vaga {
    group_label: "Dados da Vaga"
    label: "Código Interno da Vaga"
    type: string
    sql: ${TABLE}."CD_VAGA" ;;
  }

  dimension: cidade_candidato {
    group_label: "Dados do Candidato"
    label: "Cidade"
    type: string
    sql: ${TABLE}."CIDADE_CANDIDATO" ;;
  }

  dimension: cidade_vaga {
    group_label: "Dados da Vaga"
    label: "Cidade"
    type: string
    sql: ${TABLE}."CIDADE_VAGA" ;;
  }

  dimension: codigos_vaga {
    group_label: "Dados da Vaga"
    label: "Códigos Internos da Vaga"
    type: string
    sql: ${TABLE}."CODIGOS_VAGA" ;;
  }

  dimension: criterios_avaliacao_vaga {
    group_label: "Dados da Vaga"
    label: "Lista de Critérios de Avaliação"
    type: string
    sql: ${TABLE}."CRITERIOS_AVALIACAO_VAGA" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_nasc_candidato {
    group_label: "Dados do Candidato"
    label: "Data de Nascimento"
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
    group_label: "Dados do Candidato"
    label: "Lista de Deficiências"
    type: string
    sql: ${TABLE}."DEFICIENCIAS" ;;
  }

  dimension_group: dt_aprovacao_vaga {
    group_label: "Dados da Vaga"
    label: "Data de Aprovação"
    description: "Data na qual a VAGA foi aprovada"
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
    group_label: "Dados da Candidatura"
    label: "Data da Última Atualização"
    description: "Data na qual ocorreu a última atualização em qualquer informação da candidatura"
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
    group_label: "Dados da Vaga"
    label: "Data da Última Atualização"
    description: "Data na qual ocorreu a última atualização em qualquer informação do cadastro da vaga"
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
    group_label: "Dados da Vaga"
    label: "Data do Cancelamento da Vaga"
    description: "Caso ocorra o cancelamento da vaga, neste campo será registrado a data na qual esse evento ocorreu"
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
    group_label: "Dados da Candidatura"
    label: "Data da Candidatura"
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
    group_label: "Dados da Vaga"
    label: "Data do Congelamento"
    description: "Caso ocorro congelamento da vaga, neste campo ficará registrada a data na qual esse evento ocorreu"
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
    group_label: "Dados da Candidatura"
    label: "Data da Contratação"
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
    group_label: "Dados da Vaga"
    label: "Data da Criação"
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
    group_label: "Dados da Vaga"
    label: "Data Final para se Candidatar"
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
    group_label: "Dados da Vaga"
    label: "Data Descongelamento"
    description: "Caso ocorra o descongelamento da data, neste campo ficará resgitrado a data na qual esse evento ocorreu"
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
    group_label: "Dados da Candidatura"
    label: "Data Finalização da Candidatura"
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
    group_label: "Dados da Vaga"
    label: "Data da Publicação"
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
    group_label: "Dados da Candidatura"
    label: "Etapa Atual - Data de Entrada Registrada pela Carga"
    description: "Ao fazer a ingestão dos dados, registramos a data e etapa na qual a candidatura se encontra naquele momento. Caso ocorra o avanço de mais de uma etapa por dia, essa informação poderá não ser encontrada"
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
    group_label: "Dados do Candidato"
    label: "Escolaridade"
    type: string
    sql:
      case ${TABLE}."ESCOLARIDADE_CANDIDATO"
        when 'elementary_school_complete' then 'fundamental_completo'
        when 'elementary_school_in_progress' then 'fundamental_em_andamento'
        when 'elementary_school_incomplete' then 'fundamental_incompleto'
        when 'graduation_complete' then 'graduacao_completa'
        when 'graduation_in_progress' then 'graduacao_em_andamento'
        when 'graduation_incomplete' then 'graduacao_incomplete'
        when 'high_school_complete' then 'ensino_medio_completo'
        when 'high_school_in_progress' then 'ensino_medio_em_andamento'
        when 'high_school_incomplete' then 'ensino_medio_incompleto'
        when 'master_degree_complete' then 'mestrado_completo'
        when 'master_degree_in_progress' then 'mestrado_em_andamento'
        when 'master_degree_incomplete' then 'mestrado_incompleto'
        when 'phd_complete' then 'phd_completo'
        when 'phd_in_progress' then 'phd_em_andamento'
        when 'phd_incomplete' then 'phd_incompleto'
        when 'post_doctorate_complete' then 'doutorado_completo'
        when 'post_doctorate_incomplete' then 'doutorado_incompleto'
        when 'post_doctorate_in_progress' then 'doutorado_em_andamento'
        when 'post_graduate_complete' then 'pos_graduacao_completa'
        when 'post_graduate_in_progress' then 'pos_graduacao_em_andamento'
        when 'post_graduate_incomplete' then 'pos_graduacao_incompleta'
        when 'technical_course_complete' then 'tecnico_completo'
        when 'technical_course_in_progress' then 'tecnico_em_andamento'
        when 'technical_course_incomplete' then 'tecnico_incompleto'
        when 'technological_complete' then 'tecnologo_completo'
        when 'technological_in_progress' then 'tecnologo_em_andamento'
        when 'technological_incomplete' then 'tecnologo_incompleto'
        else ${TABLE}."ESCOLARIDADE_CANDIDATO"
      end
    ;;
  }

  dimension: estado_candidato {
    group_label: "Dados do Candidato"
    label: "Estado"
    type: string
    sql: ${TABLE}."ESTADO_CANDIDATO" ;;
  }

  dimension: estado_vaga {
    group_label: "Dados da Vaga"
    label: "Estado"
    type: string
    sql: ${TABLE}."ESTADO_VAGA" ;;
  }

  dimension: etapas_vagas {
    group_label: "Dados da Vaga"
    label: "Lista de Etapas"
    type: string
    sql: ${TABLE}."ETAPAS_VAGAS" ;;
  }

  dimension: flg_cadastro_completo {
    group_label: "Dados da Candidatura"
    label: "Cadastro Completo?"
    type: yesno
    sql: ${TABLE}."FLG_CADASTRO_COMPLETO" ;;
  }

  dimension: flg_deficiencia {
    group_label: "Dados do Candidato"
    label: "Possui deficiência?"
    type: yesno
    sql: ${TABLE}."FLG_DEFICIENCIA" ;;
  }

  dimension: ultima_empresa {
    group_label: "Dados do Candidato"
    label: "Empresa (da última ou atual experiência)"
    description: "EMPRESA OBJETO DA ÚLTIMA EXPERIÊNCIA INFORMADA"
    type: string
    sql: ${TABLE}."ULTIMA_EMPRESA" ;;
  }

  dimension: cargo_ultima_empresa {
    group_label: "Dados do Candidato"
    label: "Cargo (da última ou atual experiência)"
    type: string
    sql: ${TABLE}."CARGO_ULTIMA_EMPRESA" ;;
  }

  dimension: ano_mes_inicio_ultima_empresa {
    group_label: "Dados do Candidato"
    label: "Ano/Mês de início da última experiência"
    type: number
    value_format: "######"
    sql: ${TABLE}."ANO_MES_INICIO_ULTIMA_EMPRESA" ;;
  }

  dimension: ano_mes_termino_ultima_empresa {
    group_label: "Dados do Candidato"
    label: "Ano/Mês de término da última experiência"
    type: number
    value_format: "######"
    sql: ${TABLE}."ANO_MES_TERMINO_ULTIMA_EMPRESA" ;;
  }

  dimension: flg_trabalha_atualmente {
    group_label: "Dados do Candidato"
    label: "Trabalha atualmente?"
    description: "Indica se o candidato informou se est[a trabalhando atualmente"
    type: yesno
    sql: ${TABLE}."FLG_TRABALHA_ATUALMENTE" ;;
  }

  dimension: flg_feedback {
    group_label: "Dados da Candidatura"
    label: "Houve Feedback?"
    type: yesno
    sql: ${TABLE}."FLG_FEEDBACK" ;;
  }

  dimension: flg_funcionario {
    group_label: "Dados da Candidatura"
    label: "É funcionário?"
    type: yesno
    sql: ${TABLE}."FLG_FUNCIONARIO" ;;
  }

  dimension: flg_indicacao {
    group_label: "Dados da Candidatura"
    label: "É indicação?"
    type: yesno
    sql: ${TABLE}."FLG_INDICACAO" ;;
  }

  dimension: flg_vaga_deficiencia {
    group_label: "Dados da Vaga"
    label: "Vaga para Deficiente?"
    type: yesno
    sql: ${TABLE}."FLG_VAGA_DEFICIENCIA" ;;
  }

  dimension: genero_candidato {
    group_label: "Dados do Candidato"
    label: "Gênero"
    type: string
    sql: ${TABLE}."GENERO_CANDIDATO" ;;
  }

  dimension: id_candidato {
    group_label: "Dados do Candidato"
    label: "Código do Candidato"
    type: number
    sql: ${TABLE}."ID_CANDIDATO" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  #measure: total_id_candidato {
  #  type: sum
  #  sql: ${id_candidato} ;;
  #}

  #measure: average_id_candidato {
  #  type: average
  #  sql: ${id_candidato} ;;
  #}

  dimension: id_candidatura {
    group_label: "Dados da Candidatura"
    label: "Código da Candidatura"
    type: number
    sql: ${TABLE}."ID_CANDIDATURA" ;;
  }
  dimension: id_etapa_atual {
    group_label: "Dados da Candidatura"
    label: "Etapa Atual - Código"
    type: number
    sql: ${TABLE}."ID_ETAPA_ATUAL" ;;
  }

  dimension: id_vaga {
    group_label: "Dados da Vaga"
    label: "Código da Vaga"
    type: number
    sql: ${TABLE}."ID_VAGA" ;;
  }

  dimension: indicado_por {
    group_label: "Dados da Candidatura"
    label: "Indicado por"
    type: string
    sql: ${TABLE}."INDICADO_POR" ;;
  }

  dimension: metodo_fluxo_requerido {
    group_label: "Dados da Vaga"
    label: "Método do Fluxo"
    type: string
    sql: ${TABLE}."METODO_FLUXO_REQUERIDO" ;;
  }

  dimension: motivo_cancelamento_vaga {
    group_label: "Dados da Vaga"
    label: "Motivo do Cancelamento"
    type: string
    sql: ${TABLE}."MOTIVO_CANCELAMENTO_VAGA" ;;
  }

  dimension: motivo_declinio {
    group_label: "Dados da Candidatura"
    label: "Motivo do Declínio (Normalizado)"
    type: string
    sql: case ${TABLE}."MOTIVO_DECLINIO"
          when 'candidate_outside_required_location' then 'candidato_fora_localizacao_requerida'
          when 'elevated_wage_expectation' then 'alta_expectativa_salario'
          when 'fulfilled_vacancy' then 'vagas_preenchidas'
          when 'gave_up_for_personal_reasons' then 'desistencia_motivos_pessoais'
          when 'hired_by_another_company' then 'contratado_outra_empresa'
          when 'hired_in_another_job' then 'contratado_outro_trabalho'
          when 'incompatible_curriculum' then 'curriculo_incompativel'
          when 'insufficient_academic_background' then 'background_academico_insuficiente'
          when 'insufficient_knowledge' then 'conhecimento_insuficiente'
          when 'insufficient_seniority' then 'senioridade_insuficiente'
          when 'invited_to_another_process' then 'convidado_outro_processo'
          when 'lack_of_culture_alignment' then 'falta_alinhamento_cultural'
          when 'lack_of_professional_experience' then 'falta_experiencia_profissional'
          when 'little_stability_in_previous_companies' then 'pouca_estabilidade_empresas_anteriores'
          when 'missed_steps_of_process' then 'perdeu_etapas_processo'
          when 'no_potential_for_growth' then 'sem_potencial_crescimento'
          when 'not_respond_to_contacts' then 'nao_responde_contatos'
          when 'other_reason' then 'outras_razoes'
          when 'overqualified' then 'muito_qualificado'
          when 'proposal_not_accepted' then 'proposta_nao_aceita'
          when 'test_result_below_cutoff' then 'resultado_teste_abaixo'
      else ${TABLE}."MOTIVO_DECLINIO"
    end
    ;;
  }

  dimension: motivo_declinio_traduzido {
    group_label: "Dados da Candidatura"
    label: "Motivo do Declínio (Traduzido)"
    type: string
    sql: case ${TABLE}."MOTIVO_DECLINIO"
          when 'candidate_outside_required_location' then 'Candidato fora da localização requerida'
          when 'elevated_wage_expectation' then 'Alta expectativa salarial'
          when 'fulfilled_vacancy' then 'Vagas já preenchidas'
          when 'gave_up_for_personal_reasons' then 'Desistência por motivo pessoal'
          when 'hired_by_another_company' then 'Contratado por outra empresa'
          when 'hired_in_another_job' then 'Contratado em outro trabalho'
          when 'incompatible_curriculum' then 'Currículo incompatível'
          when 'insufficient_academic_background' then 'Background acadêmico insuficiente'
          when 'insufficient_knowledge' then 'Conhecimento insuficiente'
          when 'insufficient_seniority' then 'Sênioridade insuficiente'
          when 'invited_to_another_process' then 'Convidado para outro processo'
          when 'lack_of_culture_alignment' then 'Falta alinhamento cultural'
          when 'lack_of_professional_experience' then 'Falta experiência profissional'
          when 'little_stability_in_previous_companies' then 'Pouca estabilidade em empresas anteriores'
          when 'missed_steps_of_process' then 'Perdeu etapas do processo'
          when 'no_potential_for_growth' then 'Sem potencial de crescimento'
          when 'not_respond_to_contacts' then 'Não responde a contatos'
          when 'other_reason' then 'Outras razões'
          when 'overqualified' then 'Muito qualificado'
          when 'proposal_not_accepted' then 'Proposta recusada'
          when 'test_result_below_cutoff' then 'Resultado do teste abaixo da linha de corte'
      else ${TABLE}."MOTIVO_DECLINIO"
    end
    ;;
  }

  dimension: motivo_vaga {
    group_label: "Dados da Vaga"
    label: "Motivador"
    type: string
    sql: ${TABLE}."MOTIVO_VAGA" ;;
  }

  dimension: nm_candidato {
    group_label: "Dados do Candidato"
    label: "Nome"
    type: string
    sql: ${TABLE}."NM_CANDIDATO" ;;
  }

  dimension: nm_criador {
    group_label: "Dados da Vaga"
    label: "Nome do Criador"
    type: string
    sql: ${TABLE}."NM_CRIADOR" ;;
  }

  dimension: nm_depto {
    group_label: "Dados da Vaga"
    label: "Departamento"
    type: string
    sql: ${TABLE}."NM_DEPTO" ;;
  }

  dimension: nm_etapa_atual {
    group_label: "Dados da Candidatura"
    label: "Etapa Atual - Nome"
    type: string
    sql: ${TABLE}."NM_ETAPA_ATUAL" ;;
  }

  dimension: nm_etapa_atual_tratada {
    group_label: "Dados da Candidatura"
    label: "Etapa Atual - Nome Tratado"
    description: "Nome da etapa atual, tratada para padrão Gente & Gestão"
    type: string
    sql: case ${TABLE}."NM_ETAPA_ATUAL"
          when 'ALINHAMENTO_FINAL_GESTOR' then 'LEVANTAMENTO_REFERENCIAS'
          when 'CADASTRO' then 'CANDIDATURAS'
          when 'CANDIDATURA_INTERNA' then 'RECRUTAMENTO_INTERNO'
          when 'CONTRATACAO' then 'CONTRATACAO'
          when 'CASE' then 'ETAPA_TECNICA'
          when 'CASE_STUDY' then 'ETAPA_TECNICA'
          when 'DINAMICAS_GRUPO' then 'ETAPA_TECNICA'
          when 'ENTREVISTA_ALTA_LIDERANCA' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_BRUNO_LIMA' then 'ETAPA_TECNICA'
          when 'ENTREVISTA_CTO' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_DIRETOR_NEGOCIOS' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_EQUIPE' then 'ETAPA_TECNICA'
          when 'ENTREVISTA_EXTRA' then 'ENTREVISTA_EXTRA'
          when 'ENTREVISTA_FINAL' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_GEG' then 'ENTREVISTA_GENTE_GESTAO'
          when 'ENTREVISTA_GENTE_GESTAO' then 'ENTREVISTA_GENTE_GESTAO'
          when 'ENTREVISTA_GERENTE' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_GERENTE_ENGENHARIA' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_GESTAO' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_GESTOR' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_GESTOR_AREA' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_GESTOR_VAGA' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_GG' then 'ENTREVISTA_GENTE_GESTAO'
          when 'ENTREVISTA_HEAD_NOVOS_PRODUTOS' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_HEAD_PRODUTOS' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_INICIAL_STEPHANIE_WEIBER' then 'ENTREVISTA_GENTE_GESTAO'
          when 'ENTREVISTA_KARINA_TITONELLI' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_PO_TRIBE_LEADER' then 'ENTREVISTA_GESTOR'
          when 'ENTREVISTA_RECRUTADORA' then 'ENTREVISTA_GENTE_GESTAO'
          when 'ENTREVISTA_RECRUTAMENTO' then 'ENTREVISTA_GENTE_GESTAO'
          when 'ENTREVISTA_RH' then 'ENTREVISTA_GENTE_GESTAO'
          when 'ENTREVISTA_TECH_LEAD' then 'ETAPA_TECNICA'
          when 'ENTREVISTA_TECNICA' then 'ETAPA_TECNICA'
          when 'ENTREVISTA_TIME' then 'ETAPA_TECNICA'
          when 'ENVIO_OFERTA' then 'ENVIO_PROPOSTA'
          when 'ENVIO_PROPOSTA' then 'ENVIO_PROPOSTA'
          when 'ESTUDO_CASO_COMPRAS_SUPRIMENTOS' then 'ETAPA_TECNICA'
          when 'ETAPA_TECNICA' then 'ETAPA_TECNICA'
          when 'GENTE_GESTAO' then 'ENTREVISTA_GENTE_GESTAO'
          when 'PAINEL_EXECUTIVOS' then 'ENTREVISTA_EXTRA'
          when 'PORPOSTA' then 'ENVIO_PROPOSTA'
          when 'PROPOSTA' then 'ENVIO_PROPOSTA'
          when 'QUESTIONARIO_RECRUTAMENTO_INTERNO' then 'RECRUTAMENTO_INTERNO'
          when 'REDACAO_LIVRE' then 'ETAPA_TECNICA'
          when 'TESTE_FIT_CULTURAL' then 'ENTREVISTA_GENTE_GESTAO'
          when 'TESTE_LOGICA' then 'ETAPA_TECNICA'
          when 'TESTE_ONLINE' then 'ETAPA_TECNICA'
          when 'VIDEO' then 'ETAPA_TECNICA'

          when 'CONHECA_PRAVALER' then 'ENTREVISTA_GENTE_GESTAO'
          when 'ENTREVISTA_CFO' then 'ENTREVISTA_GESTOR'

          else ${TABLE}."NM_ETAPA_ATUAL"
    end
    ;;
  }


  dimension: nm_funcao {
    group_label: "Dados da Vaga"
    label: "Função"
    type: string
    sql: ${TABLE}."NM_FUNCAO" ;;
  }

  dimension: nm_gerente {
    group_label: "Dados da Vaga"
    label: "Gerente da Vaga"
    type: string
    sql: ${TABLE}."NM_GERENTE" ;;
  }

  dimension: nm_parceiro {
    group_label: "Dados da Candidatura"
    label: "Parceiro"
    type: string
    sql: ${TABLE}."NM_PARCEIRO" ;;
  }

  dimension: nm_recrutador {
    group_label: "Dados da Candidatura"
    label: "Recrutador"
    type: string
    sql: ${TABLE}."NM_RECRUTADOR" ;;
  }

  dimension: nm_vaga {
    group_label: "Dados da Vaga"
    label: "Nome da Vaga"
    type: string
    sql: ${TABLE}."NM_VAGA" ;;
  }

  dimension: nota_cancelamento_vaga {
    group_label: "Dados da Vaga"
    label: "Nota de Cancelamento"
    type: string
    sql: ${TABLE}."NOTA_CANCELAMENTO_VAGA" ;;
  }

  dimension: nro_vagas {
    group_label: "Dados da Vaga"
    label: "Número de Vagas"
    type: number
    sql: ${TABLE}."NRO_VAGAS" ;;
  }

  dimension: origem_candidatura {
    group_label: "Dados da Candidatura"
    label: "Origem"
    type: string
    sql: ${TABLE}."ORIGEM_CANDIDATURA" ;;
  }

  dimension: pais_candidato {
    group_label: "Dados do Candidato"
    label: "País"
    type: string
    sql: ${TABLE}."PAIS_CANDIDATO" ;;
  }

  dimension: pais_vaga {
    group_label: "Dados da Vaga"
    label: "País"
    type: string
    sql: ${TABLE}."PAIS_VAGA" ;;
  }

  dimension: perguntas_adicionais {
    group_label: "Dados da Candidatura"
    label: "Perguntas Adicionais"
    type: string
    sql: ${TABLE}."PERGUNTAS_ADICIONAIS" ;;
  }

  dimension: salario_estimativa_final {
    group_label: "Dados da Vaga"
    label: "Estimativa Salarial Final"
    type: number
    sql: ${TABLE}."SALARIO_ESTIMATIVA_FINAL" ;;
  }

  dimension: salario_estimativa_inicial {
    group_label: "Dados da Vaga"
    label: "Estimativa Salarial Inicial"
    type: number
    sql: ${TABLE}."SALARIO_ESTIMATIVA_INICIAL" ;;
  }

  dimension: salario_moeda {
    group_label: "Dados da Vaga"
    label: "Moeda"
    type: string
    sql: ${TABLE}."SALARIO_MOEDA" ;;
  }

  dimension: status_candidatura {
    group_label: "Dados da Candidatura"
    label: "Status da Candidatura"
    description: "Status geral da candidatura"
    type: string
    sql: case ${TABLE}."STATUS_CANDIDATURA"
          when 'give_up' then 'desistiu'
          when 'hired' then 'contratado'
          when 'in_process' then 'em andamento'
          when 'reproved' then 'reprovado'
          else ${TABLE}."STATUS_CANDIDATURA"
        end
    ;;
  }

  dimension: status_etapa_atual {
    group_label: "Dados da Candidatura"
    label: "Etapa Atual - Status"
    type: string
    sql: case ${TABLE}."STATUS_ETAPA_ATUAL"
          when 'done' then 'concluída'
          when 'not_started' then 'nao_iniciada'
          else ${TABLE}."STATUS_ETAPA_ATUAL"
    end;;
  }

  dimension: status_indicacao {
    group_label: "Dados da Candidatura"
    label: "Status da Indicação"
    type: string
    sql: ${TABLE}."STATUS_INDICACAO" ;;
  }

  dimension: status_vaga {
    group_label: "Dados da Vaga"
    label: "Status da vaga"
    type: string
    sql: case ${TABLE}."STATUS_VAGA"
          when 'approved' then 'aprovada'
          when 'canceled' then 'cancelada'
          when 'closed' then 'fechada'
          when 'frozen' then 'congelada'
          when 'published' then 'publicada'
          when 'waiting_approval' then 'em aprovação'
          when 'draft' then 'rascunho'
          when 'disapproved' then 'reprovada'
          else ${TABLE}."STATUS_VAGA"
        end
    ;;
  }

  dimension: tags {
    group_label: "Dados da Candidatura"
    label: "Lista de Tags"
    type: string
    sql: ${TABLE}."TAGS" ;;
  }

  dimension: tipo {
    group_label: "Dados da Vaga"
    label: "Tipo"
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  dimension: tipo_contratacao {
    group_label: "Dados da Candidatura"
    label: "Tipo Contratação"
    type: string
    sql: ${TABLE}."TIPO_CONTRATACAO" ;;
  }

  dimension: tipo_publicacao {
    group_label: "Dados da Vaga"
    label: "Tipo Publicação"
    type: string
    sql: ${TABLE}."TIPO_PUBLICACAO" ;;
  }

  dimension: trabalho_remoto {
    group_label: "Dados da Vaga"
    label: "Trabalho Remoto?"
    type: yesno
    sql: ${TABLE}."TRABALHO_REMOTO" ;;
  }

  dimension_group: dt_inicio_prox_etapa {
    group_label: "Dados da Candidatura"
    label: "Data de Início na próxima Etapa"
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
    sql: ${TABLE}."DT_INICIO_PROX_ETAPA" ;;
  }

  dimension:  qtd_dias_corridos_etapa{
    group_label: "Dados da Candidatura"
    label: "Quantidade de dias corridos nesta etapa"
    description: "Indica a quantidade de dias corridos que o candidato está parado nesta etapa"
    type: number
    sql: datediff(days, ${dt_registro_entrada_etapa_date}, coalesce(${dt_inicio_prox_etapa_date}, ${dt_finalizacao_candidatura_date}, current_date)) + 1
    ;;
  }

  dimension: score_compatibilidade {
    group_label: "Dados da Candidatura"
    label: "Score de compatibilidade"
    description: "Indica a pontuação que esse candidato tem com a vaga em questão"
    type: number
    sql: ${TABLE}."SCORE_COMPATIBILIDADE" ;;
  }

  dimension: genero_declarado {
    group_label: "Dados da Candidatura"
    label: "Identidade de gênero declarada"
    type: string
    sql: ${TABLE}."GENERO_DECLARADO" ;;
  }

  dimension: orientacao_sexual_declarada {
    group_label: "Dados da Candidatura"
    label: "Orientação sexual declarada"
    type: string
    sql: ${TABLE}."ORIENTACAO_SEXUAL_DECLARADA" ;;
  }

  dimension: etnia_declarada {
    group_label: "Dados da Candidatura"
    label: "Etnia declarada"
    type: string
    sql: ${TABLE}."ETNIA_DECLARADA" ;;
  }

  dimension: flg_funcionario_interno {
    group_label: "Dados do Candidato"
    label: "É funcionário interno?"
    description: "Indica se já é um funcionário interno (Segundo o cadastro na Sênior)"
    type: yesno
    sql: ${TABLE}."FLG_FUNCIONARIO_INTERNO" ;;
  }

  dimension_group: data_admissao_interno {
    group_label: "Dados do Candidato"
    label: "Data de admissão (funcionário)"
    description: "Indica a data de admissão do funcionário (Segundo o cadastro na Sênior)"
    type: time
    timeframes: [
      date,
      month,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATA_ADMISSAO_INTERNO" ;;
  }

  dimension: ordem_macroetapa {
    group_label: "Dados da Candidatura"
    label: "Ordem da Macroetapa"
    description: "Indica a ordem da etapa (ascendente)"
    type: number
    sql: ${TABLE}."ORDEM_MACROETAPA" ;;
  }

  dimension: macroetapa {
    group_label: "Dados da Candidatura"
    label: "Etapa Funil"
    description: "Nome da macroetapa no funil padrão da plataforma Gupy"
    type: string
    sql: case ${TABLE}."MACROETAPA"
      when 'registration' then 'Triagem'
      when 'online' then 'Avaliação'
      when 'offline' then 'Entrevista'
      when 'hiring' then 'Oferta'
      else ${TABLE}."MACROETAPA"
    end
    ;;
  }

  measure: count {
    type: count
    drill_fields: [drill_fields*]
  }

  measure: count_distinct_candidato {
    label: "Count distinct por candidato"
    type: count_distinct
    sql: ${TABLE}."ID_CANDIDATO" ;;
    drill_fields: [drill_fields*]
  }

  set: drill_fields {
    fields: [id_candidatura, cd_vaga, nm_vaga, nm_candidato, dt_candidatura_date, dt_publicacao_date, status_candidatura, status_vaga]
  }
}
