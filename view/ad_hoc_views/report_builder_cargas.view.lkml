view: report_builder_cargas {
  derived_table: {
    sql: select distinct
          status_do_aluno
          ,contrato
          ,cpf
          ,UPPER(TRANSLATE( nome,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as nome
          ,UPPER(TRANSLATE( endereco,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as endereco
          ,UPPER(TRANSLATE( endereco_numero,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as endereco_numero
          ,UPPER(TRANSLATE( endereco_complemento,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as endereco_complemento
          ,UPPER(TRANSLATE( bairro,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as bairro
          ,UPPER(TRANSLATE( cidade,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as cidade
          ,cep
          ,UPPER(TRANSLATE( email,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as email
          ,telefone_ddd
          ,telefone
          ,celular_ddd
          ,celular
          ,UPPER(TRANSLATE( p.fia_nome,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as fia_nome
          ,p.fia_cpf
          ,p.fia_telefone_ddd
          ,p.fia_telefone
          ,p.fia_celular_ddd
          ,p.fia_celular
          ,p.fia_telefone_com_ddd
          ,p.fia_telefone_com
          ,UPPER(TRANSLATE( p.fia_email,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as fia_email
          ,UPPER(TRANSLATE( p.pai,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as pai
          ,p.pai_escolaridade
          ,UPPER(TRANSLATE( p.pai_ocupacao,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as pai_ocupacao
          ,p.pai_telefone_ddd
          ,p.pai_telefone
          ,p.pai_celular_ddd
          ,p.pai_celular
          ,p.pai_telefone_com_ddd
          ,p.pai_telefone_com
          ,UPPER(TRANSLATE( p.mae,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as mae
          ,p.mae_escolaridade
          ,UPPER(TRANSLATE( p.mae_ocupacao,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as mae_ocupacao
          ,p.mae_telefone_ddd
          ,p.mae_telefone
          ,p.mae_celular_ddd
          ,p.mae_celular
          ,p.mae_telefone_com_ddd
          ,p.mae_telefone_com
          ,UPPER(TRANSLATE( ies,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as ies
          ,UPPER(TRANSLATE( produto,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as produto
          ,UPPER(TRANSLATE( tipo_curso,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as tipo_curso
          ,UPPER(TRANSLATE( curso,'ÁÀÃÄÂáàâãäÉÈÊËéèêëÍÌÎÏíìîïÓÒÕÔÖóòôõöÚÙÛÜúùûüÇç','AAAAAaaaaaEEEEeeeeIIIIiiiiOOOOOoooooUUUUuuuuCc') ) as curso
          ,sem_cursando_ult_inf_ies
          ,ies_prev_formatura
          ,semestre_do_curso
          ,parcelas_em_atraso
          ,parcelas_a_vencer
          ,parcelas_pagas
          ,parcela
          ,vecto
          ,data_concessao
          ,REPLACE(TO_CHAR (valor_original,'9999999999.99'),'.',',') AS VALOR_ORIGINAL
          ,atraso
          ,seunum
          ,REPLACE(TO_CHAR ((juros * atraso ) + multa,'9999999999.99'),'.',',') as juros_e_multa
          ,REPLACE(TO_CHAR (case when atraso > 10 then vl_despesa end ,'9999999999.99'),'.',',')as vl_despesa
          ,REPLACE(TO_CHAR (valor_original + ( ((juros * atraso ) + multa) +  (case when atraso > 10 then vl_despesa else 0 end)),'9999999999.99'),'.',',')as divida_atual
          ,tit_writeoff
         ,CASE WHEN tit_writeoff IS NULL THEN 'Nao WO' ELSE 'WO' END AS ALUNO_DE_WO
         ,id_fundo_investimento
         ,CASE WHEN id_fundo_investimento = 4 THEN 'Fundo FIDC'
         WHEN id_fundo_investimento =5 THEN 'Fundo Itau'
         ELSE 'Fundo Gestao' END AS FUNDO
          FROM
              (
                 select
                CASE
                      WHEN st.ID_STATUS_GERAL = 51 AND (strnv.ID_STATUS_GERAL in (2011, 2012, 2013, 2014, 2015, 2022, 2025, 2040, 2041, 2042, 2044, 2046, 2050)) THEN 'ELEGIVEL'
                      WHEN strnv.ID_STATUS_GERAL = 2019 THEN 'REPROVADO PELO RISCO'
                      WHEN strnv.ID_STATUS_GERAL = 2039 AND strnv.ID_STATUS_detalhe = 1 OR strnv.ID_STATUS_GERAL = 2007 AND strnv.ID_STATUS_detalhe = 9 THEN 'FORMADO'
                      WHEN st.ID_STATUS_GERAL = 50 THEN 'ALUNO NOVO PRIMEIRO CONTRATO'
                      WHEN st.ID_STATUS_GERAL = 51 AND strnv.ID_STATUS_GERAL is null THEN 'ALUNO NOVO'
                      WHEN st.ID_STATUS_GERAL = 57 THEN 'ALUNO NOVO NAO PAGOU PRIMEIRO BOLETO'
                      ELSE 'NAO ELEGIVEIS'
                  END AS status_do_aluno
                ,substring(p.id_proposta,5) as contrato
                ,cpf.cpf
                ,cpf.nome
                ,bpp."endereco" endereco
                ,bpp."endereco_numero" endereco_numero
                ,bpp."endereco_complemento" endereco_complemento
                ,cpf.bairro
                ,cpf.cidade
                ,cpf.cep
                ,cpf.email
                ,bpp."telefone_ddd" telefone_ddd
                ,bpp."telefone" telefone
                ,bpp."celular_ddd" celular_ddd
                ,bpp."celular" celular
                ,fcpf.nome fia_nome
                ,fcpf.cpf fia_cpf
                ,bpp."fia_telefone_ddd" fia_telefone_ddd
                ,bpp."fia_telefone" fia_telefone
                ,bpp."fia_celular_ddd" fia_celular_ddd
                ,bpp."fia_celular" fia_celular
                ,bpp."fia_telefone_com_ddd" fia_telefone_com_ddd
                ,bpp."fia_telefone_com" fia_telefone_com
                ,fcpf.email fia_email
                ,i.NOME_FANTASIA ies
                ,ia.SEMESTRE_ALUNO sem_cursando_ult_inf_ies
                  ,bpp."pai" pai
                  ,diep.DS_ESCOLARIDADE as pai_escolaridade
                  ,dop.DS_OCUPACAO as pai_ocupacao
                  ,bpp."pai_telefone_ddd" pai_telefone_ddd
                  ,bpp."pai_telefone" pai_telefone
                  ,bpp."pai_celular_ddd" pai_celular_ddd
                  ,bpp."pai_celular" pai_celular
                  ,bpp."pai_telefone_com_ddd" pai_telefone_com_ddd
                  ,bpp."pai_telefone_com" pai_telefone_com
                  ,bpp."mae" mae
                  ,diem.DS_ESCOLARIDADE as mae_escolaridade
                  ,dom.DS_OCUPACAO as mae_ocupacao
                  ,bpp."mae_telefone_ddd" mae_telefone_ddd
                  ,bpp."mae_telefone" mae_telefone
                  ,bpp."mae_celular_ddd" mae_celular_ddd
                  ,bpp."mae_celular" mae_celular
                  ,bpp."mae_telefone_com_ddd" mae_telefone_com_ddd
                  ,bpp."mae_telefone_com" mae_telefone_com
              ,case   when substring (ANO_MES_FORMACAO, 4 , 4)= null then null
                      when substring (ANO_MES_FORMACAO, 4 , 4) = '0000' then null
                    when length (ANO_MES_FORMACAO)!= 7 then null
                       when substring(ANO_MES_FORMACAO , 1 , 2)::integer  between 01 and 06 then concat(substring (ANO_MES_FORMACAO, 4 , 4) , '-06-30')
                      else concat(substring (ANO_MES_FORMACAO, 4 , 4),  '-12-31')
                    end::date as ies_prev_formatura
                ,DP.NM_PRODUTO as produto

                 ,DTC.DS_TIT_CURSO as tipo_curso

                , dc.PROGRAMA as curso

                ,dc.QTD_SEMESTRE as semestre_do_curso

               ,tpa.atraso as parcelas_em_atraso

                ,tpv.vencer as parcelas_a_vencer

                  ,tpp.pago as parcelas_pagas

                  ,t.NUM_PARCELA parcela
                ,t.DATA_VENCIMENTO vecto
                ,ac.data_concessao
                ,t.VL_BOLETO as valor_original
                ,case when DATA_PAGAMENTO is null and DATA_VENCIMENTO < current_date then current_date - DATA_VENCIMENTO end as atraso
                ,t.VL_MULTA multa
                ,t.VL_JUROS juros
                ,t.VL_JUROS seunum
                ,t.VL_DESPESA vl_despesa
                ,t.DATA_TIT_WRITEOFF tit_writeoff
                ,CASE WHEN t.DATA_TIT_WRITEOFF IS NULL THEN 'Nao WO' ELSE 'WO' END AS ALUNO_DE_WO
                ,id_fundo_investimento
                ,CASE WHEN id_fundo_investimento = 4 THEN 'Fundo FIDC'
                WHEN id_fundo_investimento =5 THEN 'Fundo Itau'
                ELSE 'Fundo Gestao' END AS FUNDO


               from veterano.fato.fato_proposta p
                      inner join (select * from veterano.fato.fato_aluno_contrato ac  where ac.ativo = 1
                          and ac.contrato_concedido IN (1,2)
                           qualify row_number() over(partition by ID_CONTRATO order by release_contrato)=1
                                 )ac on ac.ID_CONTRATO = p.id_proposta

                      INNER JOIN VETERANO.FATO.FATO_COBRANCA_TERCEIROS  TCT ON TCT.id_CPF = P.id_CPF

                      inner join VETERANO.FATO.FATO_aluno a on a.id_cpf = p.id_cpf

                      inner join VETERANO.FATO.FATO_titulo t on t.ID_ALU_CONTRATO = p.id_proposta

                --contrato
                --titulo


                      inner join veterano.DIMENSAO.dim_banco as ba on ba.ID_banco = t.ID_BANCO

                      inner join veterano.DIMENSAO.dim_instituicao i on i.id_instituicao = p.id_instituicao



                       LEFT JOIN (select * from VETERANO.FATO.FATO_ies_aval ia where ia.ID_STATUS_AVAL = 3
                                  qualify row_number() over(partition by id_cpf order by id_aval)=1) ia
                                  ON ia.id_cpf = p.id_cpf


                     LEFT JOIN  "VETERANO"."DIMENSAO"."DIM_STATUS" st
                              on  st.ID_STATUS = a.id_status
                     LEFT JOIN "VETERANO"."DIMENSAO"."DIM_STATUS" strnv
                              on  strnv.ID_STATUS = a.id_status_rnv
                     inner join veterano.DIMENSAO.dim_cpf cpf
                      on cpf.id_cpf = p.id_cpf
                      inner join veterano.DIMENSAO.dim_cpf fcpf
                      on fcpf.id_cpf = p.id_fia_cpf
                     left join "VETERANO"."DIMENSAO"."DIM_ESCOLARIDADE" diep
                      on diep.ID_ESCOLARIDADE = p.ID_PAI_ESCOLARIDADE
                     left join "VETERANO"."DIMENSAO"."DIM_OCUPACAO" dop
                      on dop.id_ocupacao = p.id_pai_ocupacao
                     left join "VETERANO"."DIMENSAO"."DIM_ESCOLARIDADE" diem
                      on diem.ID_ESCOLARIDADE = p.ID_mae_ESCOLARIDADE
                     left join "VETERANO"."DIMENSAO"."DIM_OCUPACAO" dom
                      on dom.id_ocupacao = p.id_mae_ocupacao
                     left join "VETERANO"."DIMENSAO"."DIM_PRODUTO" DP
                      ON DP.ID_PRODUTO = P.ID_PRODUTO
                     LEFT JOIN "VETERANO"."DIMENSAO"."DIM_CURSO" DC
                      ON DC.ID_CURSO = P.ID_CURSO
                     LEFT JOIN "VETERANO"."DIMENSAO"."DIM_TIT_CURSO"DTC
                      ON DTC.ID_TIT_CURSO = DC.ID_TIT_CURSO

                     left join (select count ( t.ID_SEUNUM) atraso, id_cpf from VETERANO.FATO.FATO_titulo t
                        where t.ativo in (1,2,99)
                        and t.DATA_PAGAMENTO is null
                        and DATA_VENCIMENTO < current_date
                               group by 2) tpa
                        on tpa.id_cpf = p.id_cpf


                left join(select count ( t.ID_SEUNUM) vencer, id_cpf from VETERANO.FATO.FATO_titulo t
                      where t.ativo in (1,2,99)
                        and t.DATA_PAGAMENTO is null
                        and DATA_VENCIMENTO >= current_date
                               group by 2)tpv
                        on tpv.id_cpf = p.id_cpf


                  left join(select count ( t.ID_SEUNUM) pago, id_cpf from VETERANO.FATO.FATO_titulo t
                      where t.ativo in (1,2,99)
                        and t.DATA_PAGAMENTO is null
                               group by 2) tpp
                        on tpp.id_cpf = p.id_cpf

                  left join "BICHO"."BO"."PRV_PROPOSTA" bpp
                      on bpp."id" = substring(p.id_proposta,5)

                      where ac.ativo = 1
                          and ac.contrato_concedido IN (1,2)
                          and t.DATA_PAGAMENTO is null
                          and t.ATIVO in (1,2,99)
                          and t.DATA_VENCIMENTO < current_date
                          and tct.NOME_EMPRESA ilike '%FLEX/RR'
                          and id_tipo_boleto = 2


                              ) p
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: status_do_aluno {
    type: string
    sql: ${TABLE}."STATUS_DO_ALUNO" ;;
  }

  dimension: contrato {
    type: string
    sql: ${TABLE}."CONTRATO" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: endereco {
    type: string
    sql: ${TABLE}."ENDERECO" ;;
  }

  dimension: endereco_numero {
    type: string
    sql: ${TABLE}."ENDERECO_NUMERO" ;;
  }

  dimension: endereco_complemento {
    type: string
    sql: ${TABLE}."ENDERECO_COMPLEMENTO" ;;
  }

  dimension: bairro {
    type: string
    sql: ${TABLE}."BAIRRO" ;;
  }

  dimension: cidade {
    type: string
    sql: ${TABLE}."CIDADE" ;;
  }

  dimension: cep {
    type: string
    sql: ${TABLE}."CEP" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: telefone_ddd {
    type: number
    sql: ${TABLE}."TELEFONE_DDD" ;;
  }

  dimension: telefone {
    type: number
    sql: ${TABLE}."TELEFONE" ;;
  }

  dimension: celular_ddd {
    type: number
    sql: ${TABLE}."CELULAR_DDD" ;;
  }

  dimension: celular {
    type: number
    sql: ${TABLE}."CELULAR" ;;
  }

  dimension: fia_nome {
    type: string
    sql: ${TABLE}."FIA_NOME" ;;
  }

  dimension: fia_cpf {
    type: number
    sql: ${TABLE}."FIA_CPF" ;;
  }

  dimension: fia_telefone_ddd {
    type: number
    sql: ${TABLE}."FIA_TELEFONE_DDD" ;;
  }

  dimension: fia_telefone {
    type: number
    sql: ${TABLE}."FIA_TELEFONE" ;;
  }

  dimension: fia_celular_ddd {
    type: number
    sql: ${TABLE}."FIA_CELULAR_DDD" ;;
  }

  dimension: fia_celular {
    type: number
    sql: ${TABLE}."FIA_CELULAR" ;;
  }

  dimension: fia_telefone_com_ddd {
    type: number
    sql: ${TABLE}."FIA_TELEFONE_COM_DDD" ;;
  }

  dimension: fia_telefone_com {
    type: number
    sql: ${TABLE}."FIA_TELEFONE_COM" ;;
  }

  dimension: fia_email {
    type: string
    sql: ${TABLE}."FIA_EMAIL" ;;
  }

  dimension: pai {
    type: string
    sql: ${TABLE}."PAI" ;;
  }

  dimension: pai_escolaridade {
    type: string
    sql: ${TABLE}."PAI_ESCOLARIDADE" ;;
  }

  dimension: pai_ocupacao {
    type: string
    sql: ${TABLE}."PAI_OCUPACAO" ;;
  }

  dimension: pai_telefone_ddd {
    type: number
    sql: ${TABLE}."PAI_TELEFONE_DDD" ;;
  }

  dimension: pai_telefone {
    type: number
    sql: ${TABLE}."PAI_TELEFONE" ;;
  }

  dimension: pai_celular_ddd {
    type: number
    sql: ${TABLE}."PAI_CELULAR_DDD" ;;
  }

  dimension: pai_celular {
    type: number
    sql: ${TABLE}."PAI_CELULAR" ;;
  }

  dimension: pai_telefone_com_ddd {
    type: number
    sql: ${TABLE}."PAI_TELEFONE_COM_DDD" ;;
  }

  dimension: pai_telefone_com {
    type: number
    sql: ${TABLE}."PAI_TELEFONE_COM" ;;
  }

  dimension: mae {
    type: string
    sql: ${TABLE}."MAE" ;;
  }

  dimension: mae_escolaridade {
    type: string
    sql: ${TABLE}."MAE_ESCOLARIDADE" ;;
  }

  dimension: mae_ocupacao {
    type: string
    sql: ${TABLE}."MAE_OCUPACAO" ;;
  }

  dimension: mae_telefone_ddd {
    type: number
    sql: ${TABLE}."MAE_TELEFONE_DDD" ;;
  }

  dimension: mae_telefone {
    type: number
    sql: ${TABLE}."MAE_TELEFONE" ;;
  }

  dimension: mae_celular_ddd {
    type: number
    sql: ${TABLE}."MAE_CELULAR_DDD" ;;
  }

  dimension: mae_celular {
    type: number
    sql: ${TABLE}."MAE_CELULAR" ;;
  }

  dimension: mae_telefone_com_ddd {
    type: number
    sql: ${TABLE}."MAE_TELEFONE_COM_DDD" ;;
  }

  dimension: mae_telefone_com {
    type: number
    sql: ${TABLE}."MAE_TELEFONE_COM" ;;
  }

  dimension: ies {
    type: string
    sql: ${TABLE}."IES" ;;
  }

  dimension: produto {
    type: string
    sql: ${TABLE}."PRODUTO" ;;
  }

  dimension: tipo_curso {
    type: string
    sql: ${TABLE}."TIPO_CURSO" ;;
  }

  dimension: curso {
    type: string
    sql: ${TABLE}."CURSO" ;;
  }

  dimension: sem_cursando_ult_inf_ies {
    type: number
    sql: ${TABLE}."SEM_CURSANDO_ULT_INF_IES" ;;
  }

  dimension: ies_prev_formatura {
    type: date
    sql: ${TABLE}."IES_PREV_FORMATURA" ;;
  }

  dimension: semestre_do_curso {
    type: number
    sql: ${TABLE}."SEMESTRE_DO_CURSO" ;;
  }

  dimension: parcelas_em_atraso {
    type: number
    sql: ${TABLE}."PARCELAS_EM_ATRASO" ;;
  }

  dimension: parcelas_a_vencer {
    type: number
    sql: ${TABLE}."PARCELAS_A_VENCER" ;;
  }

  dimension: parcelas_pagas {
    type: number
    sql: ${TABLE}."PARCELAS_PAGAS" ;;
  }

  dimension: parcela {
    type: number
    sql: ${TABLE}."PARCELA" ;;
  }

  dimension: vecto {
    type: date
    sql: ${TABLE}."VECTO" ;;
  }

  dimension_group: data_concessao {
    type: time
    sql: ${TABLE}."DATA_CONCESSAO" ;;
  }

  dimension: valor_original {
    type: string
    sql: ${TABLE}."VALOR_ORIGINAL" ;;
  }

  dimension: atraso {
    type: number
    sql: ${TABLE}."ATRASO" ;;
  }

  dimension: seunum {
    type: number
    sql: ${TABLE}."SEUNUM" ;;
  }

  dimension: juros_e_multa {
    type: string
    sql: ${TABLE}."JUROS_E_MULTA" ;;
  }

  dimension: vl_despesa {
    type: string
    sql: ${TABLE}."VL_DESPESA" ;;
  }

  dimension: divida_atual {
    type: string
    sql: ${TABLE}."DIVIDA_ATUAL" ;;
  }

  dimension: tit_writeoff {
    type: date
    sql: ${TABLE}."TIT_WRITEOFF" ;;
  }

  dimension: aluno_de_wo {
    type: string
    sql: ${TABLE}."ALUNO_DE_WO" ;;
  }

  dimension: id_fundo_investimento {
    type: number
    sql: ${TABLE}."ID_FUNDO_INVESTIMENTO" ;;
  }

  dimension: fundo {
    type: string
    sql: ${TABLE}."FUNDO" ;;
  }

  set: detail {
    fields: [
      status_do_aluno,
      contrato,
      cpf,
      nome,
      endereco,
      endereco_numero,
      endereco_complemento,
      bairro,
      cidade,
      cep,
      email,
      telefone_ddd,
      telefone,
      celular_ddd,
      celular,
      fia_nome,
      fia_cpf,
      fia_telefone_ddd,
      fia_telefone,
      fia_celular_ddd,
      fia_celular,
      fia_telefone_com_ddd,
      fia_telefone_com,
      fia_email,
      pai,
      pai_escolaridade,
      pai_ocupacao,
      pai_telefone_ddd,
      pai_telefone,
      pai_celular_ddd,
      pai_celular,
      pai_telefone_com_ddd,
      pai_telefone_com,
      mae,
      mae_escolaridade,
      mae_ocupacao,
      mae_telefone_ddd,
      mae_telefone,
      mae_celular_ddd,
      mae_celular,
      mae_telefone_com_ddd,
      mae_telefone_com,
      ies,
      produto,
      tipo_curso,
      curso,
      sem_cursando_ult_inf_ies,
      ies_prev_formatura,
      semestre_do_curso,
      parcelas_em_atraso,
      parcelas_a_vencer,
      parcelas_pagas,
      parcela,
      vecto,
      data_concessao_time,
      valor_original,
      atraso,
      seunum,
      juros_e_multa,
      vl_despesa,
      divida_atual,
      tit_writeoff,
      aluno_de_wo,
      id_fundo_investimento,
      fundo
    ]
  }
}
