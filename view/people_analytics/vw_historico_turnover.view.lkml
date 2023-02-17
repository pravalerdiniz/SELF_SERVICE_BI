# The name of this view in Looker is "Vw Historico Turnover"
view: vw_historico_turnover {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."VW_HISTORICO_TURNOVER"
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ano Mes" in Explore.

  dimension: ano_mes {
    primary_key: yes
    type: string
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: cargo {
    type: string
    sql: ${TABLE}."CARGO" ;;
  }

  dimension: causa_demissao {
    type: string
    sql: ${TABLE}."CAUSA_DEMISSAO" ;;
  }

  dimension: centro_custo {
    type: string
    sql: ${TABLE}."CENTRO_CUSTO" ;;
  }

  dimension: classificacao {
    type: string
    sql: ${TABLE}."CLASSIFICACAO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_admissao {
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
    sql: ${TABLE}."DATA_ADMISSAO" ;;
  }

  dimension_group: data_demissao {
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
    sql: ${TABLE}."DATA_DEMISSAO" ;;
  }

  dimension_group: data_nascimento {
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
    sql: ${TABLE}."DATA_NASCIMENTO" ;;
  }

  dimension_group: data_ultima_movimentacao {
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
    sql: ${TABLE}."DATA_ULTIMA_MOVIMENTACAO" ;;
  }

  dimension: diretoria {
    type: string
    sql: ${TABLE}."DIRETORIA" ;;
  }

  dimension: empresa {
    type: string
    sql: ${TABLE}."EMPRESA" ;;
  }

  dimension: flg_ativo {
    type: yesno
    sql: ${TABLE}."FLG_ATIVO" ;;
  }

  dimension: flg_clube_socios {
    type: yesno
    sql: ${TABLE}."FLG_CLUBE_SOCIOS" ;;
  }

  dimension: flg_deficiente {
    type: yesno
    sql: ${TABLE}."FLG_DEFICIENTE" ;;
  }

  dimension: flg_lider {
    type: yesno
    sql: ${TABLE}."FLG_LIDER" ;;
  }

  dimension: grau_instrucao {
    type: string
    sql: ${TABLE}."GRAU_INSTRUCAO" ;;
  }

  dimension: id_cargo {
    type: number
    sql: ${TABLE}."ID_CARGO" ;;
  }

  dimension: id_centro_custo {
    type: string
    sql: ${TABLE}."ID_CENTRO_CUSTO" ;;
  }

  dimension: matricula {
    type: number
    sql: ${TABLE}."MATRICULA" ;;
  }

  dimension: motivo_ultima_movimentacao {
    type: string
    sql: ${TABLE}."MOTIVO_ULTIMA_MOVIMENTACAO" ;;
  }

  dimension: nivel_cargo {
    type: string
    sql: ${TABLE}."NIVEL_CARGO" ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: raca {
    type: string
    sql: ${TABLE}."RACA" ;;
  }

  dimension: sexo {
    type: string
    sql: ${TABLE}."SEXO" ;;
  }

  dimension: situacao {
    type: string
    sql: ${TABLE}."SITUACAO" ;;
  }

  dimension: tipo_desligamento {
    type: string
    sql: ${TABLE}."TIPO_DESLIGAMENTO" ;;
  }

  dimension: idade {
    type: number
    sql: ${TABLE}."IDADE" ;;
  }

  dimension: faixa_etaria {
    type: string
    case: {
      when: {
        sql: ${idade} <= 20;;
        label: "Até 20 anos"
      }
      when: {
        sql: ${idade} between 21 and 24;;
        label: "Entre 21 e 24 anos"
      }
      when: {
        sql: ${idade} between 25 and 29;;
        label: "Entre 25 e 29 anos"
      }
      when: {
        sql: ${idade} between 30 and 34;;
        label: "Entre 30 e 34 anos"
      }
      when: {
        sql: ${idade} between 35 and 39;;
        label: "Entre 35 e 39 anos"
      }
      when: {
        sql: ${idade} >= 40;;
        label: "40 anos ou mais"
      }
      else: ""
    }
  }

  dimension: faixa_etaria_ordem {
    type: number
    case: {
      when: {
        sql: ${idade} <= 20;;
        label: "1"
      }
      when: {
        sql: ${idade} between 21 and 24;;
        label: "2"
      }
      when: {
        sql: ${idade} between 25 and 29;;
        label: "3"
      }
      when: {
        sql: ${idade} between 30 and 34;;
        label: "4"
      }
      when: {
        sql: ${idade} between 35 and 39;;
        label: "5"
      }
      when: {
        sql: ${idade} >= 40;;
        label: "6"
      }
      else: "0"
    }
  }

  dimension: tempo_casa_dias {
    type: number
    sql: ${TABLE}."TEMPO_CASA_DIAS" ;;
  }

  dimension: tempo_casa_extenso {
    view_label: "Datas e Períodos"
    label: "Tempo de Casa por extenso"
    type: string
    case: {
      when: {
        sql: ${tempo_casa_dias} < 120;; #'3 meses ou menos';;
        label: "3 meses ou menos"
      }
      when: {
        sql: ${tempo_casa_dias} between 120 and 180;; #'Entre 4 e 6 meses';;
        label: "Entre 4 e 6 meses"
      }
      when: {
        sql: ${tempo_casa_dias} between 181 and 330;; #'Entre 7 e 11 meses';;
        label: "Entre 7 e 11 meses"
      }
      when: {
        sql: ${tempo_casa_dias} between 331 and 690;; #'Entre 1 ano e 1 ano e 11 meses';;
        label: "Entre 1 ano e 1 ano e 11 meses"
      }
      when: {
        sql: ${tempo_casa_dias} > 690;; #'2 anos ou mais';;
        label: "2 anos ou mais"
      }
      else: ""
    }
    description: "Este campo é uma regra de negócio*. Indica a ordenadação de 1 à 5 a faixa de tempo do Pravalente. Então: 3 meses ou menos = 1; entre 4 e 6 meses = 2; entre 7 e 11 = 3; entre 1 ano e 1 ano e 11 meses = 4; 2 anos ou mais = 5; e caso contrário, não atender essas regras o valor será = 0"
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_ativos {
    type: count_distinct
    filters: [flg_ativo: "Yes"]
    sql: ${id} ;;
  }

}
