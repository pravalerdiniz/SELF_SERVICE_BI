# The name of this view in Looker is "Vw Elegibilidade Comercial"
view: vw_elegibilidade_comercial {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "RISCO"."VW_ELEGIBILIDADE_COMERCIAL"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Apr Bhv" in Explore.

  dimension: apr_bhv {
    type: number
    label: "Aprovado Behavior?"
    sql: ${TABLE}."APR_BHV" ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_apr_bhv {
    type: sum
    label: "Total - Aprovado Behavior"
    sql: ${apr_bhv} ;;
  }

  measure: total_formalizado {
    type: sum
    label: "Total - Formalizado"
    sql: ${formalizado} ;;
  }

  dimension: cd_cpf {
    type: number
    label: "CPF"
    primary_key: yes
    sql: ${TABLE}."CD_CPF" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_apr_bhv {
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
    label: "Aprovado Behavior"
    sql: ${TABLE}."DATA_APR_BHV" ;;
  }

  dimension_group: data_elegivel {
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
    label: "Elegibilidade"
    sql: ${TABLE}."DATA_ELEGIVEL" ;;
  }

  dimension_group: data_formalizado {
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
    label: "Formalizado"
    sql: ${TABLE}."DATA_FORMALIZADO" ;;
  }

  dimension: formalizado {
    type: number
    label: "Formalizado?"
    sql: ${TABLE}."FORMALIZADO" ;;
  }

  dimension: safra_apr_bhv {
    type: number
    hidden: yes
    sql: ${TABLE}."SAFRA_APR_BHV" ;;
  }

  dimension: safra_eleg {
    type: number
    hidden: yes
    sql: ${TABLE}."SAFRA_ELEG" ;;
  }

  dimension: safra_formalizado {
    type: number
    hidden: yes
    sql: ${TABLE}."SAFRA_FORMALIZADO" ;;
  }

  dimension: status_alu_novo {
    type: string
    hidden: yes
    sql: ${TABLE}."STATUS_ALU_NOVO" ;;
  }




  dimension: status_renov {
    type: string
    sql: ${TABLE}."STATUS_RENOV" ;;
  }


  dimension: etapa_ultimo_status_renovacao {
    type: string
    case: {
      when: {
        sql: ${status_renov} in (2000,2001,2002) ;;
        label: "Pré Elegibilidade/Iniciado"
      }
      when: {
        sql: ${status_renov} = 2010 ;;
        label: "Aguardando Análise Behavior"
      }
      when: {
        sql: ${status_renov}  in ('2019.1', '2019.10', '2019.12', '2019.3') ;;
        label: "Reprovado por Risco"
      }
      when: {
        sql: ${status_renov}  in ('2019.15') ;;
        label: "Reprovado por duas ou mais parcelas em atraso"
      }
      when: {
        sql: ${status_renov}  in ('2019.16', '2019.18', '2019.19')

;;
        label: "Reprovado Behavior"
      }
      when: {
        sql: ${status_renov}  in ('2019.13','2019.18', '2019.19') ;;
        label: "Reprovado BV"
      }

      when: {
        sql: ${status_renov}  in ('2039.1', '101.0') ;;
        label: "Formado"
      }
      when: {
        sql: ${status_renov}  in ('102.0','2009.0',
          '2029.1','2046.2','2048.0','2048.1','2058.0') ;;
        label: "Não Renovado"
      }
      when: {
        sql: ${status_renov} in ('2040.0','2042.1','2042.2','2042.3',
                  '2044.1','2044.13'
          ) ;;
        label: "Pend. Envio de Documento"
      }
      when: {
        sql: ${status_renov}  ilike '%2039%' ;;
        label: "Reprovado pela IES"
      }

      when: {
        sql: ${status_renov}  in ('2022.1',
'2022.3',
'2025.1',
'2025.3',
'2031.4',
'2032.1',
'2033.0',
'2033.2',
'2034.0',
'2035.0'
) ;;
        label: "Pendente - Geração de Contrato"
      }
      when: {
        sql: ${status_renov}  in ('2011.1','2011.5','2011.9','2013.1','2013.11','2013.12','2013.13',
        '2013.14','2013.3','2013.4','2014.1','2015.0','2015.3'
) ;;
        label: "Tela da Instituição"
      }
      when: {
        sql:${status_renov}  in (2031,2036) ;;
        label: "Aprovados pela Instituição"
      }
      when: {
        sql: ${status_renov}  in (2040) ;;
        label: "Aguardando Confirmação de Dados"
      }
      when: {
        sql: ${status_renov}  in ('2044.13') ;;
        label: "Aguardando envio de documento"
      }
      when: {
        sql:${status_renov} in ('2044.5') ;;
        label: "Aguardando assinatura"
      }
      when: {
        sql: ${status_renov}  in (2044);;
        label: "Contratos Gerados"
      }
      when: {
        sql: ${status_renov}  ilike '%2041%' ;;
        label: "Formalizado"
      }
      when: {
        sql: ${status_renov}  ilike '%2046%' ;;
        label: "Reprovado pela Formalização"
      }
      when: {
        sql: ${status_renov}  ilike '%2050%' ;;
        label: "Cedido"
      }
      when: {
        sql: ${status_renov} ilike '%2058%' ;;
        label: "Cancelado"
      }


      else: "Outros"
    }
    group_item_label: "Etapa Atual - Renovação"
  }



  measure: count {
    type: count
    drill_fields: []
  }
}
