view: alunos_inadimplencia_1_homolog {

    derived_table: {
      persist_for: "1 hour"
      sql: select
            id_cpf,
            cpf,
            LEFT(f.key,4)||'-'||RIGHT(f.key,2)||'-'||'01'::varchar as ano_mes,
            f.value:FPD::boolean as FPD,
            f.value:MOB::int as MOB,
            f.value:dias_atraso_cpf::int as dias_atraso_cpf,
            f.value:maturidade::int as maturidade,
            f.value:"OVER 15"::boolean as over15,
            f.value:"OVER 30"::boolean as over30,
            f.value:"OVER 60"::boolean as over60,
            f.value:"PDD"::varchar as pdd_produto,
            f.value:SAFRA_CESSAO_SEMESTRE_NUM::number as safra,
            f.value:SAFRA_CESSAO_CPF::number as safra_cessao_cpf
            from "HOMOLOGACAO"."GRADUADO"."ALUNOS" a,
            lateral flatten (input => maturidade_info) f
 ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }



    dimension: id_cpf {
      type: number
      sql: ${TABLE}."ID_CPF" ;;
      hidden: yes
      description: "Indica o ID do CPF do Aluno"
    }

    dimension: cpf {
      type: number
      sql: ${TABLE}."CPF" ;;
      label: "CPF"
      description: "Indica o CPF do Aluno"
    }


    dimension: safra {
      type: number
      sql: ${TABLE}."SAFRA" ;;
      label: "Safra - Semestre"
      hidden: yes
      value_format: "0"
    }


    dimension: safra_cessao_cpf {
      type: number
      sql: ${TABLE}."SAFRA_CESSAO_CPF" ;;
      label: "Safra - CPF"
      value_format: "0"
    }



    dimension_group: ano_mes {
      type: time
      timeframes: [
        month,
        month_num,
        month_name,
        year,
      ]
      sql: TO_DATE(${TABLE}."ANO_MES");;
      description: "Mês de observação"
    }






    dimension: fpd {
      type: yesno
      label: "FPD15?"
      description: "Indica se o aluno realizou o pagamento do primeiro boleto dentro de 15 dias após o vencimento."
      sql: ${TABLE}."FPD" ;;

    }

    dimension: mob {
      type: number
      sql: ${TABLE}."MOB" ;;
      label: "MOB"
      description: "Mês de observação relativo à data de cessão"
    }

    dimension: pdd_produto {
      type: string
      sql: ${TABLE}."PDD_PRODUTO" ;;
      label: "Nome do Produto"
      description: "Indica o produto do aluno dentro da PDD."
    }

    dimension: dias_atraso_cpf {
      type: number
      sql: ${TABLE}."DIAS_ATRASO_CPF" ;;
      label: "Dias de atraso"
      description: "Maior tempo de atraso no pagamento no mês de observação"
    }

    dimension: maturidade {
      type: number
      label: "Maturidade"
      sql: ${TABLE}."MATURIDADE" ;;
      description: "Tempo que o aluno está ativo na carteira"
    }

    dimension: over15 {
      type: yesno
      sql: ${TABLE}."OVER15" ;;
      label: "OVER 15?"
      description: "Indica se o aluno de uma safra específica ficou acima de 15 dias em atraso 2 meses depois de cedido"
    }

    dimension: over30 {
      type: yesno
      sql: ${TABLE}."OVER30" ;;
      label: "OVER 30?"
      description: "Indica se o aluno de uma safra específica ficou acima de 30 dias em atraso 3 meses depois de cedido"

    }

    dimension: over60 {
      type: yesno
      sql: ${TABLE}."OVER60" ;;
      label: "OVER 60?"
      description: "Indica se o aluno de uma safra específica ficou acima de 60 dias em atraso 6 meses depois de cedido"

    }



    measure: count_alunos {
      type: count_distinct
      sql_distinct_key:  ${ano_mes_month} ;;
      sql:${id_cpf} ;;
    }


    measure: count_over15  {
      group_label: "Over 15"
      group_item_label: "Quantidade de Alunos"
      type: count
      filters: [over15: "yes"]
    }

    measure: perc_over15  {
      group_label: "Over 15"
      group_item_label: "Percentual"
      type: number
      sql: (${count_over15}  / NULLIF(${count_alunos},0)) * 100;;
      value_format: "0.00\%"
    }

    measure: count_over30  {
      group_label: "Over 30"
      group_item_label: "Quantidade de Alunos"
      type: count
      filters: [over30: "yes"]
    }

    measure: perc_over30  {
      group_label: "Over 30"
      group_item_label: "Percentual"
      type: number
      sql: (${count_over30}  / NULLIF(${count_alunos},0))*100;;
      value_format: "0.00\%"
    }

    measure: count_over60  {
      group_label: "Over 60"
      group_item_label: "Quantidade de Alunos"
      type: count
      filters: [over60: "yes"]
    }

    measure: perc_over60  {
      group_label: "Over 60"
      group_item_label: "Percentual"
      type: number
      sql: (${count_over60}  / NULLIF(${count_alunos},0)*100);;
      value_format: "0.00\%"

    }

    set: detail {
      fields: [
        id_cpf,
        fpd,
        ano_mes_month,
        mob,
        dias_atraso_cpf,
        maturidade,
        over15,
        over30,
        over60
      ]
    }


  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: alunos_inadimplencia_1_homolog {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }