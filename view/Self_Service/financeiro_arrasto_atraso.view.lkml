# arrasto de atraso do Gestão Garantido

view: financeiro_arrasto_atraso {
  derived_table: {
    sql: SELECT
      financeiro."ID_CPF" AS "ID_CPF",
      MAX(financeiro."dias_atraso") OVER (PARTITION BY financeiro."ID_CPF") AS "ARRASTO"
    FROM "GRADUADO"."SELF_SERVICE_BI"."FINANCEIRO"
           AS financeiro
    WHERE financeiro."flg_pago_gestao_garantida" IS NOT NULL;;
  }

  dimension: arrasto {
    type: number
    sql: ${TABLE}."ARRASTO" ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
    label: "ID CPF"
  }

}
