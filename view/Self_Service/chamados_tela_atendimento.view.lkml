# The name of this view in Looker is "Chamados Tela Atendimento"
view: chamados_tela_atendimento {
  sql_table_name: "GRADUADO"."CRM"."CHAMADOS_TELA_ATENDIMENTO"
    ;;

  dimension: cpf {
    type: string
    group_label: "Dados Usuário"
    label: "CPF"
    description: "Indica o CPF do atendente do chamado"
    sql: ${TABLE}."CPF" ;;
  }

  dimension_group: data_chamado {
    type: time
    timeframes: [
      raw,
      time,
      hour,
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

  dimension: departamento {
    type: string
    group_label: "Dados Usuário"
    label: "Departamento"
    description: "Indica o Departamento do atendente do chamado"
    sql: ${TABLE}."DEPARTAMENTO" ;;
  }

  dimension: ds_canal {
    type: string
    group_label: "Dados Canal"
    label: "Descrição do Canal"
    description: "Indica o nome do canal que foi feito o atendimento"
    sql: ${TABLE}."DS_CANAL" ;;
  }

  dimension: ds_perfil {
    type: string
    group_label: "Dados Usuário"
    label: "Perfil"
    description: "Indica o Perfil do atendente do chamado"
    sql: ${TABLE}."DS_PERFIL" ;;
  }

  dimension: ds_status_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Status do chamado"
    description: "Indica descrição do status do chamado"
    sql: ${TABLE}."DS_STATUS_CHAMADO" ;;
  }

  dimension: ds_sub_titulo_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Descrição do subtítulo do chamado"
    description: "Indica o subtítulo do chamado"
    sql: ${TABLE}."DS_SUB_TITULO_CHAMADO" ;;
  }

  dimension: ds_titulo_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Descrição do título do chamado"
    description: "Indica o título do chamado"
    sql: ${TABLE}."DS_TITULO_CHAMADO" ;;
  }

  dimension: ds_tratativa {
    type: string
    group_label: "Dados Tratativa"
    label: "Descrição Tratativa"
    description: "Indica a Descrição da tratativa feita pelo usuário"
    sql: ${TABLE}."DS_TRATATIVA" ;;
  }

  dimension: email {
    type: string
    group_label: "Dados Usuário"
    label: "email"
    description: "Indica o email do atendente do chamado"
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: flg_ds_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Produtivo/Improdutivo"
    description: "Indica se o chamado foi Produtivo ou Improdutivo, marcação feita pelo atendente"
    sql: ${TABLE}."FLG_DS_CHAMADO" ;;
  }

  dimension: flg_tipo_atendimento {
    type: string
    group_label: "Dados Chamado"
    label: "Tipo Atendimento"
    description: "Indica o tipo de atendimento feito: ATIVO/RECEPTIVO/BO ANTIGO"
    sql: ${TABLE}."FLG_TIPO_ATENDIMENTO" ;;
  }

  dimension: horario_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Horário do chamado"
    description: "Indica o horário que foi iniciado o chamado"
    sql: ${TABLE}."HORARIO_CHAMADO" ;;
  }

  dimension: id_canal {
    type: string
    group_label: "Dados Canal"
    label: "Id do Canal"
    description: "Indica o Id do canal que foi feito o atendimento"
    sql: ${TABLE}."ID_CANAL" ;;
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

  dimension: id_status_chamado {
    type: number
    group_label: "Dados Chamado"
    label: "ID do status do chamado"
    description: "Indica o ID do status do chamado"
    sql: ${TABLE}."ID_STATUS_CHAMADO" ;;
  }

  dimension: id_sub_titulo_chamado {
    type: number
    group_label: "Dados Chamado"
    label: "ID do subtítulo do chamado"
    description: "Indica o ID do subtítulo do chamado registrado na Tela de Atendimento"
    sql: ${TABLE}."ID_SUB_TITULO_CHAMADO" ;;
  }

  dimension: id_titulo_chamado {
    type: number
    group_label: "Dados Chamado"
    label: "ID do título do chamado"
    description: "Indica o ID do título do chamado registrado na Tela de Atendimento"
    sql: ${TABLE}."ID_TITULO_CHAMADO" ;;
  }

  dimension: id_tratativa {
    type: number
    group_label: "Dados Tratativa"
    label: "Id Tratativa"
    description: "Indica o Id da tratativa feita pelo usuário"
    sql: ${TABLE}."ID_TRATATIVA" ;;
  }

  dimension: id_usuario {
    type: number
    group_label: "Dados Usuário"
    label: "Id usuário"
    description: "Indica o ID do atendente do chamado"
    sql: ${TABLE}."ID_USUARIO" ;;
  }

  dimension: instituicao {
    type: string
    group_label: "Dados Usuário"
    label: "Empresa"
    description: "Indica a empresa do atendente do chamado"
    sql: ${TABLE}."INSTITUICAO" ;;
  }

  dimension: login {
    type: string
    group_label: "Dados Usuário"
    label: "Login"
    description: "Indica o login do atendente do chamado"
    sql: ${TABLE}."LOGIN" ;;
  }

  dimension: nm_usuario {
    type: string
    group_label: "Dados Usuário"
    label: "Nome"
    description: "Indica o Nome do atendente do chamado"
    sql: ${TABLE}."NM_USUARIO" ;;
  }

  dimension: telefone {
    type: string
    group_label: "Dados Usuário"
    label: "Telefone"
    description: "Indica o telefone do atendente do chamado"
    sql: ${TABLE}."TELEFONE" ;;
  }

  dimension: texto {
    type: string
    group_label: "Dados Chamado"
    label: "Observações"
    description: "Observações registradas pelo atendente no chamado"
    sql: ${TABLE}."TEXTO" ;;
  }

  dimension: texto_chamado {
    type: string
    group_label: "Dados Chamado"
    label: "Conteúdo chamado"
    description: "Indica o texto registrado no chamado"
    sql: ${TABLE}."TEXTO_CHAMADO" ;;
  }

  dimension: tp_consultor {
    type: string
    group_label: "Dados Usuário"
    label: "Tipo consultor"
    description: "Indica o tipo do atendente do chamado"
    sql: ${TABLE}."TP_CONSULTOR" ;;
  }

  dimension: tp_usuario {
    type: string
    group_label: "Dados Usuário"
    label: "Tipo usuário"
    description: "Indica o tipo do atendente do chamado"
    sql: ${TABLE}."TP_USUARIO" ;;
  }

  dimension_group: data_completa_chamado {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      day_of_month,
      month,
      month_name,
      quarter,
      year
    ]
    group_label: "Data Completa Chamado"
    label: "Data Completa Chamado"
    description: "Indica a data, hora, minuto e segundo que foi iniciado o chamado"
    sql: CONCAT(${TABLE}."DATA_CHAMADO", ' ', ${TABLE}."HORARIO_CHAMADO")::timestamp ;;
  }

  measure: count_id_chamado {
    type: count_distinct
    sql: ${id_chamado} ;;
    group_label: "Quantidade de Chamados"
    group_item_label: "Medidas"
    description: "Contagem de ID's de chamados únicos"
  }
}
