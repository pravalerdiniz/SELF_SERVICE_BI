view: instituicao {
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."INSTITUICAO"
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}."ID";;
  }



  dimension: ano_nota_enade {
    type: number
    group_label: "ENADE"
    label: "Ano de Referência - Nota ENADE"
    description: "Ano de Referência para nota ENADE"
    sql: ${TABLE}."ANO_NOTA_ENADE";;
  }

  dimension: bairro_sede_ie {
    type: string
    group_label: "Dados da Instituição"
    label: "Sede - Bairro"
    description: "Bairro da IES"
    sql: ${TABLE}."BAIRRO_SEDE_IE";;
  }



  dimension: campus_ativo {
    type: yesno
    sql: ${TABLE}."CAMPUS_ATIVO";;
    group_label: "Dados do Campus - IE"
    label: "Campus Ativo?"
    description: "Indica se o campus está ativo."
  }

  dimension: campus_capacidade_alunos {
    type: number
    group_label: "Dados do Campus - IE"
    label: "Qtd de Alunos - Capacidade Campus"
    description:"Indica a capacidade total de alunos que o campus da instituição suporta."
    sql: ${TABLE}."CAMPUS_CAPACIDADE_ALUNOS";;
  }

  dimension: campus_possui_ead {
    type: yesno
    group_label: "Dados do Campus - IE"
    label: "Possui EAD?"
    description: "Indica se o Campus a modadelidade de Ensino à Distância para determinado curso"
    sql: ${TABLE}."CAMPUS_POSSUI_EAD";;
  }

  dimension: campus_tem_estacionamento {
    type: yesno
    group_label: "Dados do Campus - IE"
    label: "Possui Estacionamento?"
    description: "Indica se o Campus tem estacionamento em suas depêndencias"
    sql: ${TABLE}."CAMPUS_TEM_ESTACIONAMENTO";;
  }

  dimension: campus_tem_estacionamento_gratuito {
    type: yesno
    group_label: "Dados do Campus - IE"
    label: "Possui Estacionamento GRATUITO?"
    description: "Indica se o Campus tem estacionamento GRATUITO em suas depêndencias"
    sql: ${TABLE}."CAMPUS_TEM_ESTACIONAMENTO_GRATUITO";;
  }



  dimension: cep_campus {
    type: string
    group_label: "Dados do Campus - IE"
    label: "CEP"
    description: "Informação relacionado ao endereço. Indica o número do CEP do Campus"
    sql: ${TABLE}."CEP_CAMPUS";;
  }

  dimension: cep_sede_ie {
    type: string
    group_label: "Dados da Instituição"
    label: "Sede - CEP"
    description: "Informação relacionada ao endereço. Indica o número do CEP da Sede"
    sql: ${TABLE}."CEP_SEDE_IE";;
  }

  dimension: cidade_campus {
    type: string
    group_label: "Dados do Campus - IE"
    label: "Cidade"
    description: "Indica a cidade que está o campus da instituição"
    sql: ${TABLE}."CIDADE_CAMPUS";;
  }

  dimension: cidade_sede_ie {
    type: string
    group_label: "Dados da Instituição"
    label: "Sede - Cidade"
    description: "Indica a cidade que está localizada a Sede da IES"
    sql: ${TABLE}."CIDADE_SEDE_IE";;
  }

  dimension: classificacao_curso {
    type: string
    group_label: "Dados do Curso - IE"
    label: "Nivel Acadêmico do Curso"
    description: "Informação relacionada ao curso. Indica a classificação do curso. Ex: Graduação, Pós-Graduação, Técnico "
    sql: ${TABLE}."CLASSIFICACAO_CURSO";;
  }

  dimension: cnpj_ie {
    type: number
    value_format: "0"
    group_label: "Dados da Instituição"
    label: "CNPJ"
    description: "Indica o número do CNPJ da Instituição"
    sql: ${TABLE}."CNPJ_IE";;
  }





  dimension: curso_ativo {
    type: number
    group_label: "Dados do Curso - IE"
    label: "Curso Ativo?"
    description:"Indica se o curso está ativo no sistema. 1 = Ativo e 0 = Não Ativo"
    sql: ${TABLE}."CURSO_ATIVO";;
  }





  dimension: ds_area_conhecimento {
    type: string
    label: "Área de Conhecimento do Curso"
    group_label: "Dados do Curso - IE"
    description: "Indica a área de conhecimento do curso. Ex: Ciências Exatas e da Terra, Ciências Biológicas, Engenharia / Tecnologia, Ciências da Saúde, entre outras"
    sql: ${TABLE}."DS_AREA_CONHECIMENTO";;
  }

  dimension: ds_campus {
    type: string
    group_label: "Dados do Campus - IE"
    label: "Nome do Campus"
    description: "Indica o nome do Campus da IES"
    sql: ${TABLE}."DS_CAMPUS";;
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

  dimension: duracao_curso_meses {
    type: number
    group_label: "Dados do Curso - IE"
    label: "Duração do Curso - Meses"
    description: "Quantidade de meses de duração do curso"
    sql: ${TABLE}."DURACAO_CURSO_MESES";;
  }

  dimension: endereco_campus {
    type: string
    group_label: "Dados do Campus - IE"
    label: "Endereço - Campus"
    description: "Indica o Endereço do Campus"
    sql: ${TABLE}."ENDERECO_CAMPUS";;
  }

  dimension: endereco_sede_ie {
    type: string
    group_label: "Dados da Instituição"
    label: "Sede - Endereço"
    description: "Indica o Endereço da Sede da IES"
    sql: ${TABLE}."ENDERECO_SEDE_IE";;
  }

  dimension: enfase {
    type: string
    group_label: "Dados do Curso - IE"
    label: "Enfâse do Curso"
    description: "Indica qual é a Enfâse de determinado curso. Ou seja, qual o núcleo de conhecimento especializado."
    sql: ${TABLE}."ENFASE";;
  }

  dimension: estado_sede_ie {
    type: string
    group_label: "Dados da Instituição"
    label: "Sede - Estado"
    description: "UF SEDE IES"
    sql: ${TABLE}."ESTADO_SEDE_IE";;
  }

  dimension: flg_bolsa {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Bolsa?"
    description: "Indica se o IES possui o produto Bolsa"
    sql: ${TABLE}."FLG_BOLSA";;
  }

  dimension: flg_descadastrada {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Descadastrada?"
    description: "Indica se a instituição está descadastrada no PRAVALER"
    sql: ${TABLE}."FLG_DESCADASTRADA";;
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

  dimension: flg_matriz {
    type: yesno
    group_label: "Dados do Campus - IE"
    label: "Matriz?"
    description: "Indica se o campus é a matriz da instituição"
    sql: ${TABLE}."FLG_MATRIZ";;
  }

  dimension: flg_possi_pdv {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Possui PDV?"
    description: "Indica se a instituição possui PDV (Ponto de Venda)."
    sql: ${TABLE}."FLG_POSSI_PDV";;
  }

  dimension: flg_recebe_contrato {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Recebe Contrato?"
    description: "Indica se a instituição recebe contrato fisico ou se o aluno deve entregar somente ao PRAVALER"
    sql: ${TABLE}."FLG_RECEBE_CONTRATO";;
  }




  dimension: grupo {
    type: string
    group_label: "Dados da Instituição"
    label: "Grupo da Instituição"
    description: "Indica o nome do Grupo responsável pela instituição cadastrado no Backoffice."
    sql: ${TABLE}."GRUPO";;
  }

  dimension: id_campus {
    type: string
    group_label: "Dados do Campus - IE"
    label:"ID do Campus"
    description:"Indica o  ID do Campus cadastrado no Backoffice."
    sql: ${TABLE}."ID_CAMPUS";;
  }

  dimension: id_curso {
    type: string
    group_label:"Dados do Curso - IE"
    label:"ID do Curso"
    description:"Indica o ID do Curso cadastrado no Backoffice."
    sql: ${TABLE}."ID_CURSO";;
  }

  dimension: id_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "ID da Instituição"
    description:"Indica o ID da Instituição de Ensino cadastrado no Backoffice."
    sql: ${TABLE}."ID_INSTITUICAO";;
  }




  dimension: ie_ativa {
    type: number
    group_label: "Dados da Instituição"
    label: "Instituição Ativa?"
    description:"Indica se a Instituição está ativa. Ex: 1 = 'Sim' | 2 = 'Não'"
    hidden: yes
    sql: ${TABLE}."IE_ATIVA";;
  }

  dimension: ies_ativa {
    type: string
    group_label: "Dados da Instituição"
    label: "Instituição Ativa?"
    description:"Indica se a Instituição está ativa."
    sql: case when ${ie_ativa} = 1 THEN 'Yes' ELSE 'No' END;;
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


  dimension: nome_curso {
    type: string
    group_label:"Dados do Curso - IE"
    label:"Nome do Curso"
    description:"Indica o nome do Curso"
    sql: ${TABLE}."NOME_CURSO";;
  }

  dimension: nome_fantasia {
    type: string
    group_label: "Dados da Instituição"
    label: "Nome da Instituição de Ensino"
    description:"Indica o nome FANTASIA da Instituição de Ensino."
    sql: ${TABLE}."NOME_FANTASIA";;
  }

  dimension: nota_enade {
    type: number
    group_label: "ENADE"
    label: "Nota do ENADE"
    description:"Indica a Nota da IES no ENAD (Exame Nacional de Desempenho dos Estudantes)"
    sql: ${TABLE}."NOTA_ENADE";;
  }




  dimension: periodo {
    type: string
    group_label:"Dados do Curso - IE"
    label:"Periodo"
    description: "Indica o periodo do curso. Ex: Manhã, Noite, EAD."
    sql: ${TABLE}."PERIODO";;
  }

  dimension: porc_matricula_expressa {
    type: number
    group_label:"Dados da Instituição"
    label:"Porcentagem de Matrícula Expressa"
    description:"Indica o valor da porcentagem aplicada sobre a mensalidade do curso para determinar o valor do boleto de matricula expressa."
    sql: ${TABLE}."PORC_MATRICULA_EXPRESSA";;
  }

  dimension: qtd_alunos_ie {
    type: number
    group_label: "Dados da Instituição"
    label: "Quantidades de Alunos da Instituição"
    description:"Indica a Quantidade total de alunos na Instituição de Ensino."
    sql: ${TABLE}."QTD_ALUNOS_IE";;
  }

  dimension: qtd_mensalidades {
    type: number
    group_label:"Dados do Curso - IE"
    label:"Quantidade de Mensalidade"
    description: "Indica a quantidade de mensalidades por curso."
    sql: ${TABLE}."QTD_MENSALIDADES";;
  }

  dimension: qtd_semestre {
    type: number
    group_label:"Dados do Curso - IE"
    label:"Quantidade de Semestres"
    description: "Indica a quantidade de semestre por curso."
    sql: ${TABLE}."QTD_SEMESTRE";;
  }

  dimension: razao_social {
    type: string
    group_label: "Dados da Instituição"
    label: "Razão Social"
    description: "Indica o nome da razão social da instituição"
    sql: ${TABLE}."RAZAO_SOCIAL";;
  }


  dimension: reprova_por_score {
    type: string
    group_label:"Dados da Instituição"
    label:"Reprovação por Score"
    description:"Indica a descrição de reprovação por score."
    sql: ${TABLE}."REPROVA_POR_SCORE";;
  }





  dimension: uf_campus {
    type: string
    group_label: "Dados do Campus - IE"
    label: "UF"
    description: "Indica a UF do Campus da instituição"
    sql: ${TABLE}."UF_CAMPUS";;
  }

  dimension: mapa_uf_campus {
    sql: ${TABLE}."UF_CAMPUS" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados do Campus - IE"
    group_item_label: "UF - Mapa"
    description: "Indica a UF do campus, pode ser usado em gráficos de mapa"
  }




  dimension: valor_mensalidade {
    type: number
    group_label:"Dados do Curso - IE"
    value_format: "$ #,##0.00"
    label:"Valor da Mensalidade"
    description: "Indica o valor da mensalidade do curso."
    sql: ${TABLE}."VALOR_MENSALIDADE";;
  }

  dimension: ies_amigoedu_array {
    sql: ${TABLE}."DADOS_IES_AMIGOEDU" ;;
    type: string
    group_label: "Dados da IES Amigoedu"
    group_item_label: "Array amigoedu"
    description: "Indica o conjunto de dados da IES nos dados do amigoedu"
  }

  dimension: ies_amigoedu_nome {
    sql: ${TABLE}.DADOS_IES_AMIGOEDU[0]:"nome"::varchar;;
    type: string
    group_label: "Dados da IES Amigoedu"
    group_item_label: "nome da IES amigoedu"
    description: "Indica o nome da IES nos dados do amigoedu"
  }

  dimension: ies_amigoedu_grupo {
    sql: ${TABLE}.DADOS_IES_AMIGOEDU[0]:"grupo"::varchar;;
    type: string
    group_label: "Dados da IES Amigoedu"
    group_item_label: "grupo da IES amigoedu"
    description: "Indica o grupo da IES nos dados do amigoedu"
  }



  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: avg_mensalidade {
    type: average
    sql: ${valor_mensalidade} ;;
    value_format: "$ #,###"
    group_label: "Valor da Mensalidade"
    group_item_label: "Média"
    description: "Valor médio de mensalidade"
  }


  measure: sum_mensalidade {
    type: sum
    sql: ${valor_mensalidade} ;;
    value_format: "$ #,###"
    group_label: "Valor da Mensalidade"
    group_item_label: "Soma"
    description: "Soma do valor da mensalidade"
  }

  measure: max_mensalidade {
    type: max
    sql: ${valor_mensalidade} ;;
    value_format: "$ #,###"
    group_label: "Valor da Mensalidade"
    group_item_label: "Máximo"
    description: "Valor máximo de mensalidade"
  }

  measure: min_mensalidade {
    type: min
    sql: ${valor_mensalidade} ;;
    value_format: "$ #,###"
    group_label: "Valor da Mensalidade"
    group_item_label: "Mínimo"
    description: "Valor mínimo de mensalidade"
  }

  measure: sum_qtd_mensalidade {
    type: sum
    sql: ${qtd_mensalidades} ;;
    value_format: "#,###"
    group_label: "Quantidade de Mensalidades"
    group_item_label: "Soma"
    description: "Soma da quantidade de mensalidades  por curso"
  }

  measure: avg_qtd_mensalidade {
    type: average
    sql: ${qtd_mensalidades} ;;
    value_format: "#,###"
    group_label: "Quantidade de Mensalidades"
    group_item_label: "Média"
    description: "Média da quantidade de mensalidades por curso"
  }

  measure: avg_qtd_semestres {
    type: average
    sql: ${qtd_semestre} ;;
    value_format: "#,###"
    group_label: "Quantidade de Semestres"
    group_item_label: "Média"
    description: "Média da quantidade de semestres por curso"
  }

  measure: sum_qtd_semestres {
    type: sum
    sql: ${qtd_semestre} ;;
    value_format: "#,###"
    group_label: "Quantidade de Semestres"
    group_item_label: "Soma"
    description: "Soma da quantidade de semestres por curso"
  }

  measure: sum_qtd_curso_ativos {
    type: sum
    sql: ${curso_ativo} ;;
    value_format: "#,###"
    group_label: "Quantidade de Cursos"
    group_item_label: "Soma"
    description: "Soma da quantidade de cursos ativos por instituição"
  }



  measure: qtd_ies_ativas {
    type: count_distinct
    group_label: "Instituição"
    group_item_label: "Quantidade de Instituição - Ativa"
    description: "Quantidade de Instituições ativas no PRAVALER"
    sql_distinct_key: ${id_instituicao};;
    sql: ${id_instituicao} ;;
    filters: [ie_ativa: "1"]


  }

  measure: qtd_ies {
    type: count_distinct
    group_label: "Instituição"
    group_item_label: "Quantidade de Instituição"
    description: "Quantidade de Instituições total no PRAVALER"
    sql_distinct_key: ${id_instituicao};;
    sql: ${id_instituicao} ;;


  }

  measure: qtd_grupos {
    type: count_distinct
    group_label: "Instituição"
    group_item_label: "Quantidade de Grupos"
    description: "Quantidade de Grupos"
    sql: ${grupo} ;;


  }


measure: qtd_ies_descadastrada {
  type: count_distinct
  group_label: "Instituição"
  group_item_label: "Quantidade de Descadastradas"
  description: "Quantidade de Instituições descadastradas"
  sql_distinct_key: ${id_instituicao};;
  sql: ${id_instituicao} ;;
  filters: [flg_descadastrada: "yes"]


}


  measure: qtd_ies_possui_pdv {
    type: count_distinct
    group_label: "Instituição"
    group_item_label: "Quantidade de Possuem PDV(Ponto de Venda)"
    sql_distinct_key: ${id_instituicao};;
    sql:  ${id_instituicao};;
    description: "Quantidade de Instituições que possuem PDV (Ponto de Venda)"
    filters: [flg_possi_pdv: "yes"]
  }

  measure: qtd_ies_financia_matricula {
    type: count_distinct
    group_label: "Instituição"
    group_item_label: "Quantidade de Instituições que Financiam Matricula"
    sql_distinct_key: ${id_instituicao};;
    sql:  ${id_instituicao};;
    description: "Quantidade de Instituições que financiam matrícula do aluno após 1ª renovação"
    filters: [flg_financia_matricula: "yes"]
  }

  measure: qtd_ies_bolsa {
    type: count_distinct
    group_label: "Instituição"
    group_item_label: "Quantidade de Bolsa"
    sql_distinct_key: ${id_instituicao};;
    sql:  ${id_instituicao};;
    description: "Quantidade de Instituições que possuem o produto de Bolsa"
    filters: [flg_bolsa:"yes"]
  }


  measure: qtd_ies_matricula_expressa {
    type: count_distinct
    group_label: "Instituição"
    group_item_label: "Quantidade de Matricula Expressa"
    sql_distinct_key: ${id_instituicao};;
    sql:  ${id_instituicao};;
    description: "Quantidade de Instituições que optam pelo boleto de Matricula Expressa"
    filters: [flg_matricula_expressa:"yes"]
  }


  measure: qtd_campus_ativos{
    type: count_distinct
    group_label: "Campus"
    group_item_label: "Quantidade de Campus - Ativos"
    sql_distinct_key: ${id_campus};;
    sql:  ${id_campus};;
    description: "Quantidade de Campus ativos"
    filters: [campus_ativo: "yes"]
  }


  measure: qtd_campus{
    type: count_distinct
    group_label: "Campus"
    group_item_label: "Quantidade de Campus"
    sql_distinct_key: ${id_campus};;
    sql:  ${id_campus};;
    description: "Quantidade de Campus ativos"
  }






  measure: avg_duracao_curso {
    type: average
    sql: ${duracao_curso_meses} ;;
    group_label: "Duração do Curso"
    group_item_label: "Média"
    description: "Média de duração do curso em meses"
  }



  measure: min_duracao_curso {
    type: min
    sql: ${duracao_curso_meses} ;;
    group_label: "Duração do Curso"
    group_item_label: "Mínimo"
    description: "Mínimo de duração do curso"
  }


  measure: max_duracao_curso {
    type: max
    sql: ${duracao_curso_meses} ;;
    group_label: "Duração do Curso"
    group_item_label: "Máximo"
    description: "Máximo de duração do curso"
  }



#Campos ocultos - 13/06/2022 - Lulinha


  dimension: cargo {
    type: string
    group_label: "Dados da Regional - IE"
    label: "Cargo"
    hidden: yes
    description: "Nome do cargo do representante Comercial na IES"
    sql: ${TABLE}."CARGO";;
  }

  dimension: carteira_regional {
    type: string
    group_label: "Dados da Regional - IE"
    label: "Carteira Regional"
    hidden: yes
    description: "Indica o tipo de carteira regional do responsável comercial na instituição de ensino. Ex: Varejo, DN, Outros"
    sql: ${TABLE}."CARTEIRA_REGIONAL";;
  }


  dimension: regional_regiao {
    type: string
    group_label: "Dados da Regional - IE"
    label: "Região"
    hidden: yes
    description: "Indica o nome da região que representa a regional"
    sql: ${TABLE}."REGIONAL_REGIAO";;
  }

  dimension: representante_regional {
    type: string
    group_label: "Dados da Regional - IE"
    label: "Nome do Representante Regional"
    hidden: yes
    sql: ${TABLE}."REPRESENTANTE_REGIONAL";;
  }

  dimension: tipo_regional {
    type: string
    hidden: yes
    group_label: "Dados da Regional - IE"
    label: "Tipo de Representante"
    description: "Indica o tipo de representante comercial no campus da instituição de ensino. Ex: Fixo ou Volante"
    sql: ${TABLE}."TIPO_REGIONAL";;
  }


  dimension: conversao_regional {
    type: string
    hidden: yes
    group_label: "Dados da Regional - IE"
    label: "Nome - Responsável pela Conversão Regional"
    description: "Nome do responsavél pela conversão regional da IES"
    sql: ${TABLE}."CONVERSAO_REGIONAL";;
  }

  dimension: cp {
    type: string
    group_label: "Dados da Regional - IE"
    hidden: yes
    label: "Código do Representante (CP)"
    description:"Indica o código do representante comercial no campus da instituição de ensino."
    sql: ${TABLE}."CP";;
  }

  dimension: gerente_regional {
    type: string
    group_label: "Dados da Regional - IE"
    label: "Gerente Regional"
    hidden: yes
    description: "Indica o nome do responsável pela Regional"
    sql: ${TABLE}."GERENTE_REGIONAL";;
  }


}
