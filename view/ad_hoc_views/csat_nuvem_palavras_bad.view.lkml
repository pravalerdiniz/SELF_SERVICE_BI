view: csat_nuvem_palavras_bad {
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
                      trim(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(interacoes."COMENTARIO_PESQUISA",'!',''),'.',''),',',''),'Ã','A'),'Ó','O'),'Ú','U'),'Á','A'),'Ç','C'),'Ê','E'),'É','E'),'À','A'),'Ô','O'),'(',''),')',''),'"',''),'Í','I')) AS "COMENTARIO"
                  FROM "SELF_SERVICE_BI"."INTERACOES" AS interacoes
                  WHERE ( interacoes."DATA_ENVIO_PESQUISA"  ) >= ((DATEADD('day', -120, CURRENT_DATE()))) AND ((interacoes."FLG_PESQUISA_DISPARADA" ) AND (interacoes."GRUPO" ) IN ('SAC', 'Whatsapp - SAC')) AND ((interacoes."TIPO_CONTATO" ) = 'RECEPTIVO' AND (((interacoes."SCORE" ) = 'BAD' OR (interacoes."SCORE" ) IS NULL) AND (interacoes."COMENTARIO_PESQUISA" ) IS NOT NULL))
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
             WHERE T2."PALAVRAS" not IN ('A','E','O','AI','AO','OU','AS','OS','DA','DE','DO','DAS','DOS','ERA','EM','NA','NO','NEM','QUE','Q','FOI','FORAM','FUI','VOU','VAO','VEM','VINHA','VINHAM','UM','UMA','PARA','PRA','COMO','JA','TER','TIVE','TEM','TEVE','TINHA','TINHAM','ESSE','ESSA','ESSES','ESSAS','ESTA','ESTAVA','DESSE','DESSA','DESTA','DESTE','ATE','EU','VOCE','NOS','VOCES','ELA','ELE','PQ','PORQUE','MIM','ME','MEU','MINHA','MEUS','MINHAS','DELA','DELE','VCS','VOCES','POR','PELO','PELA','SEU','SUA','SER','SAO','ESTAO','COM','SEM','MUITO','MUITA','POUCO','MUITOS','MUITAS', 'VARIAS','POUCOS','POUCAS','SOU','ESTOU','ANTES','DEPOIS','TUDO','TODO','TODA','TODOS','TODAS','FAZ','FACO','FIZ','FAZIA','FEZ','FAZEM','FIZERAM','FICO','FICOU','FIQUEI','FICAMOS','FICAVA','ALGUM','ALGUNS','ALGUMA','ALGUMAS','ASSIM','VI','VIU','SE','SO','','HORA','MES','MESES','FIM','QUAL','QUASE','HOJE','QUERENDO','QUERO','QUERIA','OUTRA','OUTRO','OUTRAS','OUTROS','COISAS','COISA','HA','MAS','MAIS','DIA','POREM','SAI','SAIU','SAIR','AGORA','DEPOIS','POIS','NADA','QUANDO','AINDA','CONSTA','NAO','SIM','PRAVALER','TIROU','TIRAR','MOMENTO','TENTAR','TENTEI','CAIU','HAVIA','ALGUEM','VEZ','ALEM','SABER','SEMPRE','NUNCA','PODER','SOBRE','RECEBI','SENDO', 'ISSO', 'AQUILO' , 'MESMO', 'MESMA','MESMOS', 'MESMAS')
              GROUP BY 1
              ORDER BY 2 DESC)
      WHERE "REPETICOES" >= 15
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
