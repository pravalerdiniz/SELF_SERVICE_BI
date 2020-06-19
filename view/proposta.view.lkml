view: proposta {
  sql_table_name: "SELF_SERVICE_BI"."PROPOSTA"
    ;;

  dimension: aluno_cal_vet {
    type: string
    group_label: "Dados do Aluno"
    label: "Calouro/Veterano?"
    description: "Indica se o aluno é calouro ou veterano"
    sql: ${TABLE}."ALUNO_CAL_VET" ;;
  }

  dimension: aluno_celular {
    type: string
    group_label: "Dados do Aluno"
    label: "Celular"
    description: "Indica o número de celular do aluno"
    sql: ${TABLE}."ALUNO_CELULAR" ;;
  }

  dimension: aluno_cidade {
    type: string
    group_label: "Dados do Aluno"
    label: "Cidade"
    description: "Indica a cidade de origem do aluno"
    sql: ${TABLE}."ALUNO_CIDADE" ;;
  }

  dimension: aluno_email {
    type: string
    group_label: "Dados do Aluno"
    label: "E-mail"
    description: "Indica o e-mail do aluno"
    sql: ${TABLE}."ALUNO_EMAIL" ;;
  }

  dimension: aluno_escolaridade {
    type: string
    group_label: "Dados do Aluno"
    label: "Nível de Escolaridade"
    description: "Indica o nível de escolaridade do aluno"
    sql: ${TABLE}."ALUNO_ESCOLARIDADE" ;;
  }

  dimension: aluno_genero {
    type: string
    group_label: "Dados do Aluno"
    label: "Gênero"
    description: "Indica o sexo do aluno"
    sql: ${TABLE}."ALUNO_GENERO" ;;
  }

  dimension: aluno_idade {
    type: number
    group_label: "Dados do Aluno"
    label: "Idade"
    description: "Indica a idade do aluno"
    value_format_name: id
    sql: ${TABLE}."ALUNO_IDADE" ;;
  }

  dimension: aluno_nome {
    type: string
    group_label: "Dados do Aluno"
    label: "Nome"
    description: "Indica o nome do aluno"
    sql: ${TABLE}."ALUNO_NOME" ;;
  }

  dimension: aluno_renda {
    type: number
    group_label: "Dados do Aluno"
    value_format: "$ #,##0.00"
    label: "Renda"
    description: "Indica o valor de renda do aluno"
    sql: ${TABLE}."ALUNO_RENDA" ;;
  }

  dimension: aluno_uf {
    type: string
    group_label: "Dados do Aluno"
    label: "UF"
    description: "Indica a UF de origem do aluno"
    sql: ${TABLE}."ALUNO_UF" ;;
  }

  dimension: area_conhecimento_curso {
    type: string
    group_label: "Dados do Curso"
    label: "Área de Conhecimento"
    description: "Indica a área de conhecimento do curso. Ex: Ciências Exatas e da Terra, Ciências Biológicas, Engenharia / Tecnologia, Ciências da Saúde, entre outras"
    sql: ${TABLE}."AREA_CONHECIMENTO_CURSO" ;;
  }

  dimension: campanha_acesso {
    type: string
    group_label: "Dados de Marketing"
    label: "Acesso - Campanha"
    description: "Indica qual a campanha de acesso do aluno para preenchimento da proposta. EX: Orgânico, Paid Social, Core Business."
    sql: ${TABLE}."CAMPANHA_ACESSO" ;;
  }

  dimension: canal_acesso {
    type: string
    group_label: "Dados de Marketing"
    label: "Acesso - Canal"
    description: "Indica qual o canal online de acesso do aluno para preenchimento da proposta. EX: Orgânico, Facebook, Google, Facebook/Instagram, Faculdade."
    sql: ${TABLE}."CANAL_ACESSO" ;;
  }

  dimension: carencia {
    type: number
    group_label: "Dados do Contrato"
    label: "Dias de Carência"
    description: "Indica o número em dias da carência do contrato do aluno"
    sql: ${TABLE}."CARENCIA" ;;
  }

  dimension: cargo_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Cargo - Atual"
    description: "Indica o cargo atual do responsável comercial na instituição de ensino"
    sql: ${TABLE}."CARGO_ATUAL" ;;
  }

  dimension: cargo_original {
    type: string
    group_label: "Dados da Regional"
    label: "Cargo - Original"
    description: "Indica o cargo original do responsável comercial na instituição de ensino"
    sql: ${TABLE}."CARGO_ORIGINAL" ;;
  }

  dimension: carteira_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Carteira - Atual"
    description: "Indica o tipo de carteira atual do responsável comercial na instituição de ensino"
    sql: ${TABLE}."CARTEIRA_ATUAL" ;;
  }

  dimension: carteira_original {
    type: string
    group_label: "Dados da Regional"
    label: "Carteira - Original"
    description: "Indica o tipo de carteira original do responsável comercial na instituição de ensino"
    sql: ${TABLE}."CARTEIRA_ORIGINAL" ;;
  }

  dimension: cet_aa {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor - CET_AA"
    value_format: "$ #,##0.00"
    description: "Indica o valor do Custo Efetivo Total ao ano do contrato."
    sql: ${TABLE}."CET_AA" ;;
  }

  dimension: cet_am {
    type: number
    group_label: "Dados do Contrato"
    label: "Valor - CET_AM"
    value_format: "$ #,##0.00"
    description: "Indica o valor do Custo Efetivo Total ao mês do contrato."
    sql: ${TABLE}."CET_AM" ;;
  }

  dimension: cidade_campus {
    type: string
    group_label: "Dados do Campus"
    label: "Cidade"
    description: "Indica a cidade correspondente ao campus do aluno."
    sql: ${TABLE}."CIDADE_CAMPUS" ;;
  }

  dimension: cidade_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "Cidade"
    description: "Indica a cidade correspondente à instituição do aluno."
    sql: ${TABLE}."CIDADE_INSTITUICAO" ;;
  }

  dimension: contrato_versao {
    type: number
    group_label: "Dados do Contrato"
    label: "Versão do Contrato"
    description: "Indica o número da versão do contrato."
    sql: ${TABLE}."CONTRATO_VERSAO" ;;
  }

  dimension: conversao_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Nome - Conversão Atual"
    description: "Indica o nome do representante comercial responsável pela conversão atual na instituição de ensino"
    sql: ${TABLE}."CONVERSAO_ATUAL" ;;
  }

  dimension: conversao_original {
    type: string
    group_label: "Dados da Regional"
    label: "Nome - Conversão Original"
    description: "Indica o nome do representante comercial responsável pela conversão original na instituição de ensino"
    sql: ${TABLE}."CONVERSAO_ORIGINAL" ;;
  }

  dimension: cp_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Código do Promotor - Atual"
    description: "Indica o código do promotor atual na instituição de ensino."
    sql: ${TABLE}."CP_ATUAL" ;;
  }

  dimension: cp_original {
    type: string
    group_label: "Dados da Regional"
    label: "Código do Promotor - Original"
    description: "Indica o código do promotor original na instituição de ensino."
    sql: ${TABLE}."CP_ORIGINAL" ;;
  }

  dimension: custo_cessao {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor - Custo da Cessão"
    value_format: "$ #,##0.00"
    description: "Indica o valor de aquisição do contrato na cessão."
    sql: ${TABLE}."CUSTO_CESSAO" ;;
  }

  dimension: custo_originacao {
    type: number
    group_label: "Dados da Cessão"
    label: "Valor - Custo da Original"
    value_format: "$ #,##0.00"
    description: "Indica o valor de originação quando o fundo de investimento é BV (Banco Votorantim)."
    sql: ${TABLE}."CUSTO_ORIGINACAO" ;;
  }

  dimension_group: data_concessao {
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
    group_label: "Dados do Contrato"
    label: "Data de Concessão"
    description: "Indica a data de concessão do contrato"
    sql: ${TABLE}."DATA_CONCESSAO" ;;
  }

  dimension_group: data_fechamento_proposta {
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
    group_label: "Dados do Contrato"
    label: "Data de Concessão"
    description: "Indica a data de concessão do contrato"
    sql: ${TABLE}."DATA_FECHAMENTO_PROPOSTA" ;;
  }

  dimension_group: data_preenchimento {
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
    group_label: "Dados da Proposta"
    label: "Data de Preenchimeno"
    description: "Indica a data de preenchimento da proposta"
    sql: ${TABLE}."DATA_PREENCHIMENTO" ;;
  }

  dimension_group: data_pri_vecto {
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
    group_label: "Dados do Contrato"
    label: "Data do Primeiro Vencimento"
    description: "Indica a data do vencimento do primeiro boleto do contrato"
    sql: ${TABLE}."DATA_PRI_VECTO" ;;
  }

  dimension_group: data_ult_vecto {
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
    group_label: "Dados do Contrato"
    label: "Data do Último Vencimento"
    description: "Indica a data do vencimento do último boleto do contrato"
    sql: ${TABLE}."DATA_ULT_VECTO" ;;
  }

  dimension_group: data_validade {
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
    group_label: "Dados do Contrato"
    label: "Data de Validade"
    description: "Indica a data máxima que o contrato pode ser aproveitado pela cessão"
    sql: ${TABLE}."DATA_VALIDADE" ;;
  }

  dimension: digito_verificador {
    type: number
    group_label: "Dados do Contrato"
    label: "Digito Verificador"
    description: "Indica o número do digito verificado do contrato"
    sql: ${TABLE}."DIGITO_VERIFICADOR" ;;
  }

  dimension: docs_entregues {
    type: string
    group_label: "Dados da Formalização"
    label: "Documentos Entregues"
    description: "Indica todos os documentos entregues para formalização"
    sql: ${TABLE}."DOCS_ENTREGUES" ;;
  }

  dimension: docs_pendentes {
    type: string
    group_label: "Dados da Formalização"
    label: "Documentos Pendentes"
    description: "Indica todos os documentos pendentes para formalização"
    sql: ${TABLE}."DOCS_PENDENTES" ;;
  }

  dimension: ds_aluno_trabalha {
    type: string
    group_label: "Dados do Aluno"
    label: "Vínculo Empregatício"
    description: "Indica qual o vinculo empregáticio do aluno. Ex: Trabalha, Desempregado, Desempregado com renda."
    sql: ${TABLE}."DS_ALUNO_TRABALHA" ;;
  }

  dimension: ds_campus {
    type: string
    group_label: "Dados do Campus"
    label: "Nome do Campus"
    description: "Indica o nome do campus da instituição de ensino"
    sql: ${TABLE}."DS_CAMPUS" ;;
  }

  dimension: ds_como_soube {
    type: string
    group_label: "Dados de Marketing"
    label: "Como Soube"
    description: "Indica por qual canal de comunicação que o aluno conheceu o PRAVALER."
    sql: ${TABLE}."DS_COMO_SOUBE" ;;
  }

  dimension: ds_como_soube_complemento {
    type: string
    group_label: "Dados de Marketing"
    label: "Como Soube - Complemento"
    description: "Indica campo aberto preenchido pelo aluno na proposta complementando como ele conheceu o PRAVALER."
    sql: ${TABLE}."DS_COMO_SOUBE_COMPLEMENTO" ;;
  }

  dimension: ds_curso {
    type: string
    group_label: "Dados do Curso"
    label: "Nome do Curso"
    description: "Indica o nome do curso escolhido pelo aluno na proposta"
    sql: ${TABLE}."DS_CURSO" ;;
  }

  dimension: ds_fia_trabalha {
    type: string
    group_label: "Dados do Fiador"
    label: "Vínculo Empregatício"
    description: "Indica o nome do curso escolhido pelo aluno na proposta"
    sql: ${TABLE}."DS_FIA_TRABALHA" ;;
  }

  dimension: ds_fundo_investimento {
    type: string
    group_label: "Dados do Fundo de Investimento"
    label: "Nome do Fundo de Investimento"
    description: "Indica o nome do fundo de investimento responsável."
    sql: ${TABLE}."DS_FUNDO_INVESTIMENTO" ;;
  }

  dimension: ds_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "Nome da Instituição"
    description: "Indica o nome da instituição de ensino do aluno."
    sql: ${TABLE}."DS_INSTITUICAO" ;;
  }

  dimension: ds_matriculado {
    type: string
    group_label: "Dados do Aluno"
    label: "Matriculado?"
    description: "Indica se o aluno está matriculado."
    sql: ${TABLE}."DS_MATRICULADO" ;;
  }

  dimension: ds_ult_status {
    type: string
    group_label: "Jornada"
    label: "Último Status"
    description: "Indica a última alteração de status que a proposta teve."
    sql: ${TABLE}."DS_ULT_STATUS" ;;
  }

  dimension: ds_url {
    type: string
    group_label: "Dados de Marketing"
    label: "URL"
    description: "Indica o canal de URL associada ao primeiro acesso do aluno no site do PRAVALER."
    sql: ${TABLE}."DS_URL" ;;
  }

  dimension: enfase_curso {
    type: string
    group_label: "Dados do Curso"
    label: "Ênfase do Curso"
    description: "Indica o canal de URL associada ao primeiro acesso do aluno no site do PRAVALER."
    sql: ${TABLE}."ENFASE_CURSO" ;;
  }

  dimension: etapa_clicksign {
    type: number
    group_label: "Dados do Contrato"
    label: "Etapa Clicksign"
    description: "Identificador da etapa de processamento da clicksign"
    sql: ${TABLE}."ETAPA_CLICKSIGN" ;;
  }

  dimension: etapa_processamento {
    type: number
    group_label: "Dados do Contrato"
    label: "Etapa de Processamento"
    description: "Indica o número da etapa de processamento do contrato."
    sql: ${TABLE}."ETAPA_PROCESSAMENTO" ;;
  }

  dimension: fia_celular {
    type: string
    group_label: "Dados do Fiador"
    label: "Celular"
    description: "Indica o número do celular do fiador do aluno."
    sql: ${TABLE}."FIA_CELULAR" ;;
  }

  dimension: fia_cidade {
    type: string
    group_label: "Dados do Fiador"
    label: "Cidade"
    description: "Indica a cidade de origem do fiador do aluno."
    sql: ${TABLE}."FIA_CIDADE" ;;
  }

  dimension: fia_email {
    type: string
    group_label: "Dados do Fiador"
    label: "E-mail"
    description: "Indica o e-mail do fiador do aluno."
    sql: ${TABLE}."FIA_EMAIL" ;;
  }

  dimension: fia_escolaridade {
    type: string
    group_label: "Dados do Fiador"
    label: "Escolaridade"
    description: "Indica a escolaridade do fiador do aluno."
    sql: ${TABLE}."FIA_ESCOLARIDADE" ;;
  }

  dimension: fia_genero {
    type: string
    group_label: "Dados do Fiador"
    label: "Gênero"
    description: "Indica o sexo do fiador do aluno."
    sql: ${TABLE}."FIA_GENERO" ;;
  }

  dimension: fia_idade {
    type: number
    group_label: "Dados do Fiador"
    label: "Idade"
    description: "Indica a idade do fiador do aluno."
    value_format_name: id
    sql: ${TABLE}."FIA_IDADE" ;;
  }

  dimension: fia_nome {
    type: string
    group_label: "Dados do Fiador"
    label: "Nome"
    description: "Indica o nome do fiador do aluno."
    sql: ${TABLE}."FIA_NOME" ;;
  }

  dimension: fia_renda {
    type: number
    group_label: "Dados do Fiador"
    label: "Renda"
    value_format: "$ #,##0.00"
    description: "Indica o valor da renda do fiador do aluno."
    sql: ${TABLE}."FIA_RENDA" ;;
  }

  dimension: fia_uf {
    type: string
    group_label: "Dados do Fiador"
    label: "UF"
    sql: ${TABLE}."FIA_UF" ;;
  }

  dimension: flg_aceita_termo {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Etapa Clicksign - Aceita Termo?"
    description: "Indica se o aluno aceitou o termo de contração digital"
    sql: ${TABLE}."FLG_ACEITA_TERMO" ;;
  }

  dimension: flg_aceita_termo_garantidor {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Etapa Clicksign - Aceita Termo Garantidor?"
    description: "Indica se o garantidor aceitou o termo de contração digital"
    sql: ${TABLE}."FLG_ACEITA_TERMO_GARANTIDOR" ;;
  }

  dimension: flg_aluno_assinou {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Assinou Contrato?"
    description: "Indica se o aluno assinou contrato com PRAVALER"
    sql: ${TABLE}."FLG_ALUNO_ASSINOU" ;;
  }

  dimension: flg_boleto_atrasado {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Assinou Contrato?"
    description: "Indica se o aluno assinou contrato com PRAVALER"
    sql: ${TABLE}."FLG_BOLETO_ATRASADO" ;;
  }

  dimension: flg_campus_ativo {
    type: yesno
    group_label: "Dados do Campus"
    label: "Ativo?"
    description: "Indica se o campus está ativo no sistema do PRAVALER"
    sql: ${TABLE}."FLG_CAMPUS_ATIVO" ;;
  }

  dimension: flg_contrato_ativo {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Ativo?"
    description: "Indica se o contrato do aluno está ativo"
    sql: ${TABLE}."FLG_CONTRATO_ATIVO" ;;
  }

  dimension: flg_contrato_cedido {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Cedido?"
    description: "Indica se o contrato do aluno está cedido"
    sql: ${TABLE}."FLG_CONTRATO_CEDIDO" ;;
  }

  dimension: flg_contrato_gerado {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Gerado?"
    description: "Indica se o contrato do aluno foi gerado"
    sql: ${TABLE}."FLG_CONTRATO_GERADO" ;;
  }

  dimension: flg_contrato_ies_ativo {
    type: yesno
    group_label: "Dados da Instituição"
    label: "Ativo?"
    description: "Indica se o contrato do instituição com o PRAVALER está ativo"
    sql: ${TABLE}."FLG_CONTRATO_IES_ATIVO" ;;
  }

  dimension: flg_contrato_regerado {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Regerado?"
    description: "Indica se o contrato do aluno foi regerado."
    sql: ${TABLE}."FLG_CONTRATO_REGERADO" ;;
  }

  dimension: flg_contrato_unico {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Único?"
    description: "Indica se o contrato do aluno é único."
    sql: ${TABLE}."FLG_CONTRATO_UNICO" ;;
  }

  dimension: flg_curso_ativo {
    type: yesno
    group_label: "Dados do Curso"
    label: "Ativo?"
    description: "Indica se o curso está ativo no sistema do PRAVALER."
    sql: ${TABLE}."FLG_CURSO_ATIVO" ;;
  }

  dimension: flg_fia_assinou {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Assinou Contrato - Fiador?"
    description: "Indica se o fiador assinou o contrato."
    sql: ${TABLE}."FLG_FIA_ASSINOU" ;;
  }

  dimension: flg_financia_matricula_rnv {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Financiou Matricula?"
    description: "Indica se o aluno financiou a primeira matricula."
    sql: ${TABLE}."FLG_FINANCIA_MATRICULA_RNV" ;;
  }

  dimension: flg_instituicao_ativa {
    type: yesno
    group_label: "Dados do Instituição"
    label: "Ativa?"
    description: "Indica se a instituição está ativa no PRAVALER."
    sql: ${TABLE}."FLG_INSTITUICAO_ATIVA" ;;
  }

  dimension: flg_ipca_ies {
    type: yesno
    group_label: "Dados do Instituição"
    label: "IPCA?"
    description: "Indica se a instituição possui IPCA no contrato com o PRAVALER."
    sql: ${TABLE}."FLG_IPCA_IES" ;;
  }

  dimension: flg_produto_ativo {
    type: yesno
    group_label: "Dados do Produto"
    label: "Ativo?"
    description: "Indica se o produto está ativo no PRAVALER."
    sql: ${TABLE}."FLG_PRODUTO_ATIVO" ;;
  }

  dimension: flg_proposta_ativa {
    type: yesno
    group_label: "Dados da Proposta"
    label: "Ativo?"
    description: "Indica se a proposta está ativa no PRAVALER."
    sql: ${TABLE}."FLG_PROPOSTA_ATIVA" ;;
  }

  dimension: flg_testemunhas_assinaram {
    type: yesno
    group_label: "Dados do Contrato"
    label: "Assinou Contrato - Testemunhas?"
    description: "Indica se as testemunhas assinaram o contrato."
    sql: ${TABLE}."FLG_TESTEMUNHAS_ASSINARAM" ;;
  }

  dimension: flg_wo_ies {
    type: yesno
    group_label: "Dados do Instituição"
    label: "Entrou WriteOff?"
    description: "Indica se a instituição entrou no W.O."
    sql: ${TABLE}."FLG_WO_IES" ;;
  }

  dimension: gerente_atual {
    type: string
    group_label: "Dados da Regional"
    label: "Gerente - Atual"
    description: "Indica o nome do gerente comercial atual responsável pela regional."
    sql: ${TABLE}."GERENTE_ATUAL" ;;
  }

  dimension: gerente_original {
    type: string
    group_label: "Dados da Regional"
    label: "Gerente - Original"
    description: "Indica o nome do gerente comercial original responsável pela regional."
    sql: ${TABLE}."GERENTE_ORIGINAL" ;;
  }

  dimension: gh {
    type: string
    group_label: "Dados do Aluno"
    label: "GH "
    description: "Indica qual GH o aluno está de acordo com a classificação de score do aluno."
    sql: ${TABLE}."GH" ;;
  }

  dimension: grupo_instituicao {
    type: string
    group_label: "Dados da Instituição"
    label: "Grupo"
    description: "Indica o nome do grupo da instituição."
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
  }

  dimension: id_campus {
    type: number
    group_label: "Dados do Campus"
    label: "ID Campus"
    description: "Indica o ID do campus."
    sql: ${TABLE}."ID_CAMPUS" ;;
  }

  dimension: id_consultor_finalizou {
    type: string
    sql: ${TABLE}."ID_CONSULTOR_FINALIZOU" ;;
  }

  dimension: id_contrato_conjunto {
    type: number
    sql: ${TABLE}."ID_CONTRATO_CONJUNTO" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: id_curso {
    type: number
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_elegivel {
    type: number
    sql: ${TABLE}."ID_ELEGIVEL" ;;
  }

  dimension: id_fia_cpf {
    type: number
    sql: ${TABLE}."ID_FIA_CPF" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: id_ies_contrato {
    type: number
    sql: ${TABLE}."ID_IES_CONTRATO" ;;
  }

  dimension: id_instituicao {
    type: number
    sql: ${TABLE}."ID_INSTITUICAO" ;;
  }

  dimension: id_originadores_ativos_ies {
    type: string
    sql: ${TABLE}."ID_ORIGINADORES_ATIVOS_IES" ;;
  }

  dimension: id_produto {
    type: number
    sql: ${TABLE}."ID_PRODUTO" ;;
  }

  dimension: id_produtos_aprovados {
    type: string
    sql: ${TABLE}."ID_PRODUTOS_APROVADOS" ;;
  }

  dimension: id_proposta {
    type: number
    sql: ${TABLE}."ID_PROPOSTA" ;;
  }

  dimension: id_status_detalhado {
    type: string
    sql: ${TABLE}."ID_STATUS_DETALHADO" ;;
  }

  dimension: id_status_geral {
    type: string
    sql: ${TABLE}."ID_STATUS_GERAL" ;;
  }

  dimension: id_usuario_finalizou {
    type: string
    sql: ${TABLE}."ID_USUARIO_FINALIZOU" ;;
  }

  dimension: link_assinatura_aluno {
    type: string
    sql: ${TABLE}."LINK_ASSINATURA_ALUNO" ;;
  }

  dimension: link_assinatura_garantidor {
    type: string
    sql: ${TABLE}."LINK_ASSINATURA_GARANTIDOR" ;;
  }

  dimension: max_boleto_atrasado {
    type: number
    sql: ${TABLE}."MAX_BOLETO_ATRASADO" ;;
  }

  dimension: midia_acesso {
    type: string
    sql: ${TABLE}."MIDIA_ACESSO" ;;
  }

  dimension: nivel_curso {
    type: string
    sql: ${TABLE}."NIVEL_CURSO" ;;
  }

  dimension: nm_modalidade_produto {
    type: string
    sql: ${TABLE}."NM_MODALIDADE_PRODUTO" ;;
  }

  dimension: nm_originador {
    type: string
    sql: ${TABLE}."NM_ORIGINADOR" ;;
  }

  dimension: nm_produto {
    type: string
    sql: ${TABLE}."NM_PRODUTO" ;;
  }

  dimension: num_da_renovacao {
    type: number
    sql: ${TABLE}."NUM_DA_RENOVACAO" ;;
  }

  dimension: perc_comissao {
    type: number
    sql: ${TABLE}."PERC_COMISSAO" ;;
  }

  dimension: perc_desagio {
    type: number
    sql: ${TABLE}."PERC_DESAGIO" ;;
  }

  dimension: perc_tx_subsidiado_ies {
    type: number
    sql: ${TABLE}."PERC_TX_SUBSIDIADO_IES" ;;
  }

  dimension: periodo_curso {
    type: string
    sql: ${TABLE}."PERIODO_CURSO" ;;
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

  dimension: qtd_contratos_anteriores {
    type: number
    sql: ${TABLE}."QTD_CONTRATOS_ANTERIORES" ;;
  }

  dimension: qtd_docs_pendentes {
    type: number
    sql: ${TABLE}."QTD_DOCS_PENDENTES" ;;
  }

  dimension: qtd_men_corrente {
    type: number
    sql: ${TABLE}."QTD_MEN_CORRENTE" ;;
  }

  dimension: qtd_mensalidades {
    type: number
    sql: ${TABLE}."QTD_MENSALIDADES" ;;
  }

  dimension: qtd_prestacoes {
    type: number
    sql: ${TABLE}."QTD_PRESTACOES" ;;
  }

  dimension: qtd_semestre_curso {
    type: number
    sql: ${TABLE}."QTD_SEMESTRE_CURSO" ;;
  }

  dimension: receita_corban {
    type: number
    sql: ${TABLE}."RECEITA_CORBAN" ;;
  }

  dimension: regional_atual {
    type: string
    sql: ${TABLE}."REGIONAL_ATUAL" ;;
  }

  dimension: regional_original {
    type: string
    sql: ${TABLE}."REGIONAL_ORIGINAL" ;;
  }

  dimension: release_contrato {
    type: number
    sql: ${TABLE}."RELEASE_CONTRATO" ;;
  }

  dimension: renda_familiar {
    type: number
    sql: ${TABLE}."RENDA_FAMILIAR" ;;
  }

  dimension: representante_atual {
    type: string
    sql: ${TABLE}."REPRESENTANTE_ATUAL" ;;
  }

  dimension: representante_original {
    type: string
    sql: ${TABLE}."REPRESENTANTE_ORIGINAL" ;;
  }

  dimension: semestre_cursando {
    type: number
    sql: ${TABLE}."SEMESTRE_CURSANDO" ;;
  }

  dimension: semestre_financiado {
    type: string
    sql: ${TABLE}."SEMESTRE_FINANCIADO" ;;
  }

  dimension: ticket_medio {
    type: number
    sql: ${TABLE}."TICKET_MEDIO" ;;
  }

  dimension: tipo_atual {
    type: string
    sql: ${TABLE}."TIPO_ATUAL" ;;
  }

  dimension: tipo_original {
    type: string
    sql: ${TABLE}."TIPO_ORIGINAL" ;;
  }

  dimension: tipo_produto {
    type: string
    sql: ${TABLE}."TIPO_PRODUTO" ;;
  }

  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
  }

  dimension: tipo_renovacao {
    type: string
    sql: ${TABLE}."TIPO_RENOVACAO" ;;
  }

  dimension: tx_anual_total {
    type: number
    sql: ${TABLE}."TX_ANUAL_TOTAL" ;;
  }

  dimension: tx_mensal_aluno {
    type: number
    sql: ${TABLE}."TX_MENSAL_ALUNO" ;;
  }

  dimension: tx_mensal_total {
    type: number
    sql: ${TABLE}."TX_MENSAL_TOTAL" ;;
  }

  dimension: uf_campus {
    type: string
    sql: ${TABLE}."UF_CAMPUS" ;;
  }

  dimension: uf_instituicao {
    type: string
    sql: ${TABLE}."UF_INSTITUICAO" ;;
  }

  dimension: vl_comissao_ideal {
    type: number
    value_format_name: id
    sql: ${TABLE}."VL_COMISSAO_IDEAL" ;;
  }

  dimension: vl_dias_wo_ies {
    type: number
    sql: ${TABLE}."VL_DIAS_WO_IES" ;;
  }

  dimension: vl_financiado {
    type: number
    sql: ${TABLE}."VL_FINANCIADO" ;;
  }

  dimension: vl_financiamento {
    type: number
    sql: ${TABLE}."VL_FINANCIAMENTO" ;;
  }

  dimension: vl_financiamento_aluno {
    type: number
    sql: ${TABLE}."VL_FINANCIAMENTO_ALUNO" ;;
  }

  dimension: vl_iof {
    type: number
    sql: ${TABLE}."VL_IOF" ;;
  }

  dimension: vl_men_corrente {
    type: number
    sql: ${TABLE}."VL_MEN_CORRENTE" ;;
  }

  dimension: vl_mensalidade {
    type: number
    sql: ${TABLE}."VL_MENSALIDADE" ;;
  }

  dimension: vl_parcela {
    type: number
    sql: ${TABLE}."VL_PARCELA" ;;
  }

  dimension: vl_prestacoes {
    type: number
    sql: ${TABLE}."VL_PRESTACOES" ;;
  }

  dimension: vl_principal {
    type: number
    sql: ${TABLE}."VL_PRINCIPAL" ;;
  }

  dimension: vl_rematricula {
    type: number
    sql: ${TABLE}."VL_REMATRICULA" ;;
  }

  dimension: vl_repasse_ies {
    type: number
    sql: ${TABLE}."VL_REPASSE_IES" ;;
  }

  dimension: vl_score {
    type: number
    sql: ${TABLE}."VL_SCORE" ;;
  }

  dimension: vl_subsidiado {
    type: number
    sql: ${TABLE}."VL_SUBSIDIADO" ;;
  }

  dimension: vl_tarifa_cadastro {
    type: number
    sql: ${TABLE}."VL_TARIFA_CADASTRO" ;;
  }

  dimension: vl_tarifa_parcela {
    type: number
    sql: ${TABLE}."VL_TARIFA_PARCELA" ;;
  }

  dimension: vl_total_financiado_bv {
    type: number
    sql: ${TABLE}."VL_TOTAL_FINANCIADO_BV" ;;
  }

  dimension: vl_ult_status {
    type: string
    sql: ${TABLE}."VL_ULT_STATUS" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
