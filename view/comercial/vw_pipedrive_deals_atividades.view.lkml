
view: vw_pipedrive_deals_atividades {

  sql_table_name: "GRADUADO"."PIPEDRIVE"."VW_PIPEDRIVE_DEALS_ATIVIDADES"
    ;;

  dimension: chave {
    type: string
    primary_key: yes
    hidden: yes
    sql: concat(${id_negocio}, ${id_atividade}) ;;
  }


  dimension: atribuido_id_criador_atividade {
    type: number
    group_label: "Dados Criador Atividade"
    group_item_label: "ID usuário atribuído"
    #description: ""
    value_format_name: id
    sql: ${TABLE}."ATRIBUIDO_ID_CRIADOR_ATIVIDADE" ;;
  }

  dimension: nome_criador_atribuido_atividade {
    type: string
    group_label: "Dados Criador Atividade"
    group_item_label: "Nome usuário atribuído"
    #description: ""
    value_format_name: id
    sql: ${TABLE}."NOME_CRIADOR_ATRIBUIDO_ATIVIDADE" ;;
  }


  dimension_group: data_atividade {
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
    label: "Data atividade"
    description: "Data em que a atividade foi realizada"
    sql: ${TABLE}."DATA_ATIVIDADE" ;;
  }

  dimension_group: dt_atualizacao_atividade {
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
    label: "Data atualização da atividade"
    #description: ""
    sql: ${TABLE}."DT_ATUALIZACAO_ATIVIDADE" ;;
  }

  dimension_group: dt_criacao_atividade {
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
    label: "Data criação da atividade"
    #description: ""
    sql: ${TABLE}."DT_CRIACAO_ATIVIDADE" ;;
  }

  dimension_group: dt_marcado_como_concluido {
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
    label: "Data conclusão da atividade"
    #description: ""
    sql: ${TABLE}."DT_MARCADO_COMO_CONCLUIDO" ;;
  }

  dimension: duracao_atividade {
    type: string
    group_label: "Dados Atividade"
    group_item_label: "Duração da atividade"
    #description: ""
    sql: ${TABLE}."DURACAO_ATIVIDADE" ;;
  }

  dimension: email_pessoa_participante {
    type: string
    group_label: "Pessoa Participante"
    group_item_label: "Email pessoa participante"
    #description: ""
    sql: ${TABLE}."EMAIL_PESSOA_PARTICIPANTE" ;;
  }

  dimension: flg_ativo {
    type: yesno
    group_label: "Dados Atividade"
    group_item_label: "Flag atividade ativa"
    #description: ""
    sql: ${TABLE}."FLG_ATIVO" ;;
  }

  dimension: flg_concluido {
    type: yesno
    group_label: "Dados Atividade"
    group_item_label: "Flag atividade concluída"
    #description: ""
    sql: ${TABLE}."FLG_CONCLUIDO" ;;
  }

  dimension: hora_atividade {
    type: string
    group_label: "Dados Atividade"
    group_item_label: "Hora Atividade"
    #description: ""
    sql: ${TABLE}."HORA_ATIVIDADE" ;;
  }

  dimension: id_atividade {
    type: number
    group_label: "Dados Atividade"
    group_item_label: "ID atividade"
    #description: ""
    sql: ${TABLE}."ID_ATIVIDADE" ;;
  }

  measure: qtd_id_atividade {
    type: count_distinct
    group_label: "Quantidade"
    group_item_label: "Quantidade de atividades"
    #description: ""
    sql: ${id_atividade} ;;
  }

  dimension: id_criador_atividade {
    type: number
    group_label: "Dados Criador Atividade"
    group_item_label: "ID criador da atividade"
    #description: ""
    sql: ${TABLE}."ID_CRIADOR_ATIVIDADE" ;;
  }

  dimension: nome_criador_atividade {
    type: string
    group_label: "Dados Criador Atividade"
    group_item_label: "Nome criador da atividade"
    #description: ""
    sql: ${TABLE}."NOME_CRIADOR_ATIVIDADE" ;;
  }

  dimension: id_criador_atualizacao_atividade {
    type: number
    group_label: "Dados Criador Atividade"
    group_item_label: "ID criador atualização da atividade"
    #description: ""
    sql: ${TABLE}."ID_CRIADOR_ATUALIZACAO_ATIVIDADE" ;;
  }

  dimension: NOME_ATUALIZADOR_ATIVIDADE {
    type: string
    group_label: "Dados Criador Atividade"
    group_item_label: "Nome do atualizador da atividade"
    #description: ""
    sql: ${TABLE}."NOME_ATUALIZADOR_ATIVIDADE" ;;
  }

  dimension: id_lead {
    type: number
    group_label: "Lead"
    group_item_label: "ID Lead"
    #description: ""
    sql: ${TABLE}."ID_LEAD" ;;
  }

  dimension: id_negocio {
    type: number
    group_label: "Dados Atividade"
    group_item_label: "ID Negócio"
    #description: ""
    sql: ${TABLE}."ID_NEGOCIO" ;;
  }

  dimension: id_pessoa_participante {
    type: number
    group_label: "Pessoa Participante"
    group_item_label: "ID pessoa participante"
    description: "ID da pessoa da instituição"
    sql: ${TABLE}."ID_PESSOA_PARTICIPANTE" ;;
  }

  dimension: lead {
    type: string
    group_label: "Lead"
    group_item_label: "Lead"
    #description: ""
    sql: ${TABLE}."LEAD" ;;
  }

  dimension: nome_atividade_anterior {
    type: string
    group_label: "Dados Atividade"
    group_item_label: "Nome Atividade Anterior"
    #description: ""
    sql: ${TABLE}."NOME_ATIVIDADE_ANTERIOR" ;;
  }

  dimension: nome_atividade_atual {
    type: string
    group_label: "Dados Atividade"
    group_item_label: "Nome Atividade Atual"
    #description: ""
    sql: ${TABLE}."NOME_ATIVIDADE_ATUAL" ;;
  }

  dimension: nome_lead {
    type: string
    group_label: "Lead"
    group_item_label: "Nome Lead"
    description: "Indica o nome do lead"
    sql: ${TABLE}."NOME_LEAD" ;;
  }

  dimension: nome_pessoa_participante {
    type: string
    group_label: "Pessoa Participante"
    group_item_label: "Nome pessoa participante"
    description: "Nome da pessoa da instituição participante da atividade"
    sql: ${TABLE}."NOME_PESSOA_PARTICIPANTE" ;;
  }

  dimension: nota_descricao {
    type: string
    group_label: "Dados Atividade"
    group_item_label: "Nota Descrição"
    description: "Anotações das atividades"
    sql: ${TABLE}."NOTA_DESCRICAO" ;;
  }

  dimension: origem_empresa {
    type: string
    group_label: "Dados Atividade"
    group_item_label: "Origem Empresa"
    description: "Tipo de empresa cadastrada no Pipedrive: Graduação ou Curta Duração"
    sql: ${TABLE}."ORIGEM_EMPRESA" ;;
  }

  dimension: tipo_atividade {
    type: string
    group_label: "Dados Atividade"
    group_item_label: "Tipo Atividade"
    description: "Tipo da atividade como App, Lead, email, meeting etc"
    sql: ${TABLE}."TIPO_ATIVIDADE" ;;
  }

}
