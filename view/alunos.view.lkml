view: alunos {
  sql_table_name: "SELF_SERVICE_BI"."ALUNOS"
    ;;


  #array de objeto
  dimension: maturidade_info {
    type: string
    sql: ${TABLE}."MATURIDADE_INFO" ;;
    hidden: yes

  }


  dimension: id_produtos_contratados {
    type: string
    sql: ${TABLE}."ID_PRODUTOS_CONTRATADOS" ;;
    group_label: "Dados do Produto"
    group_item_label: "ID dos Produtos Contratados"
    description: "Número de identificação dos produtos contratados"
    hidden: yes
  }


  dimension: aluno_idade {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "Idade do Aluno"
    description: "Indica a idade atual do aluno"
    sql: ${TABLE}."ALUNO_IDADE" ;;
  }

  dimension: aluno_genero {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Sexo do Aluno"
    description: "Indica o sexo do aluno"
    sql: ${TABLE}."ALUNO_GENERO" ;;
  }

  dimension: aluno_nome {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Nome do Aluno"
    description: "Indica o nome do aluno"
    sql: ${TABLE}."ALUNO_NOME" ;;
    required_access_grants: [grupo_nome]
  }

  dimension: ano_termino_ensino_medio {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "Ano de Término do Ensino Médio"
    description: "Indica o ano que o aluno terminou o ensino médio"
    sql: ${TABLE}."ANO_TERMINO_ENSINO_MEDIO" ;;
  }

  dimension: bairro {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Bairro"
    description: "Indica o bairro que o aluno reside"
    sql: ${TABLE}."BAIRRO" ;;
  }

  dimension: celular {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Celular do Aluno"
    description: "Indica o número do celular do aluno"
    sql: ${TABLE}."CELULAR" ;;
    required_access_grants: [grupo_telefone]
  }

  dimension: cep {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "CEP do Aluno"
    description: "Indica o número do CEP correspondente ao endereço do aluno"
    sql: ${TABLE}."CEP" ;;
    required_access_grants: [grupo_endereco]
  }

  dimension: cidade {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Cidade do Aluno"
    description: "Indica a cidade que o aluno reside"
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: ds_trabalha {
    type: string
    sql: ${TABLE}."DS_TRABALHA" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Trabalha?"
    description: "Indica se o aluno trabalha ou não"
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
    group_label: "Dados do Aluno"
    group_item_label: "E-mail do Aluno"
    description: "Indica o e-mail do aluno"
    required_access_grants: [grupo_email]
    suggestable: no
  }

  dimension: endereco {
    type: string
    sql: ${TABLE}."ENDERECO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Endereço do Aluno"
    description: "Indica o e-endereço do aluno"
    required_access_grants: [grupo_endereco]
  }

  dimension: renda_mensal {
    type: number
    sql: ${TABLE}."RENDA_MENSAL" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Renda Mensal do Aluno"
    description: "Indica a renda mensal do aluno"
    required_access_grants: [grupo_renda]
  }

  dimension: tipo_residencia {
    type: string
    sql: ${TABLE}."TIPO_RESIDENCIA" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Tipo de Residência do Aluno"
    description: "Indica o tipo do residência do aluno (ex.: alugada, própria financiada, etc)"
  }

  dimension: numero_dependentes {
    type: number
    sql: ${TABLE}."NUMERO_DEPENDENTES" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Número de dependentes do Aluno"
    description: "Indica o número de dependentes do aluno"
  }

  dimension: escolaridade {
    type: string
    sql: ${TABLE}."ESCOLARIDADE" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Escolaridade"
    description: "Indica a escolaridade do Aluno"
  }

  dimension: estado_civil {
    type: string
    sql: ${TABLE}."ESTADO_CIVIL" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Estado Civil do Aluno"
    description: "Indica o estado civil do aluno"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    group_label: "Dados do Aluno"
    group_item_label: "ID do CPF do Aluno"
    primary_key: yes
    description: "Indica o ID do CPF do Aluno"
  }

  dimension: cpf_aluno {
    type: number
    group_label: "Dados do Aluno"
    label: "CPF do Aluno"
    description: "Indica o CPF do Aluno"
    value_format: "0"
    sql: ${TABLE}."CPF" ;;
    required_access_grants: [grupo_cpf]

  }



  dimension: nacionalidade {
    type: string
    sql: ${TABLE}."NACIONALIDADE" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Nacionalidade do Aluno"
    description: "Indica a nacionalidade do aluno"

  }

  dimension: natureza_ocupacao {
    type: string
    sql: ${TABLE}."NATUREZA_OCUPACAO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Natureza da Ocupação"
    description: "Indica a natureza da ocupação do aluno"
  }

  dimension: profissao {
    type: string
    sql: ${TABLE}."PROFISSAO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Profissão do Aluno"
    description: "Indica a profissão do aluno"
  }

  dimension: tempo_empresa {
    type: string
    sql: ${TABLE}."TEMPO_EMPRESA" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Tempo na Empresa"
    description: "Indica há quanto tempo o aluno está trabalhando no atual emprego, se houver"
  }

  dimension: uf {
    type: string
    sql: ${TABLE}."UF" ;;
    group_label: "Dados do Aluno"
    group_item_label: "UF do Aluno"
    description: "Indica a UF do aluno"
  }

  dimension: mapa_uf_aluno {
    sql: ${TABLE}."UF" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados do Aluno"
    group_item_label: "UF do Aluno - Mapa"
    description: "Indica a UF do aluno, pode ser usado em gráficos de mapa"
  }



  dimension: fia_bairro {
    type: string
    sql: ${TABLE}."FIA_BAIRRO" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Bairro do Garantidor"
    description: "Indica o bairro do Garantidor"
  }

  dimension: fia_parentesco {
    type: string
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Parentesco do Garantidor"
    description: "Indica o parentesco do garantidor"
    sql: ${TABLE}."FIA_PARENTESCO" ;;
  }

  dimension: fia_idade {
    type: number
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Idade do Garantidor"
    description: "Indica a idade do garantidor"
    sql: ${TABLE}."FIA_IDADE" ;;
  }

  dimension: cpf_fiador {
    type: number
    group_label: "Dados da Família e Garantidor"
    label: "CPF do Garantidor"
    description: "Indica o CPF do Garantidor"
    value_format: "0"
    sql: ${TABLE}."CPF_FIADOR" ;;
    required_access_grants: [grupo_cpf]

  }

  dimension: nm_empresa {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Nome da Empresa Devedora"
    description: "Nome da Empresa para qual o aluno deve"
    sql: ${TABLE}."NOME_EMPRESA_COBRANCA" ;;
  }

  dimension: inibido {
    type: number
    group_label: "Dados do Aluno"
    group_item_label: "Aluno Inibido como Devedor"
    description: "Aluno Inibido como Devedor"
    sql: ${TABLE}."INIBIDO" ;;
  }

  dimension: vl_pdd {
    type: number
    group_label: "Dados Financeiros"
    group_item_label: "Valor do PDD"
    description: "Indica o Valor do PDD"
    sql: ${TABLE}."VL_PDD" ;;
    value_format: "#.##"
  }



  dimension: fia_celular {
    type: string
    sql: ${TABLE}."FIA_CELULAR" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Celular do Garantidor"
    description: "Indica o celular do Garantidor"
    required_access_grants: [grupo_telefone]
  }

  dimension: fia_cep {
    type: string
    sql: ${TABLE}."FIA_CEP" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "CEP do Garantidor"
    description: "Indica o CEP do Garantidor"
    required_access_grants: [grupo_endereco]
  }

  dimension: fia_cidade {
    type: string
    sql: ${TABLE}."FIA_CIDADE" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Cidade do Garantidor"
    description: "Indica a cidade do Garantidor"
  }

  dimension: fia_email {
    type: string
    sql: ${TABLE}."FIA_EMAIL" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "E-mail do Garantidor"
    description: "Indica o e-mail do Garantidor"
    required_access_grants: [grupo_email]
  }

  dimension: fia_endereco {
    type: string
    sql: ${TABLE}."FIA_ENDERECO" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Endereço do Garantidor"
    description: "Indica o endereço do Garantidor"
    required_access_grants: [grupo_endereco]
  }

  dimension: fia_escolaridade {
    type: string
    sql: ${TABLE}."FIA_ESCOLARIDADE" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Escolaridade do Garantidor"
    description: "Indica a escolaridade do Garantidor"
  }

  dimension: fia_estado_civil {
    type: string
    sql: ${TABLE}."FIA_ESTADO_CIVIL" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Estado Civil do Garantidor"
    description: "Indica o estado civil do Garantidor"
  }

  dimension: fia_nacionalidade {
    type: string
    sql: ${TABLE}."FIA_NACIONALIDADE" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Nacionalidade do Garantidor"
    description: "Indica a nacionalidade do Garantidor"

  }

  dimension: fia_natureza_ocupacao {
    type: string
    sql: ${TABLE}."FIA_NATUREZA_OCUPACAO" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Natureza da Ocupação do Garantidor"
    description: "Indica a natureza da ocupação do Garantidor"
  }

  dimension: fia_nome {
    type: string
    sql: ${TABLE}."FIA_NOME" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Nome do Garantidor"
    description: "Indica o nome do Garantidor"
    required_access_grants: [grupo_nome]
  }

  dimension: fia_numero_dependentes {
    type: number
    sql: ${TABLE}."FIA_NUMERO_DEPENDENTES" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Número de Dependentes do Garantidor"
    description: "Indica o número de dependentes do Garantidor se houver"
  }

  dimension: fia_profissao {
    type: string
    sql: ${TABLE}."FIA_PROFISSAO" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Profissão do Garantidor"
    description: "Indica a profissão do Garantidor"
  }

  dimension: fia_renda_mensal {
    type: number
    sql: ${TABLE}."FIA_RENDA_MENSAL" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Renda Mensal do Garantidor"
    description: "Indica a renda mensal do Garantidor"
    required_access_grants: [grupo_renda]
  }

  dimension: fia_tempo_empresa {
    type: string
    sql: ${TABLE}."FIA_TEMPO_EMPRESA" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Tempo Empresa - Garantidor"
    description: "Indica há quanto tempo o garantidor trabalha na empresa atual"
  }

  dimension: fia_tipo_residencia {
    type: string
    sql: ${TABLE}."FIA_TIPO_RESIDENCIA" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Tipo da Residência do Garantidor"
    description: "Indica o tipo de residência do Garantidor (ex.: alugada / própria quitada)"
  }

  dimension: fia_uf {
    type: string
    sql: ${TABLE}."FIA_UF" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "UF do Garantidor"
    description: "Indica a UF do Garantidor"
  }

  dimension: mapa_uf_fiador {
    sql: ${TABLE}."FIA_UF" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados da Família e Garantidor"
    group_item_label: "UF - Mapa"
    description: "Indica a UF do Garantidor, pode ser usado em gráficos de mapa"
  }


  dimension: flg_formado {
    type: yesno
    sql: ${TABLE}."FLG_FORMADO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Aluno formado?"
    description: "Indica se o aluno é formando (yes / no)"
  }



  dimension: flg_mae_falecida {
    type: yesno
    sql: ${TABLE}."FLG_MAE_FALECIDA" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Mãe Falecida?"
    description: "Indica se a mãe do aluno é falecida (yes / no)"
  }

  dimension: flg_pai_falecido {
    type: yesno
    sql: ${TABLE}."FLG_PAI_FALECIDO" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Pai Falecido?"
    description: "Indica se o pai do aluno é falecido (yes / no)"
  }

  dimension: id_fia_cpf_atual {
    type: number
    sql: ${TABLE}."ID_FIA_CPF_ATUAL" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "ID do CPF do Garantidor"
    description: "Indica o ID do CPF do Garantidor"
  }

  dimension: renda_fam_mensal {
    type: number
    sql: ${TABLE}."RENDA_FAM_MENSAL" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Renda Mensal da Família"
    description: "Indica a renda mensal da família"
    required_access_grants: [grupo_renda]
  }

  dimension: qtd_semestre_curso {
    type: number
    sql: ${TABLE}."QTD_SEMESTRE_CURSO" ;;
    group_label: "Dados do Curso"
    group_item_label: "Quantidade de Semestres do Curso"
    description: "Indica a quantidade de semestres do curso"
  }

  dimension: area_conhecimento_curso {
    type: string
    sql: ${TABLE}."AREA_CONHECIMENTO_CURSO" ;;
    group_label: "Dados do Curso"
    group_item_label: "Área de Conhecimento"
    description: "Indica a área de conhecimento do curso. Ex: Ciências Exatas e da Terra, Ciências Biológicas, Engenharia / Tecnologia, Ciências da Saúde, entre outras"
  }

  dimension: ds_cal_vet {
    type: string
    sql: ${TABLE}."DS_CAL_VET" ;;
    group_label: "Dados do Curso"
    group_item_label: "Descrição Calouro/Veterano"
    description: "Descreve se o aluno é calouro, veterano ou outros"
  }

  dimension: ds_curso {
    type: string
    sql: ${TABLE}."DS_CURSO" ;;
    group_item_label: "Curso"
    group_label: "Dados do Curso"
    description: "Indica qual o curso do aluno"
  }

  dimension: enfase_curso {
    type: string
    sql: ${TABLE}."ENFASE_CURSO" ;;
    group_label: "Dados do Curso"
    group_item_label: "Ênfase"
    description: "Indica o curso de aprofuncamento se houver"
  }

  dimension: flg_curso_ativo {
    type: yesno
    sql: ${TABLE}."FLG_CURSO_ATIVO" ;;
    group_label: "Dados do Curso"
    group_item_label: "Curso Ativo?"
    description: "Indica se o curso está ativo (Yes/No)"
  }

  dimension: id_curso {
    type: string
    sql: ${TABLE}."ID_CURSO" ;;
    group_label: "Dados do Curso"
    group_item_label: "ID Curso"
    description: "Número de identificação do curso"
  }

  dimension: nivel_curso {
    type: string
    sql: ${TABLE}."NIVEL_CURSO" ;;
    group_label: "Dados do Curso"
    group_item_label: "Nível do Curso"
    description: "Indica o nível do curso (ex.: Técnico, Pós-Graduação)"
  }

  dimension: periodo_curso {
    type: string
    sql: ${TABLE}."PERIODO_CURSO" ;;
    group_label: "Dados do Curso"
    group_item_label: "Período do Curso"
    description: "Indica o período (turno) do curso (ex.: manhã, integral)"
  }

  dimension: qtd_cursos_procurados {
    type: number
    sql: ${TABLE}."QTD_CURSOS_PROCURADOS" ;;
    group_label: "Dados do Curso"
    group_item_label: "Quantidade de Cursos Procurados"
    description: "Indica a quantidade de cursos procurados pelo aluno"
  }

  dimension: qtd_campus_procurados {
    type: number
    sql: ${TABLE}."QTD_CAMPUS_PROCURADOS" ;;
    group_label: "Dados do Curso"
    group_item_label: "Quantidade de Campus Procurados"
    description: "Indica a quantidade de campus procurados pelo aluno"
  }

  dimension: cidade_campus {
    type: string
    group_label: "Dados da Instituição"
    group_item_label: "Cidade - Campus"
    description: "Indica a cidade do campus da instituição de ensino"
    sql: ${TABLE}."CIDADE_CAMPUS" ;;
  }


  dimension: flg_campus_ativo {
    type: yesno
    sql: ${TABLE}."FLG_CAMPUS_ATIVO" ;;
    group_label:  "Dados da Instituição"
    group_item_label: "Campus Ativo?"
    description: "Indica se o campus está ativo (yes/no)"
  }

  dimension: flg_instituicao_ativa {
    type: yesno
    sql: ${TABLE}."FLG_INSTITUICAO_ATIVA" ;;
    group_label:  "Dados da Instituição"
    group_item_label: "IE Ativa?"
    description: "Indica se instituição de ensino está ativa (yes/no)"
  }

  dimension: id_instituicao {
    type: string
    sql: ${TABLE}."ID_INSTITUICAO" ;;
    group_label:  "Dados da Instituição"
    group_item_label: "ID da IE"
    description: "Número de identificação da IE"
  }

  dimension: grupo_instituicao {
    type: string
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
    group_label:  "Dados da Instituição"
    group_item_label: "Grupo da IE"
    description: "Indica a qual grupo a IE pertence"
  }

  dimension: id_grupo_instituicao {
    type: number
    sql: ${TABLE}."ID_GRUPO" ;;
    group_label:  "Dados da Instituição"
    group_item_label: "ID do Grupo da IE"
    description: "Indica a qual é o ID do grupo da IE"
  }

  dimension: id_campus {
    type: string
    sql: ${TABLE}."ID_CAMPUS" ;;
    group_label:  "Dados da Instituição"
    group_item_label: "ID do Campus"
    description: "Número de identificação do campus"
  }

  dimension: cidade_instituicao {
    type: string
    sql: ${TABLE}."CIDADE_INSTITUICAO" ;;
    group_label: "Dados da Instituição"
    description: "Indica a cidade da Instituição de Ensino"
  }

  dimension: ds_campus {
    type: string
    sql: ${TABLE}."DS_CAMPUS" ;;
    group_item_label: "Campus"
    group_label: "Dados da Instituição"
    description: "Indica o campus da IE"
  }

  dimension: ds_instituicao {
    type: string
    sql: ${TABLE}."DS_INSTITUICAO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "Instituição"
    description: "Indica o nome da IE"
  }

  dimension: uf_campus {
    type: string
    sql: ${TABLE}."UF_CAMPUS" ;;
    group_label: "Dados da Instituição"
    group_item_label: "UF Campus"
    description: "Indica UF do campus"
  }


  dimension: mapa_uf_campus {
    sql: ${TABLE}."UF_CAMPUS" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados do Aluno"
    group_item_label: "UF Campus - Mapa"
    description: "Indica a UF do campus, pode ser usado em gráficos de mapa"
  }


  dimension: uf_instituicao {
    type: string
    sql: ${TABLE}."UF_INSTITUICAO" ;;
    group_label: "Dados da Instituição"
    group_item_label: "UF IE"
    description: "Indica UF da IE"
  }

  dimension: mapa_uf_instituicao {
    sql: ${TABLE}."UF_CAMPUS" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados da Instituição"
    group_item_label: "UF IE - Mapa"
    description: "Indica a UF da instituição de ensino, pode ser usado em gráficos de mapa"
  }

  dimension: cargo_atual {
    type: string
    sql: ${TABLE}."CARGO_ATUAL" ;;
    group_label: "Dados Comerciais"
    group_item_label: "Cargo - Atual"
    description: "Indica o cargo atual do responsável comercial na instituição de ensino"
  }

  dimension: gerente_atual {
    type: string
    sql: ${TABLE}."GERENTE_ATUAL" ;;
    group_label: "Dados Comerciais"
    group_item_label: "Gerente Atual"
    description: "Indica gerente atual"
  }

  dimension: representante_atual {
    type: string
    sql: ${TABLE}."REPRESENTANTE_ATUAL" ;;
    group_label: "Dados Comerciais"
    group_item_label: "Representante Atual"
    description: "Indica o representante atual"
  }

  dimension: regional_atual {
    type: string
    sql: ${TABLE}."REGIONAL_ATUAL" ;;
    group_label: "Dados Comerciais"
    group_item_label: "Regional Atual"
    description: "Indica a regional atual"
  }

  dimension: tipo_atual {
    type: string
    sql: ${TABLE}."TIPO_ATUAL" ;;
    group_label: "Dados Comerciais"
    group_item_label: "Tipo de Representante Atual"
    description: "Indica o tipo de representante atual"
  }

  dimension: carteira_atual {
    type: string
    sql: ${TABLE}."CARTEIRA_ATUAL" ;;
    group_label: "Dados Comerciais"
    group_item_label: "Carteira - Atual"
    description: "Indica o tipo de carteira atual do responsável comercial na instituição de ensino"
  }

  dimension: conversao_atual {
    type: string
    sql: ${TABLE}."CONVERSAO_ATUAL" ;;
    group_label: "Dados Comerciais"
    group_item_label: "Conversão - Atual"
    description: "Agente de conversão atribuído ao campus atualmente"
  }

  dimension: cp_atual {
    type: string
    sql: ${TABLE}."CP_ATUAL" ;;
    group_label: "Dados Comerciais"
    group_item_label: "CP - Atual"
    description: "CP do representante atribuído ao campus atualmente"
  }


  dimension: ds_fundo_investimento {
    type: string
    sql: ${TABLE}."DS_FUNDO_INVESTIMENTO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Descrição do Fundo de Investimento"
    description: "Indica o fundo responsável pelo financiamento"

  }

  dimension: flg_aluno_ativo {
    type: yesno
    sql: ${TABLE}."FLG_ALUNO_ATIVO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Aluno ativo?"
    description: "Indica se o aluno está financeiramente ativo (yes/no)"
  }


  dimension: id_proposta_atual {
    type: string
    sql: ${TABLE}."ID_PROPOSTA_ATUAL" ;;
    group_label: "Dados da Proposta"
    group_item_label: "ID da Proposta Atual"
    description: "Número de idenficação da proposta atual"
  }

  dimension: id_propostas_enviadas {
    type: string
    sql: ${TABLE}."ID_PROPOSTAS_ENVIADAS" ;;
    group_label: "Dados da Proposta"
    group_item_label: "ID Propostas Enviadas"
    description: "Número de identificação das propostas"
  }

  dimension: qtd_propostas_enviadas {
    type: number
    sql: ${TABLE}."QTD_PROPOSTAS_ENVIADAS" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Quantidade de Propostas Enviadas"
    description: "Indica a quantidade de propostas enviadas"
  }


  dimension: id_produto {
    type: string
    sql: ${TABLE}."ID_PRODUTO" ;;
    group_label: "Dados do Produto"
    group_item_label: "ID do Produto"
    description: "Número de identificação do produto"
  }

  dimension: flg_produto_ativo {
    type: yesno
    sql: ${TABLE}."FLG_PRODUTO_ATIVO" ;;
    group_label: "Dados do Produto"
    group_item_label: "Produto Ativo?"
    description: "Indica se o produto está ativo (Yes/No)"
  }

  dimension: nm_modalidade_produto {
    type: string
    sql: ${TABLE}."NM_MODALIDADE_PRODUTO" ;;
    group_label: "Dados do Produto"
    group_item_label: "Modalidade do Produto"
    description: "Descrição da modalidade do produto (ex.: FIDC, Compartilhado)"
  }

  dimension: nm_produto {
    type: string
    sql: ${TABLE}."NM_PRODUTO" ;;
    group_label: "Dados do Produto"
    group_item_label: "Descrição do Produto"
    description: "Indica o nome do produto"
  }

  dimension: tipo_produto {
    type: string
    sql: ${TABLE}."TIPO_PRODUTO" ;;
    group_label:  "Dados do Produto"
    group_item_label: "Tipo de Produto"
    description: "Indica o tipo de Produto (ex.: EAD, Emergencial, Core Business)"
  }

  dimension_group: data_matricula {
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
    description: "Indica a data de matricula do aluno no curso"
    sql: ${TABLE}."DATA_MATRICULA" ;;
  }

  dimension_group: data_primeira_cessao {
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
    sql: ${TABLE}."DATA_PRIMEIRA_CESSAO" ;;
    label: "Primeira Cessão"
    description: "Indica a data da primeira cessão do aluno dentro do PRAVALER"
  }

  dimension_group: data_ultima_cessao {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    sql: ${TABLE}."DATA_ULTIMA_CESSAO" ;;
    label: "Última Cessão"
    description: "Indica a data da última cessão (mais recente) do aluno dentro do PRAVALER"
  }

  dimension_group: previsao_formatura {
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
    sql: ${TABLE}."PREVISAO_FORMATURA" ;;
    label: "Previsão de Formatura"
    description: "Indica a data de prevista para formatura do aluno"
  }

  dimension: id_fundo_investimento {
    type: number
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "ID Fundo de Investimento"
    description: "Número de identificação do fundo de investimento"
  }

  dimension: nm_originador {
    type: string
    sql: ${TABLE}."NM_ORIGINADOR" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Originador"
    description: "Indica o banco originador do financiamento"
  }

  dimension: num_da_renovacao {
    type: number
    sql: ${TABLE}."NUM_DA_RENOVACAO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Número da Renovação"
    description: "Indica o número da renovação"
  }

  dimension: qtd_contratos_cedidos {
    type: number
    sql: ${TABLE}."QTD_CONTRATOS_CEDIDOS" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Quantidade de Contratos Cedidos"
    description: "Indica a quantidade de contratos cedidos"
  }

  dimension: qtd_garantidores_diferentes {
    type: number
    sql: ${TABLE}."QTD_GARANTIDORES_DIFERENTES" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Quantidade de Garantidores Diferentes"
    description: "Indica a quantidade de garantidores diferentes"
  }

  dimension: qtd_mensalidade_total {
    type: number
    sql: ${TABLE}."QTD_MENSALIDADE_TOTAL" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Quantidade de Mensalidade"
    description: "Indica a quantidade de mensalidade"
  }

  dimension: qtd_parcelas_semestre {
    type: number
    sql: ${TABLE}."QTD_PARCELAS_SEMESTRE" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Quantidade de Parcelas"
    description: "Indica a quantidade de parcelas"
  }

  dimension: qtd_renovacao {
    type: number
    sql: ${TABLE}."QTD_RENOVACAO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Quantidade de Propostas de Renovação"
    description: "Indica a quantidade de propostas de renovação"
  }

  dimension: safra_cessao_semestre {
    type: string
    sql: ${TABLE}."SAFRA_CESSAO_SEMESTRE" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Safra Cessão Semestre"
    description: "Indica ano e semestre da cessão (ex.:2013S02)"
  }

  dimension: tipo_renovacao {
    type: string
    sql: ${TABLE}."TIPO_RENOVACAO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Tipo de Renovação"
    description: "Indica o tipo de renovação (par/ímpar)"
  }

  dimension: vl_score {
    type: number
    sql: ${TABLE}."VL_SCORE" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Score"
    description: "Indica o Score do aluno"
  }

  dimension: flg_renegociacao {
    type: yesno
    sql: ${TABLE}."FLG_RENEGOCIACAO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Renegociação?"
    description: "Indica se é proposta de renegociação (yes/no)"
  }

  dimension: gh {
    type: string
    sql: ${TABLE}."GH" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Grupo Homogêneo"
    description: "Indica o grupo homogêneo"
  }

  dimension: data_visao_diaria {
    type: date
    sql: ${TABLE}."DT_VISAO_DIARIA" ;;
    group_label: "Dados Financeiros"
    group_item_label: "Data da Visão Diária - PDD "
    description: "Informa a data referente ao calculo diário do pdd do aluno"
  }

  dimension: flg_inadimplente {
    type: yesno
    sql: ${TABLE}."FLG_INADIMPLENTE" ;;
    group_label: "Dados Financeiros"
    group_item_label: "Aluno Inadimplente?"
    description: "Indica se o aluno está inadimplente (yes / no)"
  }

  dimension: vl_boleto {
    type: number
    sql: ${TABLE}."VL_BOLETO" ;;
    group_label: "Dados Financeiros"
    group_item_label: "Valor do Boleto"
    description: "Indica o valor do Boleto"
  }

  dimension: vl_mensalidade_atual {
    type: number
    sql: ${TABLE}."VL_MENSALIDADE_ATUAL" ;;
    group_label: "Dados Financeiros"
    group_item_label: "Valor da Mensalidade Atual"
    description: "Indica o valor da mensalidade atual"
  }

  dimension: vl_presente {
    type: number
    sql: ${TABLE}."VL_PRESENTE" ;;
    group_label: "Dados Financeiros"
    group_item_label: "Valor Presente"
    description: "Indica o valor presente"
    value_format: "#.##"
  }

  dimension: vl_total_financiado {
    type: number
    sql: ${TABLE}."VL_TOTAL_FINANCIADO" ;;
    group_label: "Dados Financeiros"
    group_item_label: "Valor Total do Financiamento"
    description: "Indica o valor total do financiamento"
  }

  dimension: vl_total_financiamento_aluno {
    type: number
    sql: ${TABLE}."VL_TOTAL_FINANCIAMENTO_ALUNO" ;;
    group_label: "Dados Financeiros"
    group_item_label: "Valor Total do Financiamento do Aluno"
    description: "Indica o valor total do financiamento do Aluno"
  }

  dimension: produto_inicial {
    type: string
    sql: ${TABLE}."PRODUTO_INICIAL" ;;
    group_label: "Dados do Produto"
    group_item_label: "Projeto de entrada"
    description: "Indica se o aluno entrou no PRAVALER por meio de algum projeto, como FIES, Compra de carteira, entre outros"
  }


dimension: ultimo_semestre_cedido_renovacao {
  type: number
  group_label: "Dados da Proposta"
  label: "Renovação - Último Semestre Cedido"
  value_format: "0"
  description: "Indica qual o último semestre cedido do aluno de renovação."
  sql: ${TABLE}."ULTIMO_SEMESTRE_CEDIDO_RENOVACAO" ;;


}


  measure: count_id_cpf {
    type: count_distinct
    sql: ${id_cpf} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Valor"
    description: "Contagem de ID CPFs únicos"
  }

  measure: perc_cpf {
    type: percent_of_total
    sql: ${count_id_cpf} ;;
    group_label: "Quantidade de Alunos"
    group_item_label: "Porcentagem"
    description: "Porcentagem do total de ID CPFs únicos"
  }

  measure: avg_idade_aluno {
    type: average
    sql: ${aluno_idade} ;;
    group_label: "Idade"
    group_item_label: "Aluno"
    description: "Média de idade do aluno"
  }

  measure: sum_renda_alu {
    type: sum
    sql: ${renda_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda do Aluno"
    group_item_label: "Soma"
    description: "Soma da renda do aluno"
    required_access_grants: [grupo_renda]
  }

  measure: avg_renda_alu {
    type: average
    sql: ${renda_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda do Aluno"
    group_item_label: "Média"
    description: "Média da renda do aluno"
    required_access_grants: [grupo_renda]
  }

  measure: sum_renda_fia {
    type: sum
    sql: ${fia_renda_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda do Garantidor"
    group_item_label: "Soma"
    description: "Soma da renda do garantidor"
    required_access_grants: [grupo_renda]
  }

  measure: avg_renda_fia {
    type: average
    sql: ${fia_renda_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda do Garantidor"
    group_item_label: "Média"
    description: "Média da renda do garantidor"
    required_access_grants: [grupo_renda]
  }

  measure: sum_renda_fam {
    type: sum
    sql: ${renda_fam_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda Familiar"
    group_item_label: "Soma"
    description: "Soma da renda familiar"
    required_access_grants: [grupo_renda]
  }

  measure: avg_renda_fam {
    type: average
    sql: ${renda_fam_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda Familiar"
    group_item_label: "Média"
    description: "Média da renda familiar"
    required_access_grants: [grupo_renda]
  }


  measure: sum_qtd_mens_fin {
    type: sum
    sql: ${qtd_mensalidade_total} ;;
    value_format: ","
    group_label: "Quantidade de Mensalidade Financiada"
    group_item_label: "Soma"
    description: "Soma da quantidade de mensalidades que foram efetivamente financiadas pelo PRAVALER"
  }

  measure: avg_qtd_mens_fin {
    type: average
    sql: ${qtd_mensalidade_total} ;;
    group_label: "Quantidade de Mensalidade Financiada"
    group_item_label: "Média"
    description: "Média da quantidade de mensalidades que foram efetivamente financiadas pelo PRAVALER"
  }

  measure: sum_valor_fin {
    type: sum
    sql: ${vl_mensalidade_atual} ;;
    value_format: "$ ,"
    group_label: "Valor Financiado"
    group_item_label: "Soma"
    description: "Soma dos valores efetivamente financiados pelo PRAVALER"
  }

  measure: avg_valor_fin {
    type: average
    sql: ${vl_mensalidade_atual} ;;
    value_format: "$ ,"
    group_label: "Valor Financiado"
    group_item_label: "Média"
    description: "Valor médio efetivamente financiado pelo PRAVALER"
  }

  measure: min_valor_fin {
    type: min
    sql: ${vl_mensalidade_atual} ;;
    value_format: "$ ,"
    group_label: "Valor Financiado"
    group_item_label: "Mínimo"
    description: "Valor mínimo efetivamente financiado pelo PRAVALER"
  }

  measure: max_valor_fin {
    type: max
    sql: ${vl_mensalidade_atual} ;;
    value_format: "$ ,"
    group_label: "Valor Financiado"
    group_item_label: "Máximo"
    description: "Valor máximo efetivamente financiado pelo PRAVALER"
  }

  measure: sum_mensalidade {
    type: sum
    sql: ${vl_mensalidade_atual} ;;
    value_format: "$ ,"
    group_label: "Valor Mensalidade"
    group_item_label: "Soma"
    description: "Soma do valor de mensalidade"
  }

  measure: avg_mensalidade {
    type: average
    sql: ${vl_mensalidade_atual} ;;
    value_format: "$ ,"
    group_label: "Valor Mensalidade"
    group_item_label: "Média"
    description: "Valor médio de mensalidade"
  }

  measure: min_mensalidade {
    type: min
    sql: ${vl_mensalidade_atual} ;;
    value_format: "$ ,"
    group_label: "Valor Mensalidade"
    group_item_label: "Mínimo"
    description: "Valor mínimo de mensalidade"
  }

  measure: max_mensalidade {
    type: max
    sql: ${vl_mensalidade_atual} ;;
    value_format: "$ ,"
    group_label: "Valor Mensalidade"
    group_item_label: "Máximo"
    description: "Valor máximo de mensalidade"
  }

  dimension: gh_final {
    type: string
    sql: ${TABLE}."GH_FINAL" ;;
    group_label: "1.4 Acordo Informações"
    group_item_label: "Grupo Homogêneo Final"
    description: "Indica o grupo homogêneo"
  }

  dimension: gh_collection {
    type: string
    sql: ${TABLE}."GH_COLLECTION" ;;
    group_label: "1.4 Acordo Informações"
    group_item_label: "Grupo Homogêneo Collection"
    description: "Indica o grupo homogêneo do modelo de collection"
  }

  dimension: flg_promessa {
    type: yesno
    sql: ${TABLE}."FLG_PROMESSA" ;;
    group_label: "1.4 Acordo Informações"
    group_item_label: "Promessa Ativa?"
    description: "Indica se o aluno possui promessa ativo (Yes/No)"
  }

  dimension_group: data_geracao_collection {
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
    sql: ${TABLE}."DATA_GERACAO_COLLECTION" ;;
    label: "Data Geração Collection"
    description: "Indica a data de geração do collection"
  }


  dimension: ds_ultimo_status {
    type: string
    sql: ${TABLE}."DS_ULTIMO_STATUS" ;;
    group_label: "Dados de Status"
    group_item_label: "Descrição - Último Status do Aluno"
    description: "Indica o nome do último status da proposta mais atual do aluno"
  }


  dimension: ultimo_status {
    type: string
    sql: ${TABLE}."ULTIMO_STATUS" ;;
    group_label: "Dados de Status"
    group_item_label: "Último Status do Aluno"
    description: "Indica o número do último status detalhado da proposta mais atual do aluno"
  }

  dimension_group: data_ultimo_status {
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
    sql: ${TABLE}."DATA_ULTIMO_STATUS" ;;
    label: "Data Último Status"
    description: "Indica a data do último Status do Aluno"
  }






}
