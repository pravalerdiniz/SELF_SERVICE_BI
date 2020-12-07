view: s_op_previsao_flatten {
  derived_table: {
    sql: with base as (
      select
          a.mes_inicio_proposta,
          a.classe_modelo_iniciado,
          a.grupo_instituicao,
          a.regiao_campus,
          a.canal_url,
          a.mes_inicio_proposta + f.key::int as data_prevista_formalizacao,
          f.value::int as valor_previsto_base
      from veterano.data_science.s_op_previsao a,
      lateral flatten (input => DISTRIBUICAO_MEDIA) f
      ),

      pessimista as (
      select
          a.mes_inicio_proposta,
          a.classe_modelo_iniciado,
          a.grupo_instituicao,
          a.regiao_campus,
          a.canal_url,
          a.mes_inicio_proposta + f.key::int as data_prevista_formalizacao,
          f.value::int as valor_previsto_pessimista
      from veterano.data_science.s_op_previsao a,
      lateral flatten (input => DISTRIBUICAO_PESSISMISTA) f
      ),

      otimista as (
      select
          a.mes_inicio_proposta,
          a.classe_modelo_iniciado,
          a.grupo_instituicao,
          a.regiao_campus,
          a.canal_url,
          a.mes_inicio_proposta + f.key::int as data_prevista_formalizacao,
          f.value::int as valor_previsto_otimista
      from veterano.data_science.s_op_previsao a,
      lateral flatten (input => DISTRIBUICAO_OTIMISTA) f
      )

      select
          b.mes_inicio_proposta,
          b.classe_modelo_iniciado,
          b.grupo_instituicao,
          b.regiao_campus,
          b.canal_url,
          b.data_prevista_formalizacao,
          b.valor_previsto_base,
          p.valor_previsto_pessimista,
          o.valor_previsto_otimista
      from base b
      inner join pessimista p on b.mes_inicio_proposta = p.mes_inicio_proposta
                             and b.classe_modelo_iniciado = p.classe_modelo_iniciado
                             and b.grupo_instituicao = p.grupo_instituicao
                             and b.regiao_campus = p.regiao_campus
                             and b.canal_url = p.canal_url
                             and b.data_prevista_formalizacao = p.data_prevista_formalizacao
      inner join otimista o on b.mes_inicio_proposta = o.mes_inicio_proposta
                             and b.classe_modelo_iniciado = o.classe_modelo_iniciado
                             and b.grupo_instituicao = o.grupo_instituicao
                             and b.regiao_campus = o.regiao_campus
                             and b.canal_url = o.canal_url
                             and b.data_prevista_formalizacao = o.data_prevista_formalizacao
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }

  dimension_group: mes_inicio_proposta {
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
    sql: ${TABLE}."MES_INICIO_PROPOSTA" ;;
    hidden: yes
  }

  dimension: classe_modelo_iniciado {
    type: string
    sql: ${TABLE}."CLASSE_MODELO_INICIADO" ;;
    hidden: yes
  }

  dimension: grupo_instituicao {
    type: string
    sql: ${TABLE}."GRUPO_INSTITUICAO" ;;
    hidden: yes
  }

  dimension: regiao_campus {
    type: string
    sql: ${TABLE}."REGIAO_CAMPUS" ;;
    hidden: yes
  }

  dimension: canal_url {
    type: string
    sql: ${TABLE}."CANAL_URL" ;;
    hidden: yes
  }

  dimension_group: data_prevista_formalizacao {
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
    sql: ${TABLE}."DATA_PREVISTA_FORMALIZACAO" ;;
  }

  dimension: valor_previsto_base {
    type: number
    sql: ${TABLE}."VALOR_PREVISTO_BASE" ;;
    hidden: yes
  }

  dimension: valor_previsto_pessimista {
    type: number
    sql: ${TABLE}."VALOR_PREVISTO_PESSIMISTA" ;;
    hidden: yes
  }

  dimension: valor_previsto_otimista {
    type: number
    sql: ${TABLE}."VALOR_PREVISTO_OTIMISTA" ;;
    hidden: yes
  }

  measure: sum_valor_previsto_base {
    type: sum
    sql: ${valor_previsto_base} ;;
  }

  measure: sum_valor_previsto_otimista {
    type: sum
    sql: ${valor_previsto_otimista} ;;
    hidden: yes
  }

  measure: sum_valor_previsto_pessimista {
    type: sum
    sql: ${valor_previsto_pessimista} ;;
    hidden: yes
  }

  set: detail {
    fields: [
      mes_inicio_proposta_raw,
      classe_modelo_iniciado,
      grupo_instituicao,
      regiao_campus,
      canal_url,
      data_prevista_formalizacao_raw,
      valor_previsto_base,
      valor_previsto_pessimista,
      valor_previsto_otimista
    ]
  }
}
