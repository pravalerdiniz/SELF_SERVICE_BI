view: iniciados_x_finalizados_lead {
  derived_table: {
    sql: select
      fl.data_acesso,
          cpf.cpf,
          cpf.email,
          cpf.celular,
          case when ini.id_cpf is not null then true else false end as iniciou_proposta,
          case when fin.id_cpf is not null then true else false end as finalizou_proposta
      from veterano.fato.fato_lead fl
      left join (select * from graduado.self_service_bi.jornada
                 where etapa = 'Iniciado'
                 qualify row_number() over(partition by id_cpf order by dt_status desc) = 1) ini on ini.id_cpf = fl.id_cpf and ini.dt_status >= fl.data_acesso
      left join (select * from graduado.self_service_bi.jornada
                 where etapa = 'Finalizado'
                 qualify row_number() over(partition by id_cpf order by dt_status desc) = 1) fin on fin.id_cpf = fl.id_cpf and fin.dt_status >= fl.data_acesso
      inner join veterano.dimensao.dim_cpf cpf
      on cpf.id_cpf = fl.id_cpf
      where fl.id_cpf is not null
      qualify row_number() over(partition by fl.id_cpf order by fl.data_acesso asc) = 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: data_acesso {
    type: time
    sql: ${TABLE}."DATA_ACESSO" ;;
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: celular {
    type: string
    sql: ${TABLE}."CELULAR" ;;
  }

  dimension: iniciou_proposta {
    type: string
    sql: ${TABLE}."INICIOU_PROPOSTA" ;;
  }

  dimension: finalizou_proposta {
    type: string
    sql: ${TABLE}."FINALIZOU_PROPOSTA" ;;
  }

  set: detail {
    fields: [
      data_acesso_time,
      cpf,
      email,
      celular,
      iniciou_proposta,
      finalizou_proposta
    ]
  }
}
