view: institution {
  sql_table_name: "VETERANO"."CURTA"."INSTITUTION"
    ;;

  dimension: agencia_banco {
    type: number
    sql: ${TABLE}."AGENCIA_BANCO";;
    description:"CODIGO DA AGENCIA BANCARIA"
    group_item_label: "Agencia"
    group_label: "Dados Bancarios"
  }
  dimension: bairro_instituicao {
    type: string
    sql: ${TABLE}."BAIRRO_INSTITUICAO";;
    description:"BAIRRO DA INSTITUIÇÃO"
    group_item_label: "Bairro"
    group_label: "Dados da Instituição"
  }
  dimension: base_juros {
    type: string
    sql: ${TABLE}."BASE_JUROS";;
    description:"INDICA QUAIS DIAS SÃO LEVADOS EM CONTA PARA CALCULAR O JUROS"
    group_item_label: "Base de Juros"
    group_label: "Taxas"
  }
  dimension: cep_instituicao {
    type: string
    sql: ${TABLE}."CEP_INSTITUICAO";;
    description:"CEP DO ENDEREÇO DA INSTITUIÇÃO"
    group_item_label: "CEP"
    group_label: "Dados da Instituição"
  }
  dimension: cidade_instituicao {
    type: string
    sql: ${TABLE}."CIDADE_INSTITUICAO";;
    description:"CIDADE ONS A INSTITUIÇÃO ESTÁ LOCALIZADA"
    group_item_label: "Cidade"
    group_label: "Dados da Instituição"
  }
  dimension: cnpj_banco {
    type: string
    sql: ${TABLE}."CNPJ_BANCO";;
    description:"NUMERO DO CNPJ DO BANCO"
    group_item_label: "CNPJ"
    group_label: "Dados Bancarios"
  }
  dimension: cnpj_instituicao {
    type: string
    sql: ${TABLE}."CNPJ_INSTITUICAO";;
    description:"CNPJ DA INSTITUIÇÃO"
    group_item_label: "CNPJ"
    group_label: "Dados da Instituição"
  }
  dimension: codigo_banco {
    type: number
    sql: ${TABLE}."CODIGO_BANCO";;
    description:"CODIGO ITENDIFICADOR DA INSTITUIÇÃO BANCÁRIA"
    group_item_label: "Codigo"
    group_label: "Dados Bancarios"
  }
  dimension: comissao {
    type: number
    sql: ${TABLE}."COMISSAO";;
    description:"TAXA DE COMISSAO"
    group_item_label: "Comissao"
    group_label: "Taxas"
  }
  dimension: complemento {
    type: string
    sql: ${TABLE}."COMPLEMENTO";;
    description:"COMPLEMENTO DO ENDEREÇO DA INSTITUIÇÃO"
    group_item_label: "Complemento"
    group_label: "Dados da Instituição"
  }
  dimension_group: contrato_data_atualizacao {
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
    sql: ${TABLE}."CONTRATO_DATA_ATUALIZACAO";;
    description:"DATA DA ULTIMA ATUALIZAÇÃO DO CONTRATO"
    label: "Atualização do Contrato"

  }
  dimension: contrato_data_reembolso {
    type: number
    sql: ${TABLE}."CONTRATO_DATA_REEMBOLSO";;
    description:"DIA DO MES PARA SER FEITO O REEMBOLSO"
    group_item_label: "Data de Reembolso"
    group_label: "Dados da Instituição"
  }
  dimension: cupons {
    type: string
    sql: ${TABLE}."CUPONS";;
    description:"CUPONS QUE PODEM SER UTILIZADOS NESSE CURSO"
    group_item_label: "Cupons"
    group_label: "Dados do Curso"
  }

  dimension_group: curso_data_atualizacao {
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
    sql: ${TABLE}."CURSO_DATA_ATUALIZACAO";;
    description:"DATA DA ULTIMA ATUALIZAÇÃO DO CURSO"
    label: "Curso Atualização"

  }

  dimension_group: data_atualizacao_endereco {
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
    sql: ${TABLE}."DATA_ATUALIZACAO_ENDERECO";;
    description:"DATA DA ULTIMA ATUALIZAÇÃO DO ENDEREÇO"
    label: "Endereço Atualização"

  }

  dimension: data_emissao_contrato {
    type: number
    sql: ${TABLE}."DATA_EMISSAO_CONTRATO";;
    description:"DIA DO MES EM QUE O CONTRATO FOI EMITIDO"
    group_item_label: "Data de Emissão do Contrato"
    group_label: "Dados da Instituição"
  }

  dimension: digito_agencia_banco {
    type: number
    sql: ${TABLE}."DIGITO_AGENCIA_BANCO";;
    description:"DIGITO DA AGENCIA BANCARIA"
    group_item_label: "Digito Agencia Bancaria"
    group_label: "Dados Bancarios"
  }
  dimension: digito_conta_banco {
    type: number
    sql: ${TABLE}."DIGITO_CONTA_BANCO";;
    description:"DIGITO DA CONTA BANCARIA"
    group_item_label: "DIgito Conta"
    group_label: "Dados Bancarios"
  }
  dimension: ds_curso {
    type: string
    sql: ${TABLE}."DS_CURSO";;
    description:"DESCRICAO DO CURSO"
    group_item_label: "Descrição do Curso"
    group_label: "Dados do Curso"
  }
  dimension: estado_instituicao {
    type: string
    sql: ${TABLE}."ESTADO_INSTITUICAO";;
    description:"ESTADO ONDE A INSTITUIÇÃO SE ENCONTRA"
    group_item_label: "Estado - UF"
    group_label: "Dados da Instituição"
  }


  dimension: estado_instituicao_mapa {
    type: string
    sql: ${estado_instituicao};;
    description:"UF DO ESTADO ONDE A INSTITUIÇÃO SE ENCONTRA"
    group_item_label: "Estado - UF (Mapa)"
    group_label: "Dados da Instituição"
  }


  dimension: regiao_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "Região da Instituição"
    description: "INDICA A REGIÃO GEOGRÁFICA DA INSTITUIÇÃO"
    sql: case when ${estado_instituicao} in ('SP', 'RJ', 'MG', 'ES') THEN 'SUDESTE'
         when ${estado_instituicao} in ('DF', 'GO', 'MT', 'MS') THEN 'CENTRO-OESTE'
         WHEN ${estado_instituicao} IN ('AC', 'AM', 'RO', 'RR', 'PA', 'AP', 'TO') then 'NORTE'
         WHEN ${estado_instituicao} IN ('MA', 'PI', 'CE', 'RN', 'PB', 'PE', 'AL', 'SE', 'BA') then 'NORDESTE'
         WHEN ${estado_instituicao} IN ('PR', 'SC', 'RS') then 'SUL'
         ELSE 'NÃO PREENCHIDO' END ;;
  }




  dimension: flg_curso_antecipacao {
    type: yesno
    sql: ${TABLE}."FLG_CURSO_ANTECIPACAO";;
    description:"INDICA SE A MODADELIDADE DO PRODUTO DO CURSO É ANTECIPAÇÃO"
    group_item_label: "Curso é Antecipação?"
    hidden: yes
    group_label: "Dados do Curso"
  }
  dimension: flg_curso_gestao {
    type: yesno
    sql: ${TABLE}."FLG_CURSO_GESTAO";;
    description:"INDICA SE A MODALIDADE DO PRODUTO DO CURSO É GESTÃO"
    hidden: yes
    group_item_label: "Curso é Gestão?"
    group_label: "Dados do Curso"
  }
  dimension: flg_intituicao_ativa {
    type: yesno
    sql: ${TABLE}."FLG_INTITUICAO_ATIVA";;
    description:"INDICA SE A INSTITUIÇÃO ESTÁ ATIVA"
    group_item_label: "Instituição Ativa?"
    hidden: yes
    group_label: "Dados da Instituição"
  }
  dimension: id_contrato_instituicao {
    type: string
    sql: ${TABLE}."ID_CONTRATO_INSTITUICAO";;
    description:"ID DO CONTRATO FIRMADO COM A INSTITUIÇÃO"
    hidden: yes
    group_item_label: "Id Contrato"
    group_label: "Dados da Instituição"
  }
  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO";;
    description:"IDENTIFICADOR DO CURSO"
    group_item_label: "Id Curso"
    hidden: yes
    group_label: "Dados do Curso"
  }




  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO";;
    description:"IDENTIFICADOR DA INSTITUIÇÃO"
    group_item_label: "Id Instituição"
    primary_key: yes
    group_label: "Dados da Instituição"
  }
  dimension_group: instituicao_data_atualizacao {
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
    sql: ${TABLE}."INSTITUICAO_DATA_ATUALIZACAO";;
    description:"DATA DA ULTIMA ATUALIZAÇÃO DA INSTITUIÇÃO"
    label: "Ultima Atualização - Instituição"

  }
  dimension: logo_instituicao {
    type: string
    sql: ${TABLE}."LOGO_INSTITUICAO";;
    description:"URL DO ENDEREÇO DA IMAGEM DO LOGO DA INSTITUIÇÃO"
    group_item_label: "Logo Instituição"
    group_label: "Dados da Instituição"
  }
  dimension: nome_banco {
    type: string
    sql: ${TABLE}."NOME_BANCO";;
    description:"NOME DO BANCO"
    group_item_label: "Nome do Banco"
    group_label: "Dados Bancarios"
  }
  dimension: nome_central_instituicao {
    type: string
    sql: ${TABLE}."NOME_CENTRAL_INSTITUICAO";;
    description:"NOME DA SEDE DA INSTITUIÇÃO"
    group_item_label: "Nome da Sede"
    group_label: "Dados da Instituição"
  }
  dimension: nome_corporativo_instituicao {
    type: string
    sql: ${TABLE}."NOME_CORPORATIVO_INSTITUICAO";;
    description:"NOME DA INSTITUIÇÃO"
    group_item_label: "Nome"
    group_label: "Dados da Instituição"
  }


  dimension: nome_segmento_instituicao {
    type: string
    sql: ${TABLE}."NOME_SEGMENTO";;
    description:"NOME DO NICHO DA INSTITUIÇÃO. EX: BELEZA, SAÚDE, TECH E ETC."
    group_item_label: "Segmento"
    group_label: "Dados da Instituição"
  }


  dimension: score_classificao_instituicao {
    type: string
    sql: ${TABLE}."SCORE_SEGMENTO";;
    description:"CLASSIFICAÇÃO DO SCORE POR NICHO DA INSTITUIÇÃO."
    group_item_label: "Score - Classificação"
    group_label: "Dados da Instituição"
  }





  dimension: nome_curso {
    type: string
    sql: ${TABLE}."NOME_CURSO";;
    description:"NOME DO CURSO"
    group_item_label: "Nome"
    hidden: yes
    group_label: "Dados do Curso"
  }
  dimension: nome_fantasia_instituicao {
    type: string
    sql: ${TABLE}."NOME_FANTASIA_INSTITUICAO";;
    description:"NOME FANTASIA DA INSTITUIÇÃO"
    group_item_label: "Nome Fantasia"
    group_label: "Dados da Instituição"
  }
  dimension: numero_conta_banco {
    type: number
    sql: ${TABLE}."NUMERO_CONTA_BANCO";;
    description:"NUMERO DA CONTA"
    group_item_label: "Numero da Conta"
    group_label: "Dados Bancarios"
  }
  dimension: numero_instituicao {
    type: string
    sql: ${TABLE}."NUMERO_INSTITUICAO";;
    description:"NUMERO DA RUA ONDE A INSTITUIÇÃO ESTÁ LOCALIZADA"
    group_item_label: "Número do Endereço"
    group_label: "Dados da Instituição"
  }
  dimension: parcelamento {
    type: string
    sql: ${TABLE}."PARCELAMENTO";;
    description:"TODAS AS POSSIBILIDADES DE PARCELAMENTO DISPONÍVEL PARA O CURSO"
    group_item_label: "Parcelamento"
    group_label: "Dados do Curso"
  }
  dimension: primeira_data_vencimento_contrato {
    type: number
    sql: ${TABLE}."PRIMEIRA_DATA_VENCIMENTO_CONTRATO";;
    description:"DIA DA PRIMEIRA DATA DE VENCIMENTO"
    group_item_label: "Dia do Primeiro vencimento"
    group_label: "Dados do Curso"
  }
  dimension: rua_instituicao {
    type: string
    sql: ${TABLE}."RUA_INSTITUICAO";;
    description:"NOME DA RUA DA INSTITUIÇÃO"
    group_item_label: "Rua"
    group_label: "Dados da Instituição"
  }
  dimension: tx_mensal {
    type: number
    sql: ${TABLE}."TX_MENSAL";;
    description:"TAXA MENSAL"
    group_item_label: "Taxa Mensal"
    group_label: "Taxas"
  }
  dimension: tx_multa {
    type: number
    sql: ${TABLE}."TX_MULTA";;
    description:"TAXA DE MULTA COBRADA EM CADA CONTRATO"
    group_item_label: "Taxa de Multa"
    group_label: "Taxas"
  }
  dimension: vl_curso {
    type: number
    sql: ${TABLE}."VL_CURSO";;
    description:"VALOR DO CURSO"
    group_item_label: "Valor do Curso"
    hidden: yes
    group_label: "Dados do Curso"
  }

  measure: count {
    type: count_distinct
    drill_fields: []
    sql: ${id_instituicao} ;;
    group_item_label: "Total de Instituições"
  }






}
