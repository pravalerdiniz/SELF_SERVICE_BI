# valor de aquisição médio por contrato sendo *boleto ATIVO e ORIGINAL*


view: financeiro_avg_vl_aquisicao {
  derived_table: {
    sql: SELECT DISTINCT
      por_contrato.ID_CONTRATO AS "ID_CONTRATO",
      AVG(por_contrato."VL_AQUISICAO") OVER (PARTITION BY por_contrato."ID_CONTRATO") AS "AVG_AQUISICAO",
      SUM(por_contrato."VL_AQUISICAO") OVER (PARTITION BY por_contrato."ID_CONTRATO") AS "SUM_AQUISICAO"
    FROM "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO" AS por_contrato
          WHERE por_contrato.ds_titulo_status = 'ATIVO'
                AND por_contrato.ds_tipo_boleto = 'Original';;
  }

  dimension: avg_aquisicao {
    description: "Valor médio de aquisição das parcelas por contrato."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."AVG_AQUISICAO" ;;
  }

  dimension: sum_aquisicao {
    description: "Soma dos Valores de aquisição das parcelas *por contrato*."
    type: number
    value_format: "$ #,###.00"
    sql: ${TABLE}."SUM_AQUISICAO" ;;
  }


  dimension: id_contrato {
    type: number
    sql: ${TABLE}."ID_CONTRATO" ;;
    label: "ID CONTRATO"
  }

}
