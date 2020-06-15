view: inep {
  sql_table_name: "SELF_SERVICE_BI"."INEP"
    ;;

  dimension: ano_censo {
    type: number
    sql: ${TABLE}."ANO_CENSO" ;;
  }

  dimension: ano_ingresso {
    type: number
    sql: ${TABLE}."ANO_INGRESSO" ;;
  }

  dimension: carga_horaria_curso {
    type: number
    sql: ${TABLE}."CARGA_HORARIA_CURSO" ;;
  }

  dimension: ds_categoria_administrativa {
    type: string
    sql: ${TABLE}."DS_CATEGORIA_ADMINISTRATIVA" ;;
  }

  dimension: ds_curso {
    type: string
    sql: ${TABLE}."DS_CURSO" ;;
  }

  dimension: ds_data_autorizacao_curso {
    type: string
    sql: ${TABLE}."DS_DATA_AUTORIZACAO_CURSO" ;;
  }

  dimension: ds_data_ingresso_curso {
    type: string
    sql: ${TABLE}."DS_DATA_INGRESSO_CURSO" ;;
  }

  dimension: ds_data_inicio_func {
    type: string
    sql: ${TABLE}."DS_DATA_INICIO_FUNC" ;;
  }

  dimension: ds_data_nascimento {
    type: string
    sql: ${TABLE}."DS_DATA_NASCIMENTO" ;;
  }

  dimension: ds_escola_ens_medio {
    type: string
    sql: ${TABLE}."DS_ESCOLA_ENS_MEDIO" ;;
  }

  dimension: ds_grau_academico {
    type: string
    sql: ${TABLE}."DS_GRAU_ACADEMICO" ;;
  }

  dimension: ds_ies {
    type: string
    sql: ${TABLE}."DS_IES" ;;
  }

  dimension: ds_ies_destino {
    type: string
    sql: ${TABLE}."DS_IES_DESTINO" ;;
  }

  dimension: ds_mantenedora {
    type: string
    sql: ${TABLE}."DS_MANTENEDORA" ;;
  }

  dimension: ds_mob_acad {
    type: string
    sql: ${TABLE}."DS_MOB_ACAD" ;;
  }

  dimension: ds_mob_acad_intern {
    type: string
    sql: ${TABLE}."DS_MOB_ACAD_INTERN" ;;
  }

  dimension: ds_modalidade_ensino {
    type: string
    sql: ${TABLE}."DS_MODALIDADE_ENSINO" ;;
  }

  dimension: ds_municipio_ies {
    type: string
    sql: ${TABLE}."DS_MUNICIPIO_IES" ;;
  }

  dimension: ds_nacionalidade {
    type: string
    sql: ${TABLE}."DS_NACIONALIDADE" ;;
  }

  dimension: ds_nivel_academico {
    type: string
    sql: ${TABLE}."DS_NIVEL_ACADEMICO" ;;
  }

  dimension: ds_organizacao_academica {
    type: string
    sql: ${TABLE}."DS_ORGANIZACAO_ACADEMICA" ;;
  }

  dimension: ds_pais {
    type: string
    sql: ${TABLE}."DS_PAIS" ;;
  }

  dimension: ds_pais_destino {
    type: string
    sql: ${TABLE}."DS_PAIS_DESTINO" ;;
  }

  dimension: ds_referente_ies {
    type: string
    sql: ${TABLE}."DS_REFERENTE_IES" ;;
  }

  dimension: ds_semestre_conclusao {
    type: string
    sql: ${TABLE}."DS_SEMESTRE_CONCLUSAO" ;;
  }

  dimension: ds_semestre_referencia {
    type: string
    sql: ${TABLE}."DS_SEMESTRE_REFERENCIA" ;;
  }

  dimension: ds_sexo {
    type: string
    sql: ${TABLE}."DS_SEXO" ;;
  }

  dimension: ds_situacao_curso {
    type: string
    sql: ${TABLE}."DS_SITUACAO_CURSO" ;;
  }

  dimension: ds_turno {
    type: string
    sql: ${TABLE}."DS_TURNO" ;;
  }

  dimension: flg_apoio_alimentacao {
    type: yesno
    sql: ${TABLE}."FLG_APOIO_ALIMENTACAO" ;;
  }

  dimension: flg_apoio_bolsa_permanencia {
    type: yesno
    sql: ${TABLE}."FLG_APOIO_BOLSA_PERMANENCIA" ;;
  }

  dimension: flg_apoio_bolsa_trabalho {
    type: yesno
    sql: ${TABLE}."FLG_APOIO_BOLSA_TRABALHO" ;;
  }

  dimension: flg_apoio_material_didatico {
    type: yesno
    sql: ${TABLE}."FLG_APOIO_MATERIAL_DIDATICO" ;;
  }

  dimension: flg_apoio_moradia {
    type: yesno
    sql: ${TABLE}."FLG_APOIO_MORADIA" ;;
  }

  dimension: flg_apoio_social {
    type: yesno
    sql: ${TABLE}."FLG_APOIO_SOCIAL" ;;
  }

  dimension: flg_apoio_transporte {
    type: yesno
    sql: ${TABLE}."FLG_APOIO_TRANSPORTE" ;;
  }

  dimension: flg_atividade_extracurricular {
    type: yesno
    sql: ${TABLE}."FLG_ATIVIDADE_EXTRACURRICULAR" ;;
  }

  dimension: flg_bolsa_estagio {
    type: yesno
    sql: ${TABLE}."FLG_BOLSA_ESTAGIO" ;;
  }

  dimension: flg_bolsa_extensao {
    type: yesno
    sql: ${TABLE}."FLG_BOLSA_EXTENSAO" ;;
  }

  dimension: flg_bolsa_monitoria {
    type: yesno
    sql: ${TABLE}."FLG_BOLSA_MONITORIA" ;;
  }

  dimension: flg_bolsa_pesquisa {
    type: yesno
    sql: ${TABLE}."FLG_BOLSA_PESQUISA" ;;
  }

  dimension: flg_capital_ies {
    type: yesno
    sql: ${TABLE}."FLG_CAPITAL_IES" ;;
  }

  dimension: flg_complementar_estagio {
    type: yesno
    sql: ${TABLE}."FLG_COMPLEMENTAR_ESTAGIO" ;;
  }

  dimension: flg_complementar_extensao {
    type: yesno
    sql: ${TABLE}."FLG_COMPLEMENTAR_EXTENSAO" ;;
  }

  dimension: flg_complementar_monitoria {
    type: yesno
    sql: ${TABLE}."FLG_COMPLEMENTAR_MONITORIA" ;;
  }

  dimension: flg_complementar_pesquisa {
    type: yesno
    sql: ${TABLE}."FLG_COMPLEMENTAR_PESQUISA" ;;
  }

  dimension: flg_concluinte {
    type: yesno
    sql: ${TABLE}."FLG_CONCLUINTE" ;;
  }

  dimension: flg_deficiencia {
    type: yesno
    sql: ${TABLE}."FLG_DEFICIENCIA" ;;
  }

  dimension: flg_fin_naoreemb_ent_externa {
    type: yesno
    sql: ${TABLE}."FLG_FIN_NAOREEMB_ENT_EXTERNA" ;;
  }

  dimension: flg_fin_naoreemb_estadual {
    type: yesno
    sql: ${TABLE}."FLG_FIN_NAOREEMB_ESTADUAL" ;;
  }

  dimension: flg_fin_naoreemb_municipal {
    type: yesno
    sql: ${TABLE}."FLG_FIN_NAOREEMB_MUNICIPAL" ;;
  }

  dimension: flg_fin_naoreemb_outra {
    type: yesno
    sql: ${TABLE}."FLG_FIN_NAOREEMB_OUTRA" ;;
  }

  dimension: flg_fin_naoreemb_prog_ies {
    type: yesno
    sql: ${TABLE}."FLG_FIN_NAOREEMB_PROG_IES" ;;
  }

  dimension: flg_fin_naoreemb_prouni_integr {
    type: yesno
    sql: ${TABLE}."FLG_FIN_NAOREEMB_PROUNI_INTEGR" ;;
  }

  dimension: flg_fin_naoreemb_prouni_parcial {
    type: yesno
    sql: ${TABLE}."FLG_FIN_NAOREEMB_PROUNI_PARCIAL" ;;
  }

  dimension: flg_fin_reemb_ent_externa {
    type: yesno
    sql: ${TABLE}."FLG_FIN_REEMB_ENT_EXTERNA" ;;
  }

  dimension: flg_fin_reemb_estadual {
    type: yesno
    sql: ${TABLE}."FLG_FIN_REEMB_ESTADUAL" ;;
  }

  dimension: flg_fin_reemb_fies {
    type: yesno
    sql: ${TABLE}."FLG_FIN_REEMB_FIES" ;;
  }

  dimension: flg_fin_reemb_municipal {
    type: yesno
    sql: ${TABLE}."FLG_FIN_REEMB_MUNICIPAL" ;;
  }

  dimension: flg_fin_reemb_outra {
    type: yesno
    sql: ${TABLE}."FLG_FIN_REEMB_OUTRA" ;;
  }

  dimension: flg_fin_reemb_prog_ies {
    type: yesno
    sql: ${TABLE}."FLG_FIN_REEMB_PROG_IES" ;;
  }

  dimension: flg_financiamento_estudantil {
    type: yesno
    sql: ${TABLE}."FLG_FINANCIAMENTO_ESTUDANTIL" ;;
  }

  dimension: flg_ingresso_avaliacao_seriada {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_AVALIACAO_SERIADA" ;;
  }

  dimension: flg_ingresso_convenio_pecg {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_CONVENIO_PECG" ;;
  }

  dimension: flg_ingresso_decisao_judicial {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_DECISAO_JUDICIAL" ;;
  }

  dimension: flg_ingresso_egresso {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_EGRESSO" ;;
  }

  dimension: flg_ingresso_enem {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_ENEM" ;;
  }

  dimension: flg_ingresso_outra_forma {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_OUTRA_FORMA" ;;
  }

  dimension: flg_ingresso_outro_tipo_selecao {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_OUTRO_TIPO_SELECAO" ;;
  }

  dimension: flg_ingresso_processo_seletivo {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_PROCESSO_SELETIVO" ;;
  }

  dimension: flg_ingresso_selecao_simplifica {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_SELECAO_SIMPLIFICA" ;;
  }

  dimension: flg_ingresso_total {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_TOTAL" ;;
  }

  dimension: flg_ingresso_transf_exofficio {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_TRANSF_EXOFFICIO" ;;
  }

  dimension: flg_ingresso_vaga_nova {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_VAGA_NOVA" ;;
  }

  dimension: flg_ingresso_vaga_prog_especial {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_VAGA_PROG_ESPECIAL" ;;
  }

  dimension: flg_ingresso_vaga_remanesc {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_VAGA_REMANESC" ;;
  }

  dimension: flg_ingresso_vestibular {
    type: yesno
    sql: ${TABLE}."FLG_INGRESSO_VESTIBULAR" ;;
  }

  dimension: flg_integral {
    type: yesno
    sql: ${TABLE}."FLG_INTEGRAL" ;;
  }

  dimension: flg_matricula {
    type: yesno
    sql: ${TABLE}."FLG_MATRICULA" ;;
  }

  dimension: flg_mobilidade_academica {
    type: yesno
    sql: ${TABLE}."FLG_MOBILIDADE_ACADEMICA" ;;
  }

  dimension: flg_noturno {
    type: yesno
    sql: ${TABLE}."FLG_NOTURNO" ;;
  }

  dimension: flg_participa_rede_social {
    type: yesno
    sql: ${TABLE}."FLG_PARTICIPA_REDE_SOCIAL" ;;
  }

  dimension: flg_reserva_deficiencia {
    type: yesno
    sql: ${TABLE}."FLG_RESERVA_DEFICIENCIA" ;;
  }

  dimension: flg_reserva_ensino_publico {
    type: yesno
    sql: ${TABLE}."FLG_RESERVA_ENSINO_PUBLICO" ;;
  }

  dimension: flg_reserva_etnico {
    type: yesno
    sql: ${TABLE}."FLG_RESERVA_ETNICO" ;;
  }

  dimension: flg_reserva_outra {
    type: yesno
    sql: ${TABLE}."FLG_RESERVA_OUTRA" ;;
  }

  dimension: flg_reserva_renda_familiar {
    type: yesno
    sql: ${TABLE}."FLG_RESERVA_RENDA_FAMILIAR" ;;
  }

  dimension: flg_reserva_vagas {
    type: yesno
    sql: ${TABLE}."FLG_RESERVA_VAGAS" ;;
  }

  dimension: flg_servico_internet {
    type: yesno
    sql: ${TABLE}."FLG_SERVICO_INTERNET" ;;
  }

  dimension: flg_vespertino {
    type: yesno
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
    sql: ${TABLE}."ID_CURSO" ;;
  }

  dimension: id_ies {
    type: number
    sql: ${TABLE}."ID_IES" ;;
  }

  dimension: id_municipio_ies {
    type: number
    sql: ${TABLE}."ID_MUNICIPIO_IES" ;;
  }

  dimension: qtd_carga_horaria_integ {
    type: number
    sql: ${TABLE}."QTD_CARGA_HORARIA_INTEG" ;;
  }

  dimension: qtd_carga_horaria_total {
    type: number
    sql: ${TABLE}."QTD_CARGA_HORARIA_TOTAL" ;;
  }

  dimension: qtd_func_total {
    type: number
    sql: ${TABLE}."QTD_FUNC_TOTAL" ;;
  }

  dimension: qtd_vaga_total {
    type: number
    sql: ${TABLE}."QTD_VAGA_TOTAL" ;;
  }

  dimension: qtd_vagas_anual_ead {
    type: number
    sql: ${TABLE}."QTD_VAGAS_ANUAL_EAD" ;;
  }

  dimension: qtd_vagas_anual_integral {
    type: number
    sql: ${TABLE}."QTD_VAGAS_ANUAL_INTEGRAL" ;;
  }

  dimension: qtd_vagas_anual_matutino {
    type: number
    sql: ${TABLE}."QTD_VAGAS_ANUAL_MATUTINO" ;;
  }

  dimension: qtd_vagas_anual_noturno {
    type: number
    sql: ${TABLE}."QTD_VAGAS_ANUAL_NOTURNO" ;;
  }

  dimension: qtd_vagas_anual_vespertino {
    type: number
    sql: ${TABLE}."QTD_VAGAS_ANUAL_VESPERTINO" ;;
  }

  dimension: sgl_ies {
    type: string
    sql: ${TABLE}."SGL_IES" ;;
  }

  dimension: uf_ies {
    type: string
    sql: ${TABLE}."UF_IES" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
