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
    group_item_label: "Idade"
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
    group_item_label: "Nome"
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
    group_item_label: "Celular"
    description: "Indica o número do celular do aluno"
    sql: ${TABLE}."CELULAR" ;;
    required_access_grants: [grupo_telefone]
  }

  dimension: cep {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "CEP"
    description: "Indica o número do CEP correspondente ao endereço do aluno"
    sql: ${TABLE}."CEP" ;;
    required_access_grants: [grupo_endereco]
  }

  dimension: cidade {
    type: string
    group_label: "Dados do Aluno"
    group_item_label: "Cidade"
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
    group_item_label: "E-mail"
    description: "Indica o e-mail do aluno"
    suggestable: no
  }

  dimension: endereco {
    type: string
    sql: ${TABLE}."ENDERECO" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Endereço"
    description: "Indica o e-endereço do aluno"
    required_access_grants: [grupo_endereco]
  }

  dimension: renda_mensal {
    type: number
    sql: ${TABLE}."RENDA_MENSAL" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Renda Mensal"
    description: "Indica a renda mensal do aluno"
  }

  dimension: tipo_residencia {
    type: string
    sql: ${TABLE}."TIPO_RESIDENCIA" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Tipo de Residência"
    description: "Indica o tipo do residência do aluno (ex.: alugada, própria financiada, etc)"
  }

  dimension: numero_dependentes {
    type: number
    sql: ${TABLE}."NUMERO_DEPENDENTES" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Número de dependentes"
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
    group_item_label: "Estado Civil"
    description: "Indica o estado civil do aluno"
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    group_label: "Dados do Aluno"
    group_item_label: "ID do CPF"
    primary_key: yes
    description: "Indica o ID do CPF do Aluno"
  }

  dimension: nacionalidade {
    type: string
    sql: ${TABLE}."NACIONALIDADE" ;;
    group_label: "Dados do Aluno"
    group_item_label: "Nacionalidade"
    description: "Indica a nacionalidade do aluno"
    hidden: yes
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
    group_item_label: "Profissão"
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
    group_item_label: "UF"
    description: "Indica a UF do aluno"
  }

  dimension: mapa_uf_aluno {
    sql: ${TABLE}."UF" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados do Aluno"
    group_item_label: "UF - Mapa"
    description: "Indica a UF do aluno, pode ser usado em gráficos de mapa"
  }



  dimension: fia_bairro {
    type: string
    sql: ${TABLE}."FIA_BAIRRO" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Bairro do Fiador"
    description: "Indica o bairro do fiador"
  }

  dimension: fia_celular {
    type: string
    sql: ${TABLE}."FIA_CELULAR" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Celular do Fiador"
    description: "Indica o celular do fiador"
    required_access_grants: [grupo_telefone]
  }

  dimension: fia_cep {
    type: string
    sql: ${TABLE}."FIA_CEP" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "CEP do Fiador"
    description: "Indica o CEP do fiador"
    required_access_grants: [grupo_endereco]
  }

  dimension: fia_cidade {
    type: string
    sql: ${TABLE}."FIA_CIDADE" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Cidade do Fiador"
    description: "Indica a cidade do fiador"
  }

  dimension: fia_email {
    type: string
    sql: ${TABLE}."FIA_EMAIL" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "E-mail do Fiador"
    description: "Indica o e-mail do fiador"
  }

  dimension: fia_endereco {
    type: string
    sql: ${TABLE}."FIA_ENDERECO" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Endereço do Fiador"
    description: "Indica o endereço do fiador"
    required_access_grants: [grupo_endereco]
  }

  dimension: fia_escolaridade {
    type: string
    sql: ${TABLE}."FIA_ESCOLARIDADE" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Escolaridade do Fiador"
    description: "Indica a escolaridade do fiador"
  }

  dimension: fia_estado_civil {
    type: string
    sql: ${TABLE}."FIA_ESTADO_CIVIL" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Estado Civil do Fiador"
    description: "Indica o estado civil do fiador"
  }

  dimension: fia_nacionalidade {
    type: string
    sql: ${TABLE}."FIA_NACIONALIDADE" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Nacionalidade do Fiador"
    description: "Indica a nacionalidade do fiador"
    hidden: yes
  }

  dimension: fia_natureza_ocupacao {
    type: string
    sql: ${TABLE}."FIA_NATUREZA_OCUPACAO" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Natureza da Ocupação do Fiador"
    description: "Indica a natureza da ocupação do fiador"
  }

  dimension: fia_nome {
    type: string
    sql: ${TABLE}."FIA_NOME" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Nome do Fiador"
    description: "Indica o nome do fiador"
    required_access_grants: [grupo_nome]
  }

  dimension: fia_numero_dependentes {
    type: number
    sql: ${TABLE}."FIA_NUMERO_DEPENDENTES" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Número de Dependentes do Fiador"
    description: "Indica o número de dependentes do fiador se houver"
  }

  dimension: fia_profissao {
    type: string
    sql: ${TABLE}."FIA_PROFISSAO" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Profissão do Fiador"
    description: "Indica a profissão do fiador"
  }

  dimension: fia_renda_mensal {
    type: number
    sql: ${TABLE}."FIA_RENDA_MENSAL" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Renda Mensal do Fiador"
    description: "Indica a renda mensal do fiador"
  }

  dimension: fia_tempo_empresa {
    type: string
    sql: ${TABLE}."FIA_TEMPO_EMPRESA" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Tempo Empresa - Fiador"
    description: "Indica há quanto tempo o fiador trabalha na empresa atual"
  }

  dimension: fia_tipo_residencia {
    type: string
    sql: ${TABLE}."FIA_TIPO_RESIDENCIA" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Tipo da Residência do Fiador"
    description: "Indica o tipo de residência do fiador (ex.: alugada / própria quitada)"
  }

  dimension: fia_uf {
    type: string
    sql: ${TABLE}."FIA_UF" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "UF do Fiador"
    description: "Indica a UF do fiador"
  }

  dimension: mapa_uf_fiador {
    sql: ${TABLE}."FIA_UF" ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "Dados da Família e Garantidor"
    group_item_label: "UF - Mapa"
    description: "Indica a UF do fiador, pode ser usado em gráficos de mapa"
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
    group_item_label: "ID do CPF do Fiador"
    description: "Indica o ID do CPF do fiador"
  }

  dimension: renda_fam_mensal {
    type: number
    sql: ${TABLE}."RENDA_FAM_MENSAL" ;;
    group_label: "Dados da Família e Garantidor"
    group_item_label: "Renda Mensal da Família"
    description: "Indica a renda mensal da família"
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
    type: number
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
    type: number
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

  dimension: id_campus {
    type: number
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
    group_label: "Dados da Proposta"
    group_item_label: "Proposta Ativa?"
    description: "Indica se a proposta está ativa (yes/no)"
  }


  dimension: id_proposta_atual {
    type: number
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
    type: number
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
  }

  dimension_group: data_ultima_cessao {
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
    sql: ${TABLE}."DATA_ULTIMA_CESSAO" ;;
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
    group_label: "Dados da Proposta"
    group_item_label: "Score"
    description: "Indica o Score do aluno"
  }

  dimension: flg_renegociacao {
    type: yesno
    sql: ${TABLE}."FLG_RENEGOCIACAO" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Renovação?"
    description: "Indica se é proposta de renovação (yes/no)"
  }

  dimension: gh {
    type: string
    sql: ${TABLE}."GH" ;;
    group_label: "Dados da Proposta"
    group_item_label: "Grupo Homogêneo"
    description: "Indica o grupo homogêneo"
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

  measure: count {
    type: count
    drill_fields: [id_cpf]
  }

  measure: count_id_cpf {
    type: count_distinct
    sql: ${id_cpf}cpf} ;;
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
  }

  measure: avg_renda_alu {
    type: average
    sql: ${renda_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda do Aluno"
    group_item_label: "Média"
    description: "Média da renda do aluno"
  }

  measure: sum_renda_fia {
    type: sum
    sql: ${fia_renda_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda do Garantidor"
    group_item_label: "Soma"
    description: "Soma da renda do garantidor"
  }

  measure: avg_renda_fia {
    type: average
    sql: ${fia_renda_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda do Garantidor"
    group_item_label: "Média"
    description: "Média da renda do garantidor"
  }

  measure: sum_renda_fam {
    type: sum
    sql: ${renda_fam_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda Familiar"
    group_item_label: "Soma"
    description: "Soma da renda familiar"
  }

  measure: avg_renda_fam {
    type: average
    sql: ${renda_fam_mensal} ;;
    value_format: "$ ,.00"
    group_label: "Renda Familiar"
    group_item_label: "Média"
    description: "Média da renda familiar"
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


  measure: count_proposta {
    type: count_distinct
    sql: ${id_proposta_atual} ;;
    drill_fields: [id_cpf,id_proposta_atual]
    group_label: "Quantidade de Propostas"
    group_item_label: "Valor"
    description: "Contagem única de propostas"
  }

  measure: perc_proposta {
    type: percent_of_total
    sql: ${count_proposta} ;;
    group_label: "Quantidade de Propostas"
    group_item_label: "Porcentagem"
    description: "Porcentagem do total de propostas únicas"
  }

}
