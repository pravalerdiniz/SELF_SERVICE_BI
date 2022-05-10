view: tela_atendimento {
  #filter: login_filter {type: string}
  derived_table: {
    sql: select * from GRADUADO.CRM.CHAMADOS_TELA_ATENDIMENTO
        where login in ('ARYELLY.PEQUENO','DANNY.SILVA.LUANDRE','INGRID.SANTOS','ELIONAI.SANTOS.LUANDRE','DAIANE.SILVA.LUANDRE',
'NATHALYA.MARTINS.LUANDRE','DANIEL.BARCELLOS','MARCELLA.SANTOS','GISELLY.CORTEZ.LUANDRE','JULIANA.AZEVEDO','JIANINI.FIGUEIREDO.LUANDRE',
'WESLEY.DALBERIO','GABRIELA.BASTOS','JEAN.REIS.LUANDRE','ANDERSON.OLIVEIRA.LUANDRE','DENISE.OLIVEIRA.LUANDRE',
'BEATRIZ.MORAES','BRUNO.NICOLETI.LUANDRE','SABRINA.RODRIGUES','VITOR.BOARINI','RAFAELA.ALVES', 'BRUNO.OLIVEIRA',
'FELIPE.SANTOS', 'KAUANY.SABINO')
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_chamado {
    type: number
    group_label: "Dados Chamado"
    label: "ID do chamado"
    description: "Indica o ID do chamado registrado na Tela de Atendimento"
    primary_key: yes
    sql: ${TABLE}."ID_CHAMADO" ;;
  }

  dimension: id_cpf {
    type: number
    group_label: "Dados do Aluno"
    label: "ID_CPF do Aluno"
    description: "Indica o ID_CPF do Aluno vindo do BO"
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension_group: data_chamado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    group_label: "Data Chamado"
    label: "Data Chamado"
    description: "Indica a data que foi iniciado o chamado"
    sql: ${TABLE}."DATA_CHAMADO" ;;
  }

  dimension: horario_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Horário do chamado"
    description: "Indica o horário que foi iniciado o chamado"
    sql: ${TABLE}."HORARIO_CHAMADO" ;;
  }

  dimension_group: data_hora_chamado {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year,
      time_of_day,
      month_name,
      day_of_year,
      hour_of_day,
      month_num,
      day_of_month
    ]
    sql: concat(${data_chamado_date},${horario_chamado}) ;;
    group_label: "Dados Chamado"
    hidden: yes
    label: "Data Hora Chamado"
    description: "Data e Hora do Chamado"
  }

  dimension: id_titulo_chamado {
    type: number
    group_label: "Dados Chamado"
    label: "ID do título do chamado"
    description: "Indica o ID do título do chamado registrado na Tela de Atendimento"
    sql: ${TABLE}."ID_TITULO_CHAMADO" ;;
  }

  dimension: ds_titulo_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Descrição do título do chamado"
    description: "Indica o título do chamado"
    sql: ${TABLE}."DS_TITULO_CHAMADO" ;;
  }

  dimension: texto_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Conteúdo chamado"
    description: "Indica o texto registrado no chamado"
    sql: ${TABLE}."TEXTO_CHAMADO" ;;
  }

  dimension: id_sub_titulo_chamado {
    type: number
    group_label: "Dados Chamado"
    label: "ID do subtítulo do chamado"
    description: "Indica o ID do subtítulo do chamado registrado na Tela de Atendimento"
    sql: ${TABLE}."ID_SUB_TITULO_CHAMADO" ;;
  }

  dimension: ds_sub_titulo_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Descrição do subtítulo do chamado"
    description: "Indica o subtítulo do chamado"
    sql: ${TABLE}."DS_SUB_TITULO_CHAMADO" ;;
  }

  dimension: texto {
    type: string
    group_label: "Dados Chamado"
    label: "Observações"
    description: "Observações registradas pelo atendente no chamado"
    sql: ${TABLE}."TEXTO" ;;
  }

  dimension: id_status_chamado {
    type: number
    group_label: "Dados Chamado"
    label: "ID do status do chamado"
    description: "Indica o ID do status do chamado"
    sql: ${TABLE}."ID_STATUS_CHAMADO" ;;
  }

  dimension: ds_status_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Status do chamado"
    description: "Indica descrição do status do chamado"
    sql: ${TABLE}."DS_STATUS_CHAMADO" ;;
  }

  dimension: id_usuario {
    type: number
    group_label: "Dados Usuário"
    label: "Id usuário"
    description: "Indica o ID do atendente do chamado"
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension: cpf {
    type: string
    group_label: "Dados Usuário"
    label: "CPF"
    description: "Indica o CPF do atendente do chamado"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: nm_usuario {
    type: string
    group_label: "Dados Usuário"
    label: "Nome"
    description: "Indica o Nome do atendente do chamado"
    sql: ${TABLE}."NM_USUARIO" ;;
  }

  dimension: login {
    type: string
    group_label: "Dados Usuário"
    label: "Login"
    description: "Indica o login do atendente do chamado"
    sql: ${TABLE}."LOGIN" ;;
  }

  dimension: instituicao {
    type: string
    group_label: "Dados Usuário"
    label: "Empresa"
    description: "Indica a empresa do atendente do chamado"
    sql: ${TABLE}."INSTITUICAO" ;;
  }

  dimension: email {
    type: string
    group_label: "Dados Usuário"
    label: "email"
    description: "Indica o email do atendente do chamado"
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: telefone {
    type: string
    group_label: "Dados Usuário"
    label: "Telefone"
    description: "Indica o telefone do atendente do chamado"
    sql: ${TABLE}."TELEFONE" ;;
  }

  dimension: tp_usuario {
    type: string
    group_label: "Dados Usuário"
    label: "Tipo usuário"
    description: "Indica o tipo do atendente do chamado"
    sql: ${TABLE}."TP_USUARIO" ;;
  }

  dimension: ds_perfil {
    type: string
    group_label: "Dados Usuário"
    label: "Perfil"
    description: "Indica o Perfil do atendente do chamado"
    sql: ${TABLE}."DS_PERFIL" ;;
  }

  dimension: departamento {
    type: string
    group_label: "Dados Usuário"
    label: "Departamento"
    description: "Indica o Departamento do atendente do chamado"
    sql: ${TABLE}."DEPARTAMENTO" ;;
  }

  dimension: tp_consultor {
    type: string
    group_label: "Dados Usuário"
    label: "Tipo consultor"
    description: "Indica o tipo do atendente do chamado"
    sql: ${TABLE}."TP_CONSULTOR" ;;
  }

  dimension: id_tratativa {
    type: number
    group_label: "Dados Tratativa"
    label: "Id Tratativa"
    description: "Indica o Id da tratativa feita pelo usuário"
    sql: ${TABLE}."ID_TRATATIVA" ;;
  }

  dimension: ds_tratativa {
    type: string
    group_label: "Dados Tratativa"
    label: "Descrição Tratativa"
    description: "Indica a Descrição da tratativa feita pelo usuário"
    sql: ${TABLE}."DS_TRATATIVA" ;;
  }

  dimension: id_canal {
    type: string
    group_label: "Dados Canal"
    label: "Id do Canal"
    description: "Indica o Id do canal que foi feito o atendimento"
    sql: ${TABLE}."ID_CANAL" ;;
  }

  dimension: ds_canal {
    type: string
    group_label: "Dados Canal"
    label: "Descrição do Canal"
    description: "Indica o nome do canal que foi feito o atendimento"
    sql: ${TABLE}."DS_CANAL" ;;
  }

  dimension: infos_jornada {
    type: string
    sql: ${TABLE}."INFOS_JORNADA" ;;
    hidden: yes
  }

  dimension: mudou_etapa {
    type: string
    case: {
      when: {
        sql: ${tela_atendimento_jornada.DT_STATUS_date} >= ${data_chamado_date}
          AND ${tela_atendimento_jornada.DT_STATUS_date} <= DATEADD(day, 3, ${data_chamado_date}) ;;
        label: "1"
      }
      else: "0"
    }
    group_label: "Mudou Etapa"
    label: "Mudou Etapa"
    description: "Indicador de mudança de status na jornada"
  }

  dimension: Formalizou {
    type: string
    case: {
      when: {
        sql: ${tela_atendimento_jornada.DT_STATUS_date} >= ${data_chamado_date}
          AND ${tela_atendimento_jornada.DT_STATUS_date} <= DATEADD(day, 3, ${data_chamado_date})
          and ${tela_atendimento_jornada.ETAPA} = 'Formalizado'
          ;;
        label: "1"
      }
      else: "0"
    }
    group_label: "Mudou Etapa"
    label: "Formalizou"
    description: "Indicador se o aluno formalizou a proposta"
  }

  measure: count_id_chamado {
    type: count_distinct
    sql: ${id_chamado} ;;
    group_label: "Quantidade de Chamados"
    group_item_label: "Valor"
    description: "Contagem de ID's de chamados únicos"
  }

  set: detail {
    fields: [
      id_chamado,
      id_cpf,
      data_chamado_time,
      horario_chamado,
      id_titulo_chamado,
      ds_titulo_chamado,
      texto_chamado,
      id_sub_titulo_chamado,
      ds_sub_titulo_chamado,
      texto,
      id_status_chamado,
      ds_status_chamado,
      id_usuario,
      cpf,
      nm_usuario,
      login,
      instituicao,
      email,
      telefone,
      tp_usuario,
      ds_perfil,
      departamento,
      tp_consultor,
      id_tratativa,
      ds_tratativa,
      id_canal,
      ds_canal,
      infos_jornada
    ]
  }
}
