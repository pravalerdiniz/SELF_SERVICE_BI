view: acompanhamento_fluxo_proposta {
  derived_table: {
    sql: select
coalesce(ini_bo.data, fin_bo.data,tt.DATA_PREENCHIMENTO,er.DATA_PREENCHIMENTO) data,
INICIADOS_BO,
finalizados_bo,
INICIADOS_TETRIS,
ERRO_LAST_SYNC,
ERRO_EM_ALGUM_MOMENTO

from(
            select count(distinct p."cpf") iniciados_bo, st."data" data
            from bicho.bo.prv_proposta p
            inner join (select "proposta", "data" from bicho.bo.prv_status_log
                        where "sl_status_destino"=1
                        qualify row_number() over(partition by "proposta" order by "id" asc)= 1
                       )st
            on st."proposta" = p."id"
            left join bicho.bo.prv_produto pr
            on pr."pro_id" = p."prp_pro_id"
            left join bicho.bo.prv_proposta_projetos pp
            on pp."proposta_id" = p."id"
            and "projeto" in (3,6)
            where "nome" not ilike '%teste%' --between '2021-05-20' and '2021-05-31'
            and st."data" > '2020-01-01'
            and "sl_status_proposta" <=100
            and ("contrato_conjunto"=0 or "contrato_conjunto" is null)
            and (p."prp_codigo_elegivel" is null or p."prp_codigo_elegivel" = 0)
            and ("pro_nome" not ilike '%compra%' or "pro_nome" is null)
            and (pp."proposta_id" is null or "pro_nome" not ilike '%fies%')

            group by 2) ini_bo

full outer join(
                select count(distinct p."cpf") finalizados_bo, st."data" data
            from bicho.bo.prv_proposta p
            inner join (select "proposta", "data" from bicho.bo.prv_status_log
                        where "sl_status_destino"=2
                        qualify row_number() over(partition by "proposta" order by "id" asc)= 1
                       )st
            on st."proposta" = p."id"
            left join bicho.bo.prv_produto pr
            on pr."pro_id" = p."prp_pro_id"
            left join bicho.bo.prv_proposta_projetos pp
            on pp."proposta_id" = p."id"
            and "projeto" in (3,6)
            where "nome" not ilike '%teste%' --between '2021-05-20' and '2021-05-31'
            and st."data" > '2020-01-01'
            and "sl_status_proposta" <=100
            and ("contrato_conjunto"=0 or "contrato_conjunto" is null)
            and (p."prp_codigo_elegivel" is null or p."prp_codigo_elegivel" = 0)
            and ("pro_nome" not ilike '%compra%' or "pro_nome" is null)
            and (pp."proposta_id" is null or "pro_nome" not ilike '%fies%')
            group by 2)fin_bo
on fin_bo.data = ini_bo.data

full outer join (
SELECT count(distinct cpf) iniciados_tetris, DATA_PREENCHIMENTO  FROM "BICHO"."DOCDB".VALIDACAO_FLUXO
WHERE  id_proposta IS NOT NULL
group by 2
) tt
on tt.DATA_PREENCHIMENTO = ini_bo.data

full outer join (
SELECT sum( case when ERRO_ULTIMA_SINCRONIZACAO ilike true then 1 else 0 end) ERRO_LAST_SYNC, sum(case when ERRO_EM_ALGUM_MOMENTO ilike true then 1 else 0 end) ERRO_EM_ALGUM_MOMENTO, DATA_PREENCHIMENTO  FROM "BICHO"."DOCDB".VALIDACAO_FLUXO
WHERE  id_proposta IS NOT NULL
group by 3
) er
on er.DATA_PREENCHIMENTO = ini_bo.data
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: data {
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
     sql: ${TABLE}."DATA" ;;
  }

  measure: iniciados_bo {
    type: sum
    sql: ${TABLE}."INICIADOS_BO" ;;

  }

  measure: finalizados_bo {
    type: sum
    sql: ${TABLE}."FINALIZADOS_BO" ;;
  }

  measure: iniciados_tetris {
    type: sum
    sql: ${TABLE}."INICIADOS_TETRIS" ;;
  }

  measure: erro_last_sync {
    type: sum
    sql: ${TABLE}."ERRO_LAST_SYNC" ;;
  }

  measure: erro_em_algum_momento {
    type: sum
    sql: ${TABLE}."ERRO_EM_ALGUM_MOMENTO" ;;
  }

  set: detail {
    fields: [ ]
  }
}
