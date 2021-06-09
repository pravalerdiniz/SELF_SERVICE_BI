view: atribuicao_rv_itau {
  derived_table: {
    sql: with cpfs as (
    select p.id_cpf,
            p.id_proposta,
            p.nm_modalidade_produto,
            p.data_concessao,
            case when CANAL_ACESSO_DESCOBERTA ilike 'itau' then 'ITAU'
                 else 'RV'
            end as atribuicao,
            p.tipo_proposta,
            'AQUISICAO' as tipo
     from graduado.self_service_bi.proposta p
     where p.flg_contrato_cedido = true
        and p.data_preenchimento >= '2020-10-01'
        and p.data_concessao >= '2020-10-01'
        and p.tipo_proposta = 'NOVO'
        and p.tipo_produto <> 'COMPRA DE CARTEIRA'
        and p.tipo_produto <> 'INTERCAMBIO'
        qualify row_number() over(partition by p.id_cpf order by p.data_concessao desc) = 1
)

select
    *,
    sum(aluno_unico_ano) over(partition by to_char(data_concessao, 'YYYY') order by data_concessao, id_cpf) as acumulado_ano
from (
    select
        *,
        case when id_cpf = lag(id_cpf, 1, null) over(order by id_cpf, data_concessao) and
                  to_char(data_concessao, 'YYYY') = lag(to_char(data_concessao, 'YYYY'), 1, null) over(order by id_cpf, data_concessao)
             then 0
             else 1
        end as aluno_unico_ano

    from (
        select
            cpfs.*
        from cpfs

        union

        select
            p.id_cpf,
            p.id_proposta,
            p.nm_modalidade_produto,
            p.data_concessao,
            cpfs.atribuicao,
            p.tipo_proposta,
            concat('R', row_number() over(partition by p.id_cpf order by p.data_concessao)) as tipo
        from graduado.self_service_bi.proposta p
        inner join cpfs on cpfs.id_cpf = p.id_cpf
        where p.tipo_proposta = 'RENOVACAO'
          and p.flg_contrato_cedido = true
          and p.data_concessao > cpfs.data_concessao
        order by id_cpf, data_concessao
    ) a
) b
       ;;
  }

  dimension: id_cpf {
    type: number
    sql: ${TABLE}."ID_CPF" ;;
  }

  dimension: tipo_proposta {
    type: string
    sql: ${TABLE}."TIPO_PROPOSTA" ;;
  }

  dimension: id_proposta {
    type: string
    sql: ${TABLE}."ID_PROPOSTA" ;;
    primary_key: yes
  }

  dimension: nm_modalidade_produto {
    type: string
    sql: ${TABLE}."NM_MODALIDADE_PRODUTO" ;;
  }

  dimension_group: data_concessao {
    type: time
    sql: ${TABLE}."DATA_CONCESSAO" ;;
  }

  dimension: atribuicao {
    type: string
    sql: ${TABLE}."ATRIBUICAO" ;;
  }

  dimension: tipo {
    type: string
    sql: ${TABLE}."TIPO" ;;
  }

  dimension: aluno_unico_ano {
    type: number
    sql: ${TABLE}."ALUNO_UNICO_ANO" ;;
  }

  dimension: acumulado_alunos_ano {
    type: number
    sql: ${TABLE}."ACUMULADO_ANO" ;;
  }

  dimension: remuneracao_fixa_rv {
    type: number
    sql: case when ${atribuicao} = 'RV' and ${data_concessao_year} = 2020 then 300000
              when ${atribuicao} = 'RV' and ${data_concessao_year} > 2020 and ${acumulado_alunos_ano} > 28000 then 0
              else 500000
              end ;;
  }

   dimension: remuneracao_variavel_itau {
    type: number
    sql: case when ${atribuicao} = 'ITAU' and ${tipo} in ('AQUISICAO') then 50
              else 0
         end;;
  }

  #############################################
  ################## ATENÇÃO ##################
  #############################################
  # Cálculo ainda não considerando casos com volume de alunos acima de 32k por ano
  dimension: remuneracao_variavel_rv {
    type: number


    sql: case when  ${acumulado_alunos_ano} <= 28000 and ${tipo} in ('AQUISICAO') then --,'R1','R2','R3') then
           (case when ${nm_modalidade_produto} <> 'FIDC' then 100
                else (case when ${atribuicao} = 'ITAU' then
                              (case when ${data_concessao_year} >= 2021 then 100
                                    else 70 end)
                           when ${data_concessao_year} = 2020 then 125
                           else 95 end)
           end)
         when  (${acumulado_alunos_ano} > 28000 and ${acumulado_alunos_ano} <= 32000) and ${tipo} in ('AQUISICAO') then --,'R1','R2','R3','R4','R5','R6','R7') then
         (case when ${nm_modalidade_produto} <> 'FIDC' then 100
              else (case when ${atribuicao} = 'ITAU' then
                       (case when ${tipo} = 'AQUISICAO' then 129
                             when ${tipo} = 'R1' then 37
                             when ${tipo} = 'R2' then 52
                             when ${tipo} in ('R3','R4','R5') then 67
                             else 175 end)
                    else (case when ${tipo} = 'AQUISICAO' then 154
                             when ${tipo} = 'R1' then 62
                             when ${tipo} = 'R2' then 77
                             when ${tipo} in ('R3','R4','R5') then 92
                             else 200 end)
                    end)
          end)
          else 0
         end ;;


    }


  measure: count {
    type: count
    label: "Quantidade de Contratos"
    description: "Contagem dos contratos cedidos."
  }

  measure: sum_alunos_ano {
    type: sum
    sql: ${aluno_unico_ano} ;;
    label: "Quantidade de Alunos no Ano"
    description: "Contagem distinsta de CPF por ano. Use preferencialmente juto com um campo de data."
  }

  measure: count_cpf {
    type: count_distinct
    sql: ${id_cpf} ;;
    label: "Quantidade de Alunos Total"
    description: "Contagem distinta de CPF, independente do ano."
  }

  measure: sum_remuneracao_variavel_itau {
    type: sum
    sql: ${remuneracao_variavel_itau} ;;
    label: "Remuneração Variável Itaú"
    value_format: "$ #,##0.00"
  }

  measure: sum_remuneracao_variavel_rv {
    type: sum
    sql: ${remuneracao_variavel_rv} ;;
    label: "Remuneração Variável RV"
    value_format: "$#,##0.00"
  }

  measure: min_remuneracao_fixa_rv {
    type: min
    sql: ${remuneracao_fixa_rv} ;;
    label: "Remuneração Fixa RV"
    value_format: "$#,##0.00"
  }

  set: detail {
    fields: [
      id_cpf,
      id_proposta,
      data_concessao_time,
      atribuicao,
      tipo,
      aluno_unico_ano
    ]
  }
}
