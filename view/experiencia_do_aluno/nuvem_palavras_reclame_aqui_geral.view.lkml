view: nuvem_palavras_reclame_aqui_geral{
  derived_table: {
    sql: SELECT
          *
      FROM
          (SELECT
              T2."PALAVRAS",
              COUNT(*) AS "REPETICOES"
          FROM
              (SELECT
                  T1."COMENTARIO",
                  SPLIT_PART(T1."COMENTARIO", ' ', numbers.num) AS "PALAVRAS"
              FROM
                  (SELECT
                      trim(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(UPPER((reclame_aqui."CONTEUDO_RECLAMACAO")),'!',''),'.',''),',',''),'Ã','A'),'Ó','O'),'Ú','U'),'Á','A'),'Ç','C'),'Ê','E'),'É','E'),'À','A'),'Ô','O'),'(',''),')',''),'"',''),'Í','I')) AS "COMENTARIO"
                  FROM "SELF_SERVICE_BI"."RA_TICKETS" AS reclame_aqui
                  WHERE ((( reclame_aqui."DATA_CRIACAO"  ) >= ((DATEADD('month', -5, DATE_TRUNC('month', CURRENT_DATE())))) AND ( reclame_aqui."DATA_CRIACAO"  ) < ((DATEADD('month', 6, DATEADD('month', -5, DATE_TRUNC('month', CURRENT_DATE()))))))) AND (reclame_aqui."FLG_RECLAMACAO_CONSIDERADA" )
                  GROUP BY
                      1
                  ORDER BY
                      1
                  ) T1

      JOIN (
      SELECT
      p0.n
      + p1.n*2
      + p2.n * POWER(2,2)
      + p3.n * POWER(2,3)
      + p4.n * POWER(2,4)
      + p5.n * POWER(2,5)
      + p6.n * POWER(2,6)
      + p7.n * POWER(2,7)
      as num
      FROM
      (SELECT 0 as n UNION SELECT 1) p0,
      (SELECT 0 as n UNION SELECT 1) p1,
      (SELECT 0 as n UNION SELECT 1) p2,
      (SELECT 0 as n UNION SELECT 1) p3,
      (SELECT 0 as n UNION SELECT 1) p4,
      (SELECT 0 as n UNION SELECT 1) p5,
      (SELECT 0 as n UNION SELECT 1) p6,
      (SELECT 0 as n UNION SELECT 1) p7) as numbers

      ON numbers.num <= regexp_count(T1."COMENTARIO", ' ') + 1
      WHERE numbers.num > 0) as T2
      WHERE T2."PALAVRAS" not IN ('A','E','O','AI','AO','OU','AS','OS','DA','DE','DO','DAS','DOS','ERA','EM','NA','NAS','NO','NOS','NEM','QUE','Q','FOI','FORAM','FUI','VOU','VAO','VEM','VINHA','VINHAM','UM','UMA','PARA','PRA','COMO','JA','TER','TIVE','TEM','TEVE','TINHA','TENHO','TINHAM','CADA','ESSE','ESSA','ESSES','ESSAS','ESTA','ESTAVA','DESSE','SENTI','ANO','DESSA','DESTA','DESTE','ATE','EU','VOCE','VOCES','ELA','ELAS','ELE','ELES','PQ','PORQUE','MIM','ME','MEU','MINHA','MEUS','MINHAS','DELA','DELE','VCS','VOCES','POR','PELO','PELA','SEU','SUA','SER','SAO','ESTAO','COM','SEM','MUITO','MUITA','POUCO','MUITOS','MUITAS', 'VARIAS','POUCOS','POUCAS','SOU','ESTOU','ANTES','DEPOIS','NOVO','TUDO','TODO','TODA','TODOS','TODAS','FAZ','FACO','FIZ','FAZIA','FEZ','FAZEM','FIZERAM', 'FAZER','FICO','FICOU','FIQUEI','FICAMOS','FICAVA','ALGUM','ALGUNS','ALGUMA','ALGUMAS','ALUNO','NINGUEM','MELHOR','ASSIM','VI','VIU','SE','SO','','HORA','MES','MESES','FIM','QUAL','QUASE','HOJE','QUERENDO','QUERO','QUERIA','OUTRA','OUTRO','OUTRAS','OUTROS','COISAS','COISA','HA','MAS','MAIS','DIA','POREM','SAI','SAIU','SAIR','AGORA','DEPOIS','POIS','NADA','QUANDO','AINDA','CONSTA','NAO','SIM','PRAVALER','TIROU','TIRAR','MOMENTO','TENTAR','TENTEI','CAIU','HAVIA','ALGUEM','VEZ','ALEM','SABER','SEMPRE','NUNCA','PODER','SOBRE','RECEBI','SENDO','DIZEM', 'CONSIGO', 'ISSO','PEDIRAM', 'AQUILO' , 'MESMO', 'MESMA','MESMOS', 'MESMAS','1','2', '3', '4','5','6','7','8','9','10','2022','NOME','ENTAO','SERIA','SEJA','CASO','APOS')
      GROUP BY 1
      ORDER BY 2 DESC)
      WHERE "REPETICOES" >= 50
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: palavras {
    type: string
    sql: ${TABLE}."PALAVRAS" ;;
  }

  dimension: repeticoes {
    type: number
    sql: ${TABLE}."REPETICOES" ;;
  }

  set: detail {
    fields: [palavras, repeticoes]
  }
}
