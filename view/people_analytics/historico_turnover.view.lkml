# The name of this view in Looker is "Historico Turnover"
view: historico_turnover {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "GRADUADO"."GENTE_GESTAO"."HISTORICO_TURNOVER"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Cargo" in Explore.

  dimension: cargo {
    view_label: "Dados Gerais"
    label: "Cargo"
    type: string
    sql: ${TABLE}."CARGO" ;;
  }

  dimension: centro_custo {
    view_label: "Dados Gerais"
    label: "Centro de custo"
    type: string
    sql: ${TABLE}."CENTRO_CUSTO" ;;
  }

  dimension: classificacao_cargo {
    view_label: "Dados Gerais"
    label: "Classificação do cargo"
    type: string
    sql: ${TABLE}."CLASSIFICACAO_CARGO" ;;
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

  dimension_group: data_carga {
    view_label: "Datas e Períodos"
    label: "Data de carga"
    type: time
    timeframes: [
      raw
    ]
    sql: ${TABLE}.CAST(${TABLE}."DATA_CARGA" AS TIMESTAMP_NTZ) ;;
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

  dimension_group: data_referencia {
    view_label: "Datas e Períodos"
    label: "Data de referência"
    description: "Data de referência do registro"
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
    sql: ${TABLE}."DATA_REFERENCIA" ;;
  }


  dimension: mes_ref_ordem {
    view_label: "Datas e Períodos"
    label: "Mês"
    description: "Mês de refência"
    type: number
    sql: to_char(${TABLE}."DATA_REFERENCIA", 'mm');;
  }

  dimension: mes_ref {
    view_label: "Datas e Períodos"
    label: "Mês (Extenso)"
    description: "Nome do mês"
    type: string
    sql: case to_char(${TABLE}."DATA_REFERENCIA", 'mm')
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
    end
    ;;
  }

  dimension: ano_referencia {
    view_label: "Datas e Períodos"
    label: "Ano de referência"
    description: "Ano de referência do registro"
    type: number
    sql: ${TABLE}."ANO_REFERENCIA" ;;
  }

  dimension: mes_referencia {
    view_label: "Datas e Períodos"
    label: "Mês de referência"
    description: "Mês de referência do registro"
    type: number
    sql: ${TABLE}."MES_REFERENCIA" ;;
  }

  dimension: diretoria {
    view_label: "Dados Gerais"
    label: "Diretoria"
    type: string
    sql: ${TABLE}."DIRETORIA" ;;
  }

  dimension: flg_ativo {
    view_label: "Dados Gerais"
    label: "Funcionário ativo?"
    description: "Indica se o funcionário estava ativo no período"
    type: yesno
    sql: ${TABLE}."FLG_ATIVO" ;;
  }

  dimension: flg_elegivel_turnover {
    view_label: "Dados Gerais"
    label: "Elegível para turnover?"
    description: "Indica se o funcionário estava elegível para turnover no período"
    type: yesno
    sql: ${TABLE}."FLG_ELEGIVEL_TURNOVER" ;;
  }

  dimension: funcao {
    view_label: "Dados Gerais"
    label: "Função"
    type: string
    sql: ${TABLE}."FUNCAO" ;;
  }

  dimension: id_centro_custo {
    view_label: "Dados Gerais"
    label: "Código do centro de custo"
    type: number
    sql: ${TABLE}."ID_CENTRO_CUSTO" ;;
  }

  dimension: motivo_demissao {
    view_label: "Dados Gerais"
    label: "Motivo da demissão"
    type: string
    sql: ${TABLE}."MOTIVO_DEMISSAO" ;;
  }

  dimension: nivel_cargo {
    view_label: "Dados Gerais"
    label: "Nível do cargo"
    type: string
    sql: ${TABLE}."NIVEL_CARGO" ;;
  }

  dimension: nome {
    view_label: "Dados Gerais"
    label: "Nome"
    type: string
    sql: ${TABLE}."NOME" ;;
  }

  dimension: sexo {
    view_label: "Dados Gerais"
    label: "Sexo"
    type: string
    sql: ${TABLE}."SEXO" ;;
  }

  dimension: situacao {
    view_label: "Dados Gerais"
    label: "Situação"
    type: string
    sql: ${TABLE}."SITUACAO" ;;
  }

  dimension: status {
    view_label: "Dados Gerais"
    label: "Status"
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: tempo_casa_dias {
    view_label: "Datas e Períodos"
    label: "Tempo de casa em dias"
    type: number
    sql: ${TABLE}."TEMPO_CASA_DIAS" ;;
  }

  dimension: tipo_turnover {
    view_label: "Dados Gerais"
    label: "Tipo de Turnover"
    type: string
    sql: ${TABLE}."TIPO_TURNOVER" ;;
  }

  dimension: unidade_negocio {
    view_label: "Dados Gerais"
    label: "Unidade de Negócio"
    type: string
    sql: ${TABLE}."UNIDADE_NEGOCIO" ;;
  }

  dimension: matricula {
    view_label: "Dados Gerais"
    label: "Matrícula"
    type: string
    sql: ${TABLE}."MATRICULA" ;;
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
    hidden: no
  }

  dimension: ordem_tempo_casa_aux {
    view_label: "Datas e Períodos"
    label: "Ordem - Tempo de casa"
    description: "Este campo é uma regra de negócio*. Indica a ordenadação de 1 à 5 a faixa de tempo do Pravalente. Então: 3 meses ou menos = 1; entre 4 e 6 meses = 2; entre 7 e 11 = 3; entre 1 ano e 1 ano e 11 meses = 4; 2 anos ou mais = 5; e caso contrário, não atender essas regras o valor será = 0"
    type: number
    case: {
      when: {
        sql: ${tempo_casa_dias} < 120;; #'3 meses ou menos'
        label: "1"
      }
      when: {
        sql: ${tempo_casa_dias} between 120 and 180;; #'Entre 4 e 6 meses'
        label: "2"
      }
      when: {
        sql: ${tempo_casa_dias} between 181 and 330;; #'Entre 7 e 11 meses'
        label: "3"
      }
      when: {
        sql: ${tempo_casa_dias} between 331 and 690;; #'Entre 1 ano e 1 ano e 11 meses'
        label: "4"
      }
      when: {
        sql: ${tempo_casa_dias} > 690;; #'2 anos ou mais'
        label: "5"
      }
      else: "0"
    }
    hidden: yes
  }

  dimension: ordem_tempo_casa {
    type: number
    view_label: "Datas e Períodos"
    label: "Ordem - Tempo de casa"
    sql: ${ordem_tempo_casa_aux} ;;
    description: "Este campo segue uma regra de negócio para ordenarmos de 1 a 5 a faixa de tempo do Pravalente. Então: 3 meses ou menos = 1; entre 4 e 6 meses = 2; entre 7 e 11 = 3; entre 1 ano e 1 ano e 11 meses = 4; 2 anos ou mais = 5; e caso contrário, não atender essas regras o valor será = 0"
  }

  dimension_group: data_nascimento {
    view_label: "Datas e Períodos"
    label: "Data de nascimento"
    description: "Data de nascimento do Pravalente"
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

  dimension: idade {
    view_label: "Datas e Períodos"
    label: "Idade"
    description: "Idade do Pravalente"
    type: number
    sql: trunc(datediff(hour, to_date(${data_nascimento_date}), current_date()) / 8766) ;;
  }

  dimension: faixa_etaria {
    view_label: "Dados Gerais"
    label: "Faixa etária"
    description: "Classificação da faixa etária"
    type: string
    case: {
      when: {
        sql: ${idade} <= 20;; #'3 meses ou menos'
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

  dimension: grau_instrucao {
    type: string
    view_label: "Dados Gerais"
    label: "Grau de Instrução"
    description: "Escolaridade do Pravalente"
    sql: ${TABLE}."GRAU_INSTRUCAO" ;;
  }

  dimension: raca {
    type: string
    view_label: "Dados Gerais"
    label: "Raça"
    description: "Etnia do Pravalente"
    sql: ${TABLE}."RACA" ;;
  }

  dimension: flg_deficiencia {
    type: yesno
    view_label: "Dados Gerais"
    label: "Possui deficiência?"
    description: "Indica se o Pravalente possui alguma deficiência"
    sql: ${TABLE}."FLG_PCD" ;;
  }

}
