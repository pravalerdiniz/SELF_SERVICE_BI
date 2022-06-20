view: student {
  sql_table_name: "VETERANO"."CURTA"."STUDENT"
    ;;

  dimension: bairro {

    type: string
    sql: ${TABLE}."BAIRRO";;
    description:"BAIRRO DO ENDEREÇO DO ALUNO"
    group_item_label: "Bairro"
    group_label: "Dados do Aluno"
  }

  dimension: flg_aluno_resp_fin {
    type: yesno
    sql: ${TABLE}."FLG_ALUNO_RESP_FIN";;
    description:"INDICA SE O ALUNO É O RESPONSÁVEL FINANCEIRO"
    group_item_label: "Responsavel Financeiro?"
    group_label: "Dados do Aluno"
  }



  dimension: bairro_fiador {
    type: string
    sql: ${TABLE}."BAIRRO_FIADOR";;
    description:"BAIRRO DO FIADOR"
    group_item_label: "Bairro"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: cep {
    type: string
    sql: ${TABLE}."CEP";;
    description:"CEP DO ALUNO"
    group_item_label: "CEP"
    group_label: "Dados do Aluno"
  }
  dimension: cep_fiador {
    type: string
    sql: ${TABLE}."CEP_FIADOR";;
    description:"CEP DO FIADOR"
    group_item_label: "CEP"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: cidade {
    type: string
    sql: ${TABLE}."CIDADE";;
    description:"CIDADE DO ENDEREÇO DO ALUNO"
    group_item_label: "Cidade"
    group_label: "Dados do Aluno"
  }
  dimension: cidade_fiador {
    type: string
    sql: ${TABLE}."CIDADE_FIADOR";;
    description:"CIDADE DO FIADOR"
    group_item_label: "Cidade"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: complemento_endereco {
    type: string
    sql: ${TABLE}."COMPLEMENTO_ENDERECO";;
    description:"COMPLEMENTO DO ENDEREÇO DO ALUNO"
    group_item_label: "Complemento do Endereço"
    group_label: "Dados do Aluno"
  }
  dimension: complemento_endereco_fiador {
    type: string
    sql: ${TABLE}."COMPLEMENTO_ENDERECO_FIADOR";;
    description:"COMPLEMENTO DO ENDEREÇO DO FIADOR"
    group_item_label: "Complemento do Endereço"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: cpf_aluno {
    type: number
    sql: ${TABLE}."CPF_ALUNO";;
    description:"NUMERO DO CPF DO ALUNO"
    group_item_label: "CPF"
    group_label: "Dados do Aluno"
    value_format: "0"
    required_access_grants: [grupo_cpf]
  }
  dimension: cpf_fiador {
    type: number
    sql: ${TABLE}."CPF_FIADOR";;
    description:"CPF DO FIADOR"
    group_item_label: "CPF"
    group_label: "Dados Responsável Financeiro"
    value_format: "0"
    required_access_grants: [grupo_cpf]
  }
  dimension: cpf_garantidor {
    type: number
    sql: ${TABLE}."CPF_GARANTIDOR";;
    description:"CPF DO RESPONSÁVEL FINANCEIRO"
    group_item_label: "CPF"
    group_label: "Dados do Garantidor"
    hidden: yes
    required_access_grants: [grupo_cpf]
  }
  dimension: cursos {
    type: string
    sql: ${TABLE}."CURSOS";;
    description:"CURSOS REALIZADOS PELO ALUNO"
    group_item_label: "Cursos"
    group_label: "Dados de Cursos"
  }
  dimension_group: data_aceite {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}."DATA_ACEITE";;
    description:"DATA EM QUE O ALUNO FOI ACEITO NO CURSO"
    label: "Aceite no curso"
  }
  dimension_group: data_atualizacao_aluno {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}."DATA_ATUALIZACAO_ALUNO";;
    description:"DATA DA ULTIMA ATUALIZAÇÃO DOS DADOS DO ALUNO"
    label: "Atualização dos Dados"
  }
  dimension_group: data_atualizacao_endereco {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}."DATA_ATUALIZACAO_ENDERECO";;
    description:"DATA DA ULTIMA ATUALIZAÇÃO DO ENDEREÇO DO ALUNO"
    label: "Atualização do Endereço"
  }
  dimension_group: data_atualizacao_endereco_fiador {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}."DATA_ATUALIZACAO_ENDERECO_FIADOR";;
    description:"DATA DA ULTIMA ATUALIZAÇÃO DOS DADOS DE ENDEREÇO DO FIADOR"
    label: "Resp. Financeiro - Atualização Endereço"
  }
  dimension_group: data_atualizacao_fiador {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}."DATA_ATUALIZACAO_FIADOR";;
    description:"DATA DE ATUALIZACAO DOS DADOS DO FIADOR"
    label: "Resp. Financeiro - Atualização de Dados"
  }
  dimension_group: data_atualizacao_garantidor {
    type: time    timeframes: [ raw, time, date, week, month, quarter, year    ]
    sql: ${TABLE}."DATA_ATUALIZACAO_GARANTIDOR";;
    description:"DATA DA ULTIMA ATUALIZAÇÃO DOS DADOS DO GARANTIDOR"
    hidden: yes
    group_item_label: "Resp. Financeiro - Última Atualização"
  }
  dimension_group: data_nascimento_aluno {
    type: time    timeframes: [ raw, date, week, month, quarter, year    ]    convert_tz: no    datatype: date
    sql: ${TABLE}."DATA_NASCIMENTO_ALUNO";;
    description:"DATA DE NASCIMENTO DO ALUNO"
     label: "Aluno - Nascimento"
  }

  dimension: idade_aluno {
    type: number
    sql:datediff('year',${data_nascimento_aluno_date},current_date) ;;
    description:"IDADE DO ALUNO"
    group_label: "Dados do Aluno"
    label: "Aluno - Idade"
  }


  dimension: regra_idade_aluno {
    type: number
    label: "Idade Regra"
    hidden: yes
    sql: ${idade_aluno} ;;


  }



  dimension: faixa_etaria_aluno {
    type: tier
    tiers: [16,18,25,30,35,40,50]
    style: integer
    sql: ${idade_aluno} ;;
    group_label: "Dados do Aluno"
    group_item_label: "Faixa Etária"
    description: "INDICA A FAIXA ETARIA DO ALUNO"
  }



  dimension_group: data_nascimento_fiador {
    type: time    timeframes: [ raw, date, week, month, quarter, year    ]    convert_tz: no    datatype: date
    sql: ${TABLE}."DATA_NASCIMENTO_FIADOR";;
    description:"DATA DE NASCIMENTO DO FIADOR"
    group_item_label: "Resp. Financeiro - Nascimento"
  }
  dimension: email_aluno {
    type: string
    sql: ${TABLE}."EMAIL_ALUNO";;
    description:"E-MAIL DO ALUNO"
    group_item_label: "E-mail"
    group_label: "Dados do Aluno"
    required_access_grants: [grupo_email]
  }
  dimension: email_fiador {
    type: string
    sql: ${TABLE}."EMAIL_FIADOR";;
    description:"EMAIL DO FIADOR"
    group_item_label: "E-mail"
    group_label: "Dados Responsável Financeiro"
    required_access_grants: [grupo_email]
  }
  dimension: estado {
    type: string
    sql: ${TABLE}."ESTADO";;
    description:"ESTADO DO ENDEREÇO DO ALUNO"
    group_item_label: "Estado - UF"
    group_label: "Dados do Aluno"
  }


  dimension: estado_mapa {
    type: string
    sql: ${estado};;
    map_layer_name: MAPA_ESTADO_ALUNO
    description:"UF DO ESTADO DO ENDEREÇO DO ALUNO. UTILIZAR ESSA DIMENSÃO COM GRÁFICO DE MAPA"
    group_item_label: "Estado - UF (Mapa)"
    group_label: "Dados do Aluno"
  }

  dimension: regiao_aluno {
    type: string
    group_label: "Dados do Aluno"
    label: "Região do Aluno"
    description: "INDICA A REGIÃO GEOGRÁFICA DO ALUNO"
    sql: case when ${estado} in ('SP', 'RJ', 'MG', 'ES') THEN 'SUDESTE'
         when ${estado} in ('DF', 'GO', 'MT', 'MS') THEN 'CENTRO-OESTE'
         WHEN ${estado} IN ('AC', 'AM', 'RO', 'RR', 'PA', 'AP', 'TO') then 'NORTE'
         WHEN ${estado} IN ('MA', 'PI', 'CE', 'RN', 'PB', 'PE', 'AL', 'SE', 'BA') then 'NORDESTE'
         WHEN ${estado} IN ('PR', 'SC', 'RS') then 'SUL'
         ELSE 'NÃO PREENCHIDO' END ;;
  }




  dimension: estado_civil_garantidor {
    type: string
    sql: ${TABLE}."ESTADO_CIVIL_GARANTIDOR";;
    description:"ESTADO CIVIL DO RESPONSAVEL FINANCEIRO"
    group_item_label: "Estado Civil"
    hidden: yes
    group_label: "Dados Responsável Financeiro"
  }
  dimension: estado_fiador {
    type: string
    sql: ${TABLE}."ESTADO_FIADOR";;
    description:"ESTADO DO FIADOR"
    group_item_label: "Estado"
    group_label: "Dados Responsável Financeiro"
  }


  dimension: estado_fiador_mapa {
    type: string
    sql: ${estado_fiador};;
    map_layer_name: MAPA_ESTADO_ALUNO
    description:"UF DO ESTADO DO ENDEREÇO DO FIADOR. UTILIZAR ESSA DIMENSÃO COM GRÁFICO DE MAPA"
    group_item_label: "Estado - UF (Mapa)"
    group_label: "Dados Responsável Financeiro"
  }


  dimension: regiao_fiador {
    type: string
    group_label: "Dados do Responsável Financeiro"
    label: "Região do Fiador"
    description: "INDICA A REGIÃO GEOGRÁFICA DO RESPONSÁVEL FINANCEIRO"
    sql: case when ${estado_fiador} in ('SP', 'RJ', 'MG', 'ES') THEN 'SUDESTE'
         when ${estado_fiador} in ('DF', 'GO', 'MT', 'MS') THEN 'CENTRO-OESTE'
         WHEN ${estado_fiador} IN ('AC', 'AM', 'RO', 'RR', 'PA', 'AP', 'TO') then 'NORTE'
         WHEN ${estado_fiador} IN ('MA', 'PI', 'CE', 'RN', 'PB', 'PE', 'AL', 'SE', 'BA') then 'NORDESTE'
         WHEN ${estado_fiador} IN ('PR', 'SC', 'RS') then 'SUL'
         ELSE 'NÃO PREENCHIDO' END ;;
  }





  dimension: id_aluno {
    type: string
    sql: ${TABLE}."ID_ALUNO";;
    description:"IDENTIFICAR ÚNICO DO ALUNO"
    group_item_label: "Id Aluno"
    primary_key: yes
    group_label: "Dados do Aluno"
  }
  dimension: id_fiador {
    type: string
    sql: ${TABLE}."ID_FIADOR";;
    description:"IDENTIFICADOR UNICO DO FIADOR"
    group_item_label: "ID Resp. Financeiro"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: id_ocupacao {
    type: string
    sql: ${TABLE}."ID_OCUPACAO";;
    description:"IDENTIFICARDO DA OCUPAÇÃO DO GARANTIDOR"
    hidden: yes
    group_item_label: "Ocupação"
    group_label: "Dados do Garantidor"
  }
  dimension: nome_aluno {
    type: string
    sql: ${TABLE}."NOME_ALUNO";;
    description:"NOME DO ALUNO"
    group_item_label: "Nome"
    group_label: "Dados do Aluno"
    required_access_grants: [grupo_nome]
  }
  dimension: nome_fiador {
    type: string
    sql: ${TABLE}."NOME_FIADOR";;
    description:"NOME DO FIADOR"
    group_item_label: "Nome"
    group_label: "Dados Responsável Financeiro"
    required_access_grants: [grupo_nome]
  }
  dimension: nome_garantidor {
    type: string
    sql: ${TABLE}."NOME_GARANTIDOR";;
    description:"NOME DO RESPONSAVEL FINANCEIRO"
    group_item_label: "Nome"
    hidden: yes
    group_label: "Dados Responsável Financeiro"
    required_access_grants: [grupo_nome]
  }
  dimension: numero_endereco {
    type: string
    sql: ${TABLE}."NUMERO_ENDERECO";;
    description:"NUMERO DO ENDEREÇO DO ALUNO"
    group_item_label: "Numero Endereço"
    group_label: "Dados do Aluno"
  }
  dimension: numero_endereco_fiador {
    type: string
    sql: ${TABLE}."NUMERO_ENDERECO_FIADOR";;
    description:"NUMERO DO ENDEREÇO DO FIADOR"
    group_item_label: "Nº endereço"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: parentesco {
    type: string
    sql: ${TABLE}."PARENTESCO";;
    description:"PARENTESCO ENTRE RESPONSAVEL FINANCEIRO E ALUNO"
    group_item_label: "Parentesco"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: renda_aluno {
    type: number
    sql: ${TABLE}."RENDA_ALUNO";;
    description:"RENDA INFORMADA PELO ALUNO"
    group_item_label: "Renda"
    group_label: "Dados do Aluno"
  }

  dimension: faixa_renda_aluno {
    type: tier
    tiers: [1000,2000,3000,4000,6000,8000,10000]
    style: integer
    sql: ${renda_aluno} ;;
    group_label: "Dados do Aluno"
    group_item_label: "Faixa de Renda"
    description: "Indica a faixa de renda do aluno"
  }






  dimension: renda_fiador {
    type: number
    sql: ${TABLE}."RENDA_FIADOR";;
    description:"RENDA INFORMADA PELO RESPONSÁVEL FINANCEIRO"
    group_item_label: "Renda"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: renda_garantidor {
    type: number
    sql: ${TABLE}."RENDA_GARANTIDOR";;
    description:"RENDA INFORMADA PELO RESPONSÁVEL FINANCEIRO"
    group_item_label: "Renda"
    hidden: yes
    group_label: "Dados Responsável Financeiro"
  }
  dimension: rua {
    type: string
    sql: ${TABLE}."RUA";;
    description:"RUA DO ENDEREÇO DO ALUNO"
    group_item_label: "Rua"
    group_label: "Dados do Aluno"
  }
  dimension: rua_fiador {
    type: string
    sql: ${TABLE}."RUA_FIADOR";;
    description:"RUA DO FIADOR"
    group_item_label: "Rua"
    group_label: "Dados Responsável Financeiro"
  }
  dimension: telefone_aluno_1 {
    type: string
    sql: ${TABLE}."TELEFONE_ALUNO_1";;
    description:"TELEFONE PRINCIPAL DO ALUNO"
    group_item_label: "Telefone Principal"
    group_label: "Dados do Aluno"
    required_access_grants: [grupo_telefone]
  }
  dimension: telefone_aluno_2 {
    type: string
    sql: ${TABLE}."TELEFONE_ALUNO_2";;
    description:"TELEFONE SECUNDÁRIO DO ALUNO"
    group_item_label: "Telefone Secundario"
    group_label: "Dados do Aluno"
    required_access_grants: [grupo_telefone]
  }
  dimension: telefone_primario_fiador {
    type: string
    sql: ${TABLE}."TELEFONE_PRIMARIO_FIADOR";;
    description:"TELEFONE PRIMARIO DO FIADOR"
    group_item_label: "Telefone Principal"
    group_label: "Dados Responsável Financeiro"
    required_access_grants: [grupo_telefone]
  }
  dimension: telefone_secundario_fiador {
    type: string
    sql: ${TABLE}."TELEFONE_SECUNDARIO_FIADOR";;
    description:"TELEFONE SECUNDARIO DO FIADOR"
    group_item_label: "Telefone Secundario"
    group_label: "Dados Responsável Financeiro"
    required_access_grants: [grupo_telefone]
  }

  dimension: nome_curso {
    type: string
    sql: ${courses.nome_curso};;
    description:"DESCRICAO DO CURSO"
    group_item_label: "Nome do Curso"
    group_label: "Dados do Curso"
    hidden: yes
  }

  dimension: nome_fantasia_instituicao {
    type: string
    sql: ${institution.nome_fantasia_instituicao};;
    description:"NOME FANTASIA DA INSTITUIÇÃO"
    group_item_label: "Nome Fantasia"
    group_label: "Dados da Instituição"
    hidden: yes
  }

  dimension: id_contrato {
    type: string
    sql: ${contracts.id_contrato};;
    description: "IDENTIFICADOR DO CONTRATO"
    group_item_label: "Id do Contrato"
    group_label: "Dados do Contrato"
    hidden: yes
  }


  dimension: qtd_parcelas {
    type: number
    sql: ${contracts.qtd_parcelas};;
    description: "TOTAL DE PARCELAS QUE O CONTRATO FOI FEITO"
    group_item_label: "QTD de Parcelas"
    group_label: "Dados do Contrato"
    hidden: yes
  }


  dimension: status_checkout {
    type: string
    sql: ${TABLE}."STATUS_CHECKOUT";;
    description:"Indica qual etapa de checkout o estudante se encontra/percorreu"
    group_item_label: "Status Checkout"
  }

  dimension: vl_total_contrato {
    type: number
    sql: ${contracts.vl_total_contrato};;
    description: "VALOR TOTAL DO CONTRATO COM AS TAXAS"
    group_item_label: "Valor Total do Contrato"
    group_label: "Dados do Contrato"
    hidden: yes
  }


  measure: count_cpf_aluno_distinct {
    type: count_distinct
    sql: ${cpf_aluno} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Valor"
    description: "Contagem de ID CPFs únicos"
    drill_fields: [id_contrato,cpf_aluno,nome_aluno,email_aluno,nome_fantasia_instituicao,nome_curso,qtd_parcelas,vl_total_contrato]
  }

  measure: perc_cpf_aluno {
    type: percent_of_total
    sql: ${count_cpf_aluno_distinct} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Porcentagem"
    description: "Porcentagem do total de CPFs únicos"
  }



  measure: avg_renda_aluno {
    type: average
    sql: ${renda_aluno};;
    description:"MÉDIA DA RENDA INFORMADA PELO ALUNO"
    label: "Média - Aluno"
    group_label: "Renda"
  }

  measure: med_renda_aluno {
    type: median
    sql: ${renda_aluno};;
    description:"MEDIANA DA RENDA INFORMADA PELO ALUNO"
    label: "Mediana - Aluno"
    group_label: "Renda"
  }


  measure: avg_renda_fiador {
    type: average
    sql: ${renda_fiador};;
    description:"MÉDIA DA RENDA INFORMADA PELO RESPONSÁVEL FINANCEIRO"
    label: "Média - Fiador"
    group_label: "Renda"
  }

  measure: med_renda_fiador {
    type: median
    sql: ${renda_aluno};;
    description:"MEDIANA DA RENDA INFORMADA PELO RESPONSÁVEL FINANCEIRO"
    label: "Mediana - Fiador"
    group_label: "Renda"
  }

measure: sum_idade_aluno {
  type: sum
  sql: ${idade_aluno} ;;
  group_label: "Idade"
  label: "Soma"
  description: "Indica a soma da idade dos alunos"



}


  measure: avg_idade_aluno {
    type: average
    sql: ${idade_aluno} ;;
    group_label: "Idade"
    label: "Média"
    description: "Indica a média da idade dos alunos"


  }





}
