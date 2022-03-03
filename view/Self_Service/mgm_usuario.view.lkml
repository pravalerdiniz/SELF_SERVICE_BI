view: mgm_usuario {
  derived_table: {
    sql: select * from GRADUADO.AD_HOC.USUARIO
      ;;
  }

  measure: count {
    type: count
    hidden: yes
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    primary_key: yes
    label: "ID"
    description: "Codigo único gerado pela ferramenta, mesmo cod. Url indicação"
    sql: ${TABLE}."ID" ;;
  }

  dimension: nome {
    type: string
    label: "Nome player"
    description: "Nome do Player"
    sql: ${TABLE}."NOME" ;;
  }

  dimension: cpf {
    type: number
    label: "CPF player"
    description: "CPF do Player"
    sql: ${TABLE}."CPF" ;;
  }

  dimension: email {
    type: string
    label: "Email player"
    description: "Email do Player"
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: telefone {
    type: number
    label: "Telefone player"
    description: "Telefone do Player"
    sql: ${TABLE}."TELEFONE" ;;
  }

  dimension: data_nascimento {
    type: date
    label: "Data de nascimento player"
    description: "Data de nascimento do Player"
    sql: ${TABLE}."DATA_NASCIMENTO" ;;
  }

  dimension: cidade {
    type: string
    label: "Cidade player"
    description: "Cidade do Player"
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: estado {
    type: string
    label: "Estado player"
    description: "Estado do Player"
    sql: ${TABLE}."ESTADO" ;;
  }

  dimension: regional {
    type: string
    label: "Regional player"
    description: "Regional do Player"
    sql: ${TABLE}."REGIONAL" ;;
  }

  dimension_group: data_adesao {
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
    group_label: "Data Adesão"
    label: "Data Adesão"
    description: "Indica a data de inscrição no programa"
    sql: ${TABLE}."DATA_ADESAO" ;;
  }

  dimension: quantidade_leads {
    type: number
    label: "Quantidade leads"
    description: "Quantidade de indicações o player trouxe para o PRV"
    sql: ${TABLE}."QUANTIDADE_LEADS" ;;
  }

  dimension: pontos_totais {
    type: number
    label: "Pontos Totais"
    description: "qtd de leads que tiveram conversão (pgto boleto). Pontos conversão atrb.: R$150 indicador e R$100 indicado"
    sql: ${TABLE}."PONTOS_TOTAIS" ;;
  }

  dimension: pontos_resgatados {
    type: number
    label: "Pontos Resgatados"
    description: "Pontos Resgatados"
    sql: ${TABLE}."PONTOS_RESGATADOS" ;;
  }

  dimension: cadastro_completo {
    type: yesno
    label: "Cadastro Completo?"
    description: "Indica se os cadastros já foram finalizados pelos atendentes"
    sql: ${TABLE}."CADASTRO_COMPLETO" ;;
  }

  dimension: numero_pageviews {
    type: number
    label: "Numero pageviews"
    description: "Qtd visitas por link de indicação"
    sql: ${TABLE}."NUMERO_PAGEVIEWS" ;;
  }

  dimension: usuario_ativo {
    type: yesno
    label: "Usuário ativo?"
    description: "Indica se o usuário está ativo"
    sql: ${TABLE}."USUARIO_ATIVO" ;;
  }

  dimension_group: dt_carga {
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
    group_label: "Data Carga"
    label: "Data Carga"
    description: "Indica a data que foi realizado a carga dos dados"
    sql: ${TABLE}."DT_CARGA" ;;
  }

  set: detail {
    fields: [
      id,
      nome,
      cpf,
      email,
      telefone,
      data_nascimento,
      cidade,
      estado,
      regional,
      data_adesao_time,
      quantidade_leads,
      pontos_totais,
      pontos_resgatados,
      cadastro_completo,
      numero_pageviews,
      usuario_ativo,
      dt_carga_time
    ]
  }
}
