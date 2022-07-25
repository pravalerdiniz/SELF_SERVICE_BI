view: nuvem_nps_ies {
    derived_table: {
      sql: SELECT
          T3."PALAVRAS",
          T3.STORE_NAME as grupo_pesquisa,
          T3.CLASS_NOTA as promotor_detrator,
          COALESCE(SUM(CAST((T3."REPETICOES") AS DOUBLE PRECISION)), 0) AS soma_de_repeticoes

      FROM (SELECT
                *
            FROM
                (SELECT
                    T2."PALAVRAS", STORE_NAME, CLASS_NOTA,
                    COUNT(*) AS "REPETICOES"
                FROM
                    (SELECT STORE_NAME, CLASS_NOTA,
                        T1."COMENTARIO",
                        SPLIT_PART(T1."COMENTARIO", ' ', numbers.num) AS "PALAVRAS"
                    FROM
                        (SELECT STORE_NAME, CLASS_NOTA,
                            trim(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(replace(upper(solucx."RATING_COMMENT"),'!',''),'.',''),',',''),'Ã','A'),'Ó','O'),'Ú','U'),'Á','A'),'Ç','C'),'Ê','E'),'É','E'),'À','A'),'Ô','O'),'(',''),')',''),'"',''),'Í','I')) AS "COMENTARIO"
                        FROM veterano."FATO"."SOLUCX_TRANSACTION" AS solucx
                        WHERE (solucx."STORE_NAME") IN ('IES NPS') AND (solucx."RATING_COMMENT") <> 'False'
                         --AND (solucx."CLASS_NOTA") = 'DETRATOR'
                         AND (((solucx."TIMESTAMP") >= ((DATE_TRUNC('year', CURRENT_DATE()))) AND (solucx."TIMESTAMP") < ((DATEADD('year', 1, DATE_TRUNC('year', CURRENT_DATE()))))))
                         AND (((( solucx."RATING_TIMESTAMP")) IS NOT NULL))
                        GROUP BY
                            1, 2, 3
                        ORDER BY
                            3
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
        WHERE T2."PALAVRAS" not IN ('A','E','O','AI','AO','OU','AS','OS','DA','DE','DO','DAS','DOS','ERA','EM','NA','NO','NEM','QUE','Q','FOI',
                                    'FORAM','FUI','VOU','VAO','VEM','VINHA','VINHAM','UM','UMA','PARA','PRA','COMO','JA','TER','TIVE','TEM','TEVE'
                                    ,'TINHA','TENHO','TINHAM','ESSE','ESSA','ESSES','ESSAS','ESTA','ESTAVA','DESSE','DESSA','DESTA','DESTE','ATE',
                                    'EU','VOCE','NOS','VOCES','ELA','ELE','PQ','PORQUE','MIM','ME','MEU','MINHA','MEUS','MINHAS','DELA','DELE','VCS',
                                    'VOCES','POR','PELO','PELA','SEU','SUA','SER','SAO','ESTAO','COM','SEM','MUITO','MUITA','POUCO','MUITOS','MUITAS',
                                    'VARIAS','POUCOS','POUCAS','SOU','ESTOU','ANTES','DEPOIS','NOVO','TUDO','TODO','TODA','TODOS','TODAS','FAZ','FACO',
                                    'FIZ','FAZIA','FEZ','FAZEM','FIZERAM', 'FAZER','FICO','FICOU','FIQUEI','FICAMOS','FICAVA','ALGUM','ALGUNS','ALGUMA',
                                    'ALGUMAS','ALUNO','NINGUEM','MELHOR','ASSIM','VI','VIU','SE','SO','','HORA','MES','MESES','FIM','QUAL','QUASE','HOJE',
                                    'QUERENDO','QUERO','QUERIA','OUTRA','OUTRO','OUTRAS','OUTROS','COISAS','COISA','HA','MAS','MAIS','DIA','POREM','SAI',
                                    'SAIU','SAIR','AGORA','DEPOIS','POIS','NADA','QUANDO','AINDA','CONSTA','NAO','SIM','PRAVALER','TIROU','TIRAR','MOMENTO',
                                    'TENTAR','TENTEI','CAIU','HAVIA','ALGUEM','VEZ','ALEM','SABER','SEMPRE','NUNCA','PODER','SOBRE','RECEBI','SENDO','DIZEM',
                                    'CONSIGO', 'ISSO','PEDIRAM', 'AQUILO' , 'MESMO', 'MESMA','MESMOS', 'MESMAS')
        GROUP BY 1, 2, 3
        ORDER BY 4 DESC)
        WHERE "REPETICOES" > 1
        )T3

        GROUP BY
        1, 2, 3
        ORDER BY
        4 DESC
        ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: palavras {
      type: string
      label: "Palavras"
      sql: ${TABLE}."PALAVRAS" ;;
    }

  dimension: grupo_pesquisa {
    type: string
    label: "Grupo Pesquisa"
    sql: ${TABLE}."grupo_pesquisa" ;;
  }

  dimension: promotor_detrator {
    type: string
    label: "Promotor Detrator"
    sql: ${TABLE}."promotor_detrator" ;;
  }

    measure: soma_de_repeticoes {
      type: sum
      label: "Qtd de repetições"
      sql: ${TABLE}."SOMA_DE_REPETICOES" ;;
    }

    set: detail {
      fields: [palavras, grupo_pesquisa, promotor_detrator, soma_de_repeticoes]
    }

 }
