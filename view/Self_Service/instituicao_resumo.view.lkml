# The name of this view in Looker is "Instituicao Resumo"
view: instituicao_resumo {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "AD_HOC"."INSTITUICAO_RESUMO"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Bairro Sede Ie" in Explore.

  dimension: id_instituicao {
    primary_key: yes
    type: string
    group_label: "Dados da Instituição"
    label: "ID da Instituição"
    description:"Indica o ID da Instituição de Ensino cadastrado no Backoffice."
    sql: ${TABLE}."ID_INSTITUICAO";;
  }

  dimension: cnpj_ie {
    type: number
    group_label: "Dados da Instituição"
    label: "CNPJ"
    description: "Indica o número do CNPJ da Instituição"
    sql: ${TABLE}."CNPJ_IE";;
  }

  dimension: nome_fantasia {
    type: string
    group_label: "Dados da Instituição"
    label: "Nome da Instituição de Ensino"
    description:"Indica o nome FANTASIA da Instituição de Ensino."
    sql: ${TABLE}."NOME_FANTASIA";;
  }

  dimension: razao_social {
    type: string
    group_label: "Dados da Instituição"
    label: "Razão Social"
    description: "Indica o nome da razão social da instituição"
    sql: ${TABLE}."RAZAO_SOCIAL";;
  }

  dimension: ie_ativa {
    type: number
    group_label: "Dados da Instituição"
    label: "Instituição Ativa?"
    description:"Indica se a Instituição está ativa. Ex: 1 = 'Sim' | 2 = 'Não'"
    hidden: yes
    sql: ${TABLE}."IE_ATIVA";;
  }

  dimension: ie_super_pravaler {
    type: number
    group_label: "Dados da Instituição"
    label: "Superpravaler?"
    description:"Indica se a Instituição possui o produto SUPERPRAVALER."
    sql: ${TABLE}."IE_SUPER_PRAVALER";;
  }

  dimension: modelo_contrato {
    type: string
    group_label:"Dados da Instituição"
    label: "Modelo de Contrato"
    description: "Indica o modelo de contrato da Instituição de Ensino com o Originador. Ex: ANTIGO, NOVO."
    sql: ${TABLE}."MODELO_CONTRATO";;
  }

  dimension: reprova_por_score {
    type: string
    group_label:"Dados da Instituição"
    label:"Reprovação por Score"
    description:"Indica a descrição de reprovação por score."
    sql: ${TABLE}."REPROVA_POR_SCORE";;
  }

  dimension: ds_mantenedor {
    type: string
    group_label: "Dados da Instituição"
    label: "Nome da Mantenedora"
    description: "Indica o nome da Mantenedora da IES"
    sql: ${TABLE}."DS_MANTENEDOR";;
  }

  dimension_group: dt_cadastro {
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
    group_label: "Cadastro"
    label: "Data de Cadastro"
    description: "Data de Cadastro da IES no Sistema"
    sql: ${TABLE}."DT_CADASTRO";;
  }

  dimension: qtd_alunos_ie {
    type: number
    group_label: "Dados da Instituição"
    label: "Quantidades de Alunos da Instituição"
    description:"Indica a Quantidade total de alunos na Instituição de Ensino."
    sql: ${TABLE}."QTD_ALUNOS_IE";;
  }

  dimension: endereco_sede_ie {
    type: string
    group_label: "Dados da Instituição"
    label: "Sede - Endereço"
    description: "Indica o Endereço da Sede da IES"
    sql: ${TABLE}."ENDERECO_SEDE_IE";;
  }

  dimension: bairro_sede_ie {
    type: string
    group_label: "Dados da Instituição"
    label: "Sede - Bairro"
    description: "Bairro da IES"
    sql: ${TABLE}."BAIRRO_SEDE_IE";;
  }

  dimension: cidade_sede_ie {
    type: string
    group_label: "Dados da Instituição"
    label: "Sede - Cidade"
    description: "Indica a cidade que está localizada a Sede da IES"
    sql: ${TABLE}."CIDADE_SEDE_IE";;
  }

  dimension: estado_sede_ie {
    type: string
    group_label: "Dados da Instituição"
    label: "Sede - Estado"
    description: "UF SEDE IES"
    sql: ${TABLE}."ESTADO_SEDE_IE";;
  }

  dimension: cep_sede_ie {
    type: string
    group_label: "Dados da Instituição"
    label: "Sede - CEP"
    description: "Informação relacionada ao endereço. Indica o número do CEP da Sede"
    sql: ${TABLE}."CEP_SEDE_IE";;
  }

  dimension: grupo {
    type: string
    group_label: "Dados da Instituição"
    label: "Grupo da Instituição"
    description: "Indica o nome do Grupo responsável pela instituição cadastrado no Backoffice."
    sql: ${TABLE}."GRUPO";;
  }

  dimension: flg_descadastrada {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Descadastrada?"
    description: "Indica se a instituição está descadastrada no PRAVALER"
    sql: ${TABLE}."FLG_DESCADASTRADA";;
  }

  dimension: flg_recebe_contrato {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Recebe Contrato?"
    description: "Indica se a instituição recebe contrato fisico ou se o aluno deve entregar somente ao PRAVALER"
    sql: ${TABLE}."FLG_RECEBE_CONTRATO";;
  }

  dimension: flg_possi_pdv {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Possui PDV?"
    description: "Indica se a instituição possui PDV (Ponto de Venda)."
    sql: ${TABLE}."FLG_POSSI_PDV";;
  }

  dimension: flg_bolsa {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Bolsa?"
    description: "Indica se o IES possui o produto Bolsa"
    sql: ${TABLE}."FLG_BOLSA";;
  }

  dimension: flg_financia_matricula {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Financia Matricula?"
    description: "Indica se a instituição permite financiar matricula"
    sql: ${TABLE}."FLG_FINANCIA_MATRICULA";;
  }

  dimension: flg_matricula_expressa {
    type: yesno
    label: "Matricula Expressa?"
    group_label: "Dados da Instituição"
    description: "Indica se a instituição está optando pelo boleto de matricula expressa"
    sql: ${TABLE}."FLG_MATRICULA_EXPRESSA";;
  }

  dimension: regional_regiao {
    type: string
    group_label: "Dados da Regional - IE"
    label: "Região"
    description: "Indica o nome da região que representa a regional"
    sql: ${TABLE}."REGIONAL_REGIAO";;
  }

  dimension: carteira_regional {
    type: string
    group_label: "Dados da Regional - IE"
    label: "Carteira Regional"
    description: "Indica o tipo de carteira regional do responsável comercial na instituição de ensino. Ex: Varejo, DN, Outros"
    sql: ${TABLE}."CARTEIRA_REGIONAL";;
  }

  dimension: gerente_regional {
    type: string
    group_label: "Dados da Regional - IE"
    label: "Gerente Regional"
    description: "Indica o nome do responsável pela Regional"
    sql: ${TABLE}."GERENTE_REGIONAL";;
  }


}
