view: nps_nuvem_palavras_detratores {
  derived_table: {
    sql: SELECT
          T3."PALAVRAS"  AS "nps_nuvem_palavras_detratores.palavras",
          COALESCE(SUM(CAST((T3."REPETICOES") AS DOUBLE PRECISION)), 0) AS soma_de_repeticoes
      FROM (SELECT
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
                            trim(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(upper(solucx."RATING_COMMENT"),'!',''),'.',''),',',''),'Ã','A'),'Ó','O'),'Ú','U'),'Á','A'),'Ç','C'),'Ê','E'),'É','E'),'À','A'),'Ô','O'),'(',''),')',''),'"',''),'Í','I')) AS "COMENTARIO"
                        FROM veterano."FATO"."SOLUCX_TRANSACTION" AS solucx
                        WHERE (solucx."STORE_NAME") IN ('ALUNOS FORMADOS - RELACIONAL', 'ALUNOS NOVOS - RELACIONAL', 'ALUNOS RENOVAÇÃO - RELACIONAL', 'Relacional') AND (solucx."RATING_COMMENT") <> 'False' AND (solucx."CLASS_NOTA") = 'DETRATOR' AND (solucx."TIMESTAMP") >= ((DATE_TRUNC('year', CURRENT_DATE()-180))) AND (((( solucx."RATING_TIMESTAMP")) IS NOT NULL))
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
            WHERE "REPETICOES" > 12
             )T3

      GROUP BY
          1
      ORDER BY
          2 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: nps_nuvem_palavras_detratores_palavras {
    type: string
    sql: ${TABLE}."NPS_NUVEM_PALAVRAS_DETRATORES.PALAVRAS" ;;
  }

  dimension: soma_de_repeticoes {
    type: number
    sql: ${TABLE}."SOMA_DE_REPETICOES" ;;
  }

  set: detail {
    fields: [nps_nuvem_palavras_detratores_palavras, soma_de_repeticoes]
  }
}
