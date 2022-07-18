view: leads_balcao {
  sql_table_name: "VETERANO"."MGM"."LEADS_BALCAO"
    ;;

  dimension: celular {
    type: number
    sql: ${TABLE}."CELULAR" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Celular do Aluno"

  }


  dimension: cpf_atendente_ies {
    type: number
    sql: ${TABLE}."CPF_ATENDENTE_IES" ;;
    group_label: "Dados do Atendente"
    group_item_label: "CPF do Atendente"
  }

  dimension: cpf_fiador {
    type: number
    sql: ${TABLE}."CPF_FIADOR" ;;
    group_label: "Dados do Garantidor"
    group_item_label: "CPF do Garantidor"
  }

  dimension: cpf_lead {
    type: number
    sql: ${TABLE}."CPF_LEAD" ;;
    group_label: "Dados do Aluno"
    group_item_label: "CPF do Aluno"
  }

  dimension_group: data_nascimento_fiador {
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
    hidden:  yes
    sql: ${TABLE}."DATA_NASCIMENTO_FIADOR" ;;
  }

  dimension_group: data_preenchimento_dados {
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
    sql: ${TABLE}."DATA_PREENCHIMENTO_DADOS" ;;
    label: "Data de Preenchimento"
    hidden:  yes
  }

  dimension_group: data_proposta {
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
    sql: ${TABLE}."DATA_PROPOSTA" ;;
    label: "Data da Proposta"
  }

  dimension_group: data_retorno_avaliacao {
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
    sql: ${TABLE}."DATA_RETORNO_AVALIACAO" ;;
    label: "Data de Retorno da Avaliação"
  }

  dimension: descricao_estado_civil_fiador {
    type: string
    sql: ${TABLE}."DESCRICAO_ESTADO_CIVIL_FIADOR" ;;
    hidden:  yes
  }

  dimension: descricao_parentesco_estudante {
    type: string
    sql: ${TABLE}."DESCRICAO_PARENTESCO_ESTUDANTE" ;;
    group_label: "Dados do Garantidor"
    group_item_label: "Parentesco com o Aluno"
  }

  dimension: descricao_retorno_avaliacao {
    type: string
    sql: ${TABLE}."DESCRICAO_RETORNO_AVALIACAO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Retorno da Avaliação"
  }

  dimension: ds_profissao_fiador {
    type: string
    sql: ${TABLE}."DS_PROFISSAO_FIADOR" ;;
    group_label: "Dados do Garantidor"
    group_item_label: "Profissão do Garantidor"
  }

  dimension_group: dt_nascimento {
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
    sql: ${TABLE}."DT_NASCIMENTO" ;;
    label: "Data do Nascimento"
  }

  dimension: email_lead {
    type: string
    sql: ${TABLE}."EMAIL_LEAD" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Email do Aluno"
  }

  dimension: flg_estudante_veterano {
    type: yesno
    sql: ${TABLE}."FLG_ESTUDANTE_VETERANO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Aluno Veterano?"
  }

  dimension: id_campus {
    type: number
    sql: ${TABLE}."ID_CAMPUS" ;;
    group_label: "Dados da Instituição"
    group_item_label: "ID do Campus"
  }

  dimension: id_curso {
    type: number
    sql: ${TABLE}."ID_CURSO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "ID do Curso"
  }

  dimension: id_estado_civil_fiador {
    type: number
    sql: ${TABLE}."ID_ESTADO_CIVIL_FIADOR" ;;
    hidden:  yes
  }

  dimension: id_instituicao {
    type: number
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "ID da Instituição"
  }

  dimension: id_lead {
    type: number
    sql: ${TABLE}."ID_LEAD" ;;
    group_label: "Dados do Aluno"
    group_item_label: "ID do Aluno"
  }

  dimension: id_parentesco_estudante {
    type: number
    sql: ${TABLE}."ID_PARENTESCO_ESTUDANTE" ;;
    hidden:  yes
  }

  dimension: id_profissao_fiador {
    type: number
    sql: ${TABLE}."ID_PROFISSAO_FIADOR" ;;
    hidden: yes
  }

  dimension: id_proposta_lead_balcao_fiador {
    type: number
    sql: ${TABLE}."ID_PROPOSTA_LEAD_BALCAO_FIADOR" ;;
    hidden:  yes
  }

  dimension: id_proposta_lead_balcao_jornada {
    type: number
    sql: ${TABLE}."ID_PROPOSTA_LEAD_BALCAO_JORNADA" ;;
    group_label: "Dados da Proposta"
    group_item_label: "ID da Proposta Balcão"
    hidden:  yes
  }

  dimension: id_retorno_avaliacao {
    type: number
    sql: ${TABLE}."ID_RETORNO_AVALIACAO" ;;
    hidden:  yes
  }

  dimension: id_tela {
    type: number
    sql: ${TABLE}."ID_TELA" ;;
    hidden: yes
  }

  dimension: nome_campus {
    type: string
    sql: ${TABLE}."NOME_CAMPUS" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Nome do Campus"
  }

  dimension: nome_curso {
    type: string
    sql: ${TABLE}."NOME_CURSO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Nome do Curso"
  }

  dimension: nome_instituicao {
    type: string
    sql: ${TABLE}."NOME_INSTITUICAO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Nome do Instituição"
  }

  dimension: nome_lead {
    type: string
    sql: ${TABLE}."NOME_LEAD" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Nome do Aluno"
  }

  dimension: nome_tela {
    type: string
    sql: ${TABLE}."NOME_TELA" ;;
    hidden:  yes
  }

  dimension: nota_avaliacao_lead {
    type: number
    sql: ${TABLE}."NOTA_AVALIACAO_LEAD" ;;
    hidden:  yes
  }

  dimension: proposta_lead_balcao {
    type: number
    sql: ${TABLE}."PROPOSTA_LEAD_BALCAO" ;;
    hidden: yes
  }

  dimension: qt_parcela_atraso {
    type: number
    sql: ${TABLE}."QT_PARCELA_ATRASO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Qtde de Parcelas em Atraso"
  }

  dimension: sigla_estado_endereco {
    type: string
    sql: ${TABLE}."SIGLA_ESTADO_ENDERECO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "UF do Aluno"
  }

  dimension: valor_renda_mensal_fiador {
    type: number
    sql: ${TABLE}."VALOR_RENDA_MENSAL_FIADOR" ;;
    group_label: "Dados do Garantidor"
    group_item_label: "Renda Mensal do Fiador"
  }

  dimension: vl_mensalidade_curso_bruto {
    type: number
    sql: ${TABLE}."VL_MENSALIDADE_CURSO_BRUTO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Valor da Mensalidade"
  }

  dimension: vl_mensalidade_curso_desconto {
    type: number
    sql: ${TABLE}."VL_MENSALIDADE_CURSO_DESCONTO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Valor da Mensalidade (Desconto)"
  }

  dimension: vl_renda_mensal {
    type: number
    sql: ${TABLE}."VL_RENDA_MENSAL" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Renda Mensal"
  }

  measure: count_leads {
    type: count
    sql: ${cpf_lead} ;;
    label: "Leads"
  }

  measure: valor_mensalidade {
    type: sum
    sql: ${vl_mensalidade_curso_bruto} ;;
    label: "Valor da Mensalidade"
  }

  measure: count_propostas {
    type: count
    sql: ${id_proposta_lead_balcao_jornada} ;;
    label: "Propostas"
    filters: [descricao_retorno_avaliacao: "APROVADO, RECUSADO"]
  }

  measure: count_propostas_aprovadas {
    type:  count
    sql: ${id_proposta_lead_balcao_jornada} ;;
    filters: [descricao_retorno_avaliacao: "APROVADO"]
    label: "Propostas Aprovadas"
  }
}
