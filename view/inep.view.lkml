view: inep {
  sql_table_name: "SELF_SERVICE_BI"."INEP"
    ;;

  dimension: ano_censo {
    type: number
    label: "Ano do Censo"
    sql: ${TABLE}."ANO_CENSO" ;;
  }

  dimension: ano_ingresso {
    type: number
    label: "Ano de Ingresso"
    sql: ${TABLE}."ANO_INGRESSO" ;;
  }

  dimension: carga_horaria_curso {
    type: number
    group_label:"Dados do Curso"
    label: "Carga Horária do Curso"
    hidden: yes
    sql: ${TABLE}."CARGA_HORARIA_CURSO" ;;
  }

  dimension: ds_categoria_administrativa {
    type: string
    group_label:"Dados da IES"
    label: "Categoria Administrativa"
    description: "Tipo da Categoria Administrativa da IES. Ex:  Pública Federal,
    Pública Estadual,
    Pública Municipal,
    Privada com fins lucrativos.
    Privada sem fins lucrativos."
    sql: ${TABLE}."DS_CATEGORIA_ADMINISTRATIVA" ;;
  }

  dimension: ds_curso {
    type: string
    group_label:"Dados do Curso"
    label: "Nome do Curso"
    sql: ${TABLE}."DS_CURSO" ;;
  }

  dimension: ds_data_autorizacao_curso {
    type: string
    group_label:"Dados do Curso"
    label: "Data de Autorização"
    hidden: yes
    sql: ${TABLE}."DS_DATA_AUTORIZACAO_CURSO" ;;
  }

  dimension: ds_data_ingresso_curso {
    type: string
    group_label:"Dados do Curso"
    label: "Data de Ingresso do Curso"
    description: "Data de ingresso do aluno no curso correspondente ao 1º semestre (01/01/20XX) e ao 2º semestre (01/07/20XX)"
    sql: ${TABLE}."DS_DATA_INGRESSO_CURSO" ;;
  }

  dimension: ds_data_inicio_func {
    type: string
    group_label:"Dados do Curso"
    label: "Data de Inicio do Funcionamento"
    description: "Data de início de funcionamento do curso"
    sql: ${TABLE}."DS_DATA_INICIO_FUNC" ;;
  }

  dimension: ds_data_nascimento {
    type: string
    group_label:"Dados do Aluno"
    label: "Data de Nascimento"
    sql: ${TABLE}."DS_DATA_NASCIMENTO" ;;
  }

  dimension: ds_escola_ens_medio {
    type: string
    group_label:"Dados do Aluno"
    label: "Escola - Ensino Médio"
    description: "Tipo de escola que o aluno concluiu ensino médio"
    sql: ${TABLE}."DS_ESCOLA_ENS_MEDIO" ;;
  }

  dimension: ds_grau_academico {
    type: string
    group_label:"Dados do Curso"
    label: "Grau Acadêmico"
    description: "Tipo do grau acadêmico conferido ao diplomado pelo curso. Ex: Bacharelado, Licenciatura, Tecnologico."
    sql: ${TABLE}."DS_GRAU_ACADEMICO" ;;
  }

  dimension: ds_ies {
    type: string
    group_label:"Dados da IES"
    label: "Nome da IES"
    sql: ${TABLE}."DS_IES" ;;
  }

  dimension: ds_ies_destino {
    type: string
    group_label:"Dados da IES"
    label: "IES de destino"
    description: "Instituição nacional receptora do aluno em mobilidade acadêmica, na qual seu vinculo é temporário"
    sql: ${TABLE}."DS_IES_DESTINO" ;;
  }

  dimension: ds_mantenedora {
    type: string
    group_label:"Dados da IES"
    label: "Mantenedora"
    sql: ${TABLE}."DS_MANTENEDORA" ;;
  }

  dimension: ds_mob_acad {
    type: string
    group_label:"Dados do Aluno"
    label: "Intercâmbio Acadêmico"
    description: "Tipo de mobilidade acadêmica ao qual o aluno participa.Ex: Nacional, Internacional"
    sql: ${TABLE}."DS_MOB_ACAD" ;;
  }

  dimension: ds_mob_acad_intern {
    type: string
    group_label:"Dados do Aluno"
    description: "Tipo de mobilidade acadêmica internacional ao qual o aluno participa. Ex: Intercâmbio,Ciências sem fronteiras"
    label: "Intercâmbio Acadêmico - Internacional"

    sql: ${TABLE}."DS_MOB_ACAD_INTERN" ;;
  }

  dimension: ds_modalidade_ensino {
    type: string
    group_label:"Dados do Curso"
    label: "Modalidade de Ensino"
    description: "Tipo da modalidade de ensino do curso. Ex: Presencial, Curso a Distância"
    sql: ${TABLE}."DS_MODALIDADE_ENSINO" ;;
  }

  dimension: ds_nacionalidade {
    type: string
    group_label:"Dados do Aluno"
    label: "Nacionalidade"
    sql: ${TABLE}."DS_NACIONALIDADE" ;;
  }

  dimension: ds_nivel_academico {
    type: string
    group_label:"Dados do Curso"
    label: "Nivel Acadêmico"
    description: "Tipo do nível acadêmico do curso. Ex: Graduação, Seqüencial de Formação Específica"
    sql: ${TABLE}."DS_NIVEL_ACADEMICO" ;;
  }

  dimension: ds_organizacao_academica {
    type: string
    group_label:"Dados da IES"
    label: "Organização Acadêmica"
    description: "Tipo da Organização Acadêmica da IES. Ex Universidade, Centro Universitário, Faculdade, Instituto Federal de Educação, Ciência e Tecnologia"
    sql: ${TABLE}."DS_ORGANIZACAO_ACADEMICA" ;;
  }

  dimension: ds_pais {
    type: string
    group_label:"Dados do Aluno"
    label: "País de Nascimento do Aluno"
    sql: ${TABLE}."DS_PAIS" ;;
  }

  dimension: ds_pais_destino {
    type: string
    group_label:"Dados do Aluno"
    label: "País de Destino do Aluno"
    sql: ${TABLE}."DS_PAIS_DESTINO" ;;
  }

  dimension: ds_referente_ies {
    type: string
    group_label:"Dados da IES"
    description: "Ex: Mantenedora, Instituição"
    label: "Tipo - Entidade Financeira"
    sql: ${TABLE}."DS_REFERENTE_IES" ;;
  }

  dimension: ds_semestre_conclusao {
    type: string
    group_label:"Dados do Aluno"
    label: "Semestre de Conclusão do Aluno"
    sql: ${TABLE}."DS_SEMESTRE_CONCLUSAO" ;;
  }

  dimension: ds_semestre_referencia {
    type: string
    group_label:"Dados do Aluno"
    label: "Semestre de Referência"
    sql: ${TABLE}."DS_SEMESTRE_REFERENCIA" ;;
  }

  dimension: ds_sexo {
    type: string
    group_label:"Dados do Aluno"
    label: "Sexo"
    sql: ${TABLE}."DS_SEXO" ;;
  }

  dimension: ds_situacao_curso {
    type: string
    group_label:"Dados do Curso"
    label: "Situação do Curso"
    description: "Tipo da situação de funcionamento do curso"
    sql: ${TABLE}."DS_SITUACAO_CURSO" ;;
  }

  dimension: ds_turno {
    type: string
    group_label:"Dados do Aluno"
    label: "Turno do Aluno"
    description: "Tipo do turno do curso ao qual o aluno está vinculado"
    sql: ${TABLE}."DS_TURNO" ;;
  }

  dimension: flg_apoio_alimentacao {
    type: yesno
    hidden: yes
    group_label: "Apoio"
    label: "Alimentação?"
    description: "Informa se o aluno recebe apoio alimentação"
    sql: ${TABLE}."FLG_APOIO_ALIMENTACAO" ;;
  }

  dimension: flg_apoio_bolsa_permanencia {
    type: yesno
    hidden: yes
    group_label: "Apoio"
    label: "Bolsa de Permanência?"
    description: "Informa se o aluno recebe auxílio financeiro destinado a alunos em situação de vulnerabilidade socioeconômica ou pertencente a grupos étnicos específicos"
    sql: ${TABLE}."FLG_APOIO_BOLSA_PERMANENCIA" ;;
  }

  dimension: flg_apoio_bolsa_trabalho {
    type: yesno
    hidden: yes
    group_label: "Apoio"
    label: "Bolsa de Trabalho?"
    description: "Informa se o aluno recebe remuneração referente a trabalhos prestados nas dependências da IES ou unidades vinculadas"
    sql: ${TABLE}."FLG_APOIO_BOLSA_TRABALHO" ;;
  }

  dimension: flg_apoio_material_didatico {
    type: yesno
    hidden: yes
    group_label: "Apoio"
    label: "Material Didático?"
    sql: ${TABLE}."FLG_APOIO_MATERIAL_DIDATICO" ;;
  }

  dimension: flg_apoio_moradia {
    type: yesno
    hidden: yes
    group_label: "Apoio"
    label: "Moradia?"
    description: "Informa se o aluno recebe apoio moradia. "
    sql: ${TABLE}."FLG_APOIO_MORADIA" ;;
  }

  dimension: flg_apoio_social {
    type: yesno
    hidden: yes
    group_label: "Apoio"
    label: "Apoio Social?"
    description: "Informa se o aluno recebe apoio para transporte até a IES"
    sql: ${TABLE}."FLG_APOIO_SOCIAL" ;;
  }

  dimension: flg_apoio_transporte {
    type: yesno
    hidden: yes
    group_label: "Apoio"
    label: "Transporte?"
    description: "Informa se o aluno recebe apoio para transporte até a IES"
    sql: ${TABLE}."FLG_APOIO_TRANSPORTE" ;;
  }

  dimension: flg_atividade_extracurricular {
    type: yesno
    group_label:"Bolsa"
    label: "Atividade Extracurricular?"
    description: "Informa se o aluno participa de algum tipo de atividade extracurricular (estágio não obrigatório, extensão, monitoria e pesquisa)"
    sql: ${TABLE}."FLG_ATIVIDADE_EXTRACURRICULAR" ;;
  }

  dimension: flg_bolsa_estagio {
    type: yesno
    hidden: yes
    group_label: "Bolsa"
    label: "Estágio?"
    description:"Informa se o aluno recebe bolsa/remuneração por fazer atividade extracurricular de estágio não obrigatório."
    sql: ${TABLE}."FLG_BOLSA_ESTAGIO" ;;
  }

  dimension: flg_bolsa_extensao {
    type: yesno
    group_label: "Bolsa"
    label: "Extensão?"
    description: "Informa se o aluno participa de atividade extracurricular de extensão"
    sql: ${TABLE}."FLG_BOLSA_EXTENSAO" ;;
  }

  dimension: flg_bolsa_monitoria {
    type: yesno
    group_label: "Bolsa"
    label: "Monitoria?"
    description: "Informa se o aluno participa de atividade extracurricular de monitoria"
    sql: ${TABLE}."FLG_BOLSA_MONITORIA" ;;
  }

  dimension: flg_bolsa_pesquisa {
    type: yesno
    group_label: "Bolsa"
    label: "Pesquisa?"
    description: "Informa se o aluno participa de atividade extracurricular de pesquisa"
    sql: ${TABLE}."FLG_BOLSA_PESQUISA" ;;
  }

  dimension: flg_capital_ies {
    type: yesno
    group_label:"Dados da IES"
    label: "Capital?"
    description: "Informa se a IES (reitoria / sede administrativa) está localizada na capital de um Estado"
    sql: ${TABLE}."FLG_CAPITAL_IES" ;;
  }

  dimension: flg_complementar_estagio {
    type: yesno
    hidden: yes
    group_label: "Bolsa"
    label: "Estágio?"
    description: "Informa se o aluno faz atividade extracurricular de estágio não obrigatório visando ao seu aperfeiçoamento profissional"
    sql: ${TABLE}."FLG_COMPLEMENTAR_ESTAGIO" ;;
  }

  dimension: flg_complementar_extensao {
    type: yesno
    hidden: yes
    group_label: "Complementar"
    label: "Extensão"
    sql: ${TABLE}."FLG_COMPLEMENTAR_EXTENSAO" ;;
  }

  dimension: flg_complementar_monitoria {
    type: yesno
    hidden: yes
    group_label: "Complementar"
    label: "Monitoria"
    sql: ${TABLE}."FLG_COMPLEMENTAR_MONITORIA" ;;
  }

  dimension: flg_complementar_pesquisa {
    type: yesno
    hidden: yes
    group_label: "Complementar"
    label: "Pesquisa"
    sql: ${TABLE}."FLG_COMPLEMENTAR_PESQUISA" ;;
  }

  dimension: flg_concluinte {
    type: yesno
    group_label:"Dados do Aluno"
    label: "Concluinte?"

    sql: ${TABLE}."FLG_CONCLUINTE" ;;
  }

  dimension: flg_deficiencia {
    type: yesno
    group_label:"Dados do Aluno"
    label: "Deficiência?"
    sql: ${TABLE}."FLG_DEFICIENCIA" ;;
  }

  dimension: flg_fin_naoreemb_ent_externa {
    type: yesno
    group_label: "Bolsa de Estudo"
    label: "Bolsa - Marketplace"
    sql: ${TABLE}."FLG_FIN_NAOREEMB_ENT_EXTERNA" ;;
  }

  dimension: flg_fin_naoreemb_estadual {
    type: yesno
    group_label: "Bolsa de Estudo"
    label: "Bolsa - Estadual"
    sql: ${TABLE}."FLG_FIN_NAOREEMB_ESTADUAL" ;;
  }

  dimension: flg_fin_naoreemb_municipal {
    type: yesno
    group_label: "Bolsa de Estudo"
    label: "Bolsa - Municipal"
    sql: ${TABLE}."FLG_FIN_NAOREEMB_MUNICIPAL" ;;
  }

  dimension: flg_fin_naoreemb_outra {
    type: yesno
    group_label: "Bolsa de Estudo"
    label: "Bolsa - Outros"
    sql: ${TABLE}."FLG_FIN_NAOREEMB_OUTRA" ;;
  }

  dimension: flg_fin_naoreemb_prog_ies {
    type: yesno
    group_label: "Bolsa de Estudo"
    label: "Bolsa - IES"
    sql: ${TABLE}."FLG_FIN_NAOREEMB_PROG_IES" ;;
  }

  dimension: flg_fin_naoreemb_prouni_integr {
    type: yesno
    group_label: "Bolsa de Estudo"
    label: "PROUNI - Integral"
    sql: ${TABLE}."FLG_FIN_NAOREEMB_PROUNI_INTEGR" ;;
  }

  dimension: flg_fin_naoreemb_prouni_parcial {
    type: yesno
    group_label: "Bolsa de Estudo"
    label: "PROUNI - Parcial"
    sql: ${TABLE}."FLG_FIN_NAOREEMB_PROUNI_PARCIAL" ;;
  }

  dimension: flg_fin_reemb_ent_externa {
    type: yesno
    group_label: "Financiamento Estudantil"
    label: "Financiamento Privado"
    sql: ${TABLE}."FLG_FIN_REEMB_ENT_EXTERNA" ;;
  }

  dimension: flg_fin_reemb_estadual {
    type: yesno
    group_label: "Financiamento Estudantil"
    label: "Financiamento Estadual"
    sql: ${TABLE}."FLG_FIN_REEMB_ESTADUAL" ;;
  }

  dimension: flg_fin_reemb_fies {
    type: yesno
    group_label: "Financiamento Estudantil"
    label: "FIES"
    sql: ${TABLE}."FLG_FIN_REEMB_FIES" ;;
  }

  dimension: flg_fin_reemb_municipal {
    type: yesno
    group_label: "Financiamento Estudantil"
    label: "Financiamento Municipal"
    sql: ${TABLE}."FLG_FIN_REEMB_MUNICIPAL" ;;
  }

  dimension: flg_fin_reemb_outra {
    type: yesno
    group_label: "Financiamento Estudantil"
    label: "Financiamento - Outros"
    sql: ${TABLE}."FLG_FIN_REEMB_OUTRA" ;;
  }

  dimension: flg_fin_reemb_prog_ies {
    type: yesno
    group_label: "Financiamento Estudantil"
    label: "Financiamento IES"
    sql: ${TABLE}."FLG_FIN_REEMB_PROG_IES" ;;
  }

  dimension: flg_financiamento_estudantil {
    type: yesno
    group_label: "Financiamento Estudantil"
    label: "Financiamento Estudantil?"
    sql: ${TABLE}."FLG_FINANCIAMENTO_ESTUDANTIL" ;;
  }

  dimension: flg_ingresso_avaliacao_seriada {
    type: yesno
    group_label: "Ingresso"
    label: "Avaliação Seriada?"
    hidden: yes
    sql: ${TABLE}."FLG_INGRESSO_AVALIACAO_SERIADA" ;;
  }

  dimension: flg_ingresso_convenio_pecg {
    type: yesno
    group_label: "Ingresso"
    label: "Convênio PECG"
    hidden: yes
    sql: ${TABLE}."FLG_INGRESSO_CONVENIO_PECG" ;;
  }

  dimension: flg_ingresso_decisao_judicial {
    type: yesno
    group_label: "Ingresso"
    label: "Decisão Judicial?"
    description: "Informa se o aluno ingressou no curso por meio de decisão judicial"
    sql: ${TABLE}."FLG_INGRESSO_DECISAO_JUDICIAL" ;;
  }

  dimension: flg_ingresso_egresso {
    type: yesno
    group_label: "Ingresso"
    label: "Egresso?"
    description: "Forma de ingresso que indica que o aluno se formou em um curso de Bacharelado Interdisciplinar ou Licenciatura Interdisciplinar e que ingressou em um curso de terminalidade."
    sql: ${TABLE}."FLG_INGRESSO_EGRESSO" ;;
  }

  dimension: flg_ingresso_enem {
    type: yesno
    group_label: "Ingresso"
    label: "Enem?"
    description: "Informa se o aluno ingressou no curso pelo Enem. "
    sql: ${TABLE}."FLG_INGRESSO_ENEM" ;;
  }

  dimension: flg_ingresso_outra_forma {
    type: yesno
    group_label: "Ingresso"
    label: "Outra Forma?"
    description: "Informa se o aluno ingressou no curso por outras formas de ingresso"
    sql: ${TABLE}."FLG_INGRESSO_OUTRA_FORMA" ;;
  }

  dimension: flg_ingresso_outro_tipo_selecao {
    type: yesno
    group_label: "Ingresso"
    label: "Outro tipo de seleção?"
    description: "Informa se o aluno ingressou no curso por outros tipos de seleção."
    sql: ${TABLE}."FLG_INGRESSO_OUTRO_TIPO_SELECAO" ;;
  }

  dimension: flg_ingresso_processo_seletivo {
    type: yesno
    group_label: "Ingresso"
    label: "Processo Seletivo?"
    description:"Informa se o aluno ingressou no curso por meio de processo seletivo principal"
    sql: ${TABLE}."FLG_INGRESSO_PROCESSO_SELETIVO" ;;
  }

  dimension: flg_ingresso_selecao_simplifica {
    type: yesno
    group_label: "Ingresso"
    label: "Seleção Simplificada"
    hidden: yes
    sql: ${TABLE}."FLG_INGRESSO_SELECAO_SIMPLIFICA" ;;
  }

  dimension: flg_ingresso_total {
    type: yesno
    group_label: "Ingresso"
    label: "Ingressou? (TOTAL)"
    sql: ${TABLE}."FLG_INGRESSO_TOTAL" ;;
  }

  dimension: flg_ingresso_transf_exofficio {
    type: yesno
    hidden: yes
    sql: ${TABLE}."FLG_INGRESSO_TRANSF_EXOFFICIO" ;;
  }

  dimension: flg_ingresso_vaga_nova {
    type: yesno
    group_label: "Ingresso"
    label: "Vaga Nova?"
    description:"Informa se o aluno é ingressante no curso por meio de processo seletivo de vaga nova"
    sql: ${TABLE}."FLG_INGRESSO_VAGA_NOVA" ;;
  }

  dimension: flg_ingresso_vaga_prog_especial {
    type: yesno
    hidden: yes
    sql: ${TABLE}."FLG_INGRESSO_VAGA_PROG_ESPECIAL" ;;
  }

  dimension: flg_ingresso_vaga_remanesc {
    type: yesno
    group_label: "Ingresso"
    label: "Vagas Remanescentes?"
    description: "Informa se o aluno ingressou no curso por  meio de vagas remanescentes"
    sql: ${TABLE}."FLG_INGRESSO_VAGA_REMANESC" ;;
  }

  dimension: flg_ingresso_vestibular {
    type: yesno
    group_label: "Ingresso"
    label: "Vestibular?"
    description: "Informa se o aluno ingressou no curso por vestibular."
    sql: ${TABLE}."FLG_INGRESSO_VESTIBULAR" ;;
  }

  dimension: flg_integral {
    type: yesno
    group_label: "Turno"
    label: "Integral"
    sql: ${TABLE}."FLG_INTEGRAL" ;;
  }

  dimension: flg_matricula {
    type: yesno
    group_label:"Dados do Aluno"
    label: "Matriculado?"
    sql: ${TABLE}."FLG_MATRICULA" ;;
  }

  dimension: flg_mobilidade_academica {
    type: yesno
    group_label:"Dados do Aluno"
    label: "Mobilidade Acadêmica?"
    description: "Informa se o aluno está regularmente matriculado em curso de graduação, que se vincula temporariamente a outra instituição, sendo ela nacional ou internacional."
    sql: ${TABLE}."FLG_MOBILIDADE_ACADEMICA" ;;
  }

  dimension: flg_noturno {
    type: yesno
    group_label: "Turno"
    label: "Noturno"
    sql: ${TABLE}."FLG_NOTURNO" ;;
  }

  dimension: flg_participa_rede_social {
    type: yesno
    group_label:"Dados da IES"
    label: "Rede Social?"
    sql: ${TABLE}."FLG_PARTICIPA_REDE_SOCIAL" ;;
  }

  dimension: flg_reserva_deficiencia {
    type: yesno
    group_label: "Reserva de Vagas"
    label: "Deficiência?"
    sql: ${TABLE}."FLG_RESERVA_DEFICIENCIA" ;;
  }

  dimension: flg_reserva_ensino_publico {
    type: yesno
    group_label: "Reserva de Vagas"
    label: "Ensino Público?"
    sql: ${TABLE}."FLG_RESERVA_ENSINO_PUBLICO" ;;
  }

  dimension: flg_reserva_etnico {
    type: yesno
    group_label: "Reserva de Vagas"
    label: "Cota Racial - Reserva Étnica?"
    sql: ${TABLE}."FLG_RESERVA_ETNICO" ;;
  }

  dimension: flg_reserva_outra {
    type: yesno
    group_label: "Reserva de Vagas"
    label: "Outras?"
    sql: ${TABLE}."FLG_RESERVA_OUTRA" ;;
  }

  dimension: flg_reserva_renda_familiar {
    type: yesno
    group_label: "Reserva de Vagas"
    label: "Cota Social - Renda Familiar?"
    sql: ${TABLE}."FLG_RESERVA_RENDA_FAMILIAR" ;;
  }

  dimension: flg_reserva_vagas {
    type: yesno
    group_label: "Reserva de Vagas"
    label: "Vagas Reservadas?"
    description:"Informa se o aluno participa de programa de reserva de vagas"
    sql: ${TABLE}."FLG_RESERVA_VAGAS" ;;
  }

  dimension: flg_servico_internet {
    type: yesno
    group_label:"Dados da IES"
    label: "Serviço de Internet?"
    description: "Informa se as bibliotecas da IES oferecem serviços pela internet"
    sql: ${TABLE}."FLG_SERVICO_INTERNET" ;;
  }

  dimension: flg_vespertino {
    type: yesno
    group_label: "Turno"
    label: "Vespertino?"
    sql: ${TABLE}."FLG_VESPERTINO" ;;
  }

  dimension: id_aluno {
    type: string

    sql: ${TABLE}."ID_ALUNO" ;;
  }

  dimension: id_aluno_curso {
    type: number

    sql: ${TABLE}."ID_ALUNO_CURSO" ;;
  }

  dimension: id_curso {
    type: number
    group_label:"Dados do Curso"
    label: "Código de Identificação do Curso"
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_ies {
    type: number
    group_label:"Dados da IES"
    label: "Código da IES"
    #hidden: yes
    sql: ${TABLE}."ID_IES" ;;
  }

  dimension: qtd_carga_horaria_integ {
    type: number
    group_label:"Dados do Aluno"
    label: "Carga Horária"
    hidden: yes
    sql: ${TABLE}."QTD_CARGA_HORARIA_INTEG" ;;
  }

  dimension: qtd_carga_horaria_total {
    type: number
    group_label:"Dados do Aluno"
    label: "Carga Horária TOTAL"
    sql: ${TABLE}."QTD_CARGA_HORARIA_TOTAL" ;;
  }

  dimension: qtd_func_total {
    type: number
    group_label:"Dados da IES"
    label: "Qtd de Funcionários IES"
    sql: ${TABLE}."QTD_FUNC_TOTAL" ;;
  }

  dimension: qtd_vaga_total {
    type: number
    group_label:"Dados do Curso"
    label: "Qtd de Vagas TOTAL"
    hidden: yes
    sql: ${TABLE}."QTD_VAGA_TOTAL" ;;
  }

  dimension: qtd_vagas_anual_ead {
    type: number
    group_label:"Dados do Curso"
    label: "Qtd de Vagas - ANUAL EAD"
    hidden: yes
    sql: ${TABLE}."QTD_VAGAS_ANUAL_EAD" ;;
  }

  dimension: qtd_vagas_anual_integral {
    type: number
    group_label:"Dados do Curso"
    label: "Qtd de Vagas - ANUAL INTEGRAL"
    hidden: yes
    sql: ${TABLE}."QTD_VAGAS_ANUAL_INTEGRAL" ;;
  }

  dimension: qtd_vagas_anual_matutino {
    type: number
    hidden: yes
    sql: ${TABLE}."QTD_VAGAS_ANUAL_MATUTINO" ;;
  }

  dimension: qtd_vagas_anual_noturno {
    type: number
    group_label:"Dados do Curso"
    label: "Qtd de Vagas - ANUAL NOTURNO"
    hidden: yes
    sql: ${TABLE}."QTD_VAGAS_ANUAL_NOTURNO" ;;
  }

  dimension: qtd_vagas_anual_vespertino {
    type: number
    group_label:"Dados do Curso"
    label: "Qtd de Vagas - ANUAL VESPERTINO"
    hidden: yes
    sql: ${TABLE}."QTD_VAGAS_ANUAL_VESPERTINO" ;;
  }

  dimension: sgl_ies {
    type: string
    group_label:"UF"
    label: "UF - Sigla"
    sql: ${TABLE}."SIGLA_UF" ;;
  }

  dimension: uf_ies {
    type: string
    group_label: "UF"
    label: "UF - Descrição"
    sql: ${TABLE}."DS_UF_IES" ;;
  }

  dimension: ds_municipio_ies {
    type: string
    group_label: "Municipio"
    label: "Municipio"
    sql: ${TABLE}."DS_MUNICIPIO_IES" ;;

  }

  dimension: ds_cor_raca {
    type: string
    group_label: "Dados do Aluno"
    label: "Cor/Raça"
    sql: ${TABLE}."DS_COR_RACA" ;;

  }


  dimension: idade_aluno {
    type: number
    group_label: "Dados do Aluno"
    label: "Idade do Aluno"
    sql: ${TABLE}."IDADE_ALUNO" ;;

  }














  measure: TAXA_EVASAO {
    type: number
    value_format: "0.00%"
    group_label: "Evasão"
    label: "Taxa de Evasão"
    sql: (${SOMA_INGRESSO_TOTAL}-${SOMA_MATRICULA})/nullif (${SOMA_INGRESSO_TOTAL},0);;



  }

  dimension: mapa_uf {
    sql: iff(${sgl_ies} = 'Não Preenchido', null, ${sgl_ies}) ;;
    map_layer_name: MAPA_ESTADO_ALUNO
    group_label: "UF"
    label: "UF - Mapa"
  }

  dimension: mapa_municipio {
    sql: iff(${ds_municipio_ies} = 'Não Preenchido', null, ${ds_municipio_ies}) ;;
    map_layer_name: MAPA_CIDADE_ALUNO
    group_label: "Municipio"
    label: "Municipio - Mapa"
  }



  measure:SOMA_INGRESSO_VESTIBULAR {
    type: sum
    group_label: "Ingressantes"
    label: "Ingresso Vestibular"
    sql: ${flg_ingresso_vestibular};;
  }

  dimension: tp_financiamento {
    type: string
    group_label: "Tipo de Bolsa/Financiamento"
    label: "Tipo de Financiamento Estudantil"
    description: "Tipos de Financiamento Estudantil"
    sql: CASE
          WHEN ${flg_fin_reemb_estadual}='TRUE' THEN 'Financiamento Estadual'
          WHEN ${flg_fin_reemb_prog_ies}='TRUE' THEN 'Financiamento Próprio'
          WHEN ${flg_fin_reemb_ent_externa}='TRUE' THEN 'Financiamento Privado'
          WHEN ${flg_fin_reemb_fies}='TRUE' THEN 'FIES'
          WHEN ${flg_fin_reemb_municipal}='TRUE' THEN 'Financiamento Municipal'
           WHEN ${flg_fin_reemb_estadual}is NULL  THEN 'Não Possui Financiamento'
          WHEN ${flg_fin_reemb_prog_ies}is NULL  THEN 'Não Possui Financiamento'
          WHEN ${flg_fin_reemb_ent_externa}is NULL THEN 'Não Possui Financiamento'
          WHEN  ${flg_fin_reemb_fies}is NULL THEN 'Não Possui Financiamento'
          WHEN ${flg_fin_reemb_municipal}is NULL THEN 'Não Possui Financiamento'

          else 'Outro tipo de financiamento'
           end
          ;;

    }

    dimension:FINANCIAMENTO_ESTUDANTIL {
      type: string
      hidden: yes
      group_label:"Financiamento"
      case: {
        when: {
          sql: ${flg_financiamento_estudantil}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }


    dimension:FIN_REEMB_FIES {
      type: string
      hidden: yes
      group_label:"Financiamento"
      case: {
        when: {
          sql: ${flg_fin_reemb_fies}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }


    dimension:FIN_REEMB_ESTADUAL {
      type: string
      hidden: yes
      group_label:"Financiamento"
      case: {
        when: {
          sql: ${flg_fin_reemb_estadual}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }


    dimension:FIN_REEMB_MUNICIPAL {
      type: string
      hidden: yes
      group_label:"Financiamento"
      case: {
        when: {
          sql: ${flg_fin_reemb_municipal}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }


    dimension:FIN_REEMB_PROG_IES {
      type: string
      hidden: yes
      group_label:"Financiamento"
      case: {
        when: {
          sql: ${flg_fin_reemb_prog_ies}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }



    dimension:FIN_REEMB_ENT_EXTERNA {
      type: string
      hidden: yes
      group_label:"Financiamento"
      case: {
        when: {
          sql: ${flg_fin_reemb_ent_externa}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }


    dimension:FIN_REEMB_OUTRA {
      type: string
      hidden: yes
      group_label:"Financiamento"
      case: {
        when: {
          sql: ${flg_fin_reemb_outra}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }

    dimension:CONCLUINTE {
      type: string
      hidden: yes
      group_label:"Concluinte"

      case: {
        when: {
          sql: ${flg_concluinte}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }

    dimension:INGRESSO_TOTAL {
      type: string
      hidden: yes
      group_label:"Ingresso"
      case: {
        when: {
          sql: ${flg_ingresso_total}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }


    dimension: MATRICULA {
      type: string
      hidden: yes
      group_label:"Matricula"
      case: {
        when: {
          sql: ${flg_matricula}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }

    dimension:DEFICIENCIA{
      type: string
      group_label:"Deficiência"
      hidden:yes
      case: {
        when: {
          sql: ${flg_deficiencia}='TRUE';;

          label: "1"
        }
        else:"0"
      }
    }



    measure: count_ies {
      type: count_distinct
      sql: ${id_ies} ;;
      group_label:"Dados da IES"
      label: "Quantidade de IES"




    }



    measure:SOMA_FIN_REEMB_FIES {
      type: sum
      group_label:"Financiamento Estudantil"
      label: "Financiamento FIES"
      sql: ${FIN_REEMB_FIES};;
    }

    measure:SOMA_FIN_REEMB_ESTADUAL {
      type: sum
      group_label:"Financiamento Estudantil"
      label: "Financiamento Estadual"
      sql: ${FIN_REEMB_ESTADUAL};;
    }

    measure:SOMA_FIN_REEMB_MUNICIPAL {
      type: sum
      group_label:"Financiamento Estudantil"
      label: "Financiamento Municipal"
      sql: ${FIN_REEMB_MUNICIPAL};;
    }

    measure:SOMA_FIN_REEMB_PROG_IES {
      type: sum
      group_label:"Financiamento Estudantil"
      label: "Financiamento Próprio"
      sql: ${FIN_REEMB_PROG_IES};;
    }

    measure:SOMA_FIN_REEMB_ENT_EXTERNA {
      type: sum
      group_label:"Financiamento Estudantil"
      label: "Financiamento Privado"
      sql: ${FIN_REEMB_ENT_EXTERNA}+${FIN_REEMB_OUTRA};;
    }

    measure:SOMA_FIN_REEMB_OUTRA {
      type: sum
      group_label:"Financiamento Estudantil"
      label: "Financiamento Outros"
      hidden: yes
      description: "Soma de Financiamento Estudantil semelhante ao PRAVALER"
      sql: ${FIN_REEMB_OUTRA};;
    }

    measure:SOMA_FINANCIAMENTO_ESTUDANTIL {
      type: sum
      group_label:"Financiamento Estudantil"
      label: "Financiamento Estudantil (Total)"
      sql: ${FINANCIAMENTO_ESTUDANTIL};;
    }

    measure:SOMA_CONCLUINTE {
      type: sum
      group_label: "Concluinte (Total)"
      sql: ${CONCLUINTE};;
    }

    measure:SOMA_INGRESSO_TOTAL {
      type: sum
      group_label: "Ingressantes"
      label: "Ingressantes (Total)"
      sql: ${INGRESSO_TOTAL};;
    }
    measure:SOMA_MATRICULA {
      type: sum
      group_label: "Matricula (Total)"
      sql: ${MATRICULA};;
    }

    measure:SOMA_DEFICIENTE {
      type: sum
      group_label: "Deficiência (Total)"
      sql: ${DEFICIENCIA};;
    }



    dimension: tp_bolsa {
      type: string
      group_label: "Tipo de Bolsa/Financiamento"
      label: "Tipo de Bolsa de estudo"
      description: "Tipo de de Bolsas de Estudo oferecidas. Ex: Bolsa IES, Prouni, Bolsa Estadual."
      sql: CASE
          WHEN ${flg_fin_naoreemb_estadual}='TRUE' THEN 'Bolsa Estadual'
          WHEN ${flg_fin_naoreemb_prog_ies}='TRUE' THEN 'Bolsa IES'
          WHEN ${flg_fin_naoreemb_ent_externa}='TRUE' THEN 'Marketplace'
          WHEN ${flg_fin_naoreemb_prouni_integr}='TRUE' THEN 'PROUNI'
          WHEN ${flg_fin_naoreemb_prouni_parcial}='TRUE' THEN 'PROUNI PARCIAL'
          WHEN ${flg_fin_naoreemb_municipal}='TRUE' THEN 'Bolsa Municipal'
           WHEN ${flg_fin_naoreemb_municipal}is NULL  THEN 'Não Possui nenhum tipo de Bolsa'
          WHEN ${flg_fin_naoreemb_estadual}is NULL  THEN 'Não Possui nenhum tipo de Bolsa'
          WHEN ${flg_fin_naoreemb_prog_ies}is NULL THEN 'Não Possui nenhum tipo de Bolsa'
          WHEN ${flg_fin_naoreemb_ent_externa}is NULL THEN 'Não Possui nenhum tipo de Bolsa'
          WHEN ${flg_fin_naoreemb_prouni_integr}is NULL THEN 'Não Possui nenhum tipo de Bolsa'
          WHEN ${flg_fin_naoreemb_prouni_parcial}is NULL THEN 'Não Possui nenhum tipo de Bolsa'
          else 'Outros'
           end
          ;;

      }

      measure: count {
        type: count
        drill_fields: []
      }
    }
