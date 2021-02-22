view: report_builder_baixa {
  derived_table: {
    sql: SELECT
          t."sinsc" AS cpf,
          to_char(t."vecto", 'DD/MM/YYYY') AS vencimento_original,
          replace((t."valor")::text, '.' , ',') AS valor_face,
          replace((t."valorpg")::text, '.' , ',') AS valor_pago,
          t."seunum" AS seunum,
          case
              when b."id_fundo_investimento" = 4 then 'PRAVALER'
              when b."id_fundo_investimento" = 5 then 'ITAU'
              else NULL
          END tipo_titulo

      FROM
          bicho.bo.prv_titulos_relacao_titulo AS rtt
      LEFT JOIN
          bicho.bo.prv_titulos_relacao_avulso AS tra ON tra."rta_tir_id" = rtt."rtt_tir_id"
      LEFT JOIN
          bicho.bo.prv_titulo_avulso AS ta ON ta."id" = tra."rta_tia_id"
      LEFT JOIN
          bicho.bo.prv_titulo AS t ON t."id" = rtt."rtt_tit_id"
      inner join
          bicho.bo.prv_banco as b on b."id" = t."banco"
      WHERE
          ta."datapg" is not null
          and ta."data_baixa" = CURRENT_DATE
      order by tipo_titulo asc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cpf {
    type: number
    sql: ${TABLE}."CPF" ;;
  }

  dimension: vencimento_original {
    type: string
    sql: ${TABLE}."VENCIMENTO_ORIGINAL" ;;
  }

  dimension: valor_face {
    type: string
    sql: ${TABLE}."VALOR_FACE" ;;
  }

  dimension: valor_pago {
    type: string
    sql: ${TABLE}."VALOR_PAGO" ;;
  }

  dimension: seunum {
    type: number
    sql: ${TABLE}."SEUNUM" ;;
  }

  dimension: tipo_titulo {
    type: string
    sql: ${TABLE}."TIPO_TITULO" ;;
  }

  set: detail {
    fields: [
      cpf,
      vencimento_original,
      valor_face,
      valor_pago,
      seunum,
      tipo_titulo
    ]
  }
}
