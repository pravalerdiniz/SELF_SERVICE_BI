# View única e exclusivamente construída para trazer o total de mensalidades somando CONTRATO NOVO E SEGUNDO REPASSE;

view: fin_qtd_mens_contrato {
  derived_table: {
    sql:  SELECT DISTINCT
             (financeiro."ID_CONTRATO")  AS "id_contrato",
             (proposta."QTD_MEN_CORRENTE" + ifnull(p2.QTD_MEN_CORRENTE, 0) ) AS "qtd_mensalidades"
          FROM "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO" AS financeiro
          LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA"AS proposta
              ON (proposta."ID_PROPOSTA")=(financeiro."ID_CONTRATO")
          LEFT JOIN "GRADUADO"."SELF_SERVICE_BI"."PROPOSTA" AS P2
              ON P2.ID_CONTRATO_CONJUNTO = (proposta.ID_CONTRATO)
                  AND P2.flg_contrato_cedido AND P2.flg_contrato_ativo
          WHERE (proposta."FLG_CONTRATO_ATIVO" ) AND (proposta."FLG_CONTRATO_CEDIDO" )
              AND (financeiro."ID_CONTRATO" ) = 'BOF-6658152'
          ORDER BY
              1 DESC
    ;;
  }

  dimension: id_contrato {
    description: "ID do contrato"
    type: string
    sql: ${TABLE}."ID_CONTRATO" ;;
    hidden: yes
  }

  dimension: qtd_mensalidades {
    description: "Soma das quantidades de mensalidades do 1º e 2º kit."
    label: "Soma Qtd mensalidades 1º e 2º kit"
    group_label: "Dados do Contrato"
    type: number
    value_format: "0"
    sql: ${TABLE}."qtd_mensalidades" ;;
  }

}
