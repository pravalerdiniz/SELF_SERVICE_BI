view: institution {
  sql_table_name: "CURTA"."INSTITUTION"
    ;;

dimension: agencia_banco {
type: number
sql: ${TABLE}."AGENCIA_BANCO"
description:"CODIGO DA AGENCIA BANCARIA"
;;}
  dimension: bairro_instituicao {
type: string
sql: ${TABLE}."BAIRRO_INSTITUICAO"
description:"BAIRRO DA INSTITUIÇÃO"
;;}
  dimension: base_juros {
type: string
sql: ${TABLE}."BASE_JUROS"
description:"INDICA QUAIS DIAS SÃO LEVADOS EM CONTA PARA CALCULAR O JUROS"
;;}
  dimension: cep_instituicao {
type: string
sql: ${TABLE}."CEP_INSTITUICAO"
description:"CEP DO ENDEREÇO DA INSTITUIÇÃO"
;;}
  dimension: cidade_instituicao {
type: string
sql: ${TABLE}."CIDADE_INSTITUICAO"
description:"CIDADE ONS A INSTITUIÇÃO ESTÁ LOCALIZADA"
;;}
  dimension: cnpj_banco {
type: string
sql: ${TABLE}."CNPJ_BANCO"
description:"NUMERO DO CNPJ DO BANCO"
;;}
  dimension: cnpj_instituicao {
type: string
sql: ${TABLE}."CNPJ_INSTITUICAO"
description:"CNPJ DA INSTITUIÇÃO"
;;}
  dimension: codigo_banco {
type: number
sql: ${TABLE}."CODIGO_BANCO"
description:"CODIGO ITENDIFICADOR DA INSTITUIÇÃO BANCÁRIA"
;;}
  dimension: comissao {
type: number
sql: ${TABLE}."COMISSAO"
description:"TAXA DE COMISSAO"
;;}
  dimension: complemento {
type: string
sql: ${TABLE}."COMPLEMENTO"
description:"COMPLEMENTO DO ENDEREÇO DA INSTITUIÇÃO"
;;}
  dimension_group: contrato_data_atualizacao {
type: time    timeframes: [      raw,      time,      date,      week,      month,      quarter,      year    ]
sql: ${TABLE}."CONTRATO_DATA_ATUALIZACAO"
description:"DATA DA ULTIMA ATUALIZAÇÃO DO CONTRATO"
;;}
  dimension: contrato_data_reembolso {
type: number
sql: ${TABLE}."CONTRATO_DATA_REEMBOLSO"
description:"DIA DO MES PARA SER FEITO O REEMBOLSO"
;;}
  dimension: cupons {
type: string
sql: ${TABLE}."CUPONS"
description:"CUPONS QUE PODEM SER UTILIZADOS NESSE CURSO"
;;}
  dimension_group: curso_data_atualizacao {
type: time    timeframes: [      raw,      time,      date,      week,      month,      quarter,      year    ]
sql: ${TABLE}."CURSO_DATA_ATUALIZACAO"
description:"DATA DA ULTIMA ATUALIZAÇÃO DO CURSO"
;;}
  dimension_group: data_atualizacao_endereco {
type: time    timeframes: [      raw,      time,      date,      week,      month,      quarter,      year    ]
sql: ${TABLE}."DATA_ATUALIZACAO_ENDERECO"
description:"DATA DA ULTIMA ATUALIZAÇÃO DO ENDEREÇO"
;;}
  dimension: data_emissao_contrato {
type: number
sql: ${TABLE}."DATA_EMISSAO_CONTRATO"
description:"DIA DO MES EM QUE O CONTRATO FOI EMITIDO"
;;}
  dimension: digito_agencia_banco {
type: number
sql: ${TABLE}."DIGITO_AGENCIA_BANCO"
description:"DIGITO DA AGENCIA BANCARIA"
;;}
  dimension: digito_conta_banco {
type: number
sql: ${TABLE}."DIGITO_CONTA_BANCO"
description:"DIGITO DA CONTA BANCARIA"
;;}
  dimension: ds_curso {
type: string
sql: ${TABLE}."DS_CURSO"
description:"DESCRICAO DO CURSO"
;;}
  dimension: estado_instituicao {
type: string
sql: ${TABLE}."ESTADO_INSTITUICAO"
description:"ESTADO ONDE A INSTITUIÇÃO SE ENCONTRA"
;;}
  dimension: flg_curso_antecipacao {
type: yesno
sql: ${TABLE}."FLG_CURSO_ANTECIPACAO"
description:"INDICA SE A MODADELIDADE DO PRODUTO DO CURSO É ANTECIPAÇÃO"
;;}
  dimension: flg_curso_gestao {
type: yesno
sql: ${TABLE}."FLG_CURSO_GESTAO"
description:"INDICA SE A MODALIDADE DO PRODUTO DO CURSO É GESTÃO"
;;}
  dimension: flg_intituicao_ativa {
type: yesno
sql: ${TABLE}."FLG_INTITUICAO_ATIVA"
description:"INDICA SE A INSTITUIÇÃO ESTÁ ATIVA"
;;}
  dimension: id_contrato_instituicao {
type: string
sql: ${TABLE}."ID_CONTRATO_INSTITUICAO"
description:"ID DO CONTRATO FIRMADO COM A INSTITUIÇÃO"
;;}
  dimension: id_curso {
type: string
sql: ${TABLE}."ID_CURSO"
description:"IDENTIFICADOR DO CURSO"
;;}
  dimension: id_instituicao {
type: string
sql: ${TABLE}."ID_INSTITUICAO"
description:"IDENTIFICADOR DA INSTITUIÇÃO"
;;}
  dimension_group: instituicao_data_atualizacao {
type: time    timeframes: [      raw,      time,      date,      week,      month,      quarter,      year    ]
sql: ${TABLE}."INSTITUICAO_DATA_ATUALIZACAO"
description:"DATA DA ULTIMA ATUALIZAÇÃO DA INSTITUIÇÃO"
;;}
  dimension: logo_instituicao {
type: string
sql: ${TABLE}."LOGO_INSTITUICAO"
description:"URL DO ENDEREÇO DA IMAGEM DO LOGO DA INSTITUIÇÃO"
;;}
  dimension: nome_banco {
type: string
sql: ${TABLE}."NOME_BANCO"
description:"NOME DO BANCO"
;;}
  dimension: nome_central_instituicao {
type: string
sql: ${TABLE}."NOME_CENTRAL_INSTITUICAO"
description:"NOME DA SEDE DA INSTITUIÇÃO"
;;}
  dimension: nome_corporativo_instituicao {
type: string
sql: ${TABLE}."NOME_CORPORATIVO_INSTITUICAO"
description:"NOME DA INSTITUIÇÃO"
;;}
  dimension: nome_curso {
type: string
sql: ${TABLE}."NOME_CURSO"
description:"NOME DO CURSO"
;;}
  dimension: nome_fantasia_instituicao {
type: string
sql: ${TABLE}."NOME_FANTASIA_INSTITUICAO"
description:"NOME FANTASIA DA INSTITUIÇÃO"
;;}
  dimension: numero_conta_banco {
type: number
sql: ${TABLE}."NUMERO_CONTA_BANCO"
description:"NUMERO DA CONTA"
;;}
  dimension: numero_instituicao {
type: string
sql: ${TABLE}."NUMERO_INSTITUICAO"
description:"NUMERO DA RUA ONDE A INSTITUIÇÃO ESTÁ LOCALIZADA"
;;}
  dimension: parcelamento {
type: string
sql: ${TABLE}."PARCELAMENTO"
description:"TODAS AS POSSIBILIDADES DE PARCELAMENTO DISPONÍVEL PARA O CURSO"
;;}
  dimension: primeira_data_vencimento_contrato {
type: number
sql: ${TABLE}."PRIMEIRA_DATA_VENCIMENTO_CONTRATO"
description:"DIA DA PRIMEIRA DATA DE VENCIMENTO"
;;}
  dimension: rua_instituicao {
type: string
sql: ${TABLE}."RUA_INSTITUICAO"
description:"NOME DA RUA DA INSTITUIÇÃO"
;;}
  dimension: tx_mensal {
type: number
sql: ${TABLE}."TX_MENSAL"
description:"TAXA MENSAL"
;;}
  dimension: tx_multa {
type: number
sql: ${TABLE}."TX_MULTA"
description:"TAXA DE MULTA COBRADA EM CADA CONTRATO"
;;}
  dimension: vl_curso {
type: number
sql: ${TABLE}."VL_CURSO"
description:"VALOR DO CURSO"
;;}

  measure: count {
    type: count
    drill_fields: []
  }
}
