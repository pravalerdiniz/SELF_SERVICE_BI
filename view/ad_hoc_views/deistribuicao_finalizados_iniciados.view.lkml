view: distribuicao_finalizados_iniciados {
  derived_table: {
    sql: select  fin_bo.data data_finalizado , count(distinct ini_bo."proposta") QTD_PROPOSTAS, ini_bo.data data_iniciado

      from (
                      select "proposta", st."data" data
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
                  and ("contrato_conjunto"=0 or "contrato_conjunto" is null)
                  and (p."prp_codigo_elegivel" is null or p."prp_codigo_elegivel" = 0)
                  and ("pro_nome" not ilike '%compra%' or "pro_nome" is null)
                  and (pp."proposta_id" is null or "pro_nome" not ilike '%fies%')
                  )fin_bo
      inner join (
                  select "proposta", st."data" data
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
                  and ("contrato_conjunto"=0 or "contrato_conjunto" is null)
                  and (p."prp_codigo_elegivel" is null or p."prp_codigo_elegivel" = 0)
                  and ("pro_nome" not ilike '%compra%' or "pro_nome" is null)
                  and (pp."proposta_id" is null or "pro_nome" not ilike '%fies%')
                  ) ini_bo
      on fin_bo."proposta" = ini_bo."proposta"

      group by 1,3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: data_finalizado {
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
    sql: ${TABLE}."DATA_FINALIZADO" ;;
  }

  measure: qtd_propostas {
    type: sum
    sql: ${TABLE}."QTD_PROPOSTAS" ;;
  }

  dimension_group: data_iniciado {
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
    sql: ${TABLE}."DATA_INICIADO" ;;
  }

  set: detail {
    fields: []
  }
}
