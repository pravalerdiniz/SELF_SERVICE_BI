# The name of this view in Looker is "Inep Lgpd"
view: inep_lgpd {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GRADUADO"."SELF_SERVICE_BI"."INEP_LGPD"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Aluno Deficiente" in Explore.

  dimension: aluno_deficiente {
    group_label: "Dados quantitativos de Alunos"
    type: number
    sql: ${TABLE}."ALUNO_DEFICIENTE" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  #measure: total_aluno_deficiente {
  #  type: sum
  #  sql: ${aluno_deficiente} ;;
  #}

  #measure: average_aluno_deficiente {
  #  type: average
  #  sql: ${aluno_deficiente} ;;
  #}

  dimension: aluno_parfor {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. alunos PARFOR"
    description: "Quantidade de ingressante que participa do programa especial para a formação de professores em exercício na rede pública de educação básica (PARFOR)"
    type: number
    sql: ${TABLE}."ALUNO_PARFOR" ;;
  }

  dimension: apoio_social {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. alunos apoio social"
    description: "Quantidade de aluno  que recebem algum tipo de apoio alimentação"
    type: number
    sql: ${TABLE}."APOIO_SOCIAL" ;;
  }

  dimension: ativ_extracurricular {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. alunos extracurricular"
    description: "Quantidade de aluno que participa de algum tipo de atividade extracurricular"
    type: number
    sql: ${TABLE}."ATIV_EXTRACURRICULAR" ;;
  }

  dimension: co_cine_area_detalhada {
    group_label: "Dados do curso"
    label: "Código Cine da área detalhada"
    description: "Código de identificação da área detalhada, conforme adaptação da Classificação Internacional Normalizada da Educação Cine/Unesco"
    type: string
    sql: ${TABLE}."CO_CINE_AREA_DETALHADA" ;;
  }

  dimension: co_cine_area_especifica {
    group_label: "Dados do curso"
    label: "Código Cine da área específica"
    description: "Código de identificação da área específica, conforme adaptação da Classificação Internacional Normalizada da Educação Cine/Unesco"
    type: string
    sql: ${TABLE}."CO_CINE_AREA_ESPECIFICA" ;;
  }

  dimension: co_cine_area_geral {
    group_label: "Dados do curso"
    label: "Código Cine da área geral"
    description: "Código de identificação da área geral, conforme adaptação da Classificação Internacional Normalizada da Educação Cine/Unesco"
    type: string
    sql: ${TABLE}."CO_CINE_AREA_GERAL" ;;
  }

  dimension: co_cine_rotulo {
    group_label: "Dados do curso"
    label: "Código do rótulo Cine"
    description: "Código de identificação do curso, conforme adaptação da Classificação Internacional Normalizada da Educação Cine/Unesco"
    type: string
    sql: ${TABLE}."CO_CINE_ROTULO" ;;
  }

  dimension: co_ies {
    group_label: "Dados IES"
    label: "Código da IES"
    type: number
    sql: ${TABLE}."CO_IES" ;;
  }

  dimension: co_mantenedora {
    group_label: "Dados IES"
    label: "Código da mantenedora"
    hidden: yes
    type: number
    sql: ${TABLE}."CO_MANTENEDORA" ;;
  }

  dimension: co_mesorregiao_ies {
    group_label: "Dados IES"
    hidden: yes
    type: number
    sql: ${TABLE}."CO_MESORREGIAO_IES" ;;
  }

  dimension: co_microrregiao_ies {
    group_label: "Dados IES"
    hidden: yes
    type: number
    sql: ${TABLE}."CO_MICRORREGIAO_IES" ;;
  }

  dimension: co_municipio {
    group_label: "Dados do curso - Local de Oferta"
    label: "Código IBGE do Município - Local de oferta"
    description: "Código do IBGE do municipio do local de oferta do curso"
    type: number
    sql: ${TABLE}."CO_MUNICIPIO" ;;
  }

  dimension: co_municipio_ies {
    group_label: "Dados IES"
    hidden: yes
    type: number
    sql: ${TABLE}."CO_MUNICIPIO_IES" ;;
  }

  dimension: co_regiao {
    group_label: "Dados do curso - Local de Oferta"
    label: "Região - Local de oferta"
    description: "Código da região geográfica do local de oferta do curso"
    type: number
    sql: ${TABLE}."CO_REGIAO" ;;
  }

  dimension: co_regiao_ies {
    group_label: "Dados IES"
    label: "Código da região da IES"
    type: number
    sql: ${TABLE}."CO_REGIAO_IES" ;;
  }

  dimension: co_uf {
    group_label: "Dados do curso - Local de Oferta"
    label: "Código IBGE da UF"
    description: "Código IBGE da Unidade da Federação do local de oferta do curso"
    type: number
    sql: ${TABLE}."CO_UF" ;;
  }

  dimension: co_uf_ies {
    group_label: "Dados IES"
    label: "Código UF da IES"
    description: "Código da UF da sede administrativa ou reitoria da IES"
    type: number
    sql: ${TABLE}."CO_UF_IES" ;;
  }

  dimension: conc_0_17 {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes até 17 anos"
    type: number
    sql: ${TABLE}."CONC_0_17" ;;
  }

  dimension: conc_18_24 {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes de 18 a 24 anos"
    type: number
    sql: ${TABLE}."CONC_18_24" ;;
  }

  dimension: conc_25_29 {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes de 25 a 29 anos"
    type: number
    sql: ${TABLE}."CONC_25_29" ;;
  }

  dimension: conc_30_34 {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes de 30 a 34 anos"
    type: number
    sql: ${TABLE}."CONC_30_34" ;;
  }

  dimension: conc_35_39 {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes de 35 a 39 anos"
    type: number
    sql: ${TABLE}."CONC_35_39" ;;
  }

  dimension: conc_40_49 {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes de 40 a 49 anos"
    type: number
    sql: ${TABLE}."CONC_40_49" ;;
  }

  dimension: conc_50_59 {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes de 50 a 59 anos"
    type: number
    sql: ${TABLE}."CONC_50_59" ;;
  }

  dimension: conc_60_mais {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes de 60 anos ou mais"
    type: number
    sql: ${TABLE}."CONC_60_MAIS" ;;
  }

  dimension: conc_aluno_deficiente {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. alunos concluintes com deficiência"
    description: "Quantidade de concluinte no curso - alunos com deficiência, transtorno global do desenvolvimento ou altas habilidades/superdotação"
    type: number
    sql: ${TABLE}."CONC_ALUNO_DEFICIENTE" ;;
  }

  dimension: conc_aluno_parfor {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. alunos concluintes PARFOR"
    description: "Quantidade de concluinte que participa do programa especial para a formação de professores em exercício na rede pública de educação básica (PARFOR)"
    type: number
    sql: ${TABLE}."CONC_ALUNO_PARFOR" ;;
  }

  dimension: conc_amarela {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes cor/raça Amarela"
    type: number
    sql: ${TABLE}."CONC_AMARELA" ;;
  }

  dimension: conc_apoio_social {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes apoio social"
    description: "Quantidade de concluinte que recebe algum tipo de apoio"
    type: number
    sql: ${TABLE}."CONC_APOIO_SOCIAL" ;;
  }

  dimension: conc_ativ_extracurricular {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes atividades extracurriculares"
    description: "Quantidade concluinte que participa de algum tipo de atividade extracurricular"
    type: number
    sql: ${TABLE}."CONC_ATIV_EXTRACURRICULAR" ;;
  }

  dimension: conc_branca {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes cor/raça Branca"
    type: number
    sql: ${TABLE}."CONC_BRANCA" ;;
  }

  dimension: conc_cornd {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes cor/raça não declarada"
    type: number
    sql: ${TABLE}."CONC_CORND" ;;
  }

  dimension: conc_diurno {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes no turno matutino"
    type: number
    sql: ${TABLE}."CONC_DIURNO" ;;
  }

  dimension: conc_fem {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes do sexo feminino"
    type: number
    sql: ${TABLE}."CONC_FEM" ;;
  }

  dimension: conc_fies {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. concluintes com FIES"
    type: number
    sql: ${TABLE}."CONC_FIES" ;;
  }

  dimension: conc_financ {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. concluintes com financiamento estudantil"
    type: number
    sql: ${TABLE}."CONC_FINANC" ;;
  }

  dimension: conc_financ_nreemb {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. concluintes com financiamento estudantil não reembolsavél"
    type: number
    sql: ${TABLE}."CONC_FINANC_NREEMB" ;;
  }

  dimension: conc_financ_nreemb_outros {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. concluintes com financiamento estudantil não reembolsavél - outros"
    description: "Quantidade de concluinte no curso - alunos que utilizam financiamento estudantil  reembolsável - pelo governo estadual, municipal, entidades externas à IES e outras entidades."
    type: number
    sql: ${TABLE}."CONC_FINANC_NREEMB_OUTROS" ;;
  }

  dimension: conc_financ_reemb {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. concluintes com financiamento estudantil reembolsavél"
    type: number
    sql: ${TABLE}."CONC_FINANC_REEMB" ;;
  }

  dimension: conc_financ_reemb_outros {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. concluintes com financiamento estudantil reembolsavél - outros"
    description: "Quantidade de concluinte no curso - alunos que utilizam financiamento estudantil  reembolsável - pelo governo estadual, municipal, entidades externas à IES e outras entidades."
    type: number
    sql: ${TABLE}."CONC_FINANC_REEMB_OUTROS" ;;
  }

  dimension: conc_indigena {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes cor/raça Indígena"
    type: number
    sql: ${TABLE}."CONC_INDIGENA" ;;
  }

  dimension: conc_masc {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes do sexo masculino"
    type: number
    sql: ${TABLE}."CONC_MASC" ;;
  }

  dimension: conc_mob_academica {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes mobilidade acadêmica"
    description: "Quantidade de concluintes em curso de graduação, que se vincula temporrariamente a outra instituição, sendo ela nacional ou internacional"
    type: number
    sql: ${TABLE}."CONC_MOB_ACADEMICA" ;;
  }

  dimension: conc_nacbras {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes nascionalidade brasileira"
    description: "Quantidade de concluinte no curso - nacionalidade brasileira ou brasileira - nascido no exterior ou naturalizado"
    type: number
    sql: ${TABLE}."CONC_NACBRAS" ;;
  }

  dimension: conc_nacestrang {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes nascionalidade estrangeira"
    type: number
    sql: ${TABLE}."CONC_NACESTRANG" ;;
  }

  dimension: conc_noturno {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes no período noturno"
    type: number
    sql: ${TABLE}."CONC_NOTURNO" ;;
  }

  dimension: conc_nrpfies {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. concluintes financiamento pela IES"
    description: "Quantidade de concluinte no curso - alunos que utilizam financiamento estudantil  não reembolsável - administrado pela instituição"
    type: number
    sql: ${TABLE}."CONC_NRPFIES" ;;
  }

  dimension: conc_parda {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes cor/raça Parda"
    type: number
    sql: ${TABLE}."CONC_PARDA" ;;
  }

  dimension: conc_preta {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes cor/raça Preta"
    type: number
    sql: ${TABLE}."CONC_PRETA" ;;
  }

  dimension: conc_procescprivada {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes ensino médio IE privada"
    description: "Quantidade de concluinte que terminaram o médio em escolas privadas"
    type: number
    sql: ${TABLE}."CONC_PROCESCPRIVADA" ;;
  }

  dimension: conc_procescpublica {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes ensino médio IE pública"
    description: "Quantidade de concluinte que terminaram o médio em escolas públicas"
    type: number
    sql: ${TABLE}."CONC_PROCESCPUBLICA" ;;
  }

  dimension: conc_procnaoinformada {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtrd. concluintes ensino médio não informado"
    description: "Quantidade de concluinte que não informaram o tipo de escola que terminaram o médio"
    type: number
    sql: ${TABLE}."CONC_PROCNAOINFORMADA" ;;
  }

  dimension: conc_prounii {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. concluintes PROUNI integral"
    description: "Quantidade de concluinte no curso - alunos que utilizam financiamento estudantil  não reembolsável  - PROUNI Integral"
    type: number
    sql: ${TABLE}."CONC_PROUNII" ;;
  }

  dimension: conc_prounip {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. concluintes PROUNI parcial"
    description: "Quantidade de concluinte no curso - alunos que utilizam financiamento estudantil  não reembolsável  - PROUNI Parcial"
    type: number
    sql: ${TABLE}."CONC_PROUNIP" ;;
  }

  dimension: conc_reserva_vaga {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes com reserva de vaga"
    description: "Quantidade de concluinte no curso - alunos que participa do programa de reserva de vagas"
    type: number
    sql: ${TABLE}."CONC_RESERVA_VAGA" ;;
  }

  dimension: conc_rpfies {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. concluintes RPFIES"
    description: "Quantidade de concluinte no curso - alunos que utilizam financiamento estudantil  reembolsável - administrado pela instituição"
    type: number
    sql: ${TABLE}."CONC_RPFIES" ;;
  }

  dimension: conc_rvetinico {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes reserva vaga ética"
    description: "Quantidade de concluinte no curso - alunos que participa do programa de reserva de vagas - cunho étnico"
    type: number
    sql: ${TABLE}."CONC_RVETINICO" ;;
  }

  dimension: conc_rvoutros {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes reserva vaga outros"
    description: "Quantidade de concluinte no curso - alunos que participa do programa de reserva de vagas - outros tipos"
    type: number
    sql: ${TABLE}."CONC_RVOUTROS" ;;
  }

  dimension: conc_rvpdef {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes reserva vaga deficiência"
    description: "Quantidade de concluinte no curso - alunos que participa do programa de reserva de vagas - pessoas com deficiência"
    type: number
    sql: ${TABLE}."CONC_RVPDEF" ;;
  }

  dimension: conc_rvredepublica {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes reserva vaga IE pública"
    description: "Quantidade de concluinte no curso - alunos que participa do programa de reserva de vagas - escola pública"
    type: number
    sql: ${TABLE}."CONC_RVREDEPUBLICA" ;;
  }

  dimension: conc_rvsocial_rf {
    group_label: "Dados quantitativos de Alunos"
    label: "Qtd. concluintes reserva vaga social/renda"
    description: "Quantidade de concluinte no curso - alunos que participa do programa de reserva de vagas - cunho social/renda familiar"
    type: number
    sql: ${TABLE}."CONC_RVSOCIAL_RF" ;;
  }

  dimension: doc_ex_0_29 {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício até 29 anos"
    type: number
    sql: ${TABLE}."DOC_EX_0_29" ;;
  }

  dimension: doc_ex_30_34 {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício de 30 a 34 anos"
    type: number
    sql: ${TABLE}."DOC_EX_30_34" ;;
  }

  dimension: doc_ex_35_39 {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício de 35 a 39 anos"
    type: number
    sql: ${TABLE}."DOC_EX_35_39" ;;
  }

  dimension: doc_ex_40_44 {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício de 40 a 44 anos"
    type: number
    sql: ${TABLE}."DOC_EX_40_44" ;;
  }

  dimension: doc_ex_45_49 {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício de 45 a 49 anos"
    type: number
    sql: ${TABLE}."DOC_EX_45_49" ;;
  }

  dimension: doc_ex_50_54 {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício de 50 a 54 anos"
    type: number
    sql: ${TABLE}."DOC_EX_50_54" ;;
  }

  dimension: doc_ex_55_59 {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício de 55 a 59 anos"
    type: number
    sql: ${TABLE}."DOC_EX_55_59" ;;
  }

  dimension: doc_ex_60_mais {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício de 60 anos ou mais"
    type: number
    sql: ${TABLE}."DOC_EX_60_MAIS" ;;
  }

  dimension: doc_ex_amarela {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício cor/raça Amarela"
    type: number
    sql: ${TABLE}."DOC_EX_AMARELA" ;;
  }

  dimension: doc_ex_bra {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício nac. Brasileira"
    description: "Quantidade de docente em exercício - nacionalidade brasileira ou brasileira - nascido no exterior ou naturalizado"
    type: number
    sql: ${TABLE}."DOC_EX_BRA" ;;
  }

  dimension: doc_ex_branca {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício cor/raça Branca"
    type: number
    sql: ${TABLE}."DOC_EX_BRANCA" ;;
  }

  dimension: doc_ex_com_deficiencia {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício com deficiência"
    type: number
    sql: ${TABLE}."DOC_EX_COM_DEFICIENCIA" ;;
  }

  dimension: doc_ex_cor_nd {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício cor/raça não declarada"
    type: number
    sql: ${TABLE}."DOC_EX_COR_ND" ;;
  }

  dimension: doc_ex_dout {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício com doutorado"
    type: number
    sql: ${TABLE}."DOC_EX_DOUT" ;;
  }

  dimension: doc_ex_esp {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício com especialização"
    type: number
    sql: ${TABLE}."DOC_EX_ESP" ;;
  }

  dimension: doc_ex_est {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício com nac. estrangeira"
    type: number
    sql: ${TABLE}."DOC_EX_EST" ;;
  }

  dimension: doc_ex_femi {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício do sexo feminino"
    type: number
    sql: ${TABLE}."DOC_EX_FEMI" ;;
  }

  dimension: doc_ex_grad {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício com graduação"
    type: number
    sql: ${TABLE}."DOC_EX_GRAD" ;;
  }

  dimension: doc_ex_hor {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício Horista"
    type: number
    sql: ${TABLE}."DOC_EX_HOR" ;;
  }

  dimension: doc_ex_indigena {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício cor/raça Indígena"
    type: number
    sql: ${TABLE}."DOC_EX_INDIGENA" ;;
  }

  dimension: doc_ex_int {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício tempo integral"
    type: number
    sql: ${TABLE}."DOC_EX_INT" ;;
  }

  dimension: doc_ex_int_de {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício tempo integral/exclusivo"
    description: "Quantidade de docentes em exercício em tempo integral com dedicação exclusiva."
    type: number
    sql: ${TABLE}."DOC_EX_INT_DE" ;;
  }

  dimension: doc_ex_int_sem_de {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício tempo integral/não exclusivo"
    description: "Quantidade de docentes em exercício em tempo integral sem dedicação exclusiva."
    type: number
    sql: ${TABLE}."DOC_EX_INT_SEM_DE" ;;
  }

  dimension: doc_ex_masc {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício do sexo masculino"
    type: number
    sql: ${TABLE}."DOC_EX_MASC" ;;
  }

  dimension: doc_ex_mest {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício com mestrado"
    type: number
    sql: ${TABLE}."DOC_EX_MEST" ;;
  }

  dimension: doc_ex_parc {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício tempo parcial"
    type: number
    sql: ${TABLE}."DOC_EX_PARC" ;;
  }

  dimension: doc_ex_parda {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício cor/raça Parda"
    type: number
    sql: ${TABLE}."DOC_EX_PARDA" ;;
  }

  dimension: doc_ex_preta {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício cor/raça Preta"
    type: number
    sql: ${TABLE}."DOC_EX_PRETA" ;;
  }

  dimension: doc_ex_sem_grad {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Qtd. docentes em exercício sem graduação"
    type: number
    sql: ${TABLE}."DOC_EX_SEM_GRAD" ;;
  }

  dimension: ds_complemento_endereco_ies {
    group_label: "Dados IES"
    label: "Complemento IES"
    type: string
    sql: ${TABLE}."DS_COMPLEMENTO_ENDERECO_IES" ;;
  }

  dimension: ds_endereco_ies {
    group_label: "Dados IES"
    label: "Endereço IES"
    description: "Endereço da sede administrativa/reitoria da IES"
    type: string
    sql: ${TABLE}."DS_ENDERECO_IES" ;;
  }

  dimension: ds_numero_endereco_ies {
    group_label: "Dados IES"
    label: "Número/Endereço IES"
    type: string
    sql: ${TABLE}."DS_NUMERO_ENDERECO_IES" ;;
  }

  dimension: in_acesso_outras_bases {
    group_label: "Dados IES"
    label: "IES - Acessa outras bases"
    description: "Informa se as bibliotecas da IES tem acesso a outras bases de dados licenciadas ou compradas"
    type: yesno
    sql: ${TABLE}."IN_ACESSO_OUTRAS_BASES" ;;
  }

  dimension: in_acesso_portal_capes {
    group_label: "Dados IES"
    label: "IES - Acessa portal capes"
    description: "Informa se as bibliotecas da IES tem acesso ao portal Capes de periódicos"
    type: yesno
    sql: ${TABLE}."IN_ACESSO_PORTAL_CAPES" ;;
  }

  dimension: in_assina_outra_base {
    group_label: "Dados IES"
    label: "IES - Assina outra base"
    description: "Informa se as bibliotecas da IES assina outras bases de dados licenciadas ou compradas"
    type: yesno
    sql: ${TABLE}."IN_ASSINA_OUTRA_BASE" ;;
  }

  dimension: in_busca_integrada {
    group_label: "Dados IES"
    label: "IES - Busca integrada"
    description: "Informa se as bibliotecas da IES oferecem serviços pela internet"
    type: yesno
    sql: ${TABLE}."IN_BUSCA_INTEGRADA" ;;
  }

  dimension: in_capital {
    group_label: "Dados do curso - Local de Oferta"
    label: "Local de oferta na capital?"
    description: "Informa se o local de oferta do curso está localizado em capital de Estado"
    type: yesno
    sql: ${TABLE}."IN_CAPITAL" ;;
  }

  dimension: in_capital_ies {
    group_label: "Dados IES"
    label: "IES localizada na capital"
    description: "Sede administrativa ou reitoria da IES está localizada em uma capital da unidade da federação"
    type: yesno
    sql: ${TABLE}."IN_CAPITAL_IES" ;;
  }

  dimension: in_catalogo_online {
    group_label: "Dados IES"
    label: "IES - Catalogo online"
    description: "Informa se a IES possui ferramenta de recuperação de informação que permite ao usuário consultar, de forma local ou remota, a existência e disponibilidade de itens do acervo da(s) biblioteca(s)."
    type: yesno
    sql: ${TABLE}."IN_CATALOGO_ONLINE" ;;
  }

  dimension: in_participa_rede_social {
    group_label: "Dados IES"
    label: "IES - Participa rede social"
    description: "Informa se a biblioteca participam de Redes Sociais"
    type: yesno
    sql: ${TABLE}."IN_PARTICIPA_REDE_SOCIAL" ;;
  }

  dimension: in_repositorio_institucional {
    group_label: "Dados IES"
    label: "IES - Repositório institucional"
    description: "Informa se a IES possui base de dados online que reúne de maneira organizada a produção científica da instituição."
    type: yesno
    sql: ${TABLE}."IN_REPOSITORIO_INSTITUCIONAL" ;;
  }

  dimension: in_servico_internet {
    group_label: "Dados IES"
    label: "IES - Servico internet"
    description: "Informa se as bibliotecas da IES oferecem serviços pela internet"
    type: yesno
    sql: ${TABLE}."IN_SERVICO_INTERNET" ;;
  }

  dimension: ing_0_17 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes até 17 anos"
    type: number
    sql: ${TABLE}."ING_0_17" ;;
  }

  dimension: ing_18_24 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes de 18 a 24 anos"
    type: number
    sql: ${TABLE}."ING_18_24" ;;
  }

  dimension: ing_25_29 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes de 25 a 29 anos"
    type: number
    sql: ${TABLE}."ING_25_29" ;;
  }

  dimension: ing_30_34 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes de 30 a 34 anos"
    type: number
    sql: ${TABLE}."ING_30_34" ;;
  }

  dimension: ing_35_39 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes de 35 a 39 anos"
    type: number
    sql: ${TABLE}."ING_35_39" ;;
  }

  dimension: ing_40_49 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes de 40 a 49 anos"
    type: number
    sql: ${TABLE}."ING_40_49" ;;
  }

  dimension: ing_50_59 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes de 50 a 59 anos"
    type: number
    sql: ${TABLE}."ING_50_59" ;;
  }

  dimension: ing_aluno_deficiente {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes com deficiência"
    description: "Quantidade de ingressante no curso - alunos com deficiência, transtorno global do desenvolvimento ou altas habilidades/superdotação"
    type: number
    sql: ${TABLE}."ING_ALUNO_DEFICIENTE" ;;
  }

  dimension: ing_aluno_parfor {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes PARFOR"
    description: "Quantidade de ingressante que participa do programa especial para a formação de professores em exercício na rede pública de educação básica (PARFOR)"
    type: number
    sql: ${TABLE}."ING_ALUNO_PARFOR" ;;
  }

  dimension: ing_amarela {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes cor/raça Amarela"
    type: number
    sql: ${TABLE}."ING_AMARELA" ;;
  }

  dimension: ing_apoio_social {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes com apoio social"
    description: "Quantidade de ingressante que recebem algum tipo de apoio alimentação"
    type: number
    sql: ${TABLE}."ING_APOIO_SOCIAL" ;;
  }

  dimension: ing_ativ_extracurricular {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes atividade extracurricular"
    description: "Quantidade de ingressante que participa de algum tipo de atividade extracurricular"
    type: number
    sql: ${TABLE}."ING_ATIV_EXTRACURRICULAR" ;;
  }

  dimension: ing_avaliacao_seriada {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressante avaliação seriada"
    type: number
    sql: ${TABLE}."ING_AVALIACAO_SERIADA" ;;
  }

  dimension: ing_branca {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes cor/raça Branca"
    type: number
    sql: ${TABLE}."ING_BRANCA" ;;
  }

  dimension: ing_cornd {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes cor/raça não declarada"
    type: number
    sql: ${TABLE}."ING_CORND" ;;
  }

  dimension: ing_diurno {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes período diurno"
    type: number
    sql: ${TABLE}."ING_DIURNO" ;;
  }

  dimension: ing_egr {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes EGR"
    description: "Quantidade de ingressos no curso de aluno que se formou em um curso de bacharelado interdisciplinar ou licenciatura interdisciplinar e que ingressou em um curso de terminalidade"
    type: number
    sql: ${TABLE}."ING_EGR" ;;
  }

  dimension: ing_enem {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes ENEM"
    type: number
    sql: ${TABLE}."ING_ENEM" ;;
  }

  dimension: ing_fem {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes sexo feminino"
    type: number
    sql: ${TABLE}."ING_FEM" ;;
  }

  dimension: ing_fies {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. ingressantes FIES"
    type: number
    sql: ${TABLE}."ING_FIES" ;;
  }

  dimension: ing_financ {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. ingressantes financiamento"
    description: "Quantidade de ingressante no curso - alunos que utilizam financiamento estudantil "
    type: number
    sql: ${TABLE}."ING_FINANC" ;;
  }

  dimension: ing_financ_nreemb {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. ingressantes financiamento não reembolsável"
    description: "Quantidade de ingressante no curso - alunos que utilizam financiamento estudantil não reembolsável"
    type: number
    sql: ${TABLE}."ING_FINANC_NREEMB" ;;
  }

  dimension: ing_financ_nreemb_outros {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. ingressantes financiamento não reembolsável - outros"
    description: "Quantidade de ingressante no curso - alunos que utilizam financiamento estudantil não  reembolsável - pelo governo estadual, municipal, entidades externas à IES e outras entidades."
    type: number
    sql: ${TABLE}."ING_FINANC_NREEMB_OUTROS" ;;
  }

  dimension: ing_financ_reemb {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. ingressantes financiamento reembolsável"
    description: "Quantidade de ingressante no curso - alunos que utilizam financiamento estudantil  reembolsável"
    type: number
    sql: ${TABLE}."ING_FINANC_REEMB" ;;
  }

  dimension: ing_financ_reemb_outros {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. ingressantes financiamento reembolsável - outros"
    description: "Quantidade de ingressante no curso - alunos que utilizam financiamento estudantil  reembolsável - pelo governo estadual, municipal, entidades externas à IES e outras entidades."
    type: number
    sql: ${TABLE}."ING_FINANC_REEMB_OUTROS" ;;
  }

  dimension: ing_indigena {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes cor/raça Indígena"
    type: number
    sql: ${TABLE}."ING_INDIGENA" ;;
  }

  dimension: ing_masc {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes sexo masculino"
    type: number
    sql: ${TABLE}."ING_MASC" ;;
  }

  dimension: ing_mob_academica {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes mobilidade acadêmica"
    description: "Quantidade de aluno ingressante em curso de graduação, que se vincula temporrariamente a outra instituição, sendo ela nacional ou internacional"
    type: number
    sql: ${TABLE}."ING_MOB_ACADEMICA" ;;
  }

  dimension: ing_nacbras {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes nac. brasileira"
    type: number
    sql: ${TABLE}."ING_NACBRAS" ;;
  }

  dimension: ing_nacestrang {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes nac. estrangeira"
    type: number
    sql: ${TABLE}."ING_NACESTRANG" ;;
  }

  dimension: ing_noturno {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes período noturno"
    type: number
    sql: ${TABLE}."ING_NOTURNO" ;;
  }

  dimension: ing_nrpfies {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. ingressantes financiamento pela IES"
    description: "Quantidade de ingressante no curso - alunos que utilizam financiamento estudantil  não reembolsável - administrado pela instituição"
    type: number
    sql: ${TABLE}."ING_NRPFIES" ;;
  }

  dimension: ing_outra_forma {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes por outras formas"
    type: number
    sql: ${TABLE}."ING_OUTRA_FORMA" ;;
  }

  dimension: ing_parda {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes cor/raça Parda"
    type: number
    sql: ${TABLE}."ING_PARDA" ;;
  }

  dimension: ing_preta {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes cor/raça Preta"
    type: number
    sql: ${TABLE}."ING_PRETA" ;;
  }

  dimension: ing_procescprivada {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes ens. médio privada"
    description: "Quantidade de ingressante que terminaram o médio em escolas privadas"
    type: number
    sql: ${TABLE}."ING_PROCESCPRIVADA" ;;
  }

  dimension: ing_procescpublica {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes ens. médio pública"
    description: "Quantidade de ingressante que terminaram o médio em escolas públicas"
    type: number
    sql: ${TABLE}."ING_PROCESCPUBLICA" ;;
  }

  dimension: ing_procnaoinformada {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes ens. médio não informado"
    type: number
    sql: ${TABLE}."ING_PROCNAOINFORMADA" ;;
  }

  dimension: ing_prounii {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. ingressantes PROUNI integral"
    description: "Quantidade de ingressante no curso - alunos que utilizam financiamento estudantil  não reembolsável  - PROUNI Integral"
    type: number
    sql: ${TABLE}."ING_PROUNII" ;;
  }

  dimension: ing_prounip {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. ingressantes PROUNI parcial"
    description: "Quantidade de ingressante no curso - alunos que utilizam financiamento estudantil  não reembolsável  - PROUNI Parcial"
    type: number
    sql: ${TABLE}."ING_PROUNIP" ;;
  }

  dimension: ing_reserva_vaga {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes reserva vaga"
    type: number
    sql: ${TABLE}."ING_RESERVA_VAGA" ;;
  }

  dimension: ing_rpfies {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. ingressantes financiamento reembolsável pela IES"
    description: "Quantidade de ingressante no curso - alunos que utilizam financiamento estudantil  reembolsável - administrado pela instituição"
    type: number
    sql: ${TABLE}."ING_RPFIES" ;;
  }

  dimension: ing_rvetinico {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes reserva vaga ética"
    description: "Quantidade de ingressante no curso - alunos que participa do programa de reserva de vagas - cunho étnico"
    type: number
    sql: ${TABLE}."ING_RVETINICO" ;;
  }

  dimension: ing_rvoutros {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes reserva vaga - outros"
    description: "Quantidade de ingressante no curso - alunos que participa do programa de reserva de vagas - outros tipos"
    type: number
    sql: ${TABLE}."ING_RVOUTROS" ;;
  }

  dimension: ing_rvpdef {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes reserva vaga deficiência"
    type: number
    sql: ${TABLE}."ING_RVPDEF" ;;
  }

  dimension: ing_rvredepublica {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes reserva vaga rede pública"
    description: "Quantidade de ingressante no curso - alunos que participa do programa de reserva de vagas - escola pública"
    type: number
    sql: ${TABLE}."ING_RVREDEPUBLICA" ;;
  }

  dimension: ing_rvsocial_rf {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes reserva vaga social/renda"
    description: "Quantidade de ingressante no curso - alunos que participa do programa de reserva de vagas - cunho social/renda familiar"
    type: number
    sql: ${TABLE}."ING_RVSOCIAL_RF" ;;
  }

  dimension: ing_selecao_simplifica {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes seleção simplificada"
    type: number
    sql: ${TABLE}."ING_SELECAO_SIMPLIFICA" ;;
  }

  dimension: ing_vestibular {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes por vestibular"
    type: number
    sql: ${TABLE}."ING_VESTIBULAR" ;;
  }

  dimension: ing_vg_nova {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes vagas novas"
    description: "Quantidade de ingressos em vagas novas oferecidas no curso"
    type: number
    sql: ${TABLE}."ING_VG_NOVA" ;;
  }

  dimension: ing_vg_prog_especial {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes programa especial"
    description: "Quantidade de ingressos no curso por meio de vagas para programas especiais"
    type: number
    sql: ${TABLE}."ING_VG_PROG_ESPECIAL" ;;
  }

  dimension: ing_vg_remanesc {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. ingressantes vagas remanescentes"
    type: number
    sql: ${TABLE}."ING_VG_REMANESC" ;;
  }

  dimension: mat_0_17 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas até 17 anos"
    type: number
    sql: ${TABLE}."MAT_0_17" ;;
  }

  dimension: mat_18_24 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas de 18 a 24 anos"
    type: number
    sql: ${TABLE}."MAT_18_24" ;;
  }

  dimension: mat_25_29 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas de 25 a 29 anos"
    type: number
    sql: ${TABLE}."MAT_25_29" ;;
  }

  dimension: mat_30_34 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas de 30 a 34 anos"
    type: number
    sql: ${TABLE}."MAT_30_34" ;;
  }

  dimension: mat_35_39 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas de 35 a 39 anos"
    type: number
    sql: ${TABLE}."MAT_35_39" ;;
  }

  dimension: mat_40_49 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas de 40 a 49 anos"
    type: number
    sql: ${TABLE}."MAT_40_49" ;;
  }

  dimension: mat_50_59 {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas de 50 a 59 anos"
    type: number
    sql: ${TABLE}."MAT_50_59" ;;
  }

  dimension: mat_60_mais {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas de 60 anos ou mais"
    type: number
    sql: ${TABLE}."MAT_60_MAIS" ;;
  }

  dimension: mat_aluno_deficiente {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas deficiências"
    type: number
    sql: ${TABLE}."MAT_ALUNO_DEFICIENTE" ;;
  }

  dimension: mat_aluno_parfor {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas PARFOR"
    description: "Quantidade de matrículas de aluno que participa do programa especial para a formação de professores em exercício na rede pública de educação básica (PARFOR)"
    type: number
    sql: ${TABLE}."MAT_ALUNO_PARFOR" ;;
  }

  dimension: mat_amarela {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas cor/raça Amarela"
    type: number
    sql: ${TABLE}."MAT_AMARELA" ;;
  }

  dimension: mat_apoio_social {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas apoio social"
    description: "Quantidade de matricula de aluno que recebe algum tipo de apoio"
    type: number
    sql: ${TABLE}."MAT_APOIO_SOCIAL" ;;
  }

  dimension: mat_ativ_extracurricular {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas atividade extracurricular"
    type: number
    sql: ${TABLE}."MAT_ATIV_EXTRACURRICULAR" ;;
  }

  dimension: mat_branca {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas cor/raça Branca"
    type: number
    sql: ${TABLE}."MAT_BRANCA" ;;
  }

  dimension: mat_cornd {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas cor/raça não declarada"
    type: number
    sql: ${TABLE}."MAT_CORND" ;;
  }

  dimension: mat_fies {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. matrículas FIES"
    description: "Quantidade de matrículas no curso - alunos que utilizam financiamento estudantil  reembolsável  - FIES"
    type: number
    sql: ${TABLE}."MAT_FIES" ;;
  }

  dimension: mat_financ {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. matrículas finaciamento"
    description: "Quantidade de matrículas no curso - alunos que utilizam financiamento estudantil "
    type: number
    sql: ${TABLE}."MAT_FINANC" ;;
  }

  dimension: mat_financ_nreemb {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. matrículas finaciamento NR"
    description: "Quantidade de matrículas no curso - alunos que utilizam financiamento estudantil não reembolsável"
    type: number
    sql: ${TABLE}."MAT_FINANC_NREEMB" ;;
  }

  dimension: mat_financ_nreemb_outros {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. matrículas finaciamento NR - outros"
    description: "Quantidade de matrículas no curso - alunos que utilizam financiamento estudantil não  reembolsável - pelo governo estadual, municipal, entidades externas à IES e outras entidades."
    type: number
    sql: ${TABLE}."MAT_FINANC_NREEMB_OUTROS" ;;
  }

  dimension: mat_financ_reemb {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. matrículas finaciamento reembolsável"
    description: "Quantidade de matrículas no curso - alunos que utilizam financiamento estudantil  reembolsável"
    type: number
    sql: ${TABLE}."MAT_FINANC_REEMB" ;;
  }

  dimension: mat_financ_reemb_outros {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. matrículas finaciamento reembolsável - outros"
    description: "Quantidade de matrículas no curso - alunos que utilizam financiamento estudantil  reembolsável - pelo governo estadual, municipal, entidades externas à IES e outras entidades."
    type: number
    sql: ${TABLE}."MAT_FINANC_REEMB_OUTROS" ;;
  }

  dimension: mat_indigena {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas cor/raça Indígena"
    type: number
    sql: ${TABLE}."MAT_INDIGENA" ;;
  }

  dimension: mat_mob_academica {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas mobilidade acadêmica"
    type: number
    sql: ${TABLE}."MAT_MOB_ACADEMICA" ;;
  }

  dimension: mat_nacbras {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas nac. brasileira"
    type: number
    sql: ${TABLE}."MAT_NACBRAS" ;;
  }

  dimension: mat_nacestrang {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas nac. estrangeira"
    type: number
    sql: ${TABLE}."MAT_NACESTRANG" ;;
  }

  dimension: mat_nrpfies {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. matrículas não reembolsável IES"
    description: "Quantidade de matrículas no curso - alunos que utilizam financiamento estudantil  não reembolsável - administrado pela instituição"
    type: number
    sql: ${TABLE}."MAT_NRPFIES" ;;
  }

  dimension: mat_parda {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas cor/raça Parda"
    type: number
    sql: ${TABLE}."MAT_PARDA" ;;
  }

  dimension: mat_preta {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas cor/raça Preta"
    type: number
    sql: ${TABLE}."MAT_PRETA" ;;
  }

  dimension: mat_procescprivada {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas ens. médio privada"
    description: "Quantidade de matrículas de alunos que terminaram o médio em escolas privadas"
    type: number
    sql: ${TABLE}."MAT_PROCESCPRIVADA" ;;
  }

  dimension: mat_procescpublica {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas ens. médio pública"
    description: "Quantidade de matrículas de alunos que terminaram o médio em escolas públicas"
    type: number
    sql: ${TABLE}."MAT_PROCESCPUBLICA" ;;
  }

  dimension: mat_procnaoinformada {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas ens. médio não informado"
    type: number
    sql: ${TABLE}."MAT_PROCNAOINFORMADA" ;;
  }

  dimension: mat_prounii {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. matrículas PROUNI - Integral"
    description: "Quantidade de matrículas no curso - alunos que utilizam financiamento estudantil  não reembolsável  - PROUNI Integral"
    type: number
    sql: ${TABLE}."MAT_PROUNII" ;;
  }

  dimension: mat_prounip {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. matrículas PROUNI - Parcial"
    description: "Quantidade de matrículas no curso - alunos que utilizam financiamento estudantil  não reembolsável  - PROUNI Parcial"
    type: number
    sql: ${TABLE}."MAT_PROUNIP" ;;
  }

  dimension: mat_reserva_vaga {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas reserva vaga"
    type: number
    sql: ${TABLE}."MAT_RESERVA_VAGA" ;;
  }

  dimension: mat_rpfies {
    group_label: "Dados quantitativos financiamento estudantil"
    label: "Qtd. matrículas finan. reembolsável IES"
    description: "Quantidade de matrículas no curso - alunos que utilizam financiamento estudantil  reembolsável - administrado pela instituição"
    type: number
    sql: ${TABLE}."MAT_RPFIES" ;;
  }

  dimension: mat_rvetinico {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas reserva vaga ética"
    description: "Quantidade de matrículas no curso - alunos que participa do programa de reserva de vagas - cunho étnico"
    type: number
    sql: ${TABLE}."MAT_RVETINICO" ;;
  }

  dimension: mat_rvoutros {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas reserva vaga outros"
    type: number
    sql: ${TABLE}."MAT_RVOUTROS" ;;
  }

  dimension: mat_rvpdef {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas reserva vaga deficiência"
    type: number
    sql: ${TABLE}."MAT_RVPDEF" ;;
  }

  dimension: mat_rvredepublica {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas reserva vaga escola pública"
    type: number
    sql: ${TABLE}."MAT_RVREDEPUBLICA" ;;
  }

  dimension: mat_rvsocial_rf {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas reserva vaga social/renda"
    type: number
    sql: ${TABLE}."MAT_RVSOCIAL_RF" ;;
  }

  dimension: mob_academica {
    type: number
    sql: ${TABLE}."MOB_ACADEMICA" ;;
  }

  dimension: no_bairro_ies {
    group_label: "Dados IES"
    label: "Bairro IES"
    type: string
    sql: ${TABLE}."NO_BAIRRO_IES" ;;
  }

  dimension: no_cine_area_detalhada {
    group_label: "Dados do curso"
    label: "Nome Cine da área detalhada"
    description: "Nome da área detalhada, conforme adaptação da Classificação Internacional Normalizada da Educação Cine/Unesco"
    type: string
    sql: ${TABLE}."NO_CINE_AREA_DETALHADA" ;;
  }

  dimension: no_cine_area_especifica {
    group_label: "Dados do curso"
    label: "Nome Cine da área específica"
    description: "Nome da área específica, conforme adaptação da Classificação Internacional Normalizada da Educação Cine/Unesco"
    type: string
    sql: ${TABLE}."NO_CINE_AREA_ESPECIFICA" ;;
  }

  dimension: no_cine_area_geral {
    group_label: "Dados do curso"
    label: "Nome Cine da área geral"
    description: "Nome da área geral, conforme adaptação da Classificação Internacional Normalizada da Educação Cine/Unesco"
    type: string
    sql: ${TABLE}."NO_CINE_AREA_GERAL" ;;
  }

  dimension: no_cine_rotulo {
    group_label: "Dados do curso"
    label: "Nome do rótulo Cine"
    description: "Nome do curso, conforme adaptação da Classificação Internacional Normalizada da Educação Cine/Unesco"
    type: string
    sql: ${TABLE}."NO_CINE_ROTULO" ;;
  }

  dimension: no_ies {
    group_label: "Dados IES"
    label: "IES"
    type: string
    sql: ${TABLE}."NO_IES" ;;
  }

  dimension: no_mantenedora {
    group_label: "Dados IES"
    label: "Mantenedora IES"
    type: string
    sql: ${TABLE}."NO_MANTENEDORA" ;;
  }

  dimension: no_mesorregiao_ies {
    group_label: "Dados IES"
    label: "Messoregião IES"
    type: string
    sql: ${TABLE}."NO_MESORREGIAO_IES" ;;
  }

  dimension: no_microrregiao_ies {
    group_label: "Dados IES"
    label: "Microrregião IES"
    type: string
    sql: ${TABLE}."NO_MICRORREGIAO_IES" ;;
  }

  dimension: no_municipio {
    group_label: "Dados do curso - Local de Oferta"
    label: "Município - Local de oferta"
    description: "Nome do Município do local de oferta do curso"
    type: string
    sql: ${TABLE}."NO_MUNICIPIO" ;;
  }

  dimension: no_municipio_ies {
    group_label: "Dados IES"
    label: "Município IES"
    type: string
    sql: ${TABLE}."NO_MUNICIPIO_IES" ;;
  }

  dimension: no_organizacao_academica {
    group_label: "Dados IES"
    label: "Organização acadêmica IES"
    type: string
    sql: ${TABLE}."NO_ORGANIZACAO_ACADEMICA" ;;
  }

  dimension: no_regiao {
    group_label: "Dados do curso - Local de Oferta"
    label: "Região - Local de oferta"
    description: "Nome da região geográfica do local de oferta do curso"
    type: string
    sql: ${TABLE}."NO_REGIAO" ;;
  }

  dimension: no_regiao_ies {
    group_label: "Dados IES"
    label: "Região IES"
    type: string
    sql: ${TABLE}."NO_REGIAO_IES" ;;
  }

  dimension: no_tp_categoria_administrativa {
    group_label: "Dados IES"
    label: "Categoria administrativa IES"
    type: string
    sql: ${TABLE}."NO_TP_CATEGORIA_ADMINISTRATIVA" ;;
  }

  dimension: no_tp_grau_academico {
    group_label: "Dados do curso"
    label: "Grau acadêmico"
    description: "Tipo do grau acadêmico conferido ao ao aluno pela conclusão dos requisitos exigidos pelo curso"
    type: string
    sql: ${TABLE}."NO_TP_GRAU_ACADEMICO" ;;
  }

  dimension: no_tp_modalidade_ensino {
    group_label: "Dados do curso"
    label: "Modalidade de ensino"
    type: string
    sql: ${TABLE}."NO_TP_MODALIDADE_ENSINO" ;;
  }

  dimension: no_tp_nivel_academico {
    group_label: "Dados do curso"
    label: "Tipo de nível acadêmico do curso"
    type: string
    sql: ${TABLE}."NO_TP_NIVEL_ACADEMICO" ;;
  }

  dimension: no_tp_rede {
    group_label: "Dados IES"
    label: "Rede de Ensino IES"
    type: string
    sql: ${TABLE}."NO_TP_REDE" ;;
  }

  dimension: no_uf {
    group_label: "Dados do curso - Local de Oferta"
    label: "UF - Local de oferta"
    description: "Nome da Unidade da Federação do local de oferta do curso"
    type: string
    sql: ${TABLE}."NO_UF" ;;
  }

  dimension: no_uf_ies {
    group_label: "Dados IES"
    label: "UF - IES"
    type: string
    sql: ${TABLE}."NO_UF_IES" ;;
  }

  dimension: nu_ano_censo {
    type: number
    label: "Ano Censo"
    sql: ${TABLE}."NU_ANO_CENSO" ;;
  }

  dimension: nu_cep_ies {
    group_label: "Dados IES"
    label: "CEP - IES"
    type: number
    sql: ${TABLE}."NU_CEP_IES" ;;
  }

  dimension: qt_conc {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. concluintes no curso"
    type: number
    sql: ${TABLE}."QT_CONC" ;;
  }

  dimension: qt_curso {
    group_label: "Dados quantitativos do Curso"
    label: "Número de cursos"
    type: number
    sql: ${TABLE}."QT_CURSO" ;;
  }

  dimension: qt_docente_exe {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Total docentes em exercício"
    type: number
    sql: ${TABLE}."QT_DOCENTE_EXE" ;;
  }

  dimension: qt_docente_total {
    group_label: "Dados quantitativos dos Docentes IES"
    label: "Total docentes"
    type: number
    sql: ${TABLE}."QT_DOCENTE_TOTAL" ;;
  }

  dimension: qt_ing {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. de ingressantes no curso"
    type: number
    sql: ${TABLE}."QT_ING" ;;
  }

  dimension: qt_ing_60_mais {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. de ingressantes 60 anos ou mais"
    type: number
    sql: ${TABLE}."QT_ING_60_MAIS" ;;
  }

  dimension: qt_insc_vg_nova {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. de inscritos vaga nova"
    type: number
    sql: ${TABLE}."QT_INSC_VG_NOVA" ;;
  }

  dimension: qt_insc_vg_prog_especial {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. de inscritos programa especial"
    type: number
    sql: ${TABLE}."QT_INSC_VG_PROG_ESPECIAL" ;;
  }

  dimension: qt_insc_vg_remanesc {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. de inscritos vagas remanescentes"
    type: number
    sql: ${TABLE}."QT_INSC_VG_REMANESC" ;;
  }

  dimension: qt_inscrito_total {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. total de inscritos"
    type: number
    sql: ${TABLE}."QT_INSCRITO_TOTAL" ;;
  }

  dimension: qt_inscrito_total_diurno {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. total de inscritos período diurno"
    type: number
    sql: ${TABLE}."QT_INSCRITO_TOTAL_DIURNO" ;;
  }

  dimension: qt_inscrito_total_ead {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. total de inscritos EAD"
    type: number
    sql: ${TABLE}."QT_INSCRITO_TOTAL_EAD" ;;
  }

  dimension: qt_inscrito_total_noturno {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. total de inscritos período noturno"
    type: number
    sql: ${TABLE}."QT_INSCRITO_TOTAL_NOTURNO" ;;
  }

  dimension: qt_livro_eletronico {
    group_label: "Dados IES"
    label: "Qtd. livros eletrônicos"
    description: "Quantidade de títulos de livros eletrônicos disponibilizados pela biblioteca convertidos ao formato digital ou originalmente produzidos nesse formato para serem lidos em computador ou outros dispositivos."
    type: number
    sql: ${TABLE}."QT_LIVRO_ELETRONICO" ;;
  }

  dimension: qt_mat {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. total de matrículas"
    type: number
    sql: ${TABLE}."QT_MAT" ;;
  }

  dimension: qt_mat_diurno {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas período diurno"
    type: number
    sql: ${TABLE}."QT_MAT_DIURNO" ;;
  }

  dimension: qt_mat_fem {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas sexo feminino"
    type: number
    sql: ${TABLE}."QT_MAT_FEM" ;;
  }

  dimension: qt_mat_masc {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas sexo masculino"
    type: number
    sql: ${TABLE}."QT_MAT_MASC" ;;
  }

  dimension: qt_mat_noturno {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. matrículas período noturno"
    type: number
    sql: ${TABLE}."QT_MAT_NOTURNO" ;;
  }

  dimension: qt_periodico_eletronico {
    group_label: "Dados IES"
    label: "Qtd. periódico eletrônico"
    description: "Quantidade de títulos de periódicos eletrônicos adquiridos pelas bibliotecas por meio de compra, doação ou permuta."
    type: number
    sql: ${TABLE}."QT_PERIODICO_ELETRONICO" ;;
  }

  dimension: qt_tec_doutorado_fem {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin feminino com doutorado"
    description: "Quantidade de funcionários técnico-administrativos do sexo feminino com doutorado"
    type: number
    sql: ${TABLE}."QT_TEC_DOUTORADO_FEM" ;;
  }

  dimension: qt_tec_doutorado_masc {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin masculino com doutorado"
    description: "Quantidade de funcionários técnico-administrativos do sexo masculino com doutorado"
    type: number
    sql: ${TABLE}."QT_TEC_DOUTORADO_MASC" ;;
  }

  dimension: qt_tec_especializacao_fem {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin feminino com especialização"
    description: "Quantidade de funcionários técnico-administrativos do sexo feminino com especialização"
    type: number
    sql: ${TABLE}."QT_TEC_ESPECIALIZACAO_FEM" ;;
  }

  dimension: qt_tec_especializacao_masc {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin masculino com especialização"
    description: "Quantidade de funcionários técnico-administrativos do sexo masculino com especialização"
    type: number
    sql: ${TABLE}."QT_TEC_ESPECIALIZACAO_MASC" ;;
  }

  dimension: qt_tec_fundamental_comp_fem {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin feminino com fundamental"
    description: "Quantidade de funcionários técnico-administrativos do sexo feminino com ensino fundamental completo"
    type: number
    sql: ${TABLE}."QT_TEC_FUNDAMENTAL_COMP_FEM" ;;
  }

  dimension: qt_tec_fundamental_comp_masc {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin masculino com fundamental"
    description: "Quantidade de funcionários técnico-administrativos do sexo masculino com ensino fundamental completo"
    type: number
    sql: ${TABLE}."QT_TEC_FUNDAMENTAL_COMP_MASC" ;;
  }

  dimension: qt_tec_fundamental_incomp_fem {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin feminino com fundamental inc."
    description: "Quantidade de funcionários técnico-administrativos do sexo feminino com ensino fundamental incompleto"
    type: number
    sql: ${TABLE}."QT_TEC_FUNDAMENTAL_INCOMP_FEM" ;;
  }

  dimension: qt_tec_fundamental_incomp_masc {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin masculino com fundamental inc."
    description: "Quantidade de funcionários técnico-administrativos do sexo masculino com ensino fundamental incompleto"
    type: number
    sql: ${TABLE}."QT_TEC_FUNDAMENTAL_INCOMP_MASC" ;;
  }

  dimension: qt_tec_medio_fem {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin feminino com ens. médio"
    description: "Quantidade de funcionários técnico-administrativos do sexo feminino com ensino médio"
    type: number
    sql: ${TABLE}."QT_TEC_MEDIO_FEM" ;;
  }

  dimension: qt_tec_medio_masc {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin masculino com ens. médio"
    description: "Quantidade de funcionários técnico-administrativos do sexo masculino com ensino médio"
    type: number
    sql: ${TABLE}."QT_TEC_MEDIO_MASC" ;;
  }

  dimension: qt_tec_mestrado_fem {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin feminino com mestrado"
    description: "Quantidade de funcionários técnico-administrativos do sexo feminino com mestrado"
    type: number
    sql: ${TABLE}."QT_TEC_MESTRADO_FEM" ;;
  }

  dimension: qt_tec_mestrado_masc {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin masculino com mestrado"
    description: "Quantidade de funcionários técnico-administrativos do sexo masculino com mestrado"
    type: number
    sql: ${TABLE}."QT_TEC_MESTRADO_MASC" ;;
  }

  dimension: qt_tec_superior_fem {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin feminino com superior"
    description: "Quantidade de funcionários técnico-administrativos do sexo feminino com superior"
    type: number
    sql: ${TABLE}."QT_TEC_SUPERIOR_FEM" ;;
  }

  dimension: qt_tec_superior_masc {
    group_label: "Dados IES"
    label: "Qtd. func. téc.admin masculino com superior"
    description: "Quantidade de funcionários técnico-administrativos do sexo masculino com superior"
    type: number
    sql: ${TABLE}."QT_TEC_SUPERIOR_MASC" ;;
  }

  dimension: qt_tec_total {
    group_label: "Dados IES"
    label: "Qtd. total de func. téc. admin"
    type: number
    sql: ${TABLE}."QT_TEC_TOTAL" ;;
  }

  dimension: qt_vaga_total {
    group_label: "Dados quantitativos do Curso"
    label: "Total vagas ofertadas"
    type: number
    sql: ${TABLE}."QT_VAGA_TOTAL" ;;
  }

  dimension: qt_vaga_total_diurno {
    group_label: "Dados quantitativos do Curso"
    label: "Total vagas diurnas ofertadas"
    type: number
    sql: ${TABLE}."QT_VAGA_TOTAL_DIURNO" ;;
  }

  dimension: qt_vaga_total_ead {
    group_label: "Dados quantitativos do Curso"
    label: "Total de vagas EAD ofertadas"
    type: number
    sql: ${TABLE}."QT_VAGA_TOTAL_EAD" ;;
  }

  dimension: qt_vaga_total_noturno {
    group_label: "Dados quantitativos do Curso"
    label: "Total vagas noturnas ofertadas"
    type: number
    sql: ${TABLE}."QT_VAGA_TOTAL_NOTURNO" ;;
  }

  dimension: qt_vg_nova {
    group_label: "Dados quantitativos do Curso"
    label: "Total de vagas novas ofertadas"
    type: number
    sql: ${TABLE}."QT_VG_NOVA" ;;
  }

  dimension: qt_vg_prog_especial {
    group_label: "Dados quantitativos do Curso"
    label: "Total de vagas programa especial ofertadas"
    type: number
    sql: ${TABLE}."QT_VG_PROG_ESPECIAL" ;;
  }

  dimension: qt_vg_remanesc {
    group_label: "Dados quantitativos do Curso"
    label: "Total de vagas remanescentes ofertadas"
    type: number
    sql: ${TABLE}."QT_VG_REMANESC" ;;
  }

  dimension: sg_ies {
    group_label: "Dados IES"
    label: "Sigla IES"
    type: string
    sql: ${TABLE}."SG_IES" ;;
  }

  dimension: sg_uf {
    group_label: "Dados do curso - Local de Oferta"
    label: "Sigla UF - Local de oferta"
    description: "Sigla da Unidade da Federação do local de oferta do curso"
    type: string
    sql: ${TABLE}."SG_UF" ;;
  }

  dimension: sg_uf_ies {
    group_label: "Dados IES"
    type: string
    sql: ${TABLE}."SG_UF_IES" ;;
  }

  dimension: sit_desvinculado {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. alunos desvinculados"
    description: "Quantidade de alunos com situação de vínculo no curso - aluno desvinculado do curso"
    type: number
    sql: ${TABLE}."SIT_DESVINCULADO" ;;
  }

  dimension: sit_falecido {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. alunos falecidos"
    type: number
    sql: ${TABLE}."SIT_FALECIDO" ;;
  }

  dimension: sit_trancada {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. alunos matrí. trancada"
    type: number
    sql: ${TABLE}."SIT_TRANCADA" ;;
  }

  dimension: sit_transferido {
    group_label: "Dados quantitativos do Curso"
    label: "Qtd. alunos transferidos"
    description: "Quantidade de alunos com situação de vínculo no curso - aluno transferido para outro curso da mesma IES"
    type: number
    sql: ${TABLE}."SIT_TRANSFERIDO" ;;
  }

  dimension: tp_categoria_administrativa {
    group_label: "Dados IES"
    label: "Código da Categoria administrativa IES"
    type: number
    sql: ${TABLE}."TP_CATEGORIA_ADMINISTRATIVA" ;;
  }

  dimension: tp_grau_academico {
    group_label: "Dados IES"
    label: "Código do Grau Acadêmico da IES"
    type: number
    sql: ${TABLE}."TP_GRAU_ACADEMICO" ;;
  }

  dimension: tp_modalidade_ensino {
    group_label: "Dados IES"
    label: "Código da Modalidade de Ensino IES"
    type: number
    sql: ${TABLE}."TP_MODALIDADE_ENSINO" ;;
  }

  dimension: tp_nivel_academico {
    group_label: "Dados IES"
    label: "Código do Nível Acadêmico IES"
    type: number
    sql: ${TABLE}."TP_NIVEL_ACADEMICO" ;;
  }

  dimension: tp_organizacao_academica {
    group_label: "Dados IES"
    label: "Código da Organização Acadêmica IES"
    type: number
    sql: ${TABLE}."TP_ORGANIZACAO_ACADEMICA" ;;
  }

  dimension: tp_rede {
    group_label: "Dados IES"
    label: "Código da Rede de  Ensino IES"
    type: number
    sql: ${TABLE}."TP_REDE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
