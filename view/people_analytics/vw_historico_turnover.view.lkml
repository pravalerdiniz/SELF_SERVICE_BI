# The name of this view in Looker is "Vw Historico Turnover"
view: vw_historico_turnover {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GENTE_GESTAO"."VW_HISTORICO_TURNOVER"
    ;;
  drill_fields: [id, matricula, empresa, nome]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    #primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}."ID" ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Ano Mes" in Explore.

  dimension: ano_mes {
    #primary_key: yes
    view_label: "Datas e Períodos"
    label: "Ano/Mês de referência"
    type: string
    sql: ${TABLE}."ANO_MES" ;;
  }

  dimension: ano_ref {
    #primary_key: yes
    view_label: "Datas e Períodos"
    label: "Ano de referência"
    type: number
    sql: substring(${TABLE}."ANO_MES", 1, 4) ;;
  }

  dimension: mes_ref {
    #primary_key: yes
    view_label: "Datas e Períodos"
    label: "Mês de referência"
    type: number
    sql: substring(${TABLE}."ANO_MES", -2, 2) ;;
  }

  dimension: mes_ref_extenso {
    view_label: "Datas e Períodos"
    label: "Mês de referência (por extenso)"
    type: string
    sql: case ${mes_ref}
      when 1 then 'Janeiro'
      when 2 then 'Fevereiro'
      when 3 then 'Março'
      when 4 then 'Abril'
      when 5 then 'Maio'
      when 6 then 'Junho'
      when 7 then 'Julho'
      when 8 then 'Agosto'
      when 9 then 'Setembro'
      when 10 then 'Outubro'
      when 11 then 'Novembro'
      when 12 then 'Dezembro'
    end;;
  }

  dimension: cargo {
    label: "Cargo na data"
    view_label: "Dados Gerais"
    type: string
    sql: ${TABLE}."CARGO" ;;
  }

  dimension: causa_demissao {
    label: "Causa da demissão"
    view_label: "Dados Gerais"
    type: string
    sql: ${TABLE}."CAUSA_DEMISSAO" ;;
  }

  dimension: centro_custo {
    view_label: "Dados Gerais"
    label: "Centro de custo"
    type: string
    sql: ${TABLE}."CENTRO_CUSTO" ;;
  }

  dimension: classificacao {
    view_label: "Dados Gerais"
    label: "Classificação"
    type: string
    sql: ${TABLE}."CLASSIFICACAO" ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_admissao {
    view_label: "Datas e Períodos"
    label: "Data de admissão"
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
    view_label: "Datas e Períodos"
    label: "Data de demissão"
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
    view_label: "Datas e Períodos"
    label: "Data de nascimento"
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
    view_label: "Datas e Períodos"
    label: "Data da última movimentação"
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
    view_label: "Dados Gerais"
    label: "Diretoria"
    type: string
    sql: ${TABLE}."DIRETORIA" ;;
  }

  dimension: empresa {
    view_label: "Dados Gerais"
    label: "Empresa"
    type: string
    sql: ${TABLE}."EMPRESA" ;;
  }

  dimension: flg_ativo {
    view_label: "Dados Gerais"
    label: "Funcionário ativo?"
    description: "Indica se o funcionário estava ativo no período"
    type: yesno
    sql: ${TABLE}."FLG_ATIVO" ;;
  }

  dimension: flg_clube_socios {
    view_label: "Dados Gerais"
    label: "Faz parte do Clube dos Sócios?"
    description: "Indica se o funcionário participa do Clube dos Sócios"
    type: yesno
    sql: ${TABLE}."FLG_CLUBE_SOCIOS" ;;
  }

  dimension: flg_deficiente {
    view_label: "Dados Gerais"
    label: "Possui alguma deficiência?"
    type: yesno
    sql: ${TABLE}."FLG_DEFICIENTE" ;;
  }

  dimension: flg_lider {
    view_label: "Dados Gerais"
    label: "É líder?"
    description: "Indica se o funcionário é lider ou foi líder na data de referência"
    type: yesno
    sql: ${TABLE}."FLG_LIDER" ;;
  }

  dimension: grau_instrucao {
    view_label: "Dados Gerais"
    label: "Grau de instrução"
    type: string
    sql: ${TABLE}."GRAU_INSTRUCAO" ;;
  }

  dimension: id_cargo {
    view_label: "Dados Gerais"
    label: "Código do cargo"
    type: number
    sql: ${TABLE}."ID_CARGO" ;;
  }

  dimension: id_centro_custo {
    view_label: "Dados Gerais"
    label: "Código do Centro de Custo"
    type: string
    sql: ${TABLE}."ID_CENTRO_CUSTO" ;;
  }

  dimension: matricula {
    view_label: "Dados Gerais"
    label: "Matrícula"
    description: "Código da matrícula"
    type: number
    sql: ${TABLE}."MATRICULA" ;;
  }

  dimension: motivo_ultima_movimentacao {
    view_label: "Dados Gerais"
    label: "Motivo da última movimentação"
    type: string
    sql: ${TABLE}."MOTIVO_ULTIMA_MOVIMENTACAO" ;;
  }

  dimension: nivel_cargo {
    view_label: "Dados Gerais"
    label: "Nível do cargo"
    description: "Indica o nível do cargo na data de referência"
    type: string
    sql: ${TABLE}."NIVEL_CARGO" ;;
  }

  dimension: nome {
    view_label: "Dados Gerais"
    label: "Nome"
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: raca {
    view_label: "Dados Gerais"
    label: "Etnia"
    type: string
    sql: ${TABLE}."RACA" ;;
  }

  dimension: sexo {
    view_label: "Dados Gerais"
    label: "Sexo"
    type: string
    sql: ${TABLE}."SEXO" ;;
  }

  #dimension: situacao {
  #  view_label: "Dados Gerais"
  #  label: "Situação"
  #  type: string
  #  sql: ${TABLE}."SITUACAO" ;;
  #}

  dimension: tipo_desligamento {
    view_label: "Dados Gerais"
    label: "Tipo de desligamento"
    type: string
    sql: ${TABLE}."TIPO_DESLIGAMENTO" ;;
  }

  dimension: idade {
    view_label: "Dados Gerais"
    label: "Idade"
    type: number
    sql: ${TABLE}."IDADE" ;;
  }

  dimension: flg_ano_mes_admissao {
    view_label: "Dados Gerais"
    label: "Mês de admissão?"
    description: "Indica se essa data foi o mês de admissão"
    type: yesno
    sql: ${TABLE}."FLG_ANO_MES_ADMISSAO" ;;
  }

  dimension: flg_elegivel_turnover {
    view_label: "Dados Gerais"
    label: "Elegível Turnover?"
    description: "Indica se esse colaborador possui um nível de cargo com elegibilidade ao turnover"
    type: yesno
    sql: ${TABLE}."FLG_ELEGIVEL_TURNOVER" ;;
  }

  dimension: faixa_etaria {
    view_label: "Dados Gerais"
    label: "Faixa etária"
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
    view_label: "Dados Gerais"
    label: "Faixa etária - Ordem"
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
    view_label: "Datas e Períodos"
    label: "Tempo de casa (dias)"
    type: number
    sql: ${TABLE}."TEMPO_CASA_DIAS" ;;
  }

  dimension: tempo_casa_extenso {
    view_label: "Datas e Períodos"
    label: "Tempo de casa (classificação)"
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
    view_label: "Dados Gerais"
    label: "Count"
    type: count
    drill_fields: []
  }

  measure: total_ativos {
    view_label: "Dados Gerais"
    label: "Total de ativos"
    type: count_distinct
    filters: [flg_ativo: "Yes"]
    sql: ${TABLE}."ID" ;;
  }

  measure: total_desligados {
    view_label: "Dados Gerais"
    label: "Total de desligados"
    type: count_distinct
    filters: [flg_ativo: "No"]
    sql: ${TABLE}."ID" ;;
  }

  measure: total_contratados {
    view_label: "Dados Gerais"
    label: "Total de contratados"
    type: count_distinct
    filters: [flg_ano_mes_admissao: "Yes"]
    sql: ${TABLE}."ID" ;;
  }

}
